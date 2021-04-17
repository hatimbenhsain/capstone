// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function FadeToBlack(t,p){
	obj_gui.blackFadeRate=t*room_speed;
	obj_gui.pauseTime=p*room_speed;
	obj_gui.blackFadeIn=true;
	obj_gui.alarm[0]=(t+p)*room_speed;
}

function Shake(f){
	if(is_undefined(f)){
		f=room_speed;	
	}
	with(obj_gui){
		shakeCounter=f*room_speed/1000;
	}
}

function ShakeText(){
	with(obj_dialogueManager){
		shake=true;	
	}
}

function DialogueFade(t){
	if(is_undefined(t)) t=100;
	with(obj_dialogueManager){
		fade=!fade;
		//fadeRate=t*0.001/room_speed;
		fadeRate=1000/(room_speed*t)
	}
}

function LayerGrassBegin(){
	if(event_type==ev_draw && event_number == 0){
		var a;
		with(obj_priestess){
			a=grassAlpha;	
		}
		shader_set(shader_opacity);
		_uniAlpha=shader_get_uniform(shader_opacity,"opacity");
		shader_set_uniform_f(_uniAlpha,a);
	}
}

function LayerGrassEnd(){
	if (event_type == ev_draw && event_number == 0){
		shader_reset();
	}
}

function LayerTileBegin(){
	if(event_type==ev_draw && event_number == 0){
		var a;
		with(obj_brumeManager){
			a=tileAlpha;	
		}
		shader_set(shader_opacity);
		_uniAlpha=shader_get_uniform(shader_opacity,"opacity");
		shader_set_uniform_f(_uniAlpha,a);
	}
}

function LayerTileEnd(){
	if (event_type == ev_draw && event_number == 0){
		shader_reset();
	}
}