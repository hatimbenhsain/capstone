/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 1:
		state=2;
		ChangeInitHead("gate2");
		with(obj_bench) ChangeInitHead("bench2");
		break;
}