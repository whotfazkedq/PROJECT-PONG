function draw_opt_menu(){
	draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
	
	draw_set_font(CONNECT_FONT_FONT);
    draw_text(400, 100, "OPTIONS");

	draw_set_font(-1);
	
    draw_text(400, 180, "Points to Win: " + string(global.max_points));
    
	for (var i = 0; i < array_length(keys_opt); i++) {
		var ko = keys_opt[i];
		var unable_min = (i == 0 && global.max_points <= 1);
		var unable_max = (i == 1 && global.max_points >= 10);
		
		if (unable_min || unable_max) {
			draw_set_color(c_gray);
		} else if (i == selected) {
			draw_set_color(c_yellow);
		} else {
			draw_set_color(c_white);
		}
		
		draw_rectangle(ko.x1, ko.y1, ko.x2, ko.y2, true);
		draw_text((ko.x1 + ko.x2)/2, (ko.y1 + ko.y2)/2, ko.text);
	}

	draw_set_color(c_white);
    var text_keys = (global.key_up == vk_up) ? "Arrow Keys ( UP / DOWN )" : " W / S ";
    draw_text(400, 300, "Controls: " + text_keys);
    
	
	
	
	draw_set_color(c_white);
}