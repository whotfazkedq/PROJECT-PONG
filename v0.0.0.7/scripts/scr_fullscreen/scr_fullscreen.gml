function toggle_fullscreen(){
	global.fullscreen = !global.fullscreen;
	window_set_fullscreen(global.fullscreen);
}