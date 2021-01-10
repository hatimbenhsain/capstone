/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

combinable=ds_map_create();



event_inherited();

if(!variable_instance_exists(id,"initialHead") || initialHead==undefined){
	initialHead=parseDialogue("itemTest.csv");	
}

if(!variable_instance_exists(id,"name")) name="item name";
description="sample item description";
pocketed=false;

icon=sprite_index;
