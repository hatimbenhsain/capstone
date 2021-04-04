/// @description Insert description here
// You can write your code in this editor
var inside=false;
var outsideA=1;
var darkA=0;
with(obj_hero){
	if(place_meeting(x,y,obj_caveInside)){
		inside=true;
		outsideA=0;
		darkA=1;
	}else if(place_meeting(x,y-5,obj_caveInside)){
		outsideA=bbox_top-obj_caveInside.bbox_bottom;
		outsideA=outsideA/5;
		darkA=1;
	}else if(place_meeting(x,y-10,obj_caveInside)){
		darkA=bbox_top-obj_caveInside.bbox_bottom-5;
		darkA=darkA/5;
		darkA=1-darkA;
		show_debug_message(darkA);
	}
}

with(obj_caveInside){
	blackA=outsideA;	
	insideA=darkA;
}
if(obj_brasier.state==-1){
	draw_sprite_ext(sprite_caveMask2,0,obj_caveInside.x,obj_caveInside.y,image_xscale,image_yscale,0,c_white,0.6*(darkA));
}
else if(obj_brasier.state==1){
	shader_set(shader_lantern);
	//shader_set_uniform_f(brasierX,(obj_brasier.x-obj_caveInside.x+sprite_get_xoffset(sprite_caveMask2))/sprite_get_width(sprite_caveMask2));
	//shader_set_uniform_f(brasierY,(obj_brasier.y-obj_caveInside.y+sprite_get_yoffset(sprite_caveMask2))/sprite_get_height(sprite_caveMask2));
	shader_set_uniform_f(brasierX,0.5)
	shader_set_uniform_f(brasierY,0.5)
	draw_sprite_ext(sprite_caveMask2,0,obj_caveInside.x,obj_caveInside.y,image_xscale,image_yscale,0,c_white,0.6*(darkA));
	shader_reset();
}
//draw_sprite_ext(sprite_caveBlack,0,obj_caveInside.x,obj_caveInside.y,1,1,0,c_white,outsideA);
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,outsideA);

