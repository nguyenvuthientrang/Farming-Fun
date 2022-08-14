/// @description Insert description here
// You can write your code in this editor
global_time = 0;
seconds = 0;
minutes = 0;
hours = 0;

day = 1;
month = 1;
year = 1;

time_increment = 1/60 * global.time_faster;  // '1/60' second per step
time_pause = true;

max_darkness = 0.7;
darkness = 0
light_color = c_black; 
draw_daylight = false;


guiWidth = display_get_gui_width();
guiHeight = display_get_gui_height();

enum phase {
	sunrise = 6,
	daytime = 8.5,
	sunset = 18,
	nighttime = 22
}