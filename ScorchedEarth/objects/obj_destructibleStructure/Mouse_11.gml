/// @description When user's mouse leaves object's collider

// tell structure name box to stop drawing this structure's name
if obj_structureNameBox.structureToDisplay == id
	obj_structureNameBox.structureToDisplay = noone

// swap sprite back to normal sprite
if sprite_index != mySprite
	sprite_index = mySprite