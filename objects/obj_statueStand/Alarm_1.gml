/// @description Insert description here
// You can write your code in this editor

sprite_index=sprite_ow_statueStand;

with(obj_goh){
	obj_goh.state=0;
	startDialogue("gohScene1",obj_goh);
	obj_dialogueManager.interlocutor=obj_goh;
}

SwitchBgm(audio_nicholeBgm);