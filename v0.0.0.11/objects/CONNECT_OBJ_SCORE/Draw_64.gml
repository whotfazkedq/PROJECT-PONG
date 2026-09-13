var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

draw_set_font(CONNECT_FONT_FONT);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_set_color(c_white);
draw_set_alpha(0.4);
var i = 0;
while (i < gui_h) {
    draw_line_width(gui_w/2, i, gui_w/2, i + 15, 2);
    i += 30;
}
draw_set_alpha(1);

draw_set_color(c_ltgray);
draw_text(gui_w * 0.75, 20, global.user);
draw_text(gui_w * 0.25, 20, "CPU");

draw_set_color(c_white);
draw_text_transformed(gui_w * 0.75, 70, string(global.player_score), player_scale, player_scale, 0);
draw_text_transformed(gui_w * 0.25, 70, string(global.cpu_score), cpu_scale, cpu_scale, 0);

draw_set_font(-1);
draw_set_color(c_purple);
draw_text(gui_w/2, gui_h - 20, "First to " + string(global.max_points) + " points");

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

