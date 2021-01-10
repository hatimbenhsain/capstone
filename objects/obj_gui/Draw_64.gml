/// @description Insert description here
// You can write your code in this editor

if(blackFadeIn && blackAlpha<1){
	blackAlpha+=1/blackFadeRate;
	show_debug_message("fade in");
}else if(blackFadeOut && blackAlpha>0){
	blackAlpha-=1/blackFadeRate;	
}else if(blackFadeOut && blackAlpha<=0){
	blackFadeOut=false;	
}

draw_set_alpha(blackAlpha);
draw_set_colour(c_black);
draw_rectangle(0,0,room_width,room_height,-1);
draw_set_alpha(1);