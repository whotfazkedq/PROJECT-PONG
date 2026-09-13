if (global.player_score != last_player_score) {
    player_scale = 1.6;
    last_player_score = global.player_score;
}
if (global.cpu_score != last_cpu_score) {
    cpu_score = 1.6;
    last_cpu_score = global.cpu_score;
}

player_scale = lerp(player_scale, 1, 0.15);
cpu_scale = lerp(cpu_scale, 1, 0.15);