if(obj_hero.state==-1){
	obj_hero.state="falling";
	obj_gui.blinkingText="PRESS Z TO LAND";
	show_debug_message("start code");
	obj_hero.startingX=672;
	obj_hero.startingY=672;
	obj_gui.state="opening";
}
obj_hero.sceneManager=obj_lilypadManager;
with(obj_soundManager){
	bgMusic=audio_limboBgm;
	audio_play_sound(bgMusic,1,true);
	audio_sound_gain(bgMusic,bgGain*masterGain,0);
	
}
