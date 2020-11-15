/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(openButton) && !obj_hero.frozen && !open){
	open=true;
	obj_hero.frozen=true;
}else if(keyboard_check_pressed(openButton) && open){
	open=false;
	obj_hero.frozen=false;
}

if(!obj_dialogueManager.inDialogue && !obj_dialogueManager.finished){
	if(keyboard_check_pressed(rightButton) && open){
		if(selectedObject+1<ds_list_size(items)) selectedObject++;
	}else if(keyboard_check_pressed(leftButton) && open){
		if(selectedObject-1>=0) selectedObject--;
	}else if(keyboard_check_pressed(upButton) && open){
		if(selectedObject-2>=0) selectedObject-=2;
	}else if(keyboard_check_pressed(downButton) && open){
		if(selectedObject+2<ds_list_size(items)) selectedObject+=2;
		else if(selectedObject+1<ds_list_size(items)) selectedObject++;
	}

	if(keyboard_check_pressed(interactButton) && open){
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
}else if(!obj_dialogueManager.inDialogue && obj_dialogueManager.finished){
	obj_dialogueManager.finished=false;
}