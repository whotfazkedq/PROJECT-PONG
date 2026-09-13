function kb_init(_title, _target, _mask, _rroom, _wroom, _broom, _user) {
    layout_main = [
        ["1","2","3","4","5","6","7","8","9","0"],
        ["q","w","e","r","t","y","u","i","o","p"],
        ["a","s","d","f","g","h","j","k","l","."],
        ["z","x","c","v","b","n","m","-","DEL"],
        ["EXT","BACK","ENTER"]
    ];
    layout_ext = [
        ["@","#","$","%","^","&","*","(",")","_"],
        ["+","=","/","\\","<",">","{","}","[","]"],
        ["~","`","|","?","!",":",";","'","\"",","],
        ["ABC","BACK","ENTER"]
    ];
    
    current_layout = layout_main;
    sel_row = 0;
    sel_col = 0;
	kb_user = _user;
	if(kb_user && variable_global_exists("user")){
		input_text = global.user;
	}else{
		input_text = "";
	}
    max_length = 30;
    
    kb_title = _title;
    kb_target = is_array(_target) ? _target : [_target];
    kb_mask = _mask;
    kb_rroom = _rroom;
    kb_wroom = _wroom;
	kb_broom = _broom;
}

function kb_get_rect(row, col) {
    var key_w = 60, key_h = 50, gap = 10;
    var start_x = 60, start_y = 200;
    var x1 = start_x + col * (key_w + gap);
    var y1 = start_y + row * (key_h + gap);
    return [x1, y1, x1 + key_w, y1 + key_h];
}

function kb_press_key(label) {
    if (label == "DEL") {
        input_text = string_delete(input_text, string_length(input_text), 1);
    }
    else if (label == "EXT") {
        current_layout = layout_ext;
        sel_row = 0; sel_col = 0;
    }
    else if (label == "ABC") {
        current_layout = layout_main;
        sel_row = 0; sel_col = 0;
    }
	else if (label = "BACK"){
		if(kb_user){
			global.user = input_text;
		}
		room_goto(kb_broom);
	}
    else if (label == "ENTER") {
        kb_submit();
    }
    else if (string_length(input_text) < max_length) {
        input_text += label;
    }
	
}

function kb_submit() {
	if(kb_user){
		global.user = input_text;
	}
    var _found = false;
	var _user_index = -1;
    for (var i = 0; i < array_length(kb_target); i++) {
        if (input_text = kb_target[i]) {
            _found = true;
			_user_index = i;
            break;
        }
    }
    
    if (_found) {
		global.user_d = _user_index;
        room_goto(kb_rroom);
    } else {
        room_goto(kb_wroom);
    }
}

function kb_step() {
    var _current_row = current_layout[sel_row];
    sel_col = clamp(sel_col, 0, array_length(_current_row) - 1);
    
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);
    
    if (keyboard_check_pressed(global.key_up) && sel_row > 0) {
        sel_row -= 1;
        var _new_row = current_layout[sel_row];
        sel_col = clamp(sel_col, 0, array_length(_new_row) - 1);
    }
    if (keyboard_check_pressed(global.key_down) && sel_row < array_length(current_layout) - 1) {
        sel_row += 1;
        var _new_row = current_layout[sel_row];
        sel_col = clamp(sel_col, 0, array_length(_new_row) - 1);
    }
    if (keyboard_check_pressed(global.key_left)) {
        sel_col = max(sel_col - 1, 0);
    }
    if (keyboard_check_pressed(global.key_right)) {
        sel_col = min(sel_col + 1, array_length(current_layout[sel_row]) - 1);
    }
    
    for (var r = 0; r < array_length(current_layout); r++) {
        var _row = current_layout[r];
        for (var c = 0; c < array_length(_row); c++) {
            var rect = kb_get_rect(r, c);
            if (point_in_rectangle(mx, my, rect[0], rect[1], rect[2], rect[3])) {
                sel_row = r;
                sel_col = c;
            }
        }
    }
    
    var confirm_key = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(ord("Z"));
    var rect_sel = kb_get_rect(sel_row, sel_col);
    var confirm_click = mouse_check_button_pressed(mb_left) &&
                         point_in_rectangle(mx, my, rect_sel[0], rect_sel[1], rect_sel[2], rect_sel[3]);
    
    if (confirm_key || confirm_click) {
        kb_press_key(current_layout[sel_row][sel_col]);
    }
    
    if (keyboard_check_pressed(vk_backspace)) {
        input_text = string_delete(input_text, string_length(input_text), 1);
    }
}

function kb_draw() {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_set_color(c_white);
    draw_text(room_width/2, 60, kb_title);
    
    draw_rectangle(room_width/4, 100, (room_width/4)*3, 150, true);
    var _show = kb_mask ? string_repeat("*", string_length(input_text)) : input_text;
    draw_text(room_width/2, 125, _show + "_");
    
    for (var r = 0; r < array_length(current_layout); r++) {
        var _row = current_layout[r];
        for (var c = 0; c < array_length(_row); c++) {
            var rect = kb_get_rect(r, c);
            var is_sel = (r == sel_row && c == sel_col);
            draw_set_color(is_sel ? c_yellow : c_white);
            draw_rectangle(rect[0], rect[1], rect[2], rect[3], true);
            draw_text((rect[0]+rect[2])/2, (rect[1]+rect[3])/2, _row[c]);
        }
    }
    
    draw_set_color(c_white);
}