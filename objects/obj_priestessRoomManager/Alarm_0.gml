/// @description Insert description here
// You can write your code in this editor
with(obj_hero){
	if(state=="falling"){
		alarm[2]=3*room_speed;
		obj_gui.state="landing";
	}
}
