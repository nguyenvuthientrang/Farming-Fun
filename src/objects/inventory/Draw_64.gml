/// @description Insert description here
// You can write your code in this editor
if (!show_inventory){exit;}
//----------inventory back
draw_sprite_part_ext(
     spr_inv_UI, 0, cell_size, 0, inv_UI_width, inv_UI_height,
	 inv_UI_x, inv_UI_y, scale, scale, c_white, 1
);

var info_grid = ds_player_info;

var c = c_black;
draw_set_font(fnt_text_24);
draw_text_color(info_x, info_y, info_grid[# 0, 3] + ":" + info_grid[# 1, 3], c, c, c, c, 1);

draw_set_font(fnt_small_digit);
var i = 0; repeat(3){
	draw_text_color(info_x + (192*scale) + ((15+18)*scale*i), info_y,
	                string(info_grid[# 1, i]), c, c, c, c, 1);
	i += 1;
}

//--------------Inventory
var ii, ix, iy, xx, yy, sx, sy, iitem, inv_grid;
ii = 0; ix = 0; iy = 0;
inv_grid = global.ds_inventory;

repeat(inv_slot){
	//x,y location for slot
	xx = slot_x + ((x_buffer+cell_size)*ix*scale);
	yy = slot_y + ((y_buffer+cell_size)*iy*scale);
	// item
	iitem = inv_grid[# 0, ii];
	sx = (iitem mod spr_inv_item_column)*cell_size;
	sy = (iitem div spr_inv_item_column)*cell_size;
	//draw slot and item
	draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 1);
	
	switch(ii){
		case selected_slot:
		     if (iitem > 0) {draw_sprite_part_ext(
	                           spr_inv_item, 0, sx, sy, cell_size, cell_size, xx, yy,
		                       scale, scale, c_white, 1);}
			 gpu_set_blendmode(bm_add);
			 draw_sprite_part_ext(spr_inv_UI, 0, 0, 0, cell_size, cell_size, xx, yy, scale, scale, c_white, 0.3);
			 gpu_set_blendmode(bm_normal);
		break;
		
		case pickup_slot:
		     if (iitem > 0) {draw_sprite_part_ext(
	                           spr_inv_item, 0, sx, sy, cell_size, cell_size, xx, yy,
		                       scale, scale, c_white, 0.2);}
		     
		default:	 
			 if (iitem > 0) {draw_sprite_part_ext(
	                           spr_inv_item, 0, sx, sy, cell_size, cell_size, xx, yy,
		                       scale, scale, c_white, 1);}
		break;
	}
	//draw item number
	if (iitem > 0) {
		var number = inv_grid[# 1, ii];
		draw_text_color(xx, yy, string(number), c, c, c, c, 1);
	}
	//increment
	ii += 1;
	ix = ii mod inv_slot_width;
	iy = ii div inv_slot_width;
}

if (pickup_slot != -1){
	// item
	iitem = inv_grid[# 0, pickup_slot];
	sx = (iitem mod spr_inv_item_column)*cell_size;
	sy = (iitem div spr_inv_item_column)*cell_size;
	draw_sprite_part_ext(spr_inv_item, 0, sx, sy, cell_size, cell_size, mousex, mousey,
		                       scale, scale, c_white, 1);
							   
	var inum = inv_grid[# 1, pickup_slot];
	draw_text_color(mousex + (cell_size*scale*0.5), mousey, string(inum), c, c, c, c, 1);
	
}