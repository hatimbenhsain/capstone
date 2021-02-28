/// @description Insert description here
// You can write your code in this editor

switch(state){
	case 0:
		var k=random(100);
		if(k<0.1 && obj_hero.state!="falling"){
			state=1;
		}else{
			with(obj_lilypad){
				image_index=0;
				sprite_index=openSprite;
			}
			with(obj_limboTree){
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
		with(obj_limboTree){
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
			with(obj_limboTree){
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
		with(obj_limboTree){
			image_index=image_index-2*delta_time*sprite_get_speed(sprite_index)/1000000;
			if(image_index<=delta_time*sprite_get_speed(sprite_index)/1000000){
				obj_lilypadManager.state=0;	
			}
		}
		break
}

yy-=0.5;
yy=yy%(sprite_get_height(ditherBG)*2);
x=camera_get_view_x(view_camera[view_current])+camera_get_view_width(view_camera[view_current])/2;
y=camera_get_view_y(view_camera[view_current])+yy;

background_color=merge_color($6E218A,c_black,cos(get_timer()/2500000)/2+0.5);

switch(scene){
	case 1:	
		obj_hero.sprite_index=sprite_heroIdleF;
		if(alarm[0]==-1) alarm[0]=room_speed;
		break;
	case 2:
		if(!obj_dialogueManager.inDialogue){
			obj_hero.dir="L";
			obj_hero.sprite_index=sprite_heroIdleL;
			scene+=1;
			startDialogue("limboDialogue2");
		}
		break;
	case 3:
		if(!obj_dialogueManager.inDialogue){
			obj_hero.dir="R";
			obj_hero.sprite_index=sprite_heroIdleR;
			scene+=1;
			obj_hero.state="grounded";
		}
		break;
	case 4:
		with(obj_hero){
			if(distance_to_object(obj_gop)<50){
				state="acting";
				cameraSubject=obj_gop;
				sprite_index=asset_get_index("sprite_heroIdle"+dir);
				startDialogue("limboDialogue3");
				obj_lilypadManager.scene+=1;
			}
		}
		break;
	case 5:
		if(!obj_dialogueManager.inDialogue){
			obj_gop.dir="F";
			if(alarm[1]==-1) alarm[1]=room_speed;
		}
		break;
	case 6:
		if(!obj_dialogueManager.inDialogue){
			with(obj_hero){
				cameraSubject=self;	
			}
			if(alarm[2]==-1) alarm[2]=room_speed/2;
			
		}
		break;
	case 7:
		if(ObjectInInventory(obj_pendant)){
			show_debug_message("changing head");
			with(obj_gop){
				ChangeInitHead("gop2");
				
			}
			scene++;
		}
		break;
	case 9:
		with(obj_hero){
			state="acting"	
		}
		with(obj_gop){
			if(!walking){
				if(obj_hero.bbox_bottom>bbox_bottom){
					alarm[2]=1;
				}else{
					alarm[1]=1;
				}
			}
			if(bbox_bottom<camera_get_view_y(view_camera[0]) || y>camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])+20){
				obj_hero.state="grounded";
				obj_lilypadManager.scene++;
				instance_deactivate_object(obj_gop);	
			}
		}
		break;
	
		
}