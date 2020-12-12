/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

switch(dir){
	case("F"):
		image_xscale=1;
		if(!walking) sprite_index=idleF;
		else sprite_index=walkF;
		break;
	case("B"):
		image_xscale=1;
		if(!walking) sprite_index=idleB;
		else sprite_index=walkB;
		break;
	case("R"):
		image_xscale=-1;
		if(!walking) sprite_index=idleL;
		else sprite_index=walkL;
		break;	
	case("L"):
		image_xscale=1;
		if(!walking) sprite_index=idleL;
		else sprite_index=walkL;
		break;
}

