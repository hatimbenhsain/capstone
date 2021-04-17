if(obj_hero.state==-1){
	obj_hero.state="falling";
	obj_gui.state="opening";
	obj_hero.startingX=592;
	obj_hero.startingY=715;
	obj_hero.timeToGetUp=0.2;
	global.cameraOverride=false;
}

obj_hero.sceneManager=obj_priestessRoomManager;

with(obj_soundManager){
	bgMusic=audio_manabgm;
	audio_play_sound(bgMusic,1,true);
	audio_sound_gain(bgMusic,bgGain*masterGain,0);
}

var lId=layer_tilemap_get_id(layer_get_id("tileLayer_grassTest"));


for(var i=0;i<room_width;i+=16){
	for(var j=0;j<room_height;j+=16){
		var data=tilemap_get(layer_tilemap_get_id(layer_get_id("tileLayer_grass")),i/16,j/16);
		var inst;
		//show_debug_message(i);
		if(tile_get_empty(data) || data==0){
			//show_debug_message("wall created "+string(i/16)+" "+string(j/16));
			inst=instance_create_layer(i,j,"layer_walls",obj_invisibleWall);
			inst.image_xscale=2;
			inst.image_yscale=2;
			inst.x+=8;
			inst.y+=8;
			//show_debug_message(inst);
		}else{
			for(var k=0;k<12;k++){
				var n=0;
				var d=tilemap_get(lId,n,k);
				while(!tile_get_empty(d)){
					if(tile_get_index(data)==tile_get_index(d)){
						inst=instance_create_layer(i,j,"layer_walls",obj_invisibleWall);
						inst.x+=8;
						inst.y+=8;
						if(k<=7){
							switch(k){
								case 0:
									inst.sprite_index=sprite_invisibleWall1;
									break;
								case 1:
									inst.sprite_index=sprite_invisibleWall2;
									break;
								case 2:
									inst.sprite_index=sprite_invisibleWall3;
									break;
								case 3:
									inst.sprite_index=sprite_invisibleWall4;
									break;
								case 4:
									inst.sprite_index=sprite_invisibleWall5;
									break;
								case 5:
									inst.sprite_index=sprite_invisibleWall6;
									break;
								case 6:
									inst.sprite_index=sprite_invisibleWall7;
									break;
								case 7:
									inst.sprite_index=sprite_invisibleWall8;
									break;
							}
							//inst.image_xscale=2;
							//inst.image_yscale=2;
							
						}else{
							
							var inst2=instance_create_layer(i,j,"layer_walls",obj_invisibleWall);
							switch(k){
								case 8:
									inst.sprite_index=sprite_invisibleWall6;
									inst2.sprite_index=sprite_invisibleWall7;
									break;
								case 9:
									inst.sprite_index=sprite_invisibleWall6;
									inst2.sprite_index=sprite_invisibleWall8;
									break;
								case 10:
									inst.sprite_index=sprite_invisibleWall5;
									inst2.sprite_index=sprite_invisibleWall7;
									break;
								case 11:
									inst.sprite_index=sprite_invisibleWall5;
									inst2.sprite_index=sprite_invisibleWall8;
									break;
							}

							inst2.x+=8;
							inst2.y+=8;
						}
						
						break;
					}else{
						n+=1;
						d=tilemap_get(lId,n,k);
					}
				}
			}
		}
	}
}

//instance_deactivate_layer(layer_get_id("layer_walls2"))
instance_deactivate_object(obj_gop);
instance_deactivate_object(obj_lilypad);


layer_script_begin("tileLayer_grass",LayerGrassBegin);
layer_script_end("tileLayer_grass",LayerGrassEnd);

layer_script_begin("tileLayer_stones",LayerTileBegin);
layer_script_end("tileLayer_stones",LayerTileEnd);
layer_script_begin("tileLayer_dirt",LayerTileBegin);
layer_script_end("tileLayer_dirt",LayerTileEnd);
