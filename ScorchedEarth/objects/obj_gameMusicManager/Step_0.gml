/// @description Called each frame

// if game transitions to post-invasion, stop gameplay music
if obj_gameManager.currPhase == InvasionPhase.postInvasion and audio_is_playing(bgrMusic)
	audio_stop_sound(bgrMusic)
