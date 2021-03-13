/// @description Insert description here
// You can write your code in this editor
items=ds_list_create();

open=false;
openButton=obj_tuning.inventoryOpenButton;
leftButton=obj_tuning.leftButton;
rightButton=obj_tuning.rightButton;
upButton=obj_tuning.upButton;
downButton=obj_tuning.downButton;
interactButton=obj_tuning.interactButton;

draw_set_font(font_codersCrux);

rows=floor((sprite_get_bbox_bottom(sprite_index)-sprite_get_bbox_top(sprite_index))/(obj_tuning.textSep/2+string_height("text")));
columns=obj_tuning.inventoryColumns;

positions=ds_grid_create(2,columns*rows);

xPadding=obj_tuning.inventoryXPadding;
yPadding=obj_tuning.inventoryYPadding;
descriptionYPadding=obj_tuning.descriptionYPadding;
descriptionXPadding=obj_tuning.descriptionXPadding;

for(var i=0;i<rows*columns;i++){
	var xx=xPadding+(i%2)*(display_get_gui_width()/2-xPadding/2);
	var yy=yPadding+floor(i/2)*(obj_tuning.textSep/2+string_height("text"));
	ds_grid_add(positions,0,i,xx);
	ds_grid_add(positions,1,i,yy);
	show_debug_message(xx);
	show_debug_message(yy);
}

firstObject=0;
selectedObject=0;
lockedObject=-1;
lockedObject2=-1;
lockedItemX=obj_tuning.lockedItemX;
lockedItemY=obj_tuning.lockedItemY;
lockedItemSize=obj_tuning.lockedItemSize;


obj_hero.pickedUp=false;

depth=0;