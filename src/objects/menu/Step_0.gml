/// @description Insert description here
// You can write your code in this editor
if (!global.pause) exit;

input_up_p		= keyboard_check_pressed(global.key_up);
input_down_p	= keyboard_check_pressed(global.key_down);
input_enter_p	= keyboard_check_pressed(global.key_enter);

var ds_ = menu_pages[page];
var ds_heigth = ds_grid_height(ds_);

if (inputting){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element_type.shift: 
			var hinput = keyboard_check_pressed(global.key_right) - keyboard_check_pressed(global.key_left);
			if (hinput != 0){
				ds_[# 3, menu_option[page]] += hinput;
				ds_[# 3, menu_option[page]] = clamp(ds_[# 3, menu_option[page]], 0, array_length_1d(ds_[# 4, menu_option[page]])-1);
			}
		break;
	}
}
else {
	var ochange = input_down_p - input_up_p;
	if (ochange != 0){
		menu_option[page] += ochange;
		if (menu_option[page] > ds_heigth) {menu_option[page] = 0;}
		if (menu_option[page] < 0) {menu_option[page] = ds_heigth - 1;}
	}	
}

if (input_enter_p){
	switch(ds_[# 1, menu_option[page]]){
		case menu_element_type.script_runner: script_execute(ds_[# 2, menu_option[page]]); break;
		case menu_element_type.page_transfer: page = ds_[# 2, menu_option[page]]; break;
		case menu_element_type.shift: 
			if (inputting){
				script_execute(ds_[# 2, menu_option[page]], ds_[# 3, menu_option[page]]);
			}
			inputting = !inputting;
		break;
	}
}