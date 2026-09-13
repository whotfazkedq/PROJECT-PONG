function save_weird() {
    ini_open("save_weird.ini");
    
    ini_write_real("rareness", "level", global.weird);
    ini_write_real("dm", "access", global.dm);
    ini_write_real("connection_level", "real", global.real);
	ini_write_real("executed", "times", global.open_count);
    
    for (var i = 0; i < 10; i++) {
        ini_write_real("weird_num", "id" + string(i), global.weird_num[i]);
    }
    
	
	
    ini_close();
}