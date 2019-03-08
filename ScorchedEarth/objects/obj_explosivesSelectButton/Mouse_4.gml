/// @description When user clicks on button

// if button isn't disabled
if !disabled
{
	// Inherit the parent event
	event_inherited();

	// set left-press weapon to molotovs
	obj_gameManager.currLeftPressWeapon = LeftPressWeapon.dynamite
}