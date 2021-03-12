/// @description Insert description here
// You can write your code in this editor
interactButton=obj_tuning.interactButton;
upButton=obj_tuning.upButton;
downButton=obj_tuning.downButton;

if(keyboard_check_pressed(ord("S"))){
	//Save();	
}

if(keyboard_check_pressed(ord("L"))){
	//Load();	
}

if(keyboard_check_pressed(obj_tuning.pauseButton) && (paused || (obj_hero.state=="grounded" && !obj_hero.frozen && !obj_dialogueManager.inDialogue && !obj_inventory.open && obj_gui.state=="ingame"))){
	if(paused){
		if(options=pausedOptions){
			paused=!paused;
			obj_hero.frozen=!obj_hero.frozen;
		}else if(options=settingsOptions || options==exitOptions){
			options=pausedOptions;	
		}else if(soundControl || keysControl){
			soundControl=false;
			keysControl=false;
		}else if(options=soundOptions || options=controlOptions){
			options=settingsOptions;
		}
	}
	else{
		paused=!paused;
		obj_hero.frozen=!obj_hero.frozen;
		optionSelected=0;
		options=pausedOptions;
		obj_gui.pausedOptions=[];
	}
}

if(keysControl && paused){
	var key=ds_map_find_first(keys);
	var entries=[obj_tuning.upButton,obj_tuning.downButton,obj_tuning.leftButton,obj_tuning.rightButton,obj_tuning.interactButton,obj_tuning.inventoryOpenButton,obj_tuning.runButton];
	for(var i=0;i<ds_map_size(keys);i++){
		if(keyboard_check_pressed(key)){
			var keyExists=false;
			for(var k=0;k<array_length(entries);k++){
				if(optionSelected!=k && entries[k]==key){
					keyExists=true;	
				}
			}
			if(!keyExists){
				switch(optionSelected){
					case 0:
						obj_tuning.upButton=key;
						break;
					case 1:
						obj_tuning.downButton=key;
						break;
					case 2:
						obj_tuning.leftButton=key;
						break;
					case 3:
						obj_tuning.rightButton=key;
						break;
					case 4:
						obj_tuning.interactButton=key;
						break;
					case 5:
						obj_tuning.inventoryOpenButton=key;
						break;
					case 6:
						obj_tuning.runButton=key;
						break;
				}
				keysControl=false;
				optionSelected++;
			}
			break;
		}else{
			key=ds_map_find_next(keys,key);	
		}
	}
}	

if(paused && keyboard_check_pressed(downButton)){
	optionSelected++;
}else if(paused && keyboard_check_pressed(upButton)){
	optionSelected--;
	if(optionSelected<0) optionSelected=array_length(options)-1;
}else if(paused && keyboard_check_pressed(interactButton)){
	if(options[optionSelected]=="Resume"){
		paused=false;
		obj_hero.frozen=!obj_hero.frozen;
	}else if(options[optionSelected]=="Save"){
		Save();
	}else if(options[optionSelected]=="Exit Game"){
		options=exitOptions;
		optionSelected=0;
	}else if(options[optionSelected]=="Settings"){
		options=settingsOptions;
		optionSelected=0;
	}else if(options==exitOptions && options[optionSelected]=="Yes"){
		game_end();	
	}else if(options==exitOptions && options[optionSelected]=="No"){
		options=pausedOptions;
		optionSelected=0;
	}else if(options==settingsOptions && options[optionSelected]=="Sound Settings"){
		options=soundOptions;
		optionSelected=0;
	}else if(options==settingsOptions && options[optionSelected]=="Controls"){
		options=controlOptions;
		optionSelected=0;
	}else if(options==soundOptions && !soundControl){
		soundControl=!soundControl;
	}else if(options==controlOptions && !keysControl){
		keysControl=true;
	}
	
	//obj_gui.pausedOptions=options;
}
optionSelected=optionSelected%array_length(options);

if(paused){
	obj_gui.pausedOptions=[];
	for(var i=0;i<array_length(options);i++){
		var t=options[i];
		obj_gui.pausedOptions[i]=t;
		if(i==optionSelected){
			if(!soundControl && !keysControl){
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
			}else if(keyboard_check_pressed(obj_tuning.rightButton)){
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