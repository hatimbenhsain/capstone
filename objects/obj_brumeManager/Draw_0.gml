/// @description Insert description here
// You can write your code in this editor
for(var i=0;i<=room_width;i+=16){
	for(var j=0;j<=room_height;j+=16){
		draw_sprite(sprite_water1,0,i+xx,j);
		draw_sprite(sprite_water1,0,i+xx-16,j);
	}
}
for(var i=0;i<=room_width;i+=16){
	for(var j=0;j<=room_height;j+=16){
		draw_sprite(sprite_index,image_index,i,j);
	}
}