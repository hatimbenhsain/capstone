/// @description Insert description here
// You can write your code in this editor
if(inDialogue){
	if((keyboard_check_pressed(interactButton) || mouse_check_button_pressed(mb_left)) && currentChar>=maxLength){
		currentChar=0;
		if(currentMessage.type=="a"){
			currentMessage=currentMessage.parent;
			currentMessage=currentMessage.children[|answerSelected].children[|0];
			if(currentMessage==noone || currentMessage==undefined){
				currentMessage=noone;
				inDialogue=false;
				//finished=true;
				obj_hero.frozen=false;
				interlocutor.head=interlocutor.initialHead;		
				return;
			}
		}else if(currentMessage.children[|answerSelected]!=undefined){
			currentMessage=currentMessage.children[|answerSelected];
		}else{
			currentMessage=noone;
			inDialogue=false;
			finished=true;
			obj_hero.frozen=false;
			interlocutor.head=interlocutor.initialHead;			
		}

		if(currentMessage!=noone && currentMessage!=undefined && currentMessage.action!=undefined){
			show_debug_message(script_get_name(destruction));
			script_execute(asset_get_index(currentMessage.action),interlocutor);
		}
		answerSelected=0;
	}else if(keyboard_check_pressed(interactButton) ||  mouse_check_button_pressed(mb_left)){
		currentChar=maxLength;	
	}

	if(keyboard_check_pressed(upButton) && currentMessage.type=="a"){
		answerSelected=(answerSelected-1+ds_list_size(currentMessage.parent.children)) mod ds_list_size(currentMessage.parent.children);
		show_debug_message("answer "+string(answerSelected)+" selected");
	}
	if(keyboard_check_pressed(downButton) && currentMessage.type=="a"){
		answerSelected=(answerSelected+1) mod ds_list_size(currentMessage.parent.children);
		show_debug_message("answer "+string(answerSelected)+" selected");
	}
}