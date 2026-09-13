#macro SAVE_KEY "youthinkyouresmart"

function save_progress(){
	var var_json = json_stringify(global.save_data);	
	var var_key_len = string_length(SAVE_KEY);
	var var_buffer = buffer_create(string_byte_length(var_json) + 1 , buffer_fixed, 1);
	
	for (var i = 1; i <= string_length(var_json); i++) {
		var var_char_code = ord(string_char_at(var_json, i));
		var var_key_code = ord(string_char_at(SAVE_KEY, ((i - 1) mod var_key_len) + 1));
		buffer_write(var_buffer, buffer_u8, var_char_code ^ var_key_code);
	}
	
	buffer_save(var_buffer, "save_data.dat");
	
	log_debug("save_progress: writting " + string(buffer_get_size(var_buffer)) + " bytes a save_data.dat");
	buffer_save(var_buffer, "save_data.dat");
	log_debug("save_progress: buffer_save executing, does file exist now? " + string(file_exists("save_data.dat")));
	buffer_delete(var_buffer);
	
	show_message("Guardado ejecutado.\nArchivo existe ahora? " + string(file_exists("savedata.dat")) + 
                 "\nRuta: " + working_directory);
}