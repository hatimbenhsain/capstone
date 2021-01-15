/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case -1:
		addInteractable(obj_knife);
		state=0;
		break;
	case 0:
		break
	case 1:
		sprite_index=sprite_ow_chimneyOpen;
		ChangeInitHead("chimney2");
		ds_map_clear(interactableObjects);
		addItem(obj_goddessPart1);
		state=2;
		break;
	case 2:
		break;
}