/// @description Insert description here
// You can write your code in this editor

if(bgMusic!=-1){
	if(!audio_is_playing(bgMusic)){
		audio_play_sound(bgMusic, 10, true);
	}
	audio_sound_gain(bgMusic,bgGain*masterGain,0);
}

if(keyboard_check_pressed(ord("M"))){
	if(masterGain>0){
		tempGain=masterGain;
		masterGain=0;
	}else{
		masterGain=tempGain;
	}
}