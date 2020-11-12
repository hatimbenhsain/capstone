// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
global.lastLine=noone;

Line =function(_message, _parent, _type, _action) constructor{
	text=_message;
	if(_parent==-1){
		isHead=true;
		parent=-1
	}else if(parent==undefined){
		parent=global.lastLine;	
	}else{
		parent=_parent;	
	}
	
	if(parent!=undefined && parent.type=="q"){
		ds_list_add(parent.children,self);
	}else if(parent!=undefined){
		parent.child=self;	
	}
	
	if(_type==undefined){
		type="s";	//s: statement
					//q: question
					//a: answer
	}else{
		type=_type;	
	}

	if(type=="q"){
		children=ds_list_create();	
	}
	type=_type;
	global.lastLine=self;
	
}

function connect(){
	
}