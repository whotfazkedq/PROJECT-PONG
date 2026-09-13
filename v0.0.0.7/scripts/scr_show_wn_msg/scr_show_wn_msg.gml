function show_wn_msg(id, msg){
	if (global.weird_num[id]) exit;
	
	global.weird_num[id] = true;
	global.weird += 1;
	
	save_weird();
	
	show_message(msg);
	game_end();
}