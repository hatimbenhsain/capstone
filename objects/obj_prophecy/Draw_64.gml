/// @description Insert description here
// You can write your code in this editor

shader_set(shader_bw);

draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(text_colour);
maxLength=0;

draw_text_ext(defaultX+textPaddingX,defaultY+textPaddingY,string_copy(prophecy[currentLine],0,currentChar),textSep,textWidthFull);
maxLength=string_length(prophecy[currentLine]);

currentChar+=textSpeed;
//PlayText(1);	
currentChar=clamp(currentChar,0,maxLength+1);

var pos;
pos=audio_sound_get_track_position(bgMusic);

if((pos>22 && pos<22.1)||(pos>22.2 && pos<22.4)){
	draw_sprite_ext(sprite_prophecy6,image_index,room_width,room_height,2,2,0,c_white,1);
	draw_sprite_ext(sprite_prophecy7,image_index,room_width,room_height,2,2,0,c_white,1);
}

shader_reset();

if (crt) draw_sprite_ext(sprite_crtLines,image_index,room_width,room_height,2,2,0,c_white,1);




if(pos>26.5){
	draw_set_color(c_black);
	draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),false);
}

if((pos>16 && pos<16.1)||(pos>16.6 && pos<16.7)||(pos>21 && pos<21.8)){
	draw_sprite_ext(sprite_prophecy6,image_index,room_width,room_height,2,2,0,c_white,1);	
}
if(pos>21.4 && pos<21.8){
	draw_sprite_ext(sprite_prophecy7,image_index,room_width,room_height,2,2,0,c_white,1);
}