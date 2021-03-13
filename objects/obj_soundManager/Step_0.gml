/// @description Insert description here
// You can write your code in this editor

if(bgGain!=prevBgGain || masterGain!=prevMasterGain){
	audio_sound_gain(bgMusic,bgGain*masterGain,0);
}


switch(room){
	case room_limbo:
		bgMusic=audio_limboBgm;
		break;
	case room_priestess:
		bgMusic=audio_manabgm;
		break;
}

if(bgMusic!=-1){
	//if(!audio_is_playing(bgMusic)){
	//	audio_play_sound(bgMusic, 10, true);
	//}
	//bgGain=audio_sound_get_gain(bgMusic)*masterGain;
	//audio_sound_gain(bgMusic,bgGain*masterGain,0);
}

if(keyboard_check_pressed(ord("M")) && obj_gameManager.debugMode){
	if(masterGain>0){
		tempGain=masterGain;
		masterGain=0;
	}else{
		masterGain=tempGain;
	}
}

prevBgGain=bgGain;
prevSfxGain=sfxGain;
prevMasterGain=masterGain;

//if(sfxPlaying!=-1 && tempBg==-1 && alarm[0]==-1){
//	tempBg=bgGain;
//	bgGain=0.8*bgGain;
//	alarm[0]=room_speed*0.5;
//}