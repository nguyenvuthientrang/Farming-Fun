depth = -1;
scale = 2;
show_inventory = false;


inv_slot = 11;

inv_slot_width = 8;
inv_slot_height = 3;

selected_slot = 0;
pickup_slot = -1;
m_slotx = 0;
m_sloty = 0;

x_buffer = 2;
y_buffer = 4;

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

cell_size = 32;

inv_UI_width =  288;
inv_UI_height = 192;

spr_inv_UI = spr_inventory_UI;
spr_inv_item = spr_inventory_item;

spr_inv_item_column = sprite_get_width(spr_inv_item)/cell_size;
spr_inv_item_row = sprite_get_height(spr_inv_item)/cell_size;

inv_UI_x = (gui_width * 0.5) - (inv_UI_width * 0.5 * scale);
inv_UI_y = (gui_height * 0.5) - (inv_UI_height * 0.5 * scale);

info_x = inv_UI_x + (9 * scale);
info_y = inv_UI_y + (9 * scale);

slot_x = info_x;
slot_y = inv_UI_y + (40*scale);

#region Player info
// 0 = GOLD
// 1 = SILVER
// 2 = BRONZE
// 3 = NAME

ds_player_info = ds_grid_create(2, 4);
ds_player_info[# 0, 0] = "Gold";
ds_player_info[# 0, 1] = "Silver";
ds_player_info[# 0, 2] = "Bronze";
ds_player_info[# 0, 3] = "Name";

ds_player_info[# 1, 0] = 1000;
ds_player_info[# 1, 1] = 0;
ds_player_info[# 1, 2] = 0;
ds_player_info[# 1, 3] = "Hoang";
#endregion

#region Inventory
// column 0 = item
// column 1 = amount

global.ds_inventory = ds_grid_create(2, inv_slot);

// Items
enum item {
	none = 0,
	tomato = 1,
	potato = 2,
	carrot = 3,
	artichoke = 4,
	chilli = 5,
	gourd = 6,
	corn = 7,
	rice= 8,
	mash		= 9,
	straw			= 10,
	height		= 11,
}

var i = 1; repeat(inv_slot-1){
	global.ds_inventory[# 0, i] = i;
	global.ds_inventory[# 1, i] = 0;

	
	i += 1;
}
#endregion