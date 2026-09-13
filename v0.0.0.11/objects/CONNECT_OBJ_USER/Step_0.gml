kb_step();

if (keyboard_check_pressed(ord("X"))){
	if(kb_user){
		global.user = input_text;
	}
	room_goto(CONNECT_RM_MAIN);
}