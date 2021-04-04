/// @description Insert description here
// You can write your code in this editor
//draw_self();

if(inDialogue && currentMessage!=noone){
	//if(ds_list_size(items)<rows*columns){
	//	image_index=0;	
	//}else if(firstObject>0 && firstObject+rows*columns<ds_list_size(items)){
	//	image_index=3;	
	//}else if(firstObject>0){
	//	image_index=2;	
	//}else{
	//	image_index=1;	
	//}
	
	draw_sprite(textBoxSprite,image_index,defaultX,defaultY);
	draw_set_font(font_codersCrux);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_colour(c_white);
	maxLength=0;
	if(currentMessage.talker==noone) var txtWidth=textWidthFull;
	else var txtWidth=textWidth;
	if(currentMessage.type!="a"){
		image_index=0;
		draw_text_ext(defaultX+textPaddingX,defaultY+textPaddingY,string_copy(currentMessage.text,0,currentChar),textSep,txtWidth);
		maxLength=string_length(currentMessage.text);
		firstAnswer=0;
	}else{
		var skipY=0;
		var k=firstAnswer;
		for(var i=firstAnswer;i<ds_list_size(currentMessage.parent.children);i++){
			k=i;
			var mess=currentMessage.parent.children[|i];
			if(mess.greyed) draw_set_color(c_gray);
			else draw_set_color(c_white);
			var text=string_copy(mess.text,0,currentChar);
			if(i==answerSelected) var text="> "+text;
			draw_text_ext(defaultX+textPaddingX,defaultY+textPaddingY+textSep*(i-firstAnswer),text,textSep,txtWidth);
			skipY+=string_height(mess.text);
			maxLength=max(string_length(mess.text),maxLength);
			if(skipY>=string_height("\n\n\ntxt")){
				break;
			}
		}
		if(answerSelected>k){
			firstAnswer+=1;
		}else if(answerSelected<firstAnswer){
			firstAnswer-=1;	
		}
		if(firstAnswer==0 && k<ds_list_size(currentMessage.parent.children)-1){
			image_index=1;	
		}else if(k<ds_list_size(currentMessage.parent.children)-1){
			image_index=3;	
		}else if(firstAnswer>0){
			image_index=2;	
		}else{
			image_index=0;	
		}
		
	}
	currentChar+=textSpeed;
	if(currentMessage.talker=="priestess"){
		PlayText(1.1);
	}else if(currentMessage.talker=="gop"){
		PlayText(0.8);
	}else{
		PlayText(1);	
	}
	currentChar=clamp(currentChar,0,maxLength+1);
	if(currentChar>=maxLength || currentMessage.type=="a"){
		obj_portrait.talking=false;
		if(currentChar>=maxLength) StopText();
		if(shake){
			shake=false;	
		}
	}else{
		obj_portrait.talking=true;
		if(shake){
			obj_gui.shakeCounter=1;	
		}
	}
	obj_portrait.drawn=true;
}else{
	obj_portrait.drawn=false;	
	shake=false;
	StopText();
}