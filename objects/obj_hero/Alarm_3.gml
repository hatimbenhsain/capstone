/// @description Insert description here
// You can write your code in this editor
var fs=choose(sound_wetStep1,sound_wetStep2,sound_wetStep4,sound_wetStep5,sound_wetStep7,sound_wetStep8,sound_wetStep9);
while(fs==lastFootStep){
	fs=choose(sound_wetStep1,sound_wetStep2,sound_wetStep4,sound_wetStep5,sound_wetStep7,sound_wetStep8,sound_wetStep9);
}
if(room=room_limbo) playSFX(fs,random_range(0.7,1));
lastFootStep=fs;

alarm[3]=obj_tuning.footStepTime*room_speed/image_speed;