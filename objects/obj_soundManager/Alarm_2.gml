/// @description Insert description here
// You can write your code in this editor
audio_stop_sound(bgMusic);
audio_sound_gain(nextBgm,0,0);
audio_play_sound(nextBgm,1,true);
audio_sound_gain(nextBgm,bgGain*masterGain,1000);
bgMusic=nextBgm;
