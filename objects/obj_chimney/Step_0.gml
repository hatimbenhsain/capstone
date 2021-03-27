/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case -1:
		//show_debug_message(head);
		AddInteractable(obj_knife);
		//show_debug_message(head);
		state=0;
		break;
	case 0:
		break;
	case 1:
		sprite_index=sprite_ow_chimneyOpen;
		ChangeInitHead("chimney2");
		ds_map_clear(interactableObjects);
		AddItem(obj_statueHead);
		state=2;
		break;
	case 2:
		break;
}