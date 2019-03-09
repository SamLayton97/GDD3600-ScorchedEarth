/// @description Called each frame

// if game transitions to post-invasion, stop gameplay music
if obj_gameManager.currPhase == InvasionPhase.postInvasion and audio_is_playing(msc_gameplayBackground)
	audio_stop_sound(msc_gameplayBackground)
