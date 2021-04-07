/// @description Insert description here
// You can write your code in this editor
event_inherited();
switch(state){
	case -1:
		state=1;
		break;
	case 0:
		if(initialHead!="brasierInit") ChangeInitHead("brasierInit");
		break;
	case 1:
		//sprite_index=sprite_ow_lantern_lit;
		if(initialHead!="brasier2"){
			with(obj_caveWall1){
				ChangeInitHead("cave2")	
			}
			ChangeInitHead("brasier2");
			AddInteractable(obj_emptyLantern);
			AddInteractable(obj_fruit);
			AddInteractableByName(obj_glowingLantern,"brasierGlowing Lantern1");
		}
		break;
	case 2:
		AddInteractableByName(obj_glowingLantern,"brasierGlowing Lantern2");
		with(obj_caveWall1){
			ChangeInitHead("cave3")	
		}
		break;
	case 3:
		ChangeInitHead("brasier3");
		sprite_index=sprite_ow_lantern_lit;
		state=4;
		with(obj_caveWall1){
			ChangeInitHead("cave1")	
		}
		break;
}