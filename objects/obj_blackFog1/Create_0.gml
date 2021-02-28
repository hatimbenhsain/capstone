/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event

fogLayer=0
if(layer==layer_get_id("fog1")){
	fogLayer=1;	
}else if((layer==layer_get_id("blackFog"))){
	fogLayer=2	
}

event_inherited();

vx=0;
vy=0;

