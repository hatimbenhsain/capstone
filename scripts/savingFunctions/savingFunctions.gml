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
		var key=ds_map_find_first(heads);
		for(var i=0;i<ds_map_size(heads);i++){
			show_debug_message("checking key "+key);
			if(key==initialHead){
				ds_map_add(map,"initialHead",key);
				break;
			}
			key=ds_map_find_next(heads,key);
		}
		var alarms=ds_list_create();
		for(var i=0;i<=11;i++){
			ds_list_add(alarms,alarm[i]);
		}
		ds_map_add_list(map,"alarms",alarms);
		SaveHeads(map);
		var io=ds_map_create();
		key=ds_map_find_first(interactableObjects);
		for(var i=0;i<ds_map_size(interactableObjects);i++){
			ds_map_add(io,key,interactableObjects[?key]);
			key=ds_map_find_next(interactableObjects,key);
		}
		ds_map_add_map(map,"interactableObjects",io);
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
	ds_map_add(map,"sprite_index",sprite_get_name(sprite_index));
	if(object_is_ancestor(asset_get_index(obj),obj_collidable)){
		ds_map_add(map,"dir",dir);
		ds_map_add(map,"state",state);
	}
	return map;
}

function SaveHeads(map){
	show_debug_message("saving heads");
	var headsMap=ds_map_create();
	ds_map_add_map(map,"heads",headsMap);
	var key=ds_map_find_first(heads);
	for(var i=0;i<ds_map_size(heads);i++){
		var dialoguesToAdd=ds_list_create();
		var messagesList=ds_list_create();
		var m=heads[?key];
		show_debug_message(ds_map_exists(heads,key));
		messagesList=MessageList(messagesList,m);
		show_debug_message("after ml");
		show_debug_message("the key is "+key);
		ds_map_add_list(headsMap,key,dialoguesToAdd);
		for(var k=0;k<ds_list_size(messagesList);k++){
			var list=ds_list_create();
			var mess=messagesList[|k];
			show_debug_message(mess.text);
			ds_list_add(dialoguesToAdd,list);
			ds_list_mark_as_list(dialoguesToAdd,ds_list_size(dialoguesToAdd)-1);
			ds_list_add(list,mess.text);
			ds_list_add(list,ds_list_find_index(messagesList,mess.parent));
			ds_list_add(list,mess.type);
			ds_list_add(list,mess.action);
			ds_list_add(list,mess.subject);
			ds_list_add(list,mess.talker);
			ds_list_add(list,mess.emotion);
			ds_list_add(list,mess.isHead);
			//if(mess.isHead) show_debug_message("HEAD "+mess.text+" "+ds_list_size(list));
			ds_list_add(list,mess.greyed);
			//if(mess.greyed) show_debug_message("greyed "+mess.text+" "+ds_list_size(list));
			var children=ds_list_create();
			ds_list_add(list,children);
			ds_list_mark_as_list(list,ds_list_size(list)-1);
			for(var p=0;p<ds_list_size(mess.children);p++){
				ds_list_add(children,ds_list_find_index(messagesList,mess.children[|p]));
			}
		}
		//show_debug_message("done with "+key);
		key=ds_map_find_next(heads,key);
		
		
	}
}

function MessageList(messagesList,mess){
	if(ds_list_find_index(messagesList,mess)==-1){
		//show_debug_message(mess.text);
		ds_list_add(messagesList,mess);
	}
	for(var k=0;k<ds_list_size(mess.children);k++){
		MessageList(messagesList,mess.children[|k]);	
	}
	return messagesList;
}

//function SaveMessage(dialoguesToAdd,mess){
//	var line=ds_list_create();
//	ds_list_add(line,mess.text);
//	ds_list_add(line,mess.text);
//	ds_list_add(dialoguesToAdd,
//}

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
		
		
		
		//show_debug_message(ds_list_size(list));
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

function LoadHeads(headMap){
	hs=ds_map_create();
	var key=ds_map_find_first(headMap);
	for(var i=0;i<ds_map_size(headMap);i++){
		//show_debug_message(headMap);
		var h=headMap[?key];
		var lines=ds_list_create();
		for(var k=0;k<ds_list_size(h);k++){
			var node=h[|k];
			show_debug_message(node[|0]);
			l=new global.Line(node[|0],-1,node[|2],node[|3],node[|4],node[|5],node[|6]);
			//(_message, _parent, _type, _action, _subject, _talker, _emotion)
			l.isHead=node[|7];
			l.greyed=node[|8];
			if(l.greyed) show_debug_message(l.text);
			l.children=ds_list_create();
			for(var p=0;p<ds_list_size(node[|9]);p++){
				ds_list_add(l.children,node[|9][|p]);
			}
			lines[|k]=l;
		}
		
		for(var k=0;k<ds_list_size(lines);k++){
			var node=lines[|k];
			node.parent=lines[|h[|k][|1]];
			for(var p=0;p<ds_list_size(node.children);p++){
				node.children[|p]=lines[|node.children[|p]];
			}
		}
		
		ds_map_add(hs,key,lines[|0]);
		//hs[?key]=lines[|0];
		
		key=ds_map_find_next(headMap,key);
	}
	return hs;
}

function standardLoad(map){
	var obj=map[?"obj"];
	if(obj!=undefined && asset_get_index(obj)>-1){
		with(instance_create_layer(0,0,layer,asset_get_index(obj))){
			x=map[?"x"];
			y=map[?"y"];
			sprite_index=asset_get_index(map[?"sprite_index"]);
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
					//alarm[i]=map[?"alarms"][|i];
				}
				heads=LoadHeads(map[?"heads"]);
				//show_debug_message("the heads "+name);
			
				if(map[?"initialHead"]!=undefined && map[?"initialHead"]!=""){
					initialHead=map[?"initialHead"];
				}
				interactableObjects=ds_map_create();
				
				var io=map[?"interactableObjects"];
				var key=ds_map_find_first(io);
				for(var i=0;i<ds_map_size(io);i++){
					ds_map_add(interactableObjects,key,io[?key]);
					key=ds_map_find_next(io,key);
				}
				//show_debug_message(map[?"initialHead"]);
			}
		}
	}
}