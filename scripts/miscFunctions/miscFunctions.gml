// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addInteractable(obj){
	
	var str1=obj.name;
	var str2= string_char_at(str1,1);
	str2 = string_upper(str2);
	str1 = string_delete(str1,1,1); 
	str1 = string_insert(str2,str1,1);
	ds_map_add(interactableObjects,obj.object_index,name+str1);
	if(!ds_map_exists(heads,name+str1)){
		ds_map_add(heads,name+str1,parseDialogue(name+str1+".csv"));
	}
}

function AddInteractableByName(obj,n){
	var inst=instance_create_depth(x,y,depth,obj);
	var name2;
	with(inst){
		name2=name;	
	}
	if(ds_map_exists(interactableObjects,name2)) ds_map_delete(interactableObjects,name2);
	
	ds_map_add(interactableObjects,name2,n);
	//if(!ds_map_exists(heads,name)){
	//	ds_map_add(heads,name,parseDialogue(name+".csv"));
	//}
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
	var name2=str1;
	var str2= string_char_at(str1,1);
	str2 = string_upper(str2);
	str1 = string_delete(str1,1,1); 
	str1 = string_insert(str2,str1,1);
	//ds_map_add(interactableObjects,index,name+str1);
	ds_map_add(interactableObjects,name2,name+str1);
	//if(!ds_map_exists(heads,name+str1)){
	//	//show_debug_message(name+str1);
	//	ds_map_add(heads,name+str1,parseDialogue(name+str1+".csv"));
	//}
	instance_destroy(inst);
}

function RemoveInteractable(obj){
	var inst=instance_create_depth(x,y,depth,obj);
	var index,name2;
	with(inst){
		index=object_index;	
		name2=name;
	}
	ds_map_delete(interactableObjects,name2);
	instance_destroy(inst);
}

function SitOnBench(){
	obj_hero.frozen=true;
	obj_hero.x=obj_bench.x;
	obj_hero.y=obj_bench.y-10;
	obj_hero.dir="F";
	obj_hero.state="sitting";
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

