/// @description When room ends

// if end-level music is still playing, stop it
if audio_is_playing(msc_successBackground)
	audio_stop_sound(msc_successBackground)
else if audio_is_playing(msc_failureMusic)
	audio_stop_sound(msc_failureMusic)