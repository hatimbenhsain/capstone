/// @description Insert description here
// You can write your code in this editor
if(open){
	for(var i=0;i<ds_list_size(items);i++){
		draw_sprite(sprites[|i],image_index,100+(i%columns)*412/columns,100+(floor(i/columns))*412/rows);	
	}
}