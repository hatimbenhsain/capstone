/// @description Insert description here
// You can write your code in this editor
scene++;
obj_hero.state="grounded";
with(obj_gop){
	AddInteractable(obj_pendant);
	ChangeInitHead("gopInit");
	ChangeHead("gopInit");
}