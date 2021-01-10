// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FadeToBlack(t,p){
	obj_gui.blackFadeRate=t*room_speed;
	obj_gui.pauseTime=p*room_speed;
	obj_gui.blackFadeIn=true;
	obj_gui.alarm[0]=(t+p)*room_speed;
}