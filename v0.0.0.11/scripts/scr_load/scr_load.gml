function load_progress() {
	log_debug("=== load_progress START ===");
	log_debug("working_directory: " + working_directory);
	log_debug("file_exists: " + string(file_exists("save_data.dat")));
	
    var var_load_fine = false;
    
    if (file_exists("save_data.dat")) {
        var var_buffer = buffer_load("save_data.dat");
        
        if (var_buffer != -1) {
            var var_key_len = string_length(SAVE_KEY);
            var var_size = buffer_get_size(var_buffer);
            
            var var_json = "";
            for (var i = 0; i < var_size; i++) {
                var var_byte = buffer_read(var_buffer, buffer_u8);
                var _key_code = ord(string_char_at(SAVE_KEY, (i mod var_key_len) + 1));
                var_json += chr(var_byte ^ _key_code);
            }
            buffer_delete(var_buffer);
            
            try {
                global.save_data = json_parse(var_json);
                var_load_fine = true;
            } catch (var_err) {
                log_debug("Save corrupto, se ignora: " + string(var_err.message));
            }
        }
    }
    
    if (!var_load_fine) {
        global.save_data = {
            anomaly: array_create(10, false),
            anomaly_num: 0,
            dev_mode: false
        };
        save_progress()();
    }
    else {
        while (array_length(global.save_data.anomaly) < 10) {
            array_push(global.save_data.anomaly, false);
        }
    }
}