/// @description Insert description here
// You can write your code in this editor

displacementFrequency=displacementMaxF*current_time/22000;
displacementFrequency=clamp(displacementFrequency,0,displacementMaxF);

if(!crt){
	var k=random(1);
	if(k<displacementFrequency){
		crt=true;
		alarm[3]=room_speed*0.1;
	}
}


if(displacement==false){
	var k=random(1);
	if(k<displacementFrequency){
		displacement=true;
		for(var i=0;i<array_length(displacedLines);i++){
			var p=random(1);
			if(p<displacementRate){
				var d=round(random_range(-maxDisplacement,maxDisplacement))
				displacedLines[i]=d;	
				var n=random(1);
				while(i<array_length(displacedLines)-1 && n>0.05){
					i++;
					displacedLines[i]=d;
					n=random(1);
				}
			}else{
				displacedLines[i]=0;
			}
		}
		alarm[2]=room_speed*0.1;
	}
}

var pos;
pos=audio_sound_get_track_position(bgMusic);
show_debug_message(pos);

if(pos>25.5){
	image_index=0;
	displacement=false;
	crt=false;
}else if(currentLine==3 && pos<23.8){
	currentChar=clamp(currentChar,0,maxLength-4);
}

if(pos>30){
	room_goto(room_start);	
}
