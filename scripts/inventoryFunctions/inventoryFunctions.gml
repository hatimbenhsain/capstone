// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addItem(item){
	AddItemSilent(item);
	with(obj_soundManager){
		audio_sound_gain(bgMusic,0.05*bgGain*masterGain,50);
		playSFX(sound_itemPickup4,1);
		alarm[1]=audio_sound_length(sound_itemPickup4)*room_speed-room_speed*0.5;
	}
}

function AddItem(item){
	AddItemSilent(item);
	if(current_time-global.roomStartTime>1000){
		with(obj_soundManager){
			audio_sound_gain(bgMusic,0.05*bgGain*masterGain,50);
			playSFX(sound_itemPickup4,1);
			alarm[1]=audio_sound_length(sound_itemPickup4)*room_speed-room_speed*0.5;
		}
	}
		
}

function AddItemSilent(item){
	//show_debug_message(item.name);
	with(item){
		//show_debug_message(object_index);
		ds_list_add(obj_inventory.items,id);
		//obj_hero.frozen=false;
	
		instance_deactivate_object(id);
		break;
	}
	obj_hero.pickedUp=true;		
}

function combineObjects(){
	show_debug_message(object_get_name(items[|lockedObject]));
	if(ds_map_exists(items[|lockedObject].combinable,items[|lockedObject2].object_index)){
		var inst=instance_create_depth(x,y,depth,ds_map_find_value(items[|lockedObject].combinable,items[|lockedObject2].object_index));
		AddItemSilent(inst);
		var itm1=min(lockedObject,lockedObject2);
		var itm2=max(lockedObject,lockedObject2);
		deleteIndex(itm2);
		deleteIndex(itm1);
		selectedObject=ds_list_size(items)-1;
		playSFX(sound_itemsCombined);
		return;
	}
	obj_dialogueManager.currentMessage=new global.Line("I don't think i can combine these items...",-1,"l","","","hero","confused");
	obj_dialogueManager.inDialogue=true;
	playSFX(sound_itemsNotCombined);
	lockedObject2=-1;
}

function deleteIndex(index){
	ds_list_delete(items,index);
	lockedObject=-1;
	lockedObject2=-1;
	selectedObject=0;
}

function deleteItem(itm){
	if(ds_list_find_value(items,itm)){
		ds_list_delete(items,ds_list_find_index(items,itm));
		lockedObject=-1;
		lockedObject2=-1;
		selectedObject=0;
	}
}

function deleteInstanceOf(obj){
	for(var i=0;i<ds_list_size(items);i++){
		if(items[|i].object_index==obj){
			ds_list_delete(items,i);
			lockedObject=-1;
			lockedObject2=-1;
			selectedObject=0;
			break;
		}
	}
}

function ObjectInInventory(obj){
	with(obj_inventory){
		for(var i=0;i<ds_list_size(items);i++){
			//show_debug_message("checking item "+string(i));
			if(items[|i].object_index==obj){
				show_debug_message("same id");
				return true;
				break;
			}
		}
	}
	return false;
}