/// @description Used for initialization

// Inherit the parent event
event_inherited();

// if room does not introduce or include inflammable structures, disable button
if !obj_gameManager.allowExplosives
{
	disabled = true
	sprite_index = myDisabledSprite
}

// set message to display cost of explosives
if !disabled
	myMessage += " (" + string(obj_gameManager.explosivesCost) + " AP)"
else
	myMessage += " (--)"