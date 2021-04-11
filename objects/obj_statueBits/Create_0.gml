/// @description Insert description here
// You can write your code in this editor
name="Statue Bits"

event_inherited();
description="Bits of an incomplete statue";
icon=sprite_statueBits;
//ds_map_add(combinable,obj_goddessPart2,obj_goddessStatue);

ds_map_add(combinable,obj_statueArms,obj_statuePieces);
ds_map_add(combinable,obj_statueHands,obj_statuePieces);
ds_map_add(combinable,obj_statueHooves,obj_statuePieces);
ds_map_add(combinable,obj_statueBody,obj_statuePieces);
ds_map_add(combinable,obj_statueHead,obj_statuePieces);
ds_map_add(combinable,obj_statueBits,obj_statueParts);
ds_map_add(combinable,obj_statuePieces,obj_statueWhole);
ds_map_add(combinable,obj_statueParts,obj_statueWhole);