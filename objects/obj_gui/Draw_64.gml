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


draw_set_color(c_black);
draw_set_alpha(pAlpha*0.8);
draw_rectangle(0,0,display_get_gui_width(),display_get_gui_height(),-1);	

draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(font_codersCrux);
draw_set_alpha(1);
var txt=pausedOptions[0];
for(var i=1;i<array_length(pausedOptions);i++){
	txt=txt+"\n"+pausedOptions[i];
}
if(obj_gameManager.options!=obj_gameManager.soundOptions && obj_gameManager.options!=obj_gameManager.controlOptions){
	draw_set_halign(fa_center);
	draw_text_ext(pX,pY,txt,display_get_gui_height()/10,display_get_gui_width()*0.75);
}else{
	var dots=":",entriestxt="",entries;
	
	if(obj_gameManager.options==obj_gameManager.soundOptions){
		entries=[floor(obj_soundManager.masterGain*10),floor(obj_soundManager.bgGain*10),floor(obj_soundManager.sfxGain*10)];
	}else if(obj_gameManager.options==obj_gameManager.controlOptions){
		entries=[obj_tuning.upButton,obj_tuning.downButton,obj_tuning.leftButton,obj_tuning.rightButton,obj_tuning.interactButton,obj_tuning.inventoryOpenButton,obj_tuning.runButton];
	}
	
	for(var i=0;i<array_length(pausedOptions);i++){
		entries[i]=string(entries[i]);
	}
	
	if(obj_gameManager.soundControl && obj_gameManager.paused){
		var t=string(entries[obj_gameManager.optionSelected]);
		var gain=real(t);
		if(gain>0 && gain<10){
			t="< "+t+" >";
		}else if(gain>0){
			t="< "+t+"  ";
		}else if(gain<10){
			t="  "+t+" >";	
		}	
		entries[obj_gameManager.optionSelected]=t;
	}
	entriestxt=entries[0];
	for(var i=1;i<array_length(pausedOptions);i++){
		dots=dots+"\n:";
		entriestxt=entriestxt+"\n"+entries[i];
	}
	
	//draw_set_halign(fa_left);
	draw_set_halign(fa_center);
	draw_text_ext(display_get_gui_width()*0.4,pY,txt,display_get_gui_height()/10,display_get_gui_width()*0.75);
	draw_set_halign(fa_center);
	draw_text_ext(display_get_gui_width()*0.7,pY,dots,display_get_gui_height()/10,display_get_gui_width()*0.75);
	draw_text_ext(display_get_gui_width()*0.9,pY,entriestxt,display_get_gui_height()/10,display_get_gui_width()*0.75);
}

