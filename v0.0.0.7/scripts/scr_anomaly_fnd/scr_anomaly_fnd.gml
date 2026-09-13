function anomaly_fnd(id, msg) {
    if (global.weird_num[id]) exit;
    
    global.weird_num[id] = true;
    global.weird += 1;
	if (id = 0) global.dm = true;
    
    
    show_message(msg);
    
    if (global.weird >= 5) {
		global.real = true;
    }
	save_weird();
	
	game_end();
}