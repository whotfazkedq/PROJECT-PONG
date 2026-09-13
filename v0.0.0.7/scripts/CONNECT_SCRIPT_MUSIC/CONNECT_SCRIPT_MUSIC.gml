function play_music(){
	if (!audio_is_playing(CONNECT_MUSIC_STOLEN)) {
		audio_play_sound(CONNECT_MUSIC_STOLEN, 10, true);
	}
}