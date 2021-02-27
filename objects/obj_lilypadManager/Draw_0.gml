/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(1);
draw_set_color(background_color);
var xx=camera_get_view_x(view_camera[view_current]);
var yy=camera_get_view_y(view_camera[view_current])
draw_rectangle(xx,yy,xx+camera_get_view_width(view_camera[view_current])*2,yy+camera_get_view_height(view_camera[view_current])*2,false)

draw_sprite(ditherBG,0,x,y); 
draw_sprite_ext(ditherBG,0,x,y+sprite_get_height(ditherBG)*2,1,-1,0,c_white,1); 
draw_sprite_ext(ditherBG,0,x,y+sprite_get_height(ditherBG)*2,1,1,0,c_white,1); 

