/// @description Used for initialization

// Inherit the parent event
event_inherited();

// set message to display cost of explosives
if !disabled
	myMessage += " (" + string(obj_gameManager.fireCost) + " AP)"
else
	myMessage += " (--)"