if (keyboard_check_pressed(vk_f4)) {
	toggle_fullscreen();
	update_view();
}

if (keyboard_check(vk_f9)) {
	anomaly_fnd(9, "ANOMALY TEST DETECTED");
	show_debug_message("Total Anomalies: " + string(global.save_data.anomaly_num));
}