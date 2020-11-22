/// @description Insert description here
// You can write your code in this editor
if(open){
	if(ds_list_size(items)<rows*columns){
		image_index=0;	
	}else if(firstObject>0 && firstObject+rows*columns<ds_list_size(items)){
		image_index=3;	
	}else if(firstObject>0){
		image_index=2;	
	}else{
		image_index=1;	
	}
	draw_sprite(sprite_index,image_index,0,0);
	for(var i=firstObject;i<min(firstObject+rows*columns,ds_list_size(items));i++){
		if(i==selectedObject) draw_sprite_ext(sprite_selectedItemBox,0,ds_grid_get(positions,0,i-firstObject)-string_height("text")*0.7,ds_grid_get(positions,1,i-firstObject),1,1,0,c_white,0.5);
		if(i==lockedObject) draw_sprite_ext(sprite_selectedItemBox,0,ds_grid_get(positions,0,i-firstObject)-string_height("text")*0.7,ds_grid_get(positions,1,i-firstObject),1,1,0,c_white,1);
		var scale=min(string_height("text")/sprite_get_width(items[|i].sprite_index),string_height("text")/sprite_get_height(items[|i].sprite_index));
		draw_set_halign(fa_left);
		draw_set_valign(fa_middle);
		draw_sprite_ext(items[|i].sprite_index,image_index,ds_grid_get(positions,0,i-firstObject),ds_grid_get(positions,1,i-firstObject),scale,scale,0,c_white,1);
		draw_text(ds_grid_get(positions,0,i-firstObject)+string_height("text"),ds_grid_get(positions,1,i-firstObject),items[|i].name);
	}
	draw_sprite(sprite_descriptionBox,image_index,0,0);
	draw_text(descriptionXPadding,descriptionYPadding,items[|selectedObject].description);
	obj_hero.frozen=true;
}else if (!open && !obj_dialogueManager.inDialogue && lockedObject!=-1){
	var scale=min(lockedItemSize/sprite_get_width(items[|lockedObject].sprite_index),lockedItemSize/sprite_get_height(items[|lockedObject].sprite_index));
	draw_sprite_ext(items[|lockedObject].sprite_index,0,lockedItemX,lockedItemY,scale,scale,0,c_white,0.8);
}