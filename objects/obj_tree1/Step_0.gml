/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 0:
		break;
	case 1:
		addInteractable(obj_pendant);
		state=2;
		break;
	case 2:
		break;
	case 3:
		with(obj_inventory) deleteInstanceOf(obj_pendant);
		image_index=0;
		sprite_index=sprite_treeGrowth;
		state=4;
		ds_map_clear(interactableObjects);
		break;
	case 4:
		if(image_index>=sprite_get_number(sprite_treeGrowth)-1){
			sprite_index=sprite_treeOfLife2;
			state=5;
		}
		break;
}