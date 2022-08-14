


/// @description Insert description here
// You can write your code in this editor

//----------Draw event
var anim_length = 4;
var frame_size = 32;
var anim_speed = 4;

if ((not hungry) and (not sleep)) or eating {

	if		(moveX > 0){ y_frame =  3;}
	else if (moveX < 0){ y_frame = 1;}
	else if (moveY > 0){ y_frame = 2;}
	else if (moveY < 0){ y_frame = 0;}

	draw_sprite_part(spr_chicken_shadow,0, 0, y_frame*frame_size,frame_size,frame_size, x, y)

	if (x_frame + anim_speed/60 < anim_length){
		x_frame += anim_speed/60
	} else { 
		x_frame = 1
	}

	if (moveX != 0 or moveY != 0){
		stand_count = 30
		draw_sprite_part(spr_chicken_walk,0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
	} else {
		if (stand_count > 0){
			stand_count -= 1;
			draw_sprite_part(spr_chicken_eat,0, 0, y_frame*frame_size, frame_size, frame_size, x, y)
		} else {
			draw_sprite_part(spr_chicken_eat,0, (floor(eat_count/4)%4)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
			if (eat_count <32){
				eat_count += 1;
			} else {
				stand_count = 60+random(30);
				eat_count = 0;
			}
		}
	}

} else if hungry{
	
	if		(moveX > 0){ y_frame =  3;}
	else if (moveX < 0){ y_frame = 1;}
	else if (moveY > 0){ y_frame = 2;}
	else if (moveY < 0){ y_frame = 0;}
	
	if (x_frame + 2/60 < anim_length){
		x_frame += 2/60
	} else { 
		x_frame = 1
	}
	
	draw_sprite_part(spr_chicken_hungry,0,floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
	
	if (random(1000) <1){
		talk = 60
	}
	if (talk> 0) and (gap < 0){
	talk = talk - 1
	draw_sprite(spr_txt_hungry, 0, x+20, y-20)
	} else if (talk == 0 ){
	talk -= 1
	gap = 120
	} else {
	gap -= 1
	} 
	
	
} else {
	if (moveX > 0){ y_frame =  3;}
	else if (moveX < 0){ y_frame = 1;}
	else if (moveY > 0){ y_frame = 2;}
	else if (moveY < 0){ y_frame = 0;}
	
	if (x_frame + 4/60 < anim_length){
		x_frame += 4/60
	} else { 
		x_frame = 0
	}
	
	draw_sprite_part(spr_chicken_sleep,0,floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)

}
	
//draw_rectangle_color(bbox_left,bbox_top, bbox_right, bbox_bottom, c_blue,c_blue,c_blue,c_blue,1)



