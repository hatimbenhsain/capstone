// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addInteractable(obj){
	
	var str1=obj.name;
	var str2= string_char_at(str1,1);
	str2 = string_upper(str2);
	str1 = string_delete(str1,1,1); 
	str1 = string_insert(str2,str1,1);
	ds_map_add(interactableObjects,obj.object_index,name+str1);
}

function AddInteractableByName(obj,name){
	var inst=instance_create_layer(x,y,layer,obj);
	if(ds_map_exists(interactableObjects,inst.object_index)) ds_map_delete(interactableObjects,inst.object_index);
	ds_map_add(interactableObjects,inst.object_index,name);
	instance_destroy(inst);
}

function AddInteractable(obj){
	var inst=instance_create_depth(x,y,depth,obj);
	show_debug_message(obj);
	show_debug_message(object_get_name(obj));
	var str1, index;
	with(inst){
		str1=name;	
		show_debug_message(str1);
		index=object_index;
	}
	var str2= string_char_at(str1,1);
	str2 = string_upper(str2);
	str1 = string_delete(str1,1,1); 
	str1 = string_insert(str2,str1,1);
	ds_map_add(interactableObjects,index,name+str1);
	instance_destroy(inst);
}

function SitOnBench(){
	obj_hero.frozen=true;
	FadeToBlack(2,3);
	obj_hero.alarm[0]=room_speed*(2*2+3); //unfreezing
	obj_bench.alarm[0]=room_speed*2; //moving the hero
	obj_bench.state=2;
	show_debug_message("sitting");
}

function ChangeState(newstate){
	with(interlocutor){
		state=newstate;	
	}
}

function TurnOn(_valueName){
	with(interlocutor){
		variable_instance_set(id,_valueName,true);
		show_debug_message(_valueName);
	}
}

function TurnOff(_valueName){
	with(interlocutor){
		variable_instance_set(id,_valueName,false);
	}
}

function Toggle(_valueName){
	with(interlocutor){
		variable_instance_set(id,_valueName,!variable_instance_get(id,_valueName));
	}
}