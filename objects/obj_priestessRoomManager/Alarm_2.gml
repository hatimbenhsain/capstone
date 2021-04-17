/// @description Insert description here
// You can write your code in this editor
var d;
with(obj_hero){
	d=distance_to_object(obj_caveWall7);	
}
if(!obj_dialogueManager.inDialogue && !obj_inventory.open && d>100){
	with(obj_hero) startDialogue("heroMonologue3");
}else{
	alarm[2]=1;	
}