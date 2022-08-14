/// @description Insert description here
// You can write your code in this editor
shop_scale = 2;
show_shop = false;

shop_slot = 11;
shop_slot_width = 4;
shop_slot_height = 3;

select_slot = 0;
choose_item = -1;
m_slotx = 0;
m_sloty = 0;

x_buffer = 2;
y_buffer = 16;

shop_gui_height = display_get_gui_height();
shop_gui_width = display_get_gui_width();

shop_cell_size = 32;

shop_UI_width = 288;
shop_UI_height = 192;

spr_shop_ui = spr_shop_UI;
spr_shop_Item = spr_inventory_item;

shop_UI_x = (shop_gui_width * 0.5) - (shop_UI_width * 0.5 * shop_scale);
shop_UI_y = (shop_gui_height * 0.5) - (shop_UI_height * 0.5 * shop_scale);

text_x = shop_UI_x + (9*shop_scale);
text_y = shop_UI_y + (9*shop_scale);

slot_item_x = text_x;
slot_item_y = shop_UI_y + (40*shop_scale);

global.money = 1000;


//-----------Shop
//0 = item
//1 = price

ds_shop = ds_grid_create(4, shop_slot);

//-----------Item
enum shop_item {
	none		= 0,
	tomato		= 1,
	potato		= 2,
	carrot		= 3,
	artichoke	= 4,
	chilli		= 5,
	gourd		= 6, 
	corn		= 7,
	rice		= 8,
	mash		= 9,
	straw		= 10,
	height		= 11,
}

//Doi gia o day
var i = 0; repeat(shop_slot){
	ds_shop[# 0, i] = i;
	ds_shop[# 1, i] = 10;
	ds_shop[# 2, i] = 0;
	i++;
}

ds_shop[# 3, 0] = "None";
ds_shop[# 3, 1] = "Tomato";
ds_shop[# 3, 2] = "Potato";
ds_shop[# 3, 3] = "Carrot";
ds_shop[# 3, 4] = "Artichoke";
ds_shop[# 3, 5] = "Chilli";
ds_shop[# 3, 6] = "Gourd";
ds_shop[# 3, 7] = "Corn";
ds_shop[# 3, 8] = "Rice";
ds_shop[# 3, 9] = "Mash";
ds_shop[# 3, 10] = "Straw";