function play_music(){
	if (!audio_is_playing(snd_pong_cat)) {
		audio_play_sound(snd_pong_cat, 10, true);
	}
}