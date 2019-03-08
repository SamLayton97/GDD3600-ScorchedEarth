/// @description When user clicks on button

// if button isn't disabled (cannot retreat after retreating)
if !disabled
{
	// Inherit the parent event
	event_inherited();

	// TODO: lock player out of starting new fires/explosives

	// if invasion has not already started, do so now
	obj_invasionManager.invasionCounter = obj_invasionManager.framesToInvasion
	
	// disable button
	disabled = true
	sprite_index = myDisabledSprite
}