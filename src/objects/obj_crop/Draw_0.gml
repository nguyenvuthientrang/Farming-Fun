/// @description Insert description here
// You can write your code in this editor
draw_sprite_part(
    spr_crop, 0, growth_stage*frame_width, 
	crop_type*frame_height, frame_width, frame_height, xx, yy
);

//draw sparkle
if (sparkle >= 0){
	draw_sprite(spr_sparkle, sparkle, x+2, y-30);
	sparkle += .1;
	if (sparkle >= sprite_get_number(spr_sparkle)){
		sparkle = -1;
		alarm[1] = random_range(4,5)*room_speed;
	}
}