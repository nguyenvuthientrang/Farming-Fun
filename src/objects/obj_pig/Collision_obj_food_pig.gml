/// @description Insert description here
// You can write your code in this editor

if (hungry = true) and (obj_food_pig.amount > 0){
	y_frame = 2
	if (delay > 0) delay -= 1
	else {
		obj_food_pig.amount -= 1
		hungry = false
		last_feed = inst_daycycle.global_time
		delay = eat_delay
	}
}