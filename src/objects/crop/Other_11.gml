/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_crop)){
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