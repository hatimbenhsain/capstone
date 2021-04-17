/// @description Insert description here
// You can write your code in this editor
openSprite=sprite_lilypad1_opening;
idleSprite=sprite_lilypad1;

a=1;

orgOffsetX=sprite_xoffset;
orgOffsetY=sprite_yoffset;

if(room==room_limbo) sprite_index=openSprite;

depth=197-y/10000;

oy=0;
index=image_index;

