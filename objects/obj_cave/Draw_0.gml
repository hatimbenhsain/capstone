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
//draw_sprite_ext(sprite_caveBlack,0,obj_caveInside.x,obj_caveInside.y,1,1,0,c_white,outsideA);
draw_sprite_ext(sprite_index,image_index,x,y,1,1,0,c_white,outsideA);

