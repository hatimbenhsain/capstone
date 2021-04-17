// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playSFX(audio,gain){
	if(is_undefined(gain)) gain=1;
	with(obj_soundManager){
		sfxPlaying=audio;
		audio_sound_gain(sfxPlaying,sfxGain*masterGain*gain,0);
		audio_play_sound(sfxPlaying,1,false);
	}
}

function FadeOutMusic(t){
	if(is_undefined(t)){
		t=1000	
	}
	with(obj_soundManager){
		audio_sound_gain(bgMusic,0,t);	
	}
}

function FadeInMusic(t){
	if(is_undefined(t)){
		t=1000	
	}
	with(obj_soundManager){
		audio_sound_gain(bgMusic,bgGain*masterGain,t);	
	}
}

function SwitchBgm(nextTrack){
	var t=1000;
	with(obj_soundManager){
		if(nextBgm!=nextTrack && nextTrack!=bgMusic){
			audio_sound_gain(bgMusic,bgGain*masterGain*0,t);
			alarm[2]=t*room_speed/1000;
			nextBgm=nextTrack;
		}
	}
}

function PlayText(p){
	if(is_undefined(p)) p=1;
	with(obj_soundManager){
		if(!audio_is_playing(sound_typing)){
			audio_sound_pitch(sound_typing,p);
			audio_play_sound(sound_typing,1,true);
			audio_sound_set_track_position(sound_typing,random(audio_sound_length(sound_typing)));
			audio_sound_gain(sound_typing,sfxGain*masterGain,0);
		}
	}
}

function StopText(){
	with(obj_soundManager){
		audio_stop_sound(sound_typing);
	}
}