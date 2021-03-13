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
		var alarms=ds_list_create();
		for(var i=0;i<=11;i++){
			ds_list_add(alarms,alarm[i]);
		}
		ds_map_add_list(map,"alarms",alarms);
	}
	
	with(obj_inventory){
		var map=standardSave(rootList);	
		var objList=ds_list_create();
		for(var i=0;i<ds_list_size(items);i++){
			ds_list_add(objList,object_get_name(items[|i].object_index));	
		}
		ds_map_add_list(map,"objList",objList);
	}
	
	with(obj_tuning){
		var map=SaveControls(rootList);
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

function SaveControls(rootList){
	var map=ds_map_create();
	ds_list_add(rootList,map);
	ds_list_mark_as_map(rootList,ds_list_size(rootList)-1);
	var keys=ds_map_create();
	keys[?"upButton"]=upButton;
	keys[?"interactButton"]=interactButton;
	keys[?"downButton"]=downButton;
	keys[?"leftButton"]=leftButton;
	keys[?"rightButton"]=rightButton;
	keys[?"runButton"]=runButton;
	keys[?"inventoryOpenButton"]=inventoryOpenButton;
	ds_map_add_map(map,"keys",keys);
	map[?"room"]=room;
}

function LoadRoom(){
	if(file_exists("save.sav")){
		var wrapper=LoadJsonFromFile("save.sav");
		var list=wrapper[?"ROOT"];
		var rm=list[|ds_list_size(list)-1][?"room"];
		room_goto(rm);		
		ds_map_destroy(wrapper);
		show_debug_message("game loaded");
		
		audio_stop_all();
		obj_gameManager.paused=false
		alarm[0]=1;
	}
	else{
		show_debug_message("failed to load");	
	}
}

function Load(){

	if(file_exists("save.sav")){
		var wrapper=LoadJsonFromFile("save.sav");
		var list=wrapper[?"ROOT"];
		var rm=list[|ds_list_size(list)-1][?"room"];
		with(obj_hero){
			instance_destroy();	
			show_debug_message("hero destroyed");
		}
		
		with(obj_interactable){
			instance_destroy();
		}
		
		with(obj_inventory){
			instance_destroy();	
		}
		
		
		
		show_debug_message(ds_list_size(list));
		for(var i=0;i<ds_list_size(list)-1;i++){
			standardLoad(list[|i]);
		}
		
		obj_hero.pickedUp=false;
		
		ds_map_destroy(wrapper);
		show_debug_message("game loaded");
	
		obj_gameManager.paused=false
		
		
	}
	else{
		show_debug_message("failed to load");	
	}
}

function LoadControls(){
	if(file_exists("save.sav")){
		var wrapper=LoadJsonFromFile("save.sav");
		var list=wrapper[?"ROOT"];
		var map=list[|ds_list_size(list)-1];
		var keys=map[?"keys"];
		upButton=keys[?"upButton"];
		interactButton=keys[?"interactButton"];
		downButton=keys[?"downButton"];
		leftButton=keys[?"leftButton"];
		rightButton=keys[?"rightButton"];
		runButton=keys[?"runButton"];
		upButton=keys[?"upButton"];
		ds_map_destroy(wrapper);
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
		if(object_is_ancestor(asset_get_index(obj),obj_interactable)){
			for(var i=0;i<=11;i++){
				alarm[i]=map[?"alarms"][|i];
			}
		}
		if(object_index==obj_hero){
			show_debug_message("loaded hero state "+state);	
		}
	}
}