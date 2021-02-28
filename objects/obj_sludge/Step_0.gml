/// @description Insert description here
// You can write your code in this editor
if(image_index>=10){
	global.cameraOverride=true;
	camera_set_view_pos(view_camera[0],camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0])+1)
	obj_hero.visible=false;
}

image_index=clamp(image_index,0,19);