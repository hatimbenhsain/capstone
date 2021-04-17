/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 2:
		image_alpha-=0.05;
		if(image_alpha<0 && !obj_dialogueManager.inDialogue){
			state=3;	
		}
		break;
	case 3:
		instance_deactivate_object(self);
		break;
}
