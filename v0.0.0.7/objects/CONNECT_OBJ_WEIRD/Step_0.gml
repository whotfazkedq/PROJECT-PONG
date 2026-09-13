var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (keyboard_check_pressed(global.key_up)) {
	selected -= 1;
	if (selected < 0) selected = array_length(keys_diff) - 1;
}
if (keyboard_check_pressed(global.key_down)) {
	selected += 1;
	if (selected >= array_length(keys_diff)) selected = 0;
}

for (var i = 0; i < array_length(keys_diff); i++) {
	var kd = keys_diff[i];
	if (point_in_rectangle(mx, my, kd.x1, kd.y1, kd.x2, kd.y2)) {
		selected = i;
	}
}

var confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var clic = mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, keys_diff[selected].x1, keys_diff[selected].y1, keys_diff[selected].x2, keys_diff[selected].y2);

if (confirm || clic) {
	switch (selected) {
		case 0: global.player_speed = 9; global.cpu_speed = 5; global.initial_ball_speed = 4; global.mult_ball = 1.025; start_match(); break;
		case 1: global.player_speed = 9; global.cpu_speed = 8; global.initial_ball_speed = 5; global.mult_ball = 1.05; start_match(); break;
		case 2: global.player_speed = 8; global.cpu_speed = 8; global.initial_ball_speed = 6; global.mult_ball = 1.1; start_match(); break;
		case 3: room_goto(CONNECT_RM_MAIN); break;
	}
}