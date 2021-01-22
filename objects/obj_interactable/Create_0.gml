/// @description Insert description here
// You can write your code in this editor

event_inherited();
state=-1;
prevState=-1;
dir=0;
talkingTo=noone;
if(variable_instance_exists(id,"name") && !variable_instance_exists(id,"initialHead")){
	initialHead=parseDialogue(name+"Init"+".csv");
}else if(!variable_instance_exists(id,"initialHead")){
	initialHead=undefined;	
}
head=initialHead;
interactableObjects=ds_map_create();
