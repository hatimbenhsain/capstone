/// @description Insert description here
// You can write your code in this editor

switch(scene){
	case 0:
		if(alarm[0]==-1 && obj_hero.alarm[0]==-1){
			alarm[0]=room_speed*3;	
		}
		
		scene++;
		break;
	case 2:
		obj_hero.dir="F";
		obj_hero.sprite_index=sprite_heroIdleF;
		scene+=1;
		obj_hero.state="grounded";
		break;
}