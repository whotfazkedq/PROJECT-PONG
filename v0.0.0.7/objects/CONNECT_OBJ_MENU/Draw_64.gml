draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

draw_set_font(CONNECT_FONT_FONT);
draw_text(400, 80, "PING PONG");

draw_set_font(-1);


draw_text(145, 450, "mabe by:");
draw_text(70, 470, "DOKOTSUMI Group");
draw_text(220, 470, "(gabo industries)");

for (var i = 0; i < array_length(keys); i++) {
	var k = keys[i];
	if (k.hidden) continue;
	
	draw_set_color(i == selected ? c_yellow : c_white);
	draw_rectangle(k.x1, k.y1, k.x2, k.y2, true);
	draw_text((k.x1 + k.x2)/2, (k.y1 + k.y2)/2, k.text);
}

draw_set_color(c_white);