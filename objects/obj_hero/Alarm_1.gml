/// @description Insert description here
// You can write your code in this editor
// footsteps

var fs=instance_create_depth(x,y,198,obj_footstep);

switch(dir){
	case "F":
		with(fs){
			sprite_index=sprite_heroFootsteps;
			image_yscale=-1;
			y=y+sprite_get_yoffset(sprite_index);
			//sprite_set_offset(sprite_index,sprite_xoffset,sprite_get_height(sprite_index)-sprite_yoffset);
		}
		if(!rightStep) fs.image_xscale=-1; 
		break;
	case "B":
		with(fs){
			sprite_index=sprite_heroFootsteps;	
		}
		if(!rightStep) fs.image_xscale=-1; 
		break;
	case "L":
		with(fs){
			sprite_index=sprite_heroFootstepsL;
			if(!obj_hero.rightStep){
				//image_yscale=-1; 
				y=y-2;
			}
			//image_angle=90;	
			//y=y+sprite_get_xoffset(sprite_index)/2;
			//x=x-sprite_get_yoffset(sprite_index)/2;
		}
		
		break;
	case "R":
		with(fs){
			sprite_index=sprite_heroFootstepsL;
			fs.image_xscale=-1; 
			if(!obj_hero.rightStep){
				//image_yscale=-1; 
				y=y-2;
			}
			//image_angle=90;	
			//y=y+sprite_get_xoffset(sprite_index)/2;
			//x=x-sprite_get_yoffset(sprite_index)/2;
		}
		break;
}

if(room=room_priestess){
	fs.depth=obj_brumeManager.depth-1;	
}

alarm[1]=(1/sprite_get_speed(sprite_index))*room_speed;
rightStep=!rightStep