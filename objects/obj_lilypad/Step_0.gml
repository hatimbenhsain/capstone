/// @description Insert description here
// You can write your code in this editor
if(obj_hero.bbox_top>bbox_bottom || obj_hero.bbox_bottom<bbox_top || obj_hero.bbox_left>bbox_right || obj_hero.bbox_right<bbox_left){
	//sprite_set_offset(sprite_index,orgOffsetX,orgOffsetY);
	image_alpha=1;
	image_blend=c_white;
	oy=0;
	index=image_index;
}else{
	oy=2;
	sprite_set_offset(sprite_index,orgOffsetX,orgOffsetY-3);
	image_blend=make_color_rgb(200,200,200);
	image_alpha=0.95;
	index=floor(image_index/2)*2
}