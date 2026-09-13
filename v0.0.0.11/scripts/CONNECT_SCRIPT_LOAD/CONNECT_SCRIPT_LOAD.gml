function load_weird() {
    if (!file_exists("save_weird.ini")) {
        global.weird = 0;
        global.dm = false;
        global.real = false;
		global.open_count = 0;
		
        global.weird_num = array_create(10, false);
		
        save_weird();
        return;
    }
    
    ini_open("save_weird.ini");
    
    global.weird = ini_read_real("rareness", "level", 0);
    global.dm = ini_read_real("dm", "access", 0);
    global.real = ini_read_real("connection_level", "real", 0);
	global.open_count = ini_read_real("executed", "times", 0);
	
    
    global.weird_num = array_create(10, false);
    for (var i = 0; i < 10; i++) {
        global.weird_num[i] = ini_read_real("weird_num", "id" + string(i), 0);
    }
	
    ini_close();
}