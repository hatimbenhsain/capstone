/// @description Insert description here
// You can write your code in this editor
audio_stop_sound(audio_limboBgm);
obj_soundManager.bgGain=1;
with(obj_inventory){
	instance_destroy(self);	
}
room_goto(room_priestess);
