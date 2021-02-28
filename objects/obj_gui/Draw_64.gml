/// @description Insert description here
// You can write your code in this editor

if(blackFadeIn && blackAlpha<1){
	blackAlpha+=1/blackFadeRate;
}else if(blackFadeOut && blackAlpha>0){
	blackAlpha-=1/blackFadeRate;	
}else if(blackFadeOut && blackAlpha<=0){
	blackFadeOut=false;	
}

if(whiteFadeIn && whiteAlpha<1){
	whiteAlpha+=1/blackFadeRate;
	obj_soundManager.bgGain-=1/blackFadeRate;
}

draw_set_alpha(blackAlpha);
draw_set_colour(c_black);
draw_rectangle(0,0,room_width,room_height,-1);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_alpha(whiteAlpha);
draw_rectangle(0,0,room_width,room_height,-1);
draw_set_alpha(1);

if(blinkingText!=""){
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(font_gui);	
	draw_set_alpha(textAlpha);
	draw_text(display_get_gui_width()/2,display_get_gui_height()*7/8,blinkingText);
	draw_set_font(font_codersCrux);
	draw_set_alpha(1);
}

