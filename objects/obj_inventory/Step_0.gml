/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(openButton) && !obj_hero.frozen && !open){
	open=true;
	obj_hero.frozen=true;
}else if(keyboard_check_pressed(openButton) && open){
	open=false;
	obj_hero.frozen=false;
}