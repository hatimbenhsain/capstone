/// @description Insert description here
// You can write your code in this editor
font=font_prophecy;
text_colour=$006491;
var b;
with(obj_soundManager){
	bgMusic=audio_prophecy;
	audio_sound_gain(bgMusic,bgGain*masterGain,0);
	b=audio_play_sound(bgMusic,1,false);
}

bgMusic=b;

prophecy=["Before humans lived under the tyranny of gods, was Humanity's first great enemy: the Rot.",
"A brave hero with a sword sealed the evil, but not before a long battle where countless lives were lost.",
"It is foretold that one day, the Rot is to return. Then, a new hero shall rise to face it.",
"And this hero... could be you!"]
sprites=[sprite_prophecy1,sprite_prophecy2,sprite_prophecy3,sprite_prophecy4]

currentLine=0;

currentChar=0;

textSep=35;
textPaddingX=0;
textPaddingY=0;

bwMode=false;

defaultX=display_get_gui_width()*0.087;
defaultY=display_get_gui_height()*0.66;
textWidthFull=display_get_gui_width()-defaultX*1.8;

textSpeed=obj_tuning.textSpeed;

frameTime=21/3;

alarm[0]=room_speed*frameTime;


bwFreq=7;
bwTimes=[7,0.1,5,0.1,0.5,0.1,3,0.1,0.3,0.1,2,0.1,4,0.1,1,0.1,0.2,0.1,0.6]
bwIndex=0;
alarm[1]=room_speed*bwTimes[bwIndex];

_uniUV=shader_get_uniform(shader_bw, "u_uv");


displacementFrequency=0.0001;
displacementRate=0.02;
displacementMaxF=0.01;
displacedLines=[];
for(var i=0;i<240;i++){
	displacedLines[i]=0;	
}
displacement=false;
maxDisplacement=10;

_offset=shader_get_uniform(shader_bw, "offset");
_displaced=shader_get_uniform(shader_bw, "displaced");
_bw=shader_get_uniform(shader_bw, "bw");
_unitexel=shader_get_uniform(shader_bw, "unitexel");

crt=false;