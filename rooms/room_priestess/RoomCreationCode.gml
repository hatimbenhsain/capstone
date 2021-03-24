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

for(var i=0;i<room_width;i+=8){
	for(var j=0;j<room_height;j+=8){
		var data=tilemap_get_at_pixel(layer_tilemap_get_id(layer_get_id("tileLayer_grass")),i,j);
		//show_debug_message(data);
		if(data==0){
			//show_debug_message("wall created ");
			//show_debug_message(i);
			instance_create_layer(i,j,"layer_walls",obj_invisibleWall);	
		}
	}
}