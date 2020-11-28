/// @description Insert description here
// You can write your code in this editor
/*Line=function(_message, _parent, _type, _action) constructor{
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
	show_debug_message(action);
	
	children=ds_list_create();	
	global.lastLine=self;
}*/



/*var l1=new Line("hello this is the head",-1);
var l2=new Line("next line");
var l3=new Line("question?",l2,"q");
var l4=new Line("answer a",l3,"a");
var l5=new Line("answer b",l3,"a");
var l6=new Line("answer c",l3,"a");
var l7=new Line("statement a",l4);
var l8=new Line("statement b",l5);
var l9=new Line("statement c",l6);*/


currentMessage=noone;
interactButton=obj_tuning.interactButton;
downButton=obj_tuning.downButton;
upButton=obj_tuning.upButton;
answerSelected=0;
inDialogue=false;
textBoxSprite=sprite_textBox;
defaultX=0;
defaultY=camera_get_view_height(view_camera[0])*83/64;
currentChar=0;
textSpeed=obj_tuning.textSpeed;
textWidth=display_get_gui_width()*5/8;
textWidthFull=display_get_gui_width()*7/8;
textSep=obj_tuning.textSep;
textPaddingX=obj_tuning.textPaddingX;
textPaddingY=obj_tuning.textPaddingY;
interlocutor=noone;
finished=false;
maxLength=0;
