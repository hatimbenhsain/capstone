/// @description Insert description here
// You can write your code in this editor
if(talkingTo!=noone && !obj_dialogueManager.finished){
	if(head!=undefined){
		if(!obj_dialogueManager.inDialogue){
			show_debug_message("dialogue start");
			obj_dialogueManager.inDialogue=true;
			obj_dialogueManager.head=head;
			obj_dialogueManager.currentMessage=head;
			obj_dialogueManager.interlocutor=self;
		}
	}else{
		talkingTo.talkingTo=noone;
		talkingTo.frozen=false;
		talkingTo=noone;
		
	}
}