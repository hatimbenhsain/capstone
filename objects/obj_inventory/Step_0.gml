/// @description Insert description here
// You can write your code in this editor
openButton=obj_tuning.inventoryOpenButton;
leftButton=obj_tuning.leftButton;
rightButton=obj_tuning.rightButton;
upButton=obj_tuning.upButton;
downButton=obj_tuning.downButton;
interactButton=obj_tuning.interactButton;

if(keyboard_check_pressed(openButton) && !obj_hero.frozen && !open && ds_list_size(items)>0){
	open=true;
	obj_hero.frozen=true;
	playSFX(sound_inventoryOpen);
}else if(keyboard_check_pressed(openButton) && open && ds_list_size(items)>0){
	open=false;
	obj_hero.frozen=false;
	playSFX(sound_inventoryClose);
}

if(!obj_dialogueManager.inDialogue && !obj_dialogueManager.finished && items!=undefined && open){
	if(keyboard_check_pressed(rightButton)){
		if(selectedObject+1<ds_list_size(items)) selectedObject++;
	}else if(keyboard_check_pressed(leftButton)){
		if(selectedObject-1>=0) selectedObject--;
	}else if(keyboard_check_pressed(upButton)){
		if(selectedObject-2>=0) selectedObject-=2;
	}else if(keyboard_check_pressed(downButton)){
		if(selectedObject+2<ds_list_size(items)) selectedObject+=2;
		else if(selectedObject+1<ds_list_size(items)) selectedObject++;
	}
	
	if(selectedObject>=firstObject+rows*columns){
		firstObject+=2;	
	}else if(selectedObject<firstObject){
		firstObject-=2;	
	}

	if(keyboard_check_pressed(interactButton)){
		if(lockedObject==-1){
			lockedObject=selectedObject;
			show_debug_message("option 1");
		}else if(lockedObject2==-1 && lockedObject!=lockedObject2 && selectedObject!=lockedObject){
			lockedObject2=selectedObject;
			combineObjects();	
			show_debug_message("option 2");
		}
		else if(lockedObject==selectedObject){
			lockedObject=-1;
			show_debug_message("option 3");
		}
	}
}else if(!obj_dialogueManager.inDialogue && obj_dialogueManager.finished && open){
	obj_dialogueManager.finished=false;
}