/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(obj_brasier.state==4 && (initHead=="cave1" || initHead=="caveInit")){
	ChangeInitHead("caveSecret7");	
}

switch(state){
	case 2:
		with(obj_priestessRoomManager){
			alarm[2]=room_speed;	
		}
		state=3;
		break;
	case 3:
		with(obj_babyBird_closed){
			if(state==-1) state=0;
		}
		break;
}