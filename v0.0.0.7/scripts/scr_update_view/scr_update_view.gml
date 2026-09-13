function update_view(){
	var w = global.fullscreen ? display_get_width() : window_get_width();
	var h = global.fullscreen ? display_get_height() : window_get_height();
	
	view_wport[0] = w;
	view_hport[0] = h;
	view_xport[0] = 0;
	view_yport[0] = 0;
}