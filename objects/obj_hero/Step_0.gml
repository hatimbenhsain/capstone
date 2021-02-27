/// @description Insert description here
// You can write your code in this editor
var buttonsUp=false;

if(keyboard_check_released(leftButton) || keyboard_check_released(downButton) || keyboard_check_released(upButton) || keyboard_check_released(rightButton)){
	buttonsUp=true;	
}


var cwidth = camera_get_view_width(view_camera[0]);
var cheight = camera_get_view_height(view_camera[0]);
var cameraX=camera_get_view_x(view_camera[0])+cwidth/2;
var cameraY=camera_get_view_y(view_camera[0])+cheight/2;

var xToUse=cameraSubject.x/2+x/2;
var yToUse=cameraSubject.y/2+y/2;

switch(state){
	case "falling":
		sprite_index=sprite_heroFall;
		if(keyboard_check_pressed(interactButton) && alarm[2]==-1){
			alarm[2]=3*room_speed;
			obj_gui.state="landing";
		}
		if(alarm[2]!=-1){
			y=lerp(y,startingY+25,1/(room_speed));
		}else{
			yToUse=y-27;
		}
		break;
	case "fallen":
		sprite_index=sprite_heroFallen;
		if(keyboard_check(leftButton) || keyboard_check(rightButton) || keyboard_check(upButton) || keyboard_check(downButton)){
			startCounter+=1;	
			var maxVal=startCounter/(room_speed*1.5);
			if(startCounter%2==0){
				var newX=random_range(-1,1)+orgOffsetX;
				var newY=random_range(-1,1)+orgOffsetY;	
			}else{
				var newX=sprite_xoffset;
				var newY=sprite_yoffset;
			}			
			sprite_set_offset(sprite_index,lerp(sprite_xoffset,newX,maxVal),lerp(sprite_yoffset,newY,maxVal));
		}else{
			startCounter-=2;
			startCounter=clamp(startCounter,0,room_speed*1.5)
			sprite_set_offset(sprite_index,lerp(sprite_xoffset,orgOffsetX,1/2),lerp(sprite_yoffset,orgOffsetY,1/2));
		}
		if(startCounter>=room_speed*1.5){
			state="acting";
			sprite_set_offset(sprite_index,orgOffsetX,orgOffsetY);
			obj_gui.state="cutscene";
			obj_gui.blinkingText="";
			obj_lilypadManager.scene+=1;
		}
		break;
	case "grounded":
		cameraSubject=self;
	
		if((keyboard_check_pressed(leftButton) || (keyboard_check(leftButton) && buttonsUp)) && !keyboard_check(rightButton) && !frozen){
			if(vx>0) vx=0;
			vx=vx-acc;
			walking=true;
			vy=0;
			sprite_index=sprite_heroWalkL;
			image_index=0;
			dir="L";
		}else if((keyboard_check_pressed(rightButton) || (keyboard_check(rightButton) && buttonsUp)) && !keyboard_check(leftButton) && !frozen){
			if(vx<0) vx=0;
			vx=vx+acc;
			walking=true;
			vy=0;
			sprite_index=sprite_heroWalkR;
			image_index=0;
			dir="R";
		}else if((keyboard_check_pressed(downButton) || (keyboard_check(downButton) && buttonsUp)) && !keyboard_check(upButton) && !frozen){
			if(vy<0) vy=0;
			vy=vy+acc;
			walking=true;
			vx=0;
			sprite_index=sprite_heroWalkF;
			image_index=0;
			dir="F";
		}else if((keyboard_check_pressed(upButton) || (keyboard_check(upButton) && buttonsUp)) && !keyboard_check(downButton) && !frozen){
			if(vy>0) vy=0;
			vy=vy-acc;
			walking=true;
			vx=0;
			sprite_index=sprite_heroWalkB;
			image_index=0;
			dir="B";
		}
		if(keyboard_check(runButton) && image_speed==1){
			image_speed=image_speed*speedFactor;
			maxSpeed=maxSpeed*speedFactor;
		}else if(!keyboard_check(runButton) && image_speed==speedFactor){
			image_speed=image_speed/speedFactor;	
			maxSpeed=maxSpeed/speedFactor;
		}

		if(walking){
			switch(dir){
				case("L"):
					vx-=acc;
					break;
				case("R"):
					vx+=acc;
					break;
				case("F"):
					vy+=acc;
					break;
				case("B"):
					vy-=acc;
					break;
			}
			if(alarm[1]==-1){
				rightStep=true;
				alarm[1]=(1-image_index%1)*room_speed/(sprite_get_speed(sprite_index)*image_speed);
			}
		}else{
			alarm[1]=-1;
		}

		vx=clamp(vx,-maxSpeed,maxSpeed);
		vy=clamp(vy,-maxSpeed,maxSpeed);

		var canmove;
		for(i=1;i<=abs(vx);i++){
			canmove=true;
			if(place_meeting(x+sign(vx),y,obj_collidable)) canmove=false;
			if(canmove) x+=sign(vx);
		}
		for(i=1;i<=abs(vy);i++){
			canmove=true;
			if(place_meeting(x,y+sign(vy),obj_collidable)) canmove=false;
			if(canmove) y+=sign(vy);
		}


		if(frozen || (!keyboard_check(leftButton) && !keyboard_check(rightButton) && !keyboard_check(upButton) && !keyboard_check(downButton))){
			vx=0;
			vy=0;
			walking=false;
		}

		if(vx==0 && vy==0){
			sprite_index=asset_get_index("sprite_heroIdle"+dir);
		}
		break;
	case "acting":
		break;
}

depth=-1*(y+sprite_height/2-12);






if(keyboard_check_pressed(interactButton) ||  mouse_check_button_pressed(mb_left)){
	var xx, yy, talkerDir;
	switch(dir){
		case("F"):
			xx=0;
			yy=bbox_bottom-bbox_top;
			talkerDir="B";
			break;
		case("L"):
			xx=bbox_left-bbox_right;
			yy=0;
			talkerDir="R";
			break;
		case("R"):
			xx=bbox_right-bbox_left;
			yy=0;
			talkerDir="L";
			break;
		case("B"):
			xx=0;
			talkerDir="F";
			yy=bbox_top-bbox_bottom;
			break;
	}
	var inst=instance_place(x+xx,y+yy,obj_interactable);
	if(inst!=noone && !obj_dialogueManager.finished && !obj_inventory.open){
		talkingTo=inst;
		talkingTo.dir=talkerDir;
		inst.talkingTo=self;
		frozen=true;
		if(obj_inventory.lockedObject!=-1){
			with(inst){
				//show_debug_message(obj_inventory.lockedObject);
				//show_debug_message(obj_inventory.items[|obj_inventory.lockedObject]);
				useItem(obj_inventory.items[|obj_inventory.lockedObject].object_index);
			}
		}
	}else if(inst!=noone && !obj_inventory.open){
		talkingTo=noone;
		inst.talkingTo=noone;
		if(alarm[0]==-1) alarm[0]=1; //unfreezing
		obj_dialogueManager.finished=false;
	}else if(inst==noone && pickedUp){
		talkingTo=noone;
		if(alarm[0]==-1) alarm[0]=1;
		obj_dialogueManager.finished=false;
		pickedUp=false;
	}
}

if(state=="acting"){
	var cameraSmoothing=cameraSmoothingActing;
}else{
	cameraSmoothing=cameraSmoothingIngame;	
}

camera_set_view_pos(view_camera[0],cameraX+(xToUse-cameraX)/cameraSmoothing-cwidth/2,cameraY+(yToUse-cameraY)/cameraSmoothing-cheight/2);
