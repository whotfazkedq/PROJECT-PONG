menu_state = ""; // "pause", "options", "end"
array_opt_menu();
toggle_fullscreen();
update_view();


selected = 0;

keys_pause = [
    { text: "CONTINUE", x1: 300, y1: 200, x2: 500, y2: 250 },
	{ text: "OPTIONS", x1: 300, y1: 280, x2: 500, y2: 330 },
	{ text: "BACK TO MENU", x1: 300, y1: 360, x2: 500, y2: 410 }
];