/// @description Insert description here
// You can write your code in this editor
global.pause = true;
global.view_width = camera_get_view_width(view_camera[0]);
global.view_heigth = camera_get_view_height(view_camera[0]);

global.time_faster = 10*60;

display_set_gui_size(global.view_width, global.view_heigth);

global.key_enter = vk_enter;
global.key_left = vk_left;
global.key_right = vk_right;
global.key_up = vk_up;
global.key_down = vk_down;

enum menu_page{
	main,
	setting,
	height
}

enum menu_element_type{
	script_runner,
	page_transfer,
	shift
}

//CREATE MENU PAGES
ds_menu_main = create_menu_page(
	[["RESUME",		menu_element_type.script_runner,	resume_game],
	 ["NEW PLAY",	menu_element_type.script_runner,	new_game],
	 ["SETTING",	menu_element_type.page_transfer,	menu_page.setting],
	 ["EXIT",		menu_element_type.script_runner,	exit_game]]
)

ds_menu_setting = create_menu_page(
	[["TIME", menu_element_type.shift,			change_time,	0, ["x10", "x100", "x1000", "REAL TIME"]],
	 ["BACK", menu_element_type.page_transfer,	menu_page.main]]
)

page = 0;
menu_pages = [ds_menu_main, ds_menu_setting];

var i = 0; array_len = array_length_1d(menu_pages);
repeat(array_len){
	menu_option[i] = 0;
	i++;
}
inputting = false;