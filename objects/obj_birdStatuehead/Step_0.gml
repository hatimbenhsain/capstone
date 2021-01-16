/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 2:
		sprite_index=sprite_bird_headOpen;
		state=3;
		break;
	case 4:
		AddItem(obj_statueArms);
		state=5;
		ds_map_clear(interactableObjects);
		ChangeInitHead("birdStatueHead2");
		break;
}
