
if (menu_state == "pause") {
    draw_set_alpha(0.7);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, true);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    
	draw_set_font(CONNECT_FONT_FONT);
    draw_text(400, 100, "PAUSE");
	draw_set_font(-1);
	
    for (var i = 0; i < array_length(keys_pause); i++) {
		var kp = keys_pause[i];
		draw_set_color(i == selected ? c_yellow : c_white);
		draw_rectangle(kp.x1, kp.y1, kp.x2, kp.y2, true);
		draw_text((kp.x1 + kp.x2)/2, (kp.y1 + kp.y2)/2, kp.text);
	}
	
}
else if (menu_state == "options") {
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, true);
    draw_set_alpha(1);
    draw_opt_menu();
}
else if (menu_state == "end") {
    draw_set_alpha(0.85);
    draw_set_color(c_black);
    draw_rectangle(0, 0, room_width, room_height, true);
    draw_set_alpha(1);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
	draw_set_font(CONNECT_FONT_FONT);
    draw_text(400, 250, global.winner);
	draw_set_font(-1);
    draw_rectangle(300, 400, 500, 450, true);
    draw_text(400, 425, "GO BACK TO MENU");
}