/// @description Insert description here
// You can write your code in this editor
state=0

x=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2;
y=camera_get_view_y(view_camera[view_current]);
yy=0;
ditherBG=sprite_ditherBG4;

depth=199;

scene=0;
heads=ds_map_create();