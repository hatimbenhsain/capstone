/// @description Insert description here
// You can write your code in this editor

blackAlpha=0;
whiteAlpha=0;

blackFadeIn=false;
blackFadeOut=false;

whiteFadeIn=false;

blackFadeRate=room_speed;

pauseTime=room_speed*2;

blinkingText="";
zoom=1.5;

textAlpha=0;
textFadeIn=true;
textFadeOut=false;

state="paused";

timeMark=0;

pausedOptions=["Resume","Save","Settings","Exit Game"];
pAlpha=0;
pX=display_get_gui_width()/2
pY=-display_get_gui_height()/2