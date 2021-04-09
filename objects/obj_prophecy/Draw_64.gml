/// @description Insert description here
// You can write your code in this editor

if(bwMode) shader_set(shader_bw);

draw_set_font(font);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(text_colour);
maxLength=0;

draw_text_ext(defaultX+textPaddingX,defaultY+textPaddingY,string_copy(prophecy[currentLine],0,currentChar),textSep,textWidthFull);
maxLength=string_length(prophecy[currentLine]);

currentChar+=textSpeed;
PlayText(1);	
currentChar=clamp(currentChar,0,maxLength+1);

if(bwMode) shader_reset();

//draw_sprite_ext(sprite_crtLines,image_index,room_width,room_height,2,2,0,c_white,0.5);