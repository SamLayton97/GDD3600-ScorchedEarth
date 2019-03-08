/// @description Used for initialization

// Inherit the parent event
event_inherited();

// initialize equipped flag
equipped = true

// set message to display cost of explosives
if !disabled
	myMessage += " (" + string(obj_gameManager.fireCost) + " AP)"
else
	myMessage += " (--)"