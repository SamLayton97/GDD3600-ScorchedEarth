/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// depending on current room, proceed to next in succession of levels
if room == rm_Fields
	room_goto(rm_Farm)
else if room == rm_Farm
	room_goto(rm_townOutskirts)