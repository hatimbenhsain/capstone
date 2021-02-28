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

switch(state){
	case 0:
		break;
	case 1:
		ds_list_clear(interactableObjects);
		obj_lilypadManager.scene=9;
		state++;
		break;
}

prevState=state;