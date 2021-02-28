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
	case 3:
		image_index=0;
		sprite_index=sprite_gate_disrobing;
		state++;
		break;
	case 4:
		if(sprite_index>=sprite_get_number(sprite_index)-1){
			sprite_index=sprite_gate_floating;
			image_index=0;
			state=5;
		}
		break;
	case 5:
		sprite_index=sprite_gate_floating;
		if(obj_hero.bbox_bottom<bbox_bottom && obj_hero.state=="grounded"){
			obj_gui.whiteFadeIn=true;	
		}
		break;
	
}