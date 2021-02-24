/// @description Insert description here
// You can write your code in this editor
// footsteps

var fs=instance_create_depth(x,y,199,obj_footstep);
switch(dir){
	case "F":
		with(fs){
			image_yscale=-1;
			y=y+sprite_get_yoffset(sprite_index);
			//sprite_set_offset(sprite_index,sprite_xoffset,sprite_get_height(sprite_index)-sprite_yoffset);
		}
		break;
	case "B":
		break;
	case "L":
		with(fs){
			image_angle=90;	
			y=y+sprite_get_xoffset(sprite_index)/2;
		}
		break;
}

if(floor(image_index)%2==1) fs.image_xscale=-1; 
alarm[1]=(1/sprite_get_speed(sprite_index))*room_speed;