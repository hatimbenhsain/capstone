/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch(state){
	case 1:
		state=2;
		ChangeInitHead("gate2");
		with(obj_bench){
			ChangeInitHead("bench2");
			ChangeHead("bench2");
		}
		break;
	case 3:
		image_index=0;
		sprite_index=sprite_gate_disrobing;
		obj_hero.cameraSubject=self;
		state++;
		break;
	case 4:
		obj_hero.cameraSubject=self;
		if(image_index>=sprite_get_number(sprite_index)-1){
			sprite_index=sprite_gate_floating;
			image_index=0;
			state=5;
			with(obj_hero){
				cameraSubject=self;	
			}
		}
		break;
	case 5:
		sprite_index=sprite_gate_floating;
		if(obj_hero.bbox_bottom<bbox_bottom && obj_hero.state=="grounded"){
			SwitchBgm(audio_investigationBgm);
			state=6;
		}
		break;
	case 6:
		sprite_index=sprite_gate_floating;
		with(obj_soundManager){
			if(bgMusic==audio_manabgm && nextBgm==bgMusic){
				SwitchBgm(audio_investigationBgm);
			}
		}
		break;
	
}