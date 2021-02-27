// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.lastLine=noone;

/*Line=function(_message, _parent, _type, _action) constructor{
	text=_message;
	isHead=false;
	if(_parent==-1){
		isHead=true;
		parent=-1
	}else if(parent==undefined){
		parent=global.lastLine;	
	}else{
		parent=_parent;	
	}
	
	if(parent!=undefined){
		ds_list_add(parent.children,self);
	}
	
	if(_type==undefined){
		type="s";	//s: statement
					//q: question
					//a: answer
	}else{
		type=_type;	
	}

	children=ds_list_create();	
	global.lastLine=self;
}*/
global.Line=function(_message, _parent, _type, _action, _subject, _talker, _emotion) constructor{
	text=_message;
	isHead=false;
	if(_parent==-1){
		isHead=true;
		parent=-1
	}else if(_parent==undefined || _parent==""){
		parent=global.lastLine;	
	}else{
		parent=_parent;	
	}	
	
	if(parent!=-1){
		ds_list_add(parent.children,self);
	}
	
	if(_type==undefined || _type==""){
		type="s";	//s: statement
					//q: question
					//a: answer
	}else{
		type=_type;	
	}
	
	if(_action==0 || _action==undefined || _action==""){
		action=undefined	
	}else{
		action=_action;
	}
	
	if(_talker=="noone"){
		global.lastTalker=noone;
		global.lastEmotion="neutral";
		emotion="neutral";
		talker=noone;
	}else if(_talker==undefined || _talker==""){
		talker=global.lastTalker;
		emotion=global.lastEmotion;
	}else{
		talker=_talker;	
		global.lastTalker=_talker;
		if(_emotion==undefined || _emotion==""){
			emotion=global.lastEmotion;
		}else{
			global.lastEmotion=_emotion;
			emotion=_emotion;
		}
	}
	
	children=ds_list_create();	
	global.lastLine=self;
	greyed=false;
	subject=_subject;
	if(subject!=""){
		if(string_digits(subject)!=subject){
			if(asset_get_index(subject)!=-1) subject=asset_get_index(subject); 
		}
		else subject=real(subject);
	}
}

function connect(_child,_parent){
	var childExists=false;
	for(var i=0;i<ds_list_size(_parent.children);i++){
		if(_parent.children[|i].text==_child.text){
			childExists=true
			break
		}
	}
	if(!childExists){
		_child.parent=_parent;	//not sure about this
		_child.isHead=false;
		ds_list_add(_parent.children,_child);
	}
}

function parseDialogue(fileName){
	if(file_exists(fileName)){
		grid=load_csv(fileName)
		var w=ds_grid_width(grid);
		var h=ds_grid_height(grid);
		head=undefined;
		var messages=ds_list_create();	//create ds list and put the messages there thenm use it to find parent
		for(var i=1;i<h;i++){
			var text=ds_grid_get(grid,0,i);
			var type=ds_grid_get(grid,1,i);
			if(ds_grid_get(grid,2,i)!=""){
				var parent=messages[|real(ds_grid_get(grid,2,i))-2];
			}else{
				var parent=undefined;
			}
			var action=ds_grid_get(grid,3,i);
			var subject=ds_grid_get(grid,4,i);
			var talker=ds_grid_get(grid,5,i);
			var emotion=ds_grid_get(grid,6,i);
			
		
			if(head==undefined){
				var l=new global.Line(text,-1,type,action,subject,talker,emotion);
				head=l;
			}else{
				var l=new global.Line(text,parent,type,action,subject,talker,emotion);
			}		
			ds_list_add(messages,l);
		}
		return head;
	}
	else return undefined;
}

function AddAnswer(node,_question,_answer){
	show_debug_message(node.text);
	if(node.text==_question){
		connect(parseDialogue(_answer),node);
		show_debug_message(_answer+" added");
		head=initialHead;
		return true;
	}else{
		for(var i=0;i<ds_list_size(node.children);i++){
			AddAnswer(node.children[|i],_question,_answer);	
		}
	}
	//show_debug_message("question not found");
	return false;
}