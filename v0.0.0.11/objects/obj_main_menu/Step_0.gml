var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (keyboard_check_pressed(global.key_up)) {
	selected -= 1;
	if (selected < 0) selected = array_length(keys) - 1;
}
if (keyboard_check_pressed(global.key_down)) {
	selected += 1;
	if (selected >= array_length(keys)) selected = 0;
}

for (var i = 0; i < array_length(keys); i++) {
	var k = keys[i];
	if (point_in_rectangle(mx, my, k.x1, k.y1, k.x2, k.y2)) {
		selected = i;
	}
}

var confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var clic = mouse_check_button_pressed(mb_left) && point_in_rectangle(mx, my, keys[selected].x1, keys[selected].y1, keys[selected].x2, keys[selected].y2);

if (confirm || clic) {
	switch (selected) {
		case 0: room_goto(room_difficulty); break;
		case 1: global.options_return = "menu"; room_goto(room_options); break;
		case 2: game_end(); break;
	}
}