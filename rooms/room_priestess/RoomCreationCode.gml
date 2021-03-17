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
