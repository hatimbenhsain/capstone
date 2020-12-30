// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//From Shaun Spalding's tutorial on saving and loading

function SaveStringToFile(name,myString){
	var buffer=buffer_create(string_byte_length(myString)+1,buffer_fixed,1);
	buffer_write(buffer,buffer_string,myString);
	buffer_save(buffer,name);
	buffer_delete(buffer);
}

function LoadJsonFromFile(name){
	var buffer=buffer_load(name);
	var myString=buffer_read(buffer,buffer_string);
	buffer_delete(buffer);
	var json=json_decode(myString);
	return json;
}

function Save(){
	var rootList=ds_list_create();
	
	with(obj_hero){
		var map=standardSave(rootList);
	}
	
	with(obj_interactable){
		var map=standardSave(rootList);
		ds_map_add(map,"initialHead",initialHead);
	}
	
	with(obj_inventory){
		var map=standardSave(rootList);	
		var objList=ds_list_create();
		for(var i=0;i<ds_list_size(items);i++){
			ds_list_add(objList,object_get_name(items[|i].object_index));	
		}
		ds_map_add_list(map,"objList",objList);
	}
	
	var wrapper=ds_map_create();
	ds_map_add_list(wrapper,"ROOT",rootList);
	
	var myString=json_encode(wrapper);
	SaveStringToFile("save.sav",myString);
	
	ds_map_destroy(wrapper);
	
	show_debug_message("game saved");
}

function standardSave(rootList){
	var map=ds_map_create();
	ds_list_add(rootList,map);
	ds_list_mark_as_map(rootList,ds_list_size(rootList)-1);
	var obj=object_get_name(object_index);
	ds_map_add(map,"obj",obj);
	ds_map_add(map,"x",x);
	ds_map_add(map,"y",y);
	ds_map_add(map,"sprite_index",sprite_index);
	if(object_is_ancestor(asset_get_index(obj),obj_collidable)){
		ds_map_add(map,"dir",dir);
		ds_map_add(map,"state",state);
	}
	return map;
}

function Load(){

	if(file_exists("save.sav")){
		with(obj_hero){
			instance_destroy();	
		}
		
		with(obj_interactable){
			instance_destroy();
		}
		
		with(obj_inventory){
			instance_destroy();	
		}
		
		var wrapper=LoadJsonFromFile("save.sav");
		var list=wrapper[?"ROOT"];
		
		show_debug_message(ds_list_size(list));
		for(var i=0;i<ds_list_size(list);i++){
			standardLoad(list[|i]);
		}
		
		obj_hero.pickedUp=false;
		
		ds_map_destroy(wrapper);
		show_debug_message("game loaded");
		
	}
	else{
		show_debug_message("failed to load");	
	}
}

function standardLoad(map){
	var obj=map[?"obj"];
	with(instance_create_layer(0,0,layer,asset_get_index(obj))){
		x=map[?"x"];
		y=map[?"y"];
		sprite_index=map[?"sprite_index"];
		if(object_is_ancestor(asset_get_index(obj),obj_collidable)){
			dir=map[?"dir"];
			state=map[?"state"];
		}else if(obj=="obj_inventory"){
			var objList=map[?"objList"];
			for(var i=0;i<ds_list_size(objList);i++){
				addItem(instance_create_layer(0,0,layer,asset_get_index(objList[|i])))
			}
		}
	}
}