/// @description Insert description here
// You can write your code in this editor

switch(state){
	case "opening":
		pAlpha=0;
		pY=-display_get_gui_height()/2;
		textAlpha=sin(get_timer()/1000000)/2+0.5;
		zoom=1.5;
		break;
	case "landing":
		textAlpha=lerp(textAlpha,0,1/room_speed);
		zoom=lerp(zoom,1,1/(room_speed));
		break;
	case "fallen":
		if(keyboard_check(obj_hero.leftButton) || keyboard_check(obj_hero.rightButton) || keyboard_check(obj_hero.upButton) || keyboard_check(obj_hero.downButton)){
			textAlpha=lerp(textAlpha,0,1/room_speed);
		}else{
			textAlpha=sin((get_timer()-timeMark)/1000000)/2+0.5;
		}
		zoom=lerp(zoom,1,1/(room_speed));
		break;
	case "cutscene":
		zoom=1;
		break;
	case "ingame":
		zoom=1;
		if (pAlpha>0) pAlpha=lerp(pAlpha,0,0.5);
		if(pY>-display_get_gui_height()/2 && pY<display_get_gui_height()*1.5) pY=lerp(pY,display_get_gui_height()*1.5,0.3);
		if(obj_gameManager.paused){
			state="paused";
			pY=-display_get_gui_height()/2;
		}
		break;
	case "paused":
		if (pAlpha<1){
			pAlpha=lerp(pAlpha,1,1/2);
		}
		if(pY<display_get_gui_height()/2){
			pY=lerp(pY,display_get_gui_height()/2,0.3);
		}
		if(!obj_gameManager.paused){
			state="ingame";
		}
		break;
}

	
camera_set_view_size(view_camera[0],obj_tuning.cameraWidth/zoom,obj_tuning.cameraHeight/zoom);