/// @description Insert description here
// You can write your code in this editor
if (!global.pause) exit;

var gwidth = global.view_width;
var gheigth = global.view_heigth;

var ds_grid = menu_pages[page];
var ds_heigth = ds_grid_height(ds_grid);

var y_buffer =32, x_buffer = 16;
var start_y = (gheigth/2) - (((ds_heigth-1)/2) * y_buffer);
var start_x = gwidth/2; 

//DRAW PAUSE MENU "BACK"
c = c_black;
draw_rectangle_color(0, 0, gwidth, gheigth, c, c, c, c, false);

//DRAW ELEMENTS ON LEFT SIDE
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty, xo;

var yy = 0; repeat(ds_heigth){
	lty = start_y + (yy*y_buffer);
	c = c_white;
	xo = 0;
	
	if (yy == menu_option[page]){
		c = c_orange;
		xo = -(x_buffer/2);
	}
	
	draw_set_font(fnt_small_digit);
	draw_text_color(ltx + xo, lty, ds_grid[# 0, yy], c, c, c, c, 1);
	yy++;
}
//DRAW DIVIDING LINE
draw_line(start_x, start_y-y_buffer, start_x, lty+y_buffer);

//DRAW ELEMENTS ON RIGHT SIDE
draw_set_halign(fa_left);

var rtx = start_x + x_buffer, rty;

yy = 0; repeat(ds_heigth){
	rty = start_y + (yy*y_buffer);
	
	switch(ds_grid[# 1, yy]){
		case menu_element_type.shift:
			var current_val = ds_grid[# 3, yy];
			var current_array = ds_grid[#4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			c = c_white;
			
			if (current_val == 0){left_shift = "";}
			if (current_val == array_length_1d(ds_grid[# 4, yy]) - 1){right_shift = "";}
			
			if (inputting and yy == menu_option[page]){c = c_yellow;}
			draw_set_font(fnt_small_digit);
			draw_text_color(rtx, rty,left_shift + current_array[current_val] + right_shift, c, c, c, c, 1);
			
		break;
	}
	yy++; 
}

draw_set_valign(fa_top);