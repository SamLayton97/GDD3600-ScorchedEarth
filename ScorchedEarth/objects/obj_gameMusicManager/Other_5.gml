/// @description When room ends

// if background music is still playing (likely due to tester skipping previous level), stop it
if audio_is_playing(msc_gameplayBackground)
	audio_stop_sound(msc_gameplayBackground)