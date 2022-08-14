/// @description Insert description here
// You can write your code in this editor
if (keyboard_check_pressed(ord("S"))){show_shop = !show_shop;}

if (!show_shop){exit;}

#region Mouse slot
mousex = device_mouse_x_to_gui(0);
mousey = device_mouse_y_to_gui(0);

var cell_xbuff = (shop_cell_size + x_buffer)*shop_scale;
var cell_ybuff = (shop_cell_size + y_buffer)*shop_scale;

var i_mousex = mousex - slot_item_x;
var i_mousey = mousey - slot_item_y;

var nx = i_mousex div cell_xbuff;
var ny = i_mousey div cell_ybuff;

if (nx >= 0 and nx < shop_slot_width and ny >= 0 and ny < shop_slot_height){
	var sx = i_mousex - (nx*cell_xbuff);
	var sy = i_mousey - (ny*cell_ybuff);
	
	if ((sx < shop_cell_size*shop_scale) and (sy < shop_cell_size*shop_scale)){
		m_slotx = nx;
		m_sloty = ny;
	}
}

//Set selected slot to mouse position
select_slot = min(shop_slot-1, m_slotx + (m_sloty*shop_slot_width));
#endregion

//Select item to buy
var shop_grid = ds_shop;
var ss_item = shop_grid[# 0, select_slot];

if (ss_item != shop_item.none){
	if (mouse_check_button_pressed(mb_left)){
		shop_grid[# 2, select_slot] += 1;
		show_debug_message(string(shop_grid[# 2, select_slot]) + "qua" +shop_grid[# 3, select_slot]);
	}
	if (mouse_check_button_pressed(mb_right)){
		if (shop_grid[# 2, select_slot] > 0){
			shop_grid[# 2, select_slot] -= 1;
		}
		show_debug_message(string(shop_grid[# 2, select_slot]) + " qua " + shop_grid[# 3, select_slot]);
	}
}

if (keyboard_check_pressed(ord("B"))){
	var k = 0; repeat(shop_slot){
		global.ds_inventory[# 1, k] += shop_grid[# 2, k];
		shop_grid[# 2, k] = 0;
		k++;
	}
}