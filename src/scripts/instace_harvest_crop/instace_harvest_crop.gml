///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type
function instance_harvest_crop(x_pos, y_pos){
	var cs = crop.cellSize;
	var gx = (x_pos div cs);
	var gy = (y_pos div cs);
	var i_grid = crop.ds_crop_instances;
	var cell = i_grid[# gx, gy];
	
	
	if (cell != 0){
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
	
	
		// kiet nen destroy inst hay cell :(
		instance_destroy(cell, true);
		i_grid[# gx, gy] = 0;
		
		//var inst = obj_crop.id;
			
		
	
	
	}
	else {
		show_debug_message("There is already something here.");
		return false;
	}
	
	
}