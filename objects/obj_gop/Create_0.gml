/// @description Insert description here
// You can write your code in this editor
name="gop";

event_inherited();

show_debug_message("gop creation code");

idleB=sprite_gop_idleB;
idleF=sprite_gop_idleF;
idleL=sprite_gop_idleF;
idleR=sprite_gop_idleF;
walkB=sprite_gop_walkB;
walkF=sprite_gop_walkF;
capeSprite=sprite_gop_cape_idle;
capeImage=0;
totalTime=0;
capeOpacity=1;
walking=false;

neutralSprite=sprite_gop_neutral;


state=-1;

dir="B";
