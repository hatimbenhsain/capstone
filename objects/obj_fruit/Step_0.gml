/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 0:
		sprite_index=sprite_ow_fruit;
		originalY=y;
		var ty=0;
		var d=0;
		with(obj_tree1){
			ty=y+sprite_get_bbox_bottom(sprite_treeOfLife2)-sprite_get_height(sprite_treeOfLife2)/2;	
			d=depth-1;
		}
		show_debug_message(ty);
		targetY=ty;
		state=1;
		targetDepth=d;
		break;
	case 1:
		depth=targetDepth;
		if(y<targetY) y+=obj_tuning.fallingSpeed;
		else state=2;
		break;
}

