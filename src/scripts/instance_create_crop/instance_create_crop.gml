///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type
function instance_create_crop(x_pos, y_pos, cropType){
	var cs = crop.cellSize;
	var gx = (x_pos div cs);
	var gy = (y_pos div cs);
	var i_grid = crop.ds_crop_instances;
	var cell = i_grid[# gx, gy];
	
	if (cell == 0){
		xx = gx*cs;
	    yy = gy*cs;
	
	    //check for soil
	    var lay_id = layer_get_id("T_Soil");
	    var map_id = layer_tilemap_get_id(lay_id);
	    var data = tilemap_get_at_pixel(map_id, x_pos, y_pos);
	
	    if (data == 0){
		    show_debug_message("There is no soil here.");
		    return false;
	    }
	    else {
		    show_debug_message("There is soil here.");
	    }
	
	    var inst = instance_create_layer(xx+(cs/2), yy+(cs/2), "Instances", obj_crop);
	    i_grid[# gx, gy] = inst;
	
	    with (inst){
		    crop_type = cropType;
		    growth_stage_duration = crop.ds_crops_types[# 0, crop_type];
	    }
	    return inst;
	}
	else {
		show_debug_message("There is already something here.");
		return false;
	}
	
	
}