/// @description When room ends

// if background music is still playing (likely due to tester skipping previous level), stop it
if audio_is_playing(bgrMusic)
	audio_stop_sound(bgrMusic)