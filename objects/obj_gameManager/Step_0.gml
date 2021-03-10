/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("S"))){
	//Save();	
}

if(keyboard_check_pressed(ord("L"))){
	//Load();	
}

if( keyboard_check_pressed(obj_tuning.pauseButton) && (paused || (obj_hero.state=="grounded" && !obj_hero.frozen && !obj_dialogueManager.inDialogue && !obj_inventory.open && obj_gui.state=="ingame"))){
	paused=!paused;
	obj_hero.frozen=!obj_hero.frozen;
	soundControl=false;
	if(paused){
		optionSelected=0;
		options=pausedOptions;
		obj_gui.pausedOptions=[];
	}
}

if(paused && keyboard_check_pressed(obj_tuning.downButton)){
	optionSelected++;
}else if(paused && keyboard_check_pressed(obj_tuning.upButton)){
	optionSelected--;
	if(optionSelected<0) optionSelected=array_length(options)-1;
}else if(paused && keyboard_check_pressed(obj_tuning.interactButton)){
	obj_gui.pausedOptions=[];
	if(options[optionSelected]=="Resume"){
		paused=false;
		obj_hero.frozen=!obj_hero.frozen;
	}else if(options[optionSelected]=="Save"){
		Save();
	}else if(options[optionSelected]=="Exit Game"){
		options=exitOptions;
	}else if(options[optionSelected]=="Settings"){
		options=settingsOptions;
	}else if(options==exitOptions && options[optionSelected]=="Yes"){
		game_end();	
	}else if(options==exitOptions && options[optionSelected]=="No"){
		options=pausedOptions;
	}else if(options==settingsOptions && options[optionSelected]=="Sound Settings"){
		options=soundOptions;	
	}else if(options==settingsOptions && options[optionSelected]=="Controls"){
		options=controlOptions;
	}else if(options==soundOptions && !soundControl){
		soundControl=!soundControl;
	}
	//obj_gui.pausedOptions=options;
}
optionSelected=optionSelected%array_length(options);

if(paused){
	for(var i=0;i<array_length(options);i++){
		var t=options[i];
		obj_gui.pausedOptions[i]=t;
		if(i==optionSelected){
			if(!soundControl || options!=soundOptions){
				t="> "+t+" <";
				obj_gui.pausedOptions[i]=t;
			}
		}
	
	}
	
	if(soundControl){
		with(obj_soundManager){
			var gains=[masterGain,bgGain,sfxGain]
			var gg=0;
			if(keyboard_check_pressed(obj_tuning.leftButton)){
				gg=-0.1;
			}else if(keyboard_check_pressed(obj_tuning.rightButton) && gains[obj_gameManager.optionSelected]<1){
				gg=0.1
			}
			switch(obj_gameManager.optionSelected){
				case 0:
					masterGain=clamp(masterGain+gg,0,1);
					break;
				case 1:
					bgGain=clamp(bgGain+gg,0,1);
					break;
				case 2:
					sfxGain=clamp(sfxGain+gg,0,1);
					break;	
			}
			
		}
	}
	
}

if(ds_list_empty(obj_inventory.items) && room==room_priestess){
	var pendant=instance_create_layer(x,y,layer,obj_pendant);
	addItem(pendant);
}

if(keyboard_check(vk_alt) && keyboard_check(ord("D")) && keyboard_check_pressed(ord("B"))){
	debugMode=!debugMode;	
}

if(debugMode && keyboard_check_pressed(ord("Y"))){
	if(room==room_limbo){
		room_goto(room_priestess);	
	}else if(room==room_priestess){
		room_goto(room_limbo);
	}	
}