/// @description Insert description here
// You can write your code in this editor
interactButton=obj_tuning.interactButton;
downButton=obj_tuning.downButton;
upButton=obj_tuning.upButton;


if(inDialogue){
	var action="";
	var subject=interlocutor;
	if(((keyboard_check_pressed(interactButton) || (skipMode && keyboard_check(interactButton))) && currentChar>=maxLength)){
		currentChar=0;
		//playSFX(sound_textAdvance,0.15);
		if(currentMessage.action!=undefined && currentMessage.type!="a"){
				//script_execute(asset_get_index(currentMessage.parent.children[|answerSelected].action),interlocutor);
				if(!currentMessage.isHead){
					action=asset_get_index(currentMessage.parent.children[|answerSelected].action);
					if(currentMessage.parent.children[|answerSelected].subject!="") subject=currentMessage.parent.children[|answerSelected].subject;
				}else{
					action=asset_get_index(currentMessage.action);
					if(currentMessage.subject!="") subject=currentMessage.subject;
				}
		}
			
		if(currentMessage.type=="q"){
			skipMode=false;
			skipCounter=0;
			CheckGrey(currentMessage,0);
		}
			
		if(currentMessage.type=="a"){
			currentMessage=currentMessage.parent;
			currentMessage=currentMessage.children[|answerSelected];
			skipMode=false;
			skipCounter=0;
			if(currentMessage.action!=undefined){
				//script_execute(asset_get_index(currentMessage.action),interlocutor);
				action=asset_get_index(currentMessage.action);
				if(currentMessage.subject!="") subject=currentMessage.subject;
			}
			//if(currentMessage.text!="Ask something." && currentMessage.text!=">Ask something."){
			currentMessage.greyed=true;
			//}
			currentMessage=currentMessage.children[|0];
			if(currentMessage==noone || currentMessage==undefined){
				currentMessage=noone;
				inDialogue=false;
				finished=true;
				obj_hero.frozen=false;
				interlocutor.head=interlocutor.initialHead;		
				//return;
			}
		}else if(currentMessage.children[|answerSelected]!=undefined){
			currentMessage=currentMessage.children[|answerSelected];
		}else{
			currentMessage=noone;
			inDialogue=false;
			finished=true;
			obj_hero.frozen=false;
			if(interlocutor!="" && interlocutor!=noone){
				interlocutor.head=interlocutor.initialHead;
			}
		}

		
		answerSelected=0;
		if(action!=""){
			script_execute(action,subject);	
		}
	}else if(keyboard_check_pressed(interactButton) || (skipMode && keyboard_check(interactButton))){
		currentChar=maxLength;	
	}

	if(keyboard_check_pressed(upButton) && currentMessage.type=="a"){
		answerSelected=(answerSelected-1+ds_list_size(currentMessage.parent.children)) mod ds_list_size(currentMessage.parent.children);
		playSFX(sound_optionChange,0.9);
		show_debug_message("answer "+string(answerSelected)+" selected");
	}
	if(keyboard_check_pressed(downButton) && currentMessage.type=="a"){
		answerSelected=(answerSelected+1) mod ds_list_size(currentMessage.parent.children);
		playSFX(sound_optionChange,0.9);
		show_debug_message("answer "+string(answerSelected)+" selected");
	}
	
	if(keyboard_check(interactButton)){
		skipCounter++;	
		if(skipCounter>room_speed){
			skipMode=true;	
		}
	}else{
		skipCounter=0;
		skipMode=false;
	}
	
}

if(fade && fadeA<1){
	fadeA+=fadeRate;
}else if(!fade && fadeA>0){
	fadeA-=fadeRate;	
}