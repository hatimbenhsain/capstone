/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("S"))){
	//Save();	
}

if(keyboard_check_pressed(ord("L"))){
	//Load();	
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