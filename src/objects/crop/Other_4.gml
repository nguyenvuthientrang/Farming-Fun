/// @description Insert description here
// You can write your code in this editor
if (room == Room_1 and ds_crop_instances = -1){
	ds_crop_instances = ds_grid_create(room_width div cellSize, room_height div cellSize);
	/*ds_grid_clear(ds_crop_instances, 0);
	
	//respawn the crop
	if (ds_crop_data[# 0,0] != 1){
		var inst_num = ds_grid_height(ds_crop_data);
		var slot = 0; repeat(inst_num){
			//respawn that instance
			respawn_crop(
			ds_crop_data[# 0, slot],
			ds_crop_data[# 1, slot],
			ds_crop_data[# 2, slot],
			ds_crop_data[# 3, slot],
			);
			slot += 1;
		}
	}*/
}
