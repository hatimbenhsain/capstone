/// @description Insert description here
// You can write your code in this editor
frozen=false;
vx=0;
vy=0;
dir="F";
walking=false;
state="falling";
startCounter=0;
acc=obj_tuning.heroAcc;
maxSpeed=obj_tuning.heroMaxSpeed;
speedFactor=obj_tuning.speedFactor;

leftButton=obj_tuning.leftButton;
rightButton=obj_tuning.rightButton;
downButton=obj_tuning.downButton;
upButton=obj_tuning.upButton;
interactButton=obj_tuning.interactButton;
runButton=obj_tuning.runButton;

cameraSmoothingIngame=obj_tuning.cameraSmoothing;
cameraSmoothingActing=obj_tuning.cameraSmoothing*4;
shadowSprite=sprite_shadow;
talkingTo=noone;

pickedUp=false;

angrySprite=sprite_hero_angry;
confusedSprite=sprite_hero_confused;
cringeSprite=sprite_hero_cringe;
excitedSprite=sprite_hero_excited;
happySprite=sprite_hero_happy;
neutralSprite=sprite_hero_neutral;
sadSprite=sprite_hero_sad;
shockedSprite=sprite_hero_shocked;
suspiciousSprite=sprite_hero_suspicious;
thinkingSprite=sprite_hero_thinking;
pensiveSprite=sprite_hero_pensive;

orgOffsetX=sprite_xoffset;
orgOffsetY=sprite_yoffset;

cameraSubject=self;

rightStep=true;