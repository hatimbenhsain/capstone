/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 0:
		break;
	case 1:
		AddInteractable(obj_pendant);
		ChangeInitHead("deadTree1");
		with(obj_interactable){
			if(!is_undefined(name) && name=="deadTree"){
				AddInteractable(obj_pendant);	
				ChangeInitHead("deadTree1");
			}
		}
		state=2;
		break;
	case 2:
		if(ds_map_empty(interactableObjects)) state=1;
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
			ChangeInitHead("treeOfLife2");
			state=5;
		}
		break;
	case 6:
		ChangeInitHead("treeOfLife3");
		with(obj_statueHands) state=0;
		state=7;
		break;
	case 8:
		ChangeInitHead("treeOfLife4");
		with(obj_fruit) state=0;
		state=9;
		break;
	
}