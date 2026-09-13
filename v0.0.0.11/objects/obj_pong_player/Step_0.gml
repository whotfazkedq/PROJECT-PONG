if(global.paused) exit;

if (keyboard_check(global.key_up)) {
	y -= global.player_speed;
}

if (keyboard_check(global.key_down)) {
	y += global.player_speed;
}

y = clamp(y, sprite_height/2, room_height - sprite_height/2);