/// @description Insert description here
// You can write your code in this editor
if(drawn && talker!=noone){
	var scale=display_get_gui_width()/camera_get_view_width(view_camera[0]);
	var portraitX=display_get_gui_width()*111/128;
	var portraitY=display_get_gui_height()*53/64;
	draw_sprite_ext(portraitBG,0,portraitX,portraitY,scale,scale,0,c_white,1);
	var frame=image_index;
	var frameFrame=(current_time%1000)*5/1000;
	if(!talking && floor(frame)!=4) frame=0;
	if(!talking) frameFrame=0;
	draw_sprite_ext(sprite_index,frame,portraitX,portraitY,scale,scale,0,c_white,1);
	draw_sprite_ext(portraitFrame,frameFrame,portraitX,portraitY,scale,scale,0,c_white,1);	
}