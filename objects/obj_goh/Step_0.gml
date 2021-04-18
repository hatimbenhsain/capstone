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

switch(state){
	case -1:
		visible=false;
		break;
	case 0:
		visible=true;
		depth=obj_statueStand.depth-1;
		sprite_index=sprite_goh_transform;
		image_index=0;
		state=1;
		lockedSprite=true;
		obj_hero.cameraSubject=self;
		obj_hero.state="acting";
		obj_gui.state="cutscene";
		break;
	case 1:
		depth=obj_statueStand.depth-1;
		if(image_index>=image_number-1 && sprite_index==sprite_goh_transform){
			sprite_index=sprite_goh_pose;
			image_index=0;
		}
		break;
	case 2:
		sprite_index=sprite_goh_idleF;
		depth=obj_statueStand.depth-1;
		break;
	case 3:
		depth=obj_statueStand.depth-1;
		break;
	case 5:
		depth=obj_statueStand.depth-1;
		sprite_index=sprite_goh_idleB;
		obj_priestess.x=x;
		obj_priestess.y=172;
		obj_priestess.state=35;
		state=6;
		break;
	case 6:
		depth=obj_statueStand.depth-1;
		break;
	case 7:
		depth=obj_statueStand.depth-1;
		break;
	case 9:
		sprite_index=sprite_goh_idleF;
		depth=obj_statueStand.depth-1;
		break;
	case 11:
		sprite_index=sprite_goh_idleB;
		depth=obj_statueStand.depth-1;
		break;
	case 13:
		sprite_index=sprite_goh_idleF;
		depth=obj_statueStand.depth-1;
		break;
	case 15:
		sprite_index=sprite_goh_idleF;
		depth=obj_statueStand.depth-1;
		break;
	case 17:
		sprite_index=sprite_goh_idleB;
		depth=obj_statueStand.depth-1;
		break;
	case 19:
		depth=obj_statueStand.depth-1;
		obj_priestess.state=37;
		state=6;
		break;
	case 20:
		depth=obj_statueStand.depth-1;
		obj_priestess.state=38;
		state=6;
		break;
	case 21:
		depth=obj_statueStand.depth-1;
		obj_priestess.state=39;
		state=6;
		FadeInMusic(3000);
		break;
	case 23:
		sprite_index=sprite_goh_idleF;
		depth=obj_statueStand.depth-1;
		break;
	case 25:
		sprite_index=sprite_goh_idleF;
		depth=obj_statueStand.depth-1;
		obj_priestess.state=40;
		break;
	case 27:
		sprite_index=sprite_goh_idleB;
		depth=obj_statueStand.depth-1;
		break;
	case 29:
		sprite_index=sprite_goh_idleB;
		depth=obj_statueStand.depth-1;
		obj_priestess.state=41;
		break;
	case 31:
		sprite_index=sprite_goh_idleB;
		depth=obj_statueStand.depth-1;
		obj_priestess.state=42;
		with(obj_soundManager){
			if(audio_sound_get_gain(bgMusic)==bgGain*masterGain) FadeOutMusic(3000);
		}
		break;
	case 33:
		sprite_index=sprite_goh_idleB;
		depth=obj_statueStand.depth-1;
		image_alpha-=0.005;
		initialHead="";
		if(image_alpha<=0){
			x=room_width;
			y=room_height;
			if(obj_gui.state=="cutscene"){
				with(obj_hero){
					state="grounded";
					obj_gui.state="ingame";
					cameraSubject=self;
				}
			}
		}
		
		break;
	case 34:
		x=640;
		y=480;
		phantomMode=true;
		walking=true;
		dir="B";
		state=35;
		head="";
		initHead="";
		sprite_index=idleB;
		instance_deactivate_object(obj_statueStand);
		lockedSprite=false;
		visible=true;
		image_alpha=1;
		break;
	case 35:
		//image_alpha+=0.05;
		if(y<=310){
			walking=false;
			state=36;	
			ChangeInitHead("goh2");	
			obj_priestess.grassAlpha=0;
			instance_activate_object(obj_gop);
			instance_activate_object(obj_lilypad);
			instance_activate_object(obj_invisibleWall);
			obj_priestess.state=56;
		}
		
		break;
	case 36:
		ChangeInitHead("goh2");
		break;
	case 37:
		image_alpha-=0.01;
		initialHead="";
		if(image_alpha<=0){
			x=room_width;
			y=room_height;
			state=38;
			instance_activate_object(obj_gop);
			instance_activate_object(obj_lilypad);
			obj_gop.state=3;
			instance_activate_layer("endFog");
			instance_activate_object(obj_blackFog1);
			with(obj_blackFog1){
				if(!object_is_ancestor(object_index,obj_brume1) && object_index!=obj_brume1){
					image_alpha=0;	
				}
			}
		}
		break;
		
}


prevState=state;