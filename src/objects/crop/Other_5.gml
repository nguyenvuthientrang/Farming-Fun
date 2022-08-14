/// @description Insert description here
// You can write your code in this editor
/*if (room == Room_1){
	var inst_num = instance_number(obj_crop);
	if (inst_num == 0){ds_grid_clear(ds_crop_data, -1);}//no data
	else {
		//there is crop here so save their data
		ds_grid_resize(ds_crop_data, ds_grid_width(ds_crop_data), inst_num);
		//loop throught the instance grid
		var gw = ds_grid_width(ds_crop_instances);
		var gh = ds_grid_height(ds_crop_instances);
		var slot = 0;
		
		var xx = 0; repeat(gw){
			var yy = 0; repeat(gh){
				var inst = ds_crop_instances[# xx, yy];
				
				// if there is a instance in the cell save it
				if (inst != 0){
					ds_crop_data[# 0, slot] = xx;
					ds_crop_data[# 1, slot] = yy;
					ds_crop_data[# 2, slot] = inst.crop_type;
					ds_crop_data[# 3, slot] = inst.day_old;
					slot += 1;
				}
				yy += 1;
			}
		    xx += 1;
		}
	}
	ds_grid_destroy(ds_crop_instances);
}*/