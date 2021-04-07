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
			y=80;
			x=640;
			state=10;
			AddInteractable(obj_page1);
			AddInteractable(obj_page11);
			AddInteractable(obj_page2);
			AddInteractable(obj_page3);
			AddInteractable(obj_toy);
			AddInteractable(obj_emptyLantern);
			AddInteractable(obj_glowingLantern);
			AddInteractable(obj_fruit);
			AddInteractableByName(obj_statueArms,"priestessStatue Piece");
			AddInteractableByName(obj_statueHooves,"priestessStatue Piece");
			AddInteractableByName(obj_statueHead,"priestessStatue Piece");
			AddInteractableByName(obj_statueHands,"priestessStatue Piece");
			AddInteractableByName(obj_statueBody,"priestessStatue Piece");
			AddInteractable(obj_knife);
			AddInteractable(obj_birdStatueFood);
			AddInteractable(obj_pendant);
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
	case 10:
		ChangeInitHead("priestessQuestions");
		with(obj_gate){
			if(state<3)	state=3;
		}
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
		
		var treeQ=false;
		var howItHappenedQ=false;
		var caveQ=false;
		var h=GetHead(initialHead);
		for(var i=0;i<ds_list_size(h.children);i++){
			var c=h.children[|i];
			if(c.text=="How it happened." && c.greyed){
				howItHappenedQ=true;	
			}else if(c.text=="The cave." && c.greyed){
				caveQ=true;	
			}else if(c.text=="The tree." && c.greyed){
				treeQ=true;	
			}
		}
		if(howItHappenedQ && caveQ && treeQ){
			state=30;
			alarm[5]=room_speed;
			with(obj_hero){
				state="acting"	
			}
		}
		break;
	case 13:
		var q=AddAnswer(GetHead(initialHead),"What do you want to learn about?","priestessChildrenQ.csv");
		state=prevState;
		//ancient toy
		break;
	case 14:
		var q=AddAnswer(GetHead(initialHead),"What do you want to learn about?","priestessTreeQ.csv");
		state=prevState;
		//empty lantern
		break;
	case 15:
		state=prevState;
		RemoveInteractable(obj_page2);
		//faded page (diary)
		break;
	case 16:
		var q=AddAnswer(GetHead(initialHead),"What do you want to learn about?","priestessWorshipQ.csv");
		state=prevState;
		//discarded page
		break;
	case 17:
		var q=AddAnswer(GetHead(initialHead),"What do you want to learn about?","priestessStatueQ.csv");
		state=prevState;
		//statue piece
		break;
	case 18:
		var q=AddAnswer(GetHead(initialHead),"What do you want to learn about?","priestessFairFolkQ.csv");
		state=prevState;
		//the fair folk
		break;
	case 19:
		//how it happened
		var q=AddAnswer(GetHead(initialHead),"What do you want to learn about?","priestessHowItHappenedQ.csv");
		state=prevState;
		break;
	case 20:
		//after tree discussion
		with(obj_tree1){
			if(state==0) state=1;	
		}
		state=prevState;
		FadeInMusic(3000);
		break;
	case 21:
		with(obj_brasier){
			if(state==0) state=1;	
		}
		state=prevState;
		//after cave discussion
		break;
	case 22: 
		//tired
		with(obj_brasier){
			if(state==1) state=2;	
		}
		state=prevState;
		break;
	case 30:
		if(alarm[5]==-1){
			startDialogue("priestessTired");
			state=31;
			with(obj_priestessRoomManager){
				alarm[1]=room_speed*2;
			}
		}
		break;
	case 31:
		with(obj_gate){
			if(state<3)	state=3;
		}
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
		break;
}

prevState=state;