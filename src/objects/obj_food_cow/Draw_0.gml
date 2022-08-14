var frame_size = 64

x_frame = 3-amount

draw_sprite_part(spr_food_straw,0, x_frame*frame_size, 0, frame_size, frame_size,x,y)

if position_meeting(mouse_x,mouse_y,self) {
	var xx = mouse_x
	var yy = mouse_y

	draw_sprite_part(spr_food_cow,0,0,0,32,32, xx-5, yy-10)	
}


