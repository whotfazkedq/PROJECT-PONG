
if(menu_state !=  "end" && keyboard_check_pressed(vk_escape)) {
	if (menu_state == "") {
		menu_state = "pause";
		global.paused = true;
	} else if (menu_state == "pause") {
		menu_state = "";
		global.paused = false;
	}
}

if (menu_state == "pause") {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
	if (keyboard_check_pressed(global.key_up)) {
		selected -= 1;
		if (selected < 0) selected = array_length(keys_pause) - 1;
	}
	if (keyboard_check_pressed(global.key_down)) {
		selected += 1;
		if (selected >= array_length(keys_pause)) selected = 0;
	}
	
	for (var i = 0; i < array_length(keys_pause); i++) {
		var kp = keys_pause[i];
		if (point_in_rectangle(mx, my, kp.x1, kp.y1, kp.x2, kp.y2)) {
			selected = i;
		}
	}
	
	var confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
	var clic = mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, keys_pause[selected].x1, keys_pause[selected].y1, keys_pause[selected].x2, keys_pause[selected].y2);
	
	if (confirm || clic) {
		switch (selected) {
			case 0: menu_state = ""; global.paused = false; break;
			case 1: global.options_return = "pause"; menu_state = "options"; break;
			case 2: global.paused = false; window_set_cursor(cr_default); room_goto(CONNECT_RM_MAIN); break;
		}
	}


}
else if (menu_state == "options") {
    click_opt_menu(); 
}
else if (menu_state == "end" && mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    if (point_in_rectangle(mx, my, 300, 400, 500, 450)) {
        global.paused = false;
		window_set_cursor(cr_default);
        room_goto(CONNECT_RM_MAIN);
    }
}

if (menu_state == "") {
	window_set_cursor(cr_none);
} else { 
	window_set_cursor(cr_default);
}