/// @description Used for initialization

// Inherit the parent event
event_inherited();

// if player is in either fields or farm, disable this button (explosives not yet introduced)
//if room == rm_Fields
//{
//	disabled = true
//	sprite_index = myDisabledSprite
//}

// set message to display cost of explosives
if !disabled
	myMessage += " (" + string(obj_gameManager.explosivesCost) + " AP)"
else
	myMessage += " (--)"