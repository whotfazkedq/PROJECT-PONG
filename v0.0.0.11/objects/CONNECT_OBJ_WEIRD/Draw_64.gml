draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_set_font(CONNECT_FONT_FONT);
draw_text(400, 80, "CHOOSE DIFFICULTY");

draw_set_font(-1);
for (var i = 0; i < array_length(keys_diff); i++) {
	var kd = keys_diff[i];
	draw_set_color(i == selected ? c_yellow : c_white);
	draw_rectangle(kd.x1, kd.y1, kd.x2, kd.y2, true);
	draw_text((kd.x1 + kd.x2)/2, (kd.y1 + kd.y2)/2, kd.text);
}

draw_set_color(c_white);