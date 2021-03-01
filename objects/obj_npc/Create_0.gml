/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

dir="F";

idleL=0;
idleB=0;
idleF=0;
walkL=0;
walkB=0;
walkF=0;

acc=obj_tuning.heroAcc;
maxSpeed=obj_tuning.heroMaxSpeed;
speedFactor=obj_tuning.speedFactor;
walking=false;
vx=0;
vy=0;

standby=-1;
standbyState=-1;
lastDir="F";
shadowSprite=sprite_shadow;

lockedSprite=false;