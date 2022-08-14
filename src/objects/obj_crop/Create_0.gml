/// @description Insert description here
// You can write your code in this editor
frame_width = 32;
frame_height = 64;

crop_type = 0;
day_old = 0;
growth_stage = 0;
growth_stage_duration = 0;
max_growth_stage = (sprite_get_width(spr_crop)/frame_width) - 1;

fullyGrown = false;
sparkle = -1;

xx = x - (frame_width/2) + 2;
yy = y - frame_height + 6;