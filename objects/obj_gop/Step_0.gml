/// @description Insert description here
// You can write your code in this editor

//if(state=="0"){
//	if(alarm[11]==-1){
//		alarm[11]=room_speed*16;
//		show_debug_message("cycle");
//		alarm[1]=1;
//		alarm[0]=2*room_speed;
//		alarm[3]=room_speed*4;
//		alarm[2]=room_speed*8;
//		alarm[4]=room_speed*12;
//	}else if(alarm[0]==-1){
//		alarm[0]=4*room_speed;
//	}
//}
//if(state==3){
//	initialHead=parseDialogue("priestessQuestions.csv");
//	state=2
//}


event_inherited();



totalTime+=delta_time/1000000;
capeOpacity=0.8+sin(totalTime)*0.2;

capeImage=(capeImage+delta_time*sprite_get_speed(capeSprite)/1000000)%sprite_get_number(capeSprite);

if(capeSprite==sprite_gop_cape_idle && capeImage<0.5){
	var r=random(100);
	if(r<10){
		capeSprite=sprite_gop_cape_eyes;
		capeImage=0;
	}
}else if(capeSprite=sprite_gop_cape_eyes && capeImage>sprite_get_number(capeSprite)-1){
	capeSprite=sprite_gop_cape_idle;
	capeImage=0.5;
}

if(room=room_limbo){
	switch(state){
		case 0:
			break;
		case 1:
			ds_list_clear(interactableObjects);
			obj_lilypadManager.scene=9;
			state++;
			break;
	}
}else if(room=room_priestess){
	switch(state){
		case 3:
			with(obj_collidable){
				var n=object_get_name(object_index);
				if(n!="obj_hero" && n!="obj_gop" && n!="obj_lilypad" && n!="obj_priestess"){
					image_alpha-=0.005;
					if(image_alpha<=0){
						instance_deactivate_object(id);	
					}
				}
			}
			with(obj_brumeManager){
				if(state<=2) state=3;
			}	
			x=obj_lilypad.x;
			ChangeInitHead("gopFinal");
			break;
		case 4:
			var inst=instance_create_depth(obj_hero.x,obj_hero.bbox_bottom,depth,obj_abyss);
			state=5;
			with(inst){
				image_alpha=0;
				state=5;
			}
			break;
		case 6:
			head="";
			initHead="";
			with(obj_abyss){
				state=1;
			}
			state=7;
			FadeOutMusic(2000);
			break;
			
	}
}

prevState=state;