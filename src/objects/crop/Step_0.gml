/// @description Insert description here
// You can write your code in this editor
#region Planting
if (keyboard_check_pressed(ord("P"))){planting = !planting}

if (!planting){
	mx = mouse_x;
	my = mouse_y;
	
	if (mouse_wheel_up()){selectCrop += 1;}
	if (mouse_wheel_down()){selectCrop -= 1;}
	
	if (selectCrop > sprite_get_number(spr_crop_picked)-1){selectCrop = 0;}
	else if (selectCrop < 0){selectCrop = sprite_get_number(spr_crop_picked)-1;}
	
	if (mouse_check_button_pressed(mb_left)){
		instance_create_crop(mx, my, selectCrop);
    }
}
#endregion

#region Crop Growing 
if (instance_exists(obj_crop) and keyboard_check_pressed(ord("G"))){
	with (obj_crop){
		if (growth_stage < max_growth_stage){
			day_old += 1;
			
			//first growth
			var firstGrowth = 0;
			if (day_old > 0){firstGrowth = 1;}
			growth_stage = firstGrowth + (day_old div growth_stage_duration);
		}
		else {
			growth_stage = max_growth_stage;
			fullyGrown = true;
			alarm[1] = 1;
		}
	}
}
#endregion
//HARVESTING
if (keyboard_check_pressed(ord("H"))){harvesting = !harvesting;}

if (instance_exists(obj_crop) and harvesting){
	mx = mouse_x;
	my = mouse_y;
	
	if (mouse_check_button_pressed(mb_left)){
		if (obj_crop.growth_stage == obj_crop.max_growth_stage){
			instance_harvest_crop(mx, my);}
		else {
			show_debug_message("Unripe plant")
		}
	}

}