function click_opt_menu() {
    var mx = device_mouse_x_to_gui(0);
	var my = device_mouse_y_to_gui(0);

	if (keyboard_check_pressed(global.key_up)) {
		selected -= 1;
		if (selected < 0) selected = array_length(keys_opt) - 1;
	}
	if (keyboard_check_pressed(global.key_down)) {
		selected += 1;
		if (selected >= array_length(keys_opt)) selected = 0;
	}
	
	for (var i = 0; i < array_length(keys_opt); i++) {
		var ko = keys_opt[i];
		if (point_in_rectangle(mx, my, ko.x1, ko.y1, ko.x2, ko.y2)) {
			selected = i;
		}
	}
	
	var confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
	var clic = mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, keys_opt[selected].x1, keys_opt[selected].y1, keys_opt[selected].x2, keys_opt[selected].y2);
	
	if (confirm || clic) {
		switch (selected) {
			case 0: global.max_points = max(1, global.max_points - 1); break;
			case 1: global.max_points = min(10, global.max_points + 1); break;
			case 2: if (global.key_up == vk_up) { global.key_up = ord("W"); global.key_down = ord("S"); global.key_right = ord("D"); global.key_left = ord("A") } else { global.key_up = vk_up; global.key_down = vk_down; global.key_right = vk_right; global.key_left = vk_left }; break;
			case 3: if (global.options_return == "pause") { menu_state = ""; global.paused = false; } else { room_goto(room_menu) }; break;
		}
	}
}