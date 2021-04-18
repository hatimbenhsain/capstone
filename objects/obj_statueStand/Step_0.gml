/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 1:
		if(ds_map_size(interactableObjects)<=1){
			AddInteractableByName(obj_statueArms,"statueStandStatue Piece");
			AddInteractableByName(obj_statueBits,"statueStandStatue Piece");
			AddInteractableByName(obj_statueBody,"statueStandStatue Piece");
			AddInteractableByName(obj_statueHands,"statueStandStatue Piece");
			AddInteractableByName(obj_statueHead,"statueStandStatue Piece");
			AddInteractableByName(obj_statueHooves,"statueStandStatue Piece");
			AddInteractableByName(obj_statueParts,"statueStandStatue Piece");
			AddInteractableByName(obj_statuePieces,"statueStandStatue Piece");
		}
		if(!ds_map_exists(interactableObjects,"Statue")) AddInteractable(obj_statueWhole);
		ChangeInitHead("statueStand2");
		break;
	case 3:
		sprite_index=sprite_ow_statueWhole;
		if(obj_priestess.state==10) ChangeInitHead("statueStand3");
		else if(obj_priestess.state==31){
			ChangeInitHead("statueStand4");
			state=4;
		}else if(obj_priestess.state==34){
			ChangeInitHead("statueStand5");
			state=5;
		}
		break;
	case 4:
		sprite_index=sprite_ow_statueWhole;
		if(obj_priestess.state==34){
			ChangeInitHead("statueStand5");
			state=5;
		}
		break;
	case 5:
		ChangeInitHead("statueStand5");
		DeleteInstanceOf(obj_statueWhole);
		sprite_index=sprite_ow_statueWhole;
		break;
	case 6:
		initHead="";
		head="";
		FadeToBlack(2,1);
		obj_hero.frozen=true;
		alarm[0]=room_speed*2; //moving everything in place
		state=7;
		break;
	case 7:
		initHead="";
		head="";
		break;
}