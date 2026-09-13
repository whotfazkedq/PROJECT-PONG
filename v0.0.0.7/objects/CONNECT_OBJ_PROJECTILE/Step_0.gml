if (global.paused) {
	hspeed = 0;
	vspeed = 0;
	exit;
}

if (y - sprite_height/2 <= 0 || y + sprite_height/2 >= room_height) {
    vspeed = -vspeed;
}

if (x > room_width) {
	global.cpu_score += 1;
	x = room_width/2;
	y = room_height/2;
	vx = global.initial_ball_speed;
	vy = global.initial_ball_speed;
	
	if(global.cpu_score >= global.max_points) {
		global.winner = "CPU WINS";
		with (CONNECT_OBJ_MATCH) {
			menu_state = "end";
		}
		global.paused = true;
	}
}

if (x < 0) {
	global.player_score += 1;
    x = room_width/2;
    y = room_height/2;
    vx = global.initial_ball_speed;
	vy = global.initial_ball_speed;
	
	if(global.player_score >= global.max_points) {
		global.winner = "YOU WIN";
		with(CONNECT_OBJ_MATCH) {
			menu_state = "end";
		}
		global.paused = true;
	}
}

hspeed = vx;
vspeed = vy;