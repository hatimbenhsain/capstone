/// @description Insert description here
// You can write your code in this editor
//draw_sprite(shadowSprite,0,x,y+3);
if(dir=="F"){
	draw_sprite_ext(capeSprite,capeImage,x,y,image_xscale,image_yscale,0,c_white,capeOpacity);
	draw_self();
	if(capeImage>=10 && capeImage<11){
		draw_sprite(sprite_gop_eye,1,x,y);	
	}
}else if(dir=="B"){
	draw_self();
	draw_sprite_ext(capeSprite,capeImage,x,y,image_xscale,image_yscale,0,c_white,capeOpacity);
}