
/// @description Insert description here
// You can write your code in this editor

//----------Draw event
var anim_length = 4;
var frame_size = 128;
var anim_speed = 4;

if ((not hungry) and (not sleep)) or eating {
	//direction
	if (moveX > 0){ y_frame =  3;}
	else if (moveX < 0){ y_frame = 1;}
	else if (moveY > 0){ y_frame = 2;}
	else if (moveY < 0){ y_frame = 0;}

	//Draw shadow underneath
	draw_sprite_part(spr_llama_shadow,0, 0, y_frame*frame_size,frame_size,frame_size, x, y-5)

	if (x_frame + anim_speed/60 < anim_length){
		x_frame += anim_speed/60
	} else { 
		x_frame = 1
	}

	if (moveX != 0 or moveY != 0){
		//Walking 
	
		stand_count = 30
		draw_sprite_part(spr_sheep_walk,0, floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
	
	} else {
		if (stand_count > 0){
			//Standing still
		
			stand_count -= 1;
			draw_sprite_part(spr_sheep_eat,0, 0, y_frame*frame_size, frame_size, frame_size, x, y)
		
		} else {
		
			//Eating
		

			if (eat_count <39){
				//Start eating (draw frame 1,2,3,4)
				draw_sprite_part(spr_sheep_eat,0, (floor(eat_count/10))*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
				eat_count += 1;
			} else if (eat_count < l_stand-39) {
				//Eating (Draw frame 3,4)
				draw_sprite_part(spr_sheep_eat,0, (2+(floor( eat_count/10))%2)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
				eat_count +=1;
			} else if (eat_count < l_stand ) {
				//Stop eating (draw frame 4,3,2,1)
				draw_sprite_part(spr_sheep_eat,0, (3-(floor((eat_count-l_stand+39)/10)))*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
				eat_count += 1
			} else {
				//Reset
				draw_sprite_part(spr_sheep_eat,0, 0, y_frame*frame_size, frame_size, frame_size, x, y)
				stand_count = 60+random(30);
				eat_count = 0;
			}
		}
	}

} else {
	if (moveX > 0){ y_frame =  1;}
	else if (moveX < 0){ y_frame = 0;}
	else if (moveY > 0 or moveY < 0){y_frame = 1}
	
	if (x_frame + 4/60 < anim_length){
		x_frame += 4/60
	} else { 
		x_frame = 0 
	}
	if hungry {
		draw_sprite_part(spr_sheep_hungry,0,floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
	
		if (random(1000) <5){
			talk = 60
		}
		if (talk> 0) and (gap < 0){
			talk = talk - 1
			draw_sprite(spr_txt_hungry, 0, x+65, y+20)
		} else if (talk == 0 ){
			talk -= 1
			gap = 120
		} else {
			gap -= 1
		} 
	} else {
		draw_sprite_part(spr_sheep_sleep,0,floor(x_frame)*frame_size, y_frame*frame_size, frame_size, frame_size, x, y)
	} 
	


}
//draw_rectangle_color(bbox_left,bbox_top, bbox_right, bbox_bottom, c_blue,c_blue,c_blue,c_blue,1)
