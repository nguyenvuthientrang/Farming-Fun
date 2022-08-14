              /// @description Insert description here
// You can write your code in this editor
if (inst_daycycle.global_time - last_feed > 100000){
	hungry = true
}
if not hungry{
	eating = false
	if ( inst_daycycle.hours<6 or inst_daycycle.hours > 22){
		sleep = true
	} else {
		sleep = false
	}	
}

if ((not hungry) and (not sleep)){
	randomise() 

	spd = 0.5;


	moveX = 0
	moveY = 0

	if (rand <1){
		moveX = spd;
	} else if (rand >= 1 and rand <2) {
		moveX = -spd;
	} else if (rand >=2 and rand <3) {
		moveY = spd;
	} else if (rand >=3 and rand <4){
		moveY = -spd;
	}


	//walk 0->360: Standing
	//walk 360 -> 480: walking


	if (walk > l_stand){
		walk -= 1
	} else if (walk > 0){
		walk -= 1
		moveX = 0
		moveY = 0
	} else
	{
		rand = random(4)
		walk = l_stand + l_step
	}


	/*
	// Manual move
	input_up = keyboard_check(ord("W"));
	input_down = keyboard_check(ord("S"));
	input_left = keyboard_check(ord("A"));
	input_right = keyboard_check(ord("D"));


	moveX = 0;
	moveY = 0;

	//move logic

	moveX = (input_right-input_left) * spd;
	moveY = (input_down-input_up) * spd;

	*/


	//-----------Barrier collision

	if (moveX != 0){
		if (place_meeting(x+moveX, y, obj_collision)){
			repeat(abs(moveX)) {
				if (place_meeting(x+sign(moveX),y, obj_collision) ){
					break;
				} else {x += sign(moveX);}
			}
			moveX = 0; 
		}
	}
	if (moveY != 0){
		if (place_meeting(x, y+moveY, obj_collision)){
			repeat(abs(moveY)) {
				if (place_meeting(x, y+sign(moveY), obj_collision)){
					break;
				} else {
					y+= sign(moveY);
				}	
			}
			moveY = 0;
		}
	}


	x+= moveX;
	y+= moveY;
} else if (hungry) and (obj_food_sheep.amount > 0){
	eating = true

	//move in x direction
	if ((x - des_x)<-2) moveX = 1
	else if ((x - des_x)>2) moveX = -1
	//move in y direction
	else{
		moveX = 0 
		if ((y - des_y)<-2) moveY = 1
		else if ((y - des_y)>2) moveY = -1
	}

 	if (moveX != 0){
		if (place_meeting(x+moveX, y, obj_collision)){
			moveX = 0; 
		}
	}
	if (moveY != 0){ 
		if (place_meeting(x, y + moveY, obj_collision)){
			moveY = 0; 
		}
	}
	x+= moveX;
	y+= moveY;
} else if hungry and (obj_food_sheep.amount = 0) {
	eating = false
}