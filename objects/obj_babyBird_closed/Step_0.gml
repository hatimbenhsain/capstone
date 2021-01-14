/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case -1:
		break;
	case 0:
		addInteractable(obj_knife);
		ChangeInitHead("babyBirdKnifeless");
		state=1;
		break;
	case 2:
		sprite_index=sprite_babyBird_open;
		ChangeInitHead("babyBirdOpen");
		ds_map_clear(interactableObjects);
		addItem(obj_candy);
		state=3;
		break;
	case 4:
		ChangeInitHead("babyBird4");
		state=5;
		break;
}