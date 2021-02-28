// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playSFX(audio){
	with(obj_soundManager){
		sfxPlaying=audio;
		audio_sound_gain(sfxPlaying,sfxGain*masterGain,0);
		audio_play_sound(sfxPlaying,1,false);
	}
}