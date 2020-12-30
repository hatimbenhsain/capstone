/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();

//if(talkingTo!=noone) walking=false;

switch(dir){
	case("F"):
		image_xscale=1;
		if(!walking) sprite_index=idleF;
		else{
			sprite_index=walkF;
			if (vy<0) vy=0;
			vy+=acc;
			vx=0;
		}
		break;
	case("B"):
		image_xscale=1;
		if(!walking) sprite_index=idleB;
		else{
			sprite_index=walkB;
			if (vy>0) vy=0;
			vy-=acc;
			vx=0;
		}
		break;
	case("R"):
		image_xscale=-1;
		if(!walking) sprite_index=idleL;
		else{
			sprite_index=walkL;
			if (vx<0) vx=0;
			vx+=acc;
			vy=0;
		}
		break;	
	case("L"):
		image_xscale=1;
		if(!walking) sprite_index=idleL;
		else{
			sprite_index=walkL;
			if (vx>0) vx=0;
			vx-=acc;
			vy=0;
		}
		break;
}

vx=clamp(vx,-maxSpeed,maxSpeed);
vy=clamp(vy,-maxSpeed,maxSpeed);



var canmove=true;
for(i=1;i<=abs(vx);i++){
	canmove=true;
	if(place_meeting(x+sign(vx),y,obj_collidable)) canmove=false;
	//if(canmove) x+=sign(vx);
}
for(i=1;i<=abs(vy);i++){
	canmove=true;
	if(place_meeting(x,y+sign(vy),obj_collidable)) canmove=false;
	//if(canmove) y+=sign(vy);
}

var xx, yy, talkerDir;
switch(dir){
		case("F"):
			xx=0;
			yy=bbox_bottom-bbox_top;
			talkerDir="B";
			break;
		case("L"):
			xx=bbox_left-bbox_right;
			yy=0;
			talkerDir="R";
			break;
		case("R"):
			xx=bbox_right-bbox_left;
			yy=0;
			talkerDir="L";
			break;
		case("B"):
			xx=0;
			talkerDir="F";
			yy=bbox_top-bbox_bottom;
			break;
}
var inst=instance_place(x+xx,y+yy,obj_hero);
if(talkingTo==noone && standby!=-1 && dir!=standby){
	dir=standby;
}else if(inst!=noone && standby==-1 && walking){
	canmove=false;
}else if(inst==noone && standby!=-1){
	walking=true;
	standby=-1;
}

if(canmove){
	x+=vx;
	y+=vy;
}

if(inst!=noone){
	for(var i=0;i<=11;i++){
		alarm[i]=alarm[i]+1;	
	}
	if(standby==-1 && walking){
		standby=lastDir;
		standbyState=state;
		walking=false;
	}
}
