/// @description Insert description here
// You can write your code in this editor
if(obj_dialogueManager.currentMessage!=noone){
	talker=obj_dialogueManager.currentMessage.talker;
	if(talker!=noone){
		emotion=obj_dialogueManager.currentMessage.emotion;
		talker=asset_get_index("obj_"+talker);
		talker=instance_find(talker,0);
		show_debug_message(emotion+"Sprite");
		sprite_index=variable_instance_get(talker,emotion+"Sprite");
	}
}else{
	talker=noone;	
}