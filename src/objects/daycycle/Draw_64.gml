/// @description Insert description here
// You can write your code in this editor
var c = light_color;
draw_set_alpha(darkness);
draw_rectangle_color(0, 0, guiWidth, guiHeight, c, c, c, c, false);
draw_set_alpha(1);

draw_text_color(10, 10, string(seconds), c_yellow, c_yellow, c_yellow, c_yellow, 1);
draw_text_color(10, 30, string(minutes), c_yellow, c_yellow, c_yellow, c_yellow, 1);
draw_text_color(10, 50, string(hours), c_yellow, c_yellow, c_yellow, c_yellow, 1);
draw_text_color(10, 70, string(day), c_yellow, c_yellow, c_yellow, c_yellow, 1);
draw_text_color(10, 90, string(month), c_yellow, c_yellow, c_yellow, c_yellow, 1);
draw_text_color(10, 110, string(year), c_yellow, c_yellow, c_yellow, c_yellow, 1);
