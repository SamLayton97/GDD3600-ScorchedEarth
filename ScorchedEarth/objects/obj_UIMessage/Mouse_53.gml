/// @description When user clicks somewhere on-screen

// TODO: if playing, stop dialogue
if audio_is_playing(myDialogue)
	audio_stop_sound(myDialogue)

// play 'close' sound
audio_play_sound(sfx_denied, 4, false)

// destroy self
instance_destroy(id)