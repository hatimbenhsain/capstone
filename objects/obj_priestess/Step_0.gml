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
depth=-1*(y+sprite_height/2-12);

switch(state){
	case 2:
		dir="F";
		sprite_index=sittingSprite;
		lockedSprite=true;
		break;
	case 3:
		if(prevState==4){
			state=4;	
		}else if (!add1){
			add1=AddAnswer(GetHead(initialHead),"What will you ask?","priestessQuestion1.csv");
			state=2;
		}
		break;
	case 4:
		dir="B";
		sprite_index=sprite_priestess_idleB;
		lockedSprite=true;
		if(ObjectInInventory(obj_weapon1) && ObjectInInventory(obj_cloth1)){
			ChangeInitHead("priestess3");
		}
		break;
	case 5:
		state=4;
		
		ChangeInitHead("priestess2");
		AddInteractable(obj_weapon1);
		AddInteractable(obj_cloth1);
		for(var i=0;i<instance_number(obj_blackFog1);i++){
			var fog=instance_find(obj_blackFog1,i);
			if (fog.fogLayer==1){
				if(fog.x<630){
					fog.vx=-1;	
				}else{
					fog.vx=1;	
				}
			}
		}
		if(clothShown && weaponShown){
			ds_map_clear(interactableObjects);
			state=8;
			lockedSprite=false;
			ChangeInitHead("priestess8");
			ChangeHead("priestess8");
		}
		break;
	case 6:
		clothShown=true;
		state=8;
		break;
	case 7:
		weaponShown=true;
		state=8
		break;
	case 8:
		lockedSprite=false;
		if(clothShown && weaponShown){
			ds_map_clear(interactableObjects);
			ChangeInitHead("priestess8");
			ChangeHead("priestess8");
			state=-1;
		}
		break;
	case 9:
		image_alpha-=0.005;
		initialHead="";
		if(image_alpha<=0){
			y=y-300;
			state=10;
			image_alpha=10;
			for(var i=0;i<instance_number(obj_blackFog1);i++){
				var fog=instance_find(obj_blackFog1,i);
				if (fog.fogLayer==2){
					fog.vy=-1;
				}
			}
			with(obj_gate){
				state=3;
			}
		}
		break;
	case 13:
		//ancient toy
		break;
	case 14:
		//empty lantern
		break;
	case 15:
		//faded page
		break;
	case 16:
		//discarded page
		break;
	case 17:
		//statue piece
		break;
	case 18:
		//the fair folk
		break;
}

prevState=state;