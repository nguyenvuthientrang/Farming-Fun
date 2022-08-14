/// @description Insert description here
// You can write your code in this editor
if (!show_shop){exit;}

//---------Shop back
draw_sprite_part_ext(
	spr_shop_ui, 0, shop_cell_size, 0, shop_UI_width, shop_UI_height, shop_UI_x, shop_UI_y, shop_scale, 
	shop_scale, c_white, 1);

draw_set_font(fnt_text_24);
var c = c_black
draw_text_color(text_x, text_y, "Shop", c, c, c, c, 1);

draw_set_font(fnt_small_digit);
draw_text_color(290*shop_scale, text_y + 3*shop_scale, string(global.money), c, c, c, c, 1);

//---------Shop
var ii, ix, iy, xx, yy, sx, iitem, shop_grid;
ii = 0; ix = 0; iy = 0; shop_grid = ds_shop;
repeat(shop_slot){
	//x, y location for slot
	xx = slot_item_x + ((shop_cell_size+x_buffer)*ix*shop_scale);
	yy = slot_item_y + ((shop_cell_size+y_buffer)*iy*shop_scale);
	
	//Item
	iitem = shop_grid[# 0, ii];
	sx = iitem*shop_cell_size;
	
	//Draw item
	switch(ii){
		case select_slot: 
			draw_sprite_part_ext(
			spr_shop_Item, 0, sx, 0, shop_cell_size, shop_cell_size, xx, yy,
			shop_scale, shop_scale, c_white, 1
		);
			gpu_set_blendmode(bm_add);
			draw_sprite_part_ext(spr_shop_ui, 0, 0, 0, shop_cell_size, shop_cell_size, xx, yy, shop_scale, shop_scale, c_white, 0.3);
			gpu_set_blendmode(bm_normal);
		default:
			draw_sprite_part_ext(
			spr_shop_Item, 0, sx, 0, shop_cell_size, shop_cell_size, xx, yy,
			shop_scale, shop_scale, c_white, 1
		);
		break;
	}
	
	//Draw price
	var price = shop_grid[# 1, ii];
	draw_text_color(xx + 8*shop_scale, yy + 33*shop_scale, string(price), c, c, c, c, 1);
	
	//Increment
	
	ii++;
	ix = ii mod shop_slot_width;
	iy = ii div shop_slot_width;
}

//-------Draw bill
var item_name, item_number, ver_buffer, j = 0, var total = 0;
var i = 1; repeat(shop_slot-1){
	item_name = shop_grid[# 3, i];
	item_number = shop_grid[# 2, i];
	
	ver_buffer = 14;
	
	total += item_number*shop_grid[# 1, i];
	
	if (item_number > 0){
		draw_set_font(fnt_text_12);
		draw_text_color(206*shop_scale, (67 + j*ver_buffer)*shop_scale, item_name, c, c, c, c, 1);
		draw_text_color(290*shop_scale, (67 + j*ver_buffer)*shop_scale, item_number, c, c, c, c, 1);
		j++;
	}
	i++;	
}

if (total > 0){
	draw_set_font(fnt_text_12);
	draw_text_color(206*shop_scale, 174*shop_scale, "Total:", c, c, c, c, 1);
	draw_text_color(236*shop_scale, 174*shop_scale, string(total), c, c, c, c, 1);
}