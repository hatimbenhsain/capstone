// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function addInteractable(obj){
	var str1=obj.name;
	var str2= string_char_at(str1,1);
	str2 = string_upper(str2);
	str1 = string_delete(str1,1,1); 
	str1 = string_insert(str2,str1,1)
	ds_map_add(interactableObjects,obj.object_index,name+str1);
}