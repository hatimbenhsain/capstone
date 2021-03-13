// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function destruction(){
	instance_destroy(obj_hero);	
}

function ChangeHead(name){
	head=name;
}

function ChangeInitHead(name){
	initialHead=name;	
}

function useItem(obj){
	show_debug_message(object_get_name(object_index));
	if(ds_map_exists(interactableObjects,obj)){
		head=ds_map_find_value(interactableObjects,obj);
	}else{
		if(file_exists("dialogueFiles/"+name+"Confusion"+".csv")) head=name+"Confusion";	
	}
	obj_inventory.lockedObject=-1;
}

function startDialogue(dialogueName){
	var dialogue=GetHead(dialogueName);
	obj_dialogueManager.inDialogue=true;
	obj_dialogueManager.head=dialogue;
	obj_dialogueManager.currentMessage=dialogue;
	obj_dialogueManager.interlocutor="";
}
