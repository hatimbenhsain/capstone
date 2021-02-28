/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



x+=vx;
y+=vy;

if(x<-100 || y<-100 || x>room_width+100 || y>room_width+100){
	instance_destroy(self);	
}