/// @description When user clicks on button

// if button isn't disabled
if !disabled
{
	// Inherit the parent event
	event_inherited();

	// set left-press weapon to molotovs
	obj_gameManager.currLeftPressWeapon = LeftPressWeapon.molotov
}
// otherwise, play denied sound
else
	audio_play_sound(sfx_denied, 4, false)