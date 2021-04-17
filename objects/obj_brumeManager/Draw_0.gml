/// @description Insert description here
// You can write your code in this editor
//for(var i=0;i<=room_width;i+=16){

var wx=camera_get_view_x(view_camera[0])-camera_get_view_width(view_camera[0])/2;
wx=wx-wx%16;
var wy=camera_get_view_y(view_camera[0])-camera_get_view_height(view_camera[0])/2;
wy=wy-wy%16;

for(var i=wx;i<=room_width+camera_get_view_width(view_camera[0])/2;i+=16){
	for(var j=wy;j<=room_height+camera_get_view_height(view_camera[0])/2;j+=16){
		draw_sprite(sprite_water1,0,i+xx,j);
		draw_sprite(sprite_water1,0,i+xx-16,j);
	}
}
for(var i=wx;i<=room_width+camera_get_view_width(view_camera[0])/2;i+=16){
	for(var j=wy;j<=room_height+camera_get_view_height(view_camera[0])/2;j+=16){
		draw_sprite(sprite_index,image_index,i,j);
	}
}

draw_set_alpha(1-tileAlpha);
draw_set_color(background_color);
var x2=camera_get_view_x(view_camera[view_current]);
var y2=camera_get_view_y(view_camera[view_current])
draw_rectangle(x2,y2,x2+camera_get_view_width(view_camera[view_current])*2,y2+camera_get_view_height(view_camera[view_current])*2,false)

draw_sprite(ditherBG,0,dx,dy); 
draw_sprite_ext(ditherBG,0,dx,dy+sprite_get_height(ditherBG)*2,1,-1,0,c_white,1-tileAlpha); 
draw_sprite_ext(ditherBG,0,dx,dy+sprite_get_height(ditherBG)*2,1,1,0,c_white,1-tileAlpha); 

draw_set_alpha(1);
draw_set_color(c_white);