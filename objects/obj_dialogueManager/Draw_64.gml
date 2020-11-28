/// @description Insert description here
// You can write your code in this editor
//draw_self();
if(inDialogue && currentMessage!=noone){
	draw_sprite(textBoxSprite,0,defaultX,defaultY);
	draw_set_font(font_codersCrux);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_colour(c_white);
	maxLength=0;
	if(currentMessage.talker==noone) var txtWidth=textWidthFull;
	else var txtWidth=textWidth;
	if(currentMessage.type!="a"){
		draw_text_ext(defaultX+textPaddingX,defaultY+textPaddingY,string_copy(currentMessage.text,0,currentChar),textSep,txtWidth);
		maxLength=string_length(currentMessage.text);
	}else{
		var skipY=0;
		for(var i=0;i<ds_list_size(currentMessage.parent.children);i++){
			var mess=currentMessage.parent.children[|i];
			if(mess.greyed) draw_set_color(c_gray);
			else draw_set_color(c_white);
			var text=string_copy(mess.text,0,currentChar);
			if(i==answerSelected) var text="> "+text;
			draw_text_ext(defaultX+textPaddingX,defaultY+textPaddingY+textSep*i,text,textSep,txtWidth);
			skipY+=string_height(mess.text);
			maxLength=max(string_length(mess.text),maxLength);
		}
	}
	currentChar+=textSpeed;
	currentChar=clamp(currentChar,0,maxLength+1);
	if(currentChar>=maxLength || currentMessage.type=="a"){
		obj_portrait.talking=false;	
	}else{
		obj_portrait.talking=true;
	}
	obj_portrait.drawn=true;
}else{
	obj_portrait.drawn=false;	
}