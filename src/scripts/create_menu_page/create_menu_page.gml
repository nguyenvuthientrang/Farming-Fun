// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@description create_menu_page
///@arg [[Name1, type1, entries1...], [Name2, type2, entries2,...]]

function create_menu_page(arguments){
	var arg, i = 0; argument_num = array_length_1d(arguments);
	repeat(argument_num){
		arg[i] = arguments[i];
		i++;
	}
	
	var ds_grid_id = ds_grid_create(5, argument_num);
	
	i = 0; repeat(argument_num){
		var array = arg[i];
		var array_len = array_length_1d(array);
		var j = 0; repeat(array_len){
			ds_grid_id[# j, i] = array[j];
			j++;
		}
		i++;
	}
	
	return ds_grid_id;
}