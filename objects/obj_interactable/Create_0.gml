/// @description Insert description here
// You can write your code in this editor

event_inherited();
state=-1;
prevState=-1;
dir=0;
talkingTo=noone;
if(!variable_instance_exists(id,"heads")){
	heads=ds_map_create();
}
if(variable_instance_exists(id,"name") && !variable_instance_exists(id,"initialHead") && file_exists("dialogueFiles/"+name+"Init.csv")){
	initialHead=name+"Init";
}else if(!variable_instance_exists(id,"initialHead")){
	initialHead="";	
}
head=initialHead;
interactableObjects=ds_map_create();
lockedSprite=false;
