/// @description Insert description here
// You can write your code in this editor

switch(state){
	case "opening":
		textAlpha=sin(get_timer()/1000000)/2+0.5;
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
}
	
camera_set_view_size(view_camera[0],obj_tuning.cameraWidth/zoom,obj_tuning.cameraHeight/zoom);