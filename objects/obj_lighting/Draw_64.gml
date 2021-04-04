/// @description Insert description here
// You can write your code in this editor
if(room=room_priestess){
	var sc=display_get_gui_width()/camera_get_view_width(view_camera[0]);
	draw_sprite_ext(sprite_caveMask,0,sc*(obj_caveInside.x-camera_get_view_x(view_camera[0])),sc*(obj_caveInside.y-camera_get_view_y(view_camera[0])),sc,sc,0,c_white,obj_caveInside.insideA);
	if(obj_caveInside.insideA>0){
		draw_sprite_ext(sprite_caveOutside,obj_cave.image_index,sc*(obj_cave.x-camera_get_view_x(view_camera[0])),sc*(obj_cave.y-camera_get_view_y(view_camera[0])),sc,sc,0,c_white,obj_caveInside.blackA);
	}
	
}