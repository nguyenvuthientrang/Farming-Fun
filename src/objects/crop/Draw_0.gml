/// @description Insert description here
// You can write your code in this editor
if (!planting){

	var cs = cellSize;
	var gx = (mx div cs);
	var gy = (my div cs);

	xx = gx*cs;
	yy = gy*cs;

	//what is in the cell
	var c = c_red;
	cell = ds_crop_instances[# gx, gy];

	if (cell == 0){
		var lay_id = layer_get_id("T_Soil");
		var map_id = layer_tilemap_get_id(lay_id);
		var data = tilemap_get_at_pixel(map_id, mx, my);
		if (data != 0){c = c_white;}
	}

	draw_rectangle_color(xx, yy, xx+cs, yy+cs, c,c,c,c, true);

	draw_sprite(spr_crop_picked, selectCrop, xx+(cs/2), yy+(cs/2));
}

if (harvesting){
	var hcs = cellSize;
	var hgx = (mx div hcs);
	var hgy = (my div hcs);

	hxx = hgx*hcs;
	hyy = hgy*hcs;
	
	var c = c_red;
	var cell = ds_crop_instances[# hgx, hgy];
	
	if (cell != 0){
		var lay_id = layer_get_id("T_Soil");
		var map_id = layer_tilemap_get_id(lay_id);
		var data = tilemap_get_at_pixel(map_id, mx, my);
		if (instance_exists(obj_crop)) {
			if (cell != 0 and obj_crop.growth_stage == obj_crop.max_growth_stage){
				c = c_white;
			}
		}
	}

	draw_rectangle_color(hxx, hyy, hxx+hcs, hyy+hcs, c,c,c,c, true);
}