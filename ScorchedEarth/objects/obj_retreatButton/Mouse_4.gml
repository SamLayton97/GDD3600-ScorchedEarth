/// @description When user clicks on button

// if button isn't disabled (cannot retreat after retreating)
if !disabled
{
	// Inherit the parent event
	event_inherited();

	// disable selection of new weapons
	obj_explosivesSelectButton.disabled = true
	obj_fireSelectButton.disabled = true

	// if invasion has not already started, do so now
	obj_invasionManager.invasionCounter = obj_invasionManager.framesToInvasion
	
	// disable button
	disabled = true
	sprite_index = myDisabledSprite
}