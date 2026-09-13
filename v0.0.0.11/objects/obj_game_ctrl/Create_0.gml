load_progress();

show_message("working_directory: " + working_directory + 
             "\nfile_exists: " + string(file_exists("savedata.dat")));

show_debug_message("=== RUTA ACTUAL ===");
show_debug_message(working_directory);

if (!variable_global_exists("max_points")) {
	global.player_score = 0;
	global.cpu_score = 0;
	global.max_points = 5;
	
	global.key_up = vk_up;
    global.key_down = vk_down;
	global.key_right = vk_right;
	global.key_left = vk_left;
    
    global.player_speed = 8;
    global.cpu_speed = 8;
    global.initial_ball_speed = 5;
    global.mult_ball = 1.1;
    
    global.paused = false;
    global.winner = "";
    global.options_return = "menu"; 
	
	global.fullscreen = false;
	global.scale_mode = "fixed";

}

play_music();

