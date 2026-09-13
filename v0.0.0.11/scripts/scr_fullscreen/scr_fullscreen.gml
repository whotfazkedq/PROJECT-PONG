function toggle_fullscreen(){
	if(room != CONNECT_RM_MATCH_PLACE){
		global.fullscreen = !global.fullscreen;
		window_set_fullscreen(global.fullscreen);
	} else if(global.fullscreen=false) {
		global.fullscreen = !global.fullscreen;
		window_set_fullscreen(global.fullscreen);
	}
}