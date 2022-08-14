 /// @description Insert description here
//update input
input_left = keyboard_check(vk_left);
input_right = keyboard_check(vk_right);
input_up = keyboard_check(vk_up);
input_down = keyboard_check(vk_down);

input_walk = keyboard_check(vk_control);
input_run = keyboard_check(vk_shift);
//alter speed
if (input_walk or input_run){
	spd = abs(input_walk*w_spd - input_run*r_spd);
}
else {spd = n_spd;}
//reset move variable
moveX = 0;
moveY = 0;
//intended movement
moveX = (input_right - input_left)*spd;
if (moveX = 0) {moveY = (input_down - input_up)*spd;}
//Collision check
//horizontal check
if (moveX != 0){
	if (place_meeting(x+moveX, y, obj_collision)){
		repeat(abs(moveX)){
			if (!place_meeting(x+sign(moveX), y, obj_collision)){x += sign(moveX);}
			else{break;}
		}
		moveX = 0;
	}
}
//vertical check
if (moveY != 0){
	if (place_meeting(x, y+moveY, obj_collision)){
		repeat(abs(moveY)){
			if (!place_meeting(x, y+sign(moveY), obj_collision)){y += sign(moveY);}
			else{break;}
		}
		moveY = 0;
	}
}
//apply movement
x += moveX
y += moveY