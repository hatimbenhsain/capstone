/// @description Insert description here
// You can write your code in this editor
global.cameraOverride=false;

debugMode=false;

paused=true;



optionSelected=0;

keys=ds_map_create();
keys[?vk_left]="left";
keys[?vk_right]="right";
keys[?vk_up]="up";
keys[?vk_down]="down";
keys[?vk_shift]="shift";
keys[?vk_enter]="enter";
keys[?vk_alt]="alt";
keys[?vk_backspace]="back";
keys[?vk_tab]="tab";
keys[?vk_delete]="del";
keys[?vk_insert]="insert";
keys[?vk_pageup]="pageup";
keys[?vk_pagedown]="pagedown";
keys[?vk_left]="left";
keys[?vk_left]="left";
for(var i=65;i<=90;i++){
	keys[?ord(chr(i))]=chr(i);				
}
keys[?vk_space]="space";


pausedOptions=["Resume","Save","Settings","Exit Game"];
settingsOptions=["Sound Settings","Controls"];
exitOptions=["Yes","No"];
soundOptions=["Master Volume","Background Music","Sound Effects"];
controlOptions=["Move Forward","Move Backward","Move Left","Move Right","Interact","Inventory","Run"];
if(file_exists("save.sav")){
	startOptions=["Load Game","New Game","Settings","Exit Game"];	
}else{
	startOptions=["New Game","Settings","Exit Game"];
}
options=startOptions;
soundControl=false;
keysControl=false;