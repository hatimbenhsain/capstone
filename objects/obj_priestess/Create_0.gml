/// @description Insert description here
// You can write your code in this editor
name="priestess";

event_inherited();




neutralSprite=sprite_priestess_neutral;

idleL=sprite_priestess_idleL;
idleB=sprite_priestess_idleB;
idleF=sprite_priestess_idleF;
walkL=sprite_priestess_walkL;
walkB=sprite_priestess_walkB;
walkF=sprite_priestess_walkF;
sittingSprite=sprite_priestess_sat;
walking=false;


state=0;



add1=false;
addBird=false;

angrySprite=sprite_priestess_angry;
happySprite=sprite_priestess_happy;
neutralSprite=sprite_priestess_neutral;
sadSprite=sprite_priestess_sad;
shockedSprite=sprite_priestess_shocked;
suspiciousSprite=sprite_hero_suspicious;
thinkingSprite=sprite_priestess_thinking;
cryingSprite=sprite_priestess_crying;
sereneSprite=sprite_priestess_serene;
pensiveSprite=sprite_priestess_pensive;

clothShown=false;
weaponShown=false;

grassAlpha=1;

instance_deactivate_layer("layer_walls2");

instance_deactivate_layer("endFog");

//for(var i=0;i<3;i++){
//	ds_list_add(conditions,false);	
//}


