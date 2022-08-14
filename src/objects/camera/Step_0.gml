 /// @description Insert description here
// You can write your code in this edit
moveCam = keyboard_check(ord("C"));

if (moveCam){
	x += (keyboard_check(ord("D"))- keyboard_check(ord("A")))*6;
	y += (keyboard_check(ord("S"))- keyboard_check(ord("W")))*6;
}else {
	x = clamp(x, following.x - h_border, following.x+h_border);
	y = clamp(y, following.y - v_border, following.y+v_border);
}

