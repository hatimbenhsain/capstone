// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FadeToBlack(t,p){
	obj_gui.blackFadeRate=t*room_speed;
	obj_gui.pauseTime=p*room_speed;
	obj_gui.blackFadeIn=true;
	obj_gui.alarm[0]=(t+p)*room_speed;
}

function Shake(f){
	if(is_undefined(f)){
		f=room_speed;	
	}
	with(obj_gui){
		shakeCounter=f*room_speed/1000;
	}
}

function ShakeText(){
	with(obj_dialogueManager){
		shake=true;	
	}
}