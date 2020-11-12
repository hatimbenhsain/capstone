// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addItem(item){
	show_debug_message(item);
	with(item){
		show_debug_message(object_index);
		ds_list_add(obj_inventory.items,object_index);
		ds_list_add(obj_inventory.sprites,sprite_index);
		instance_destroy();
	}
	show_debug_message("item add");
}