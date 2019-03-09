/// @description Used for initialization

// if not already playing, start title music
if !audio_is_playing(msc_titleBackground)
	audio_play_sound(msc_titleBackground, 10, true)