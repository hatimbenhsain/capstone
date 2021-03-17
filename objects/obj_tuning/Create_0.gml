/// @description Insert description here
// You can write your code in this editor
heroAcc=0.2;
heroMaxSpeed=1;
fallingSpeed=4;

leftButton=vk_left;
rightButton=vk_right;
downButton=vk_down;
upButton=vk_up;
interactButton=ord("Z");
inventoryOpenButton=ord("I");
pauseButton=vk_escape;
runButton=vk_shift;

speedFactor=2;

inventoryRows=6;
inventoryColumns=2;
inventoryXPadding=50;
inventoryYPadding=100;
descriptionYPadding=40;
descriptionXPadding=30;
lockedItemSize=50;
lockedItemX=display_get_gui_width()-50;
lockedItemY=display_get_gui_height()-50;
textSep=30;
textPaddingX=30;
textPaddingY=30;

textSpeed=0.5;
cameraSmoothing=5;

cameraWidth=320;
cameraHeight=240;

shakeRate=2;

LoadControls();