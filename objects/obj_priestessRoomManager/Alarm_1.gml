/// @description Insert description here
// You can write your code in this editor
var d;
with(obj_hero){
	d=distance_to_object(obj_priestess);	
}
if(!obj_dialogueManager.inDialogue && !obj_inventory.open && d>12){
	startDialogue("heroMonologue1");
}else{
	alarm[1]=1;	
}