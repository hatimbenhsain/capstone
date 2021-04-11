/// @description Insert description here
// You can write your code in this editor
name="Statue Pieces"

event_inherited();
description="Pieces of an incomplete statue";
icon=sprite_statuePieces;
//ds_map_add(combinable,obj_goddessPart2,obj_goddessStatue);

ds_map_add(combinable,obj_statueArms,obj_statueParts);
ds_map_add(combinable,obj_statueHands,obj_statueParts);
ds_map_add(combinable,obj_statueHooves,obj_statueParts);
ds_map_add(combinable,obj_statueBody,obj_statueParts);
ds_map_add(combinable,obj_statueHead,obj_statueParts);
ds_map_add(combinable,obj_statueBits,obj_statueWhole);
ds_map_add(combinable,obj_statuePieces,obj_statueWhole);
ds_map_add(combinable,obj_statueParts,obj_statueWhole);