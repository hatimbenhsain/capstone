/// @description Insert description here
// You can write your code in this editor
if(state!=-1){
	switch(state){
		case "grounded":
			draw_sprite(shadowSprite,0,x,y);
			break;
		case "acting":
			draw_sprite(shadowSprite,0,x,y);
			break;
	}
	draw_self();
}