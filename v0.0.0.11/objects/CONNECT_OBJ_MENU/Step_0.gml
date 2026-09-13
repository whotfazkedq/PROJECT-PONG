if (!wait_active) {
	watch_timer += delta_time / 1000000;
	
	var sec_limit = global.dm ? 60 : 300;
	
	if(watch_timer >= sec_limit) {
		wait_active = true;
		keys[0].text = "???";
	}
}

var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (keyboard_check_pressed(global.key_up)) {
    var next = keys[selected].up;
    if (next != -1) selected = next;
}
if (keyboard_check_pressed(global.key_down)) {
    var next = keys[selected].down;
    if (next != -1) selected = next;
}
if (keyboard_check_pressed(global.key_left)) {
    var next = keys[selected].left;
    if (next != -1) selected = next;
}
if (keyboard_check_pressed(global.key_right)) {
    var next = keys[selected].right;
    if (next != -1) selected = next;
}

for (var i = 0; i < array_length(keys); i++) {
    var k = keys[i];
    if (!k.hidden && point_in_rectangle(mx, my, k.x1, k.y1, k.x2, k.y2)) {
        selected = i;
    }
}

var confirm_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
var confirm_click = mouse_check_button_pressed(mb_left) && !keys[selected].hidden && point_in_rectangle(mx, my, keys[selected].x1, keys[selected].y1, keys[selected].x2, keys[selected].y2);

if (confirm_key || confirm_click) {
    switch (selected) {
        case 0: if (wait_active) { anomaly_fnd(3, "patience is a virtue"); } else if(global.dm=false) { room_goto(CONNECT_RM_USERNAME); } else if(global.dm=true){room_goto(CONNECT_RM_SELECT);} break;
        case 1: if(global.dm=false){global.options_return = "menu"; room_goto(CONNECT_RM_WEIRD_ADJUSTMENT);}else{room_goto(CONNECT_RM_OPT_DEV);} break;
        case 2: game_end(); break;
    }
    
    var meta_node = global.dm ? 3 : 9;
    if (selected = meta_node) {
        anomaly_fnd(1, "you pretty good at mazes");
    }
}

