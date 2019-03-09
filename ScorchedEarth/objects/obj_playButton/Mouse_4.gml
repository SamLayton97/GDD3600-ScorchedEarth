/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// if playing, stop title music
if audio_is_playing(msc_titleBackground)
	audio_stop_sound(msc_titleBackground)

// go to first level
room_goto(rm_Fields)