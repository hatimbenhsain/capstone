/// @description Insert description here
// You can write your code in this editor

switch(state){
	case 0:
		var k=random(100);
		if(k<0.5){
			state=1;
			with(obj_brume1) image_index=0;
		}else{
			with(obj_brume1){
				image_speed=0.3;
			}
		}
		break;
	case 1:
		with(obj_brume1){
			image_speed=2;
			if(image_index>2) obj_brumeManager.state=2;	
		}
		break;
	case 2:
		with(obj_brume1){
			if(image_index<1) obj_brumeManager.state=0;	
		}
		break;
	case 3:
		if(tileAlpha>0) tileAlpha-=0.005;
		break;
}

xx+=0.1;
if(xx>=16) xx=0;

yy-=0.5;
yy=yy%(sprite_get_height(ditherBG)*2);
dx=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2;
dy=camera_get_view_y(view_camera[view_current])+yy;

background_color=merge_color($6E218A,$461D61,cos(get_timer()/2500000)*0.4+0.4);