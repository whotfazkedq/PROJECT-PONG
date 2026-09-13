global.weird = 0;
global.dm = false;
global.real = false;
global.error_exists = false;
global.open_count = 0;
global.user = "";
global.devs = [
	{ user: "me#2222@doko.ai", pass: "connect_you&&sim" },
	{ user: "gabnir08.0@doko.dev", pass: "d0k0.4zds_143ar" },
	{ user: "mikemy10.mm@doko.dev", pass: "rw.puw_14gf" },
	{ user: "cvisx__fx@doko.dev", pass: "cuek0_mh.fat" },
];

show_debug_message("=== RUTA ACTUAL ===");
show_debug_message(working_directory);
show_debug_message("file_exists: " + string(file_exists("save_weird.ini")));

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
load_weird();

global.watch_folder = working_directory + "project_pong/";
global.watch_file = global.watch_folder + "request_access.me";


if (!directory_exists(global.watch_folder)) {
	directory_create(global.watch_folder);
	show_message("folder created");
}

file_watch_prev = false;
watch_timer = 0;


if (global.real = false) {
	if(global.dm=false){
		room_goto(CONNECT_RM_MAIN);
	}else{
		room_goto(CONNECT_RM_SELECT);
	}
	play_music();
}

if (!global.real = true) {
	if(global.open_count < 23){
		global.open_count += 1;
	}
	if (global.open_count >= 22) {
		
		anomaly_fnd(2, "are you having issues? :(");
	} else {
		save_weird();
	}
}