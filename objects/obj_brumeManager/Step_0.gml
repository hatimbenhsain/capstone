/// @description Insert description here
// You can write your code in this editor

switch(state){
	case 0:
		var k=random(100);
		if(k<0.5){
			state=1;
			with(obj_brume1) image_index=0;
		}else{
			with(obj_brume1){
				image_speed=0.3;
			}
		}
		break;
	case 1:
		with(obj_brume1){
			image_speed=2;
			if(image_index>2) obj_brumeManager.state=2;	
		}
		break;
	case 2:
		with(obj_brume1){
			if(image_index<1) obj_brumeManager.state=0;	
		}
		break;
}

xx+=0.1;
if(xx>=16) xx=0;