function log_debug(text){
	var var_file = file_text_open_append("debug_log.txt");
	if (var_file == -1) {
		var_file = file_text_open_write("debug_log.txt");
	}
	file_text_write_string(var_file, string(current_time) + " - " + text + "\n");
	file_text_close(var_file);
}