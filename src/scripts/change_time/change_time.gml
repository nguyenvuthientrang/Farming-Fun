// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_time(arg){
	show_debug_message("change time to" + string(arg));
	switch(arg){
		case 0: global.time_faster = 10*60; break;
		case 1: global.time_faster = 100*60; break;
		case 2: global.time_faster = 1000*60; break;
		case 3: global.time_faster = 1; break;
	}
}