/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("S"))){
	Save();	
}

if(keyboard_check_pressed(ord("L"))){
	Load();	
}

if(ds_list_empty(obj_inventory.items)){
	var pendant=instance_create_layer(x,y,layer,obj_pendant);
	addItem(pendant);
}