

if (keyboard_check_pressed(vk_f4)) {
	toggle_fullscreen();
	update_view();
}


if (global.dm = true) {
	if (global.weird_num[9] = false) {
		if(keyboard_check(vk_f9)) {
			anomaly_fnd(9, "didnt know you were gonna figure out this one");
			save_weird();
		game_end();
		}
	}
}

if (global.real	= false){
	if (room != CONNECT_RM_MATCH_PLACE){
		if (keyboard_check_pressed(vk_escape)) {
			game_end();
		}
	}
	if (room = CONNECT_RM_MAIN){
		if (keyboard_check_pressed(ord("X"))){
			game_end();
		}
	}
}

watch_timer += delta_time / 1000000;
if (watch_timer >= 1) {
	watch_timer = 0;
}
var file_now = file_exists(global.watch_file);

if(file_now && !file_watch_prev) {
	if(global.weird_num[4] = false) {
		if(global.dm = true){
			anomaly_fnd(4, "good job");
		}else{ 
			show_message("ACCESS_DENIED");
			file_delete(global.watch_file);
		}
	}
	file_watch_prev = file_now;
}
