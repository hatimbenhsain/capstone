/// @description Insert description here
// You can write your code in this editor
event_inherited();
if(talkingTo!=noone && !obj_dialogueManager.finished){
	if(head!="" && head!=undefined){
		if(!obj_dialogueManager.inDialogue){
			show_debug_message(head);
			show_debug_message(obj_dialogueManager.finished);
			obj_dialogueManager.inDialogue=true;
			obj_dialogueManager.head=GetHead(head);
			obj_dialogueManager.currentMessage=obj_dialogueManager.head;
			obj_dialogueManager.interlocutor=self;
		}
	}else{
		talkingTo.talkingTo=noone;
		talkingTo.frozen=false;
		talkingTo=noone;
	}
}

if(head=="" || head==undefined){
	head=initialHead;	
}