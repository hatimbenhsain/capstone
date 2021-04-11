/// @description Insert description here
// You can write your code in this editor
name="Statue Body"

event_inherited();
description="Part of a broken statue";
icon=sprite_statueBody;
state=-1;

ds_map_add(combinable,obj_statueArms,obj_statueBits);
ds_map_add(combinable,obj_statueHands,obj_statueBits);
ds_map_add(combinable,obj_statueHooves,obj_statueBits);
ds_map_add(combinable,obj_statueHead,obj_statueBits);
ds_map_add(combinable,obj_statueBits,obj_statuePieces);
ds_map_add(combinable,obj_statuePieces,obj_statueParts);
ds_map_add(combinable,obj_statueParts,obj_statueWhole);
