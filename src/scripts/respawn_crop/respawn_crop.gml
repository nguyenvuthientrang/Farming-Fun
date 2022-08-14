///@description respawn_crop
///@arg grid_x
///@arg grid_y
///@arg cropType
///@arg daysOld
function respawn_crop(gird_x, grid_y, crop_Type, days_Old){
	var xx = gird_x*cellSize;
	var yy = grid_y*cellSize;
	
	var inst = instance_create_layer(xx+(cellSize/2), yy+(cellSize/2), "Instances", obj_crop);
	ds_crop_instances[# gird_x, grid_y] = inst;
	show_debug_message("respawn a crop");
	//give the crop its characteristic
	with(inst){
		crop_type = crop_Type;
		day_old = days_Old;
		growth_stage_duration = crop.ds_crops_types[# 0,crop_type];
	}
	return inst;
}