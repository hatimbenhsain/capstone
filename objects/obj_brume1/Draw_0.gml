/// @description Insert description here
// You can write your code in this editor
if(obj_brumeManager.state==0){
	shader_set(shader_brume);
	draw_self();
	shader_reset();
}else{
	draw_self();	
}