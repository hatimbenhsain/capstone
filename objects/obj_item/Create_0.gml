/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
initialHead=parseDialogue("itemTest.csv");
combinable=ds_map_create();

event_inherited();

if(!variable_instance_exists(id,"name")) name="item name";
description="sample item description";
pocketed=false;
