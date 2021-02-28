/// @description Insert description here
// You can write your code in this editor

switch(state){
	case 1:
		show_debug_message(distance_to_point(obj_hero.x,obj_hero.bbox_bottom));
		if(point_distance(obj_hero.x,obj_hero.bbox_bottom,x,y)<5){
			with(obj_hero){
				instance_create_depth(x,y,depth-2,obj_sludge);
				state="acting";
			}
			state++;
			FadeToBlack(3,5);
			alarm[0]=room_speed*5;
			audio_sound_gain(audio_limboBgm,0,5);
		}
		
		break;
}