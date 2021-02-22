/// @description Insert description here
// You can write your code in this editor

switch(state){
	case 0:
		var k=random(100);
		if(k<0.01){
			state=1;
		}else{
			with(obj_lilypad){
				image_index=0;
				sprite_index=openSprite;
			}
		}
		break;
	case 1:
		with(obj_lilypad){
			if(image_index>=sprite_get_number(sprite_index)-delta_time*sprite_get_speed(sprite_index)/1000000){
				obj_lilypadManager.state=2;
				sprite_index=idleSprite;
				image_index=0;
			}
		}
		break;
	case 2:
		var k=random(100);
		if(k<0.01){
			with(obj_lilypad){
				sprite_index=openSprite;
				image_index=sprite_get_number(sprite_index)-delta_time/(sprite_get_speed(sprite_index)*1000000);
			}
			state=3;
		}
		break;
	case 3:
		with(obj_lilypad){
			image_index=image_index-2*delta_time*sprite_get_speed(sprite_index)/1000000;
			if(image_index<=delta_time*sprite_get_speed(sprite_index)/1000000){
				obj_lilypadManager.state=0;	
			}
		}
		break
}

yy+=0.3;
yy=yy%sprite_get_height(ditherBG);
x=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2;
y=camera_get_view_y(view_camera[view_current])+yy;
show_debug_message(yy);