function play_music(){
	if(global.dm=false){
		if (!audio_is_playing(CONNECT_MUSIC_HOMEFLOWERS_EMPTY)) {
			audio_play_sound(CONNECT_MUSIC_HOMEFLOWERS_EMPTY, 10, true);
		}
	}else{ 
		if(!audio_is_playing(CONNECT_MUSIC_GLACEIR)){
			audio_play_sound(CONNECT_MUSIC_GLACEIR, 10, true);
		}
	}
}