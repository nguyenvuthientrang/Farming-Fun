/// @description Insert description here
// You can write your code in this editor
if (drop_move){
	x = lerp(x, goal_x, 0.1);
	y = lerp(y, goal_y, 0.1);
	if (abs(x - goal_x) < 1 and abs(y - goal_y) < 1){drop_move = false;}
}
else{
	if (!keyboard_check(ord("O"))){exit;}
	
	var px = obj_player.x;
	var py = obj_player.y;
	var r = 32;
	if (point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
		//are we on top of the player
		r = 2;
		if (!point_in_rectangle(px, py, x-r, y-r, x+r, y+r)){
			//move toward the player
			x = lerp(x, px, 0.1);
			y = lerp(y, py, 0.1);
		}
		else {//pick up item 
			var in = item_num;
			
			with(inventory){
				var ds_inv = global.ds_inventory;
				var picked_up = false;
				
				//check if item exist in the inventory alredy
				var yy = 0; repeat(inv_slot){
					if (ds_inv[# 0, yy] == in){
						ds_inv[# 1, yy] += 1;
						picked_up = true;
						break;
					}
					else {yy += 1;}
				}
				//otherwise, add item into an empty slot if there is one
				if (!picked_up){
					var yy = 0; repeat(inv_slot){
						if (ds_inv[# 0, yy] == item.none){
							ds_inv[# 0, yy] = in;
							ds_inv[# 1, yy] += 1;
							picked_up = true;
							break;
						}
						else {yy += 1;}
				    }
				}
			}
			//destroy item if pick up
			if (picked_up){
				instance_destroy();
				show_debug_message("Picked up an item.");
			}
		}
		
	}
}