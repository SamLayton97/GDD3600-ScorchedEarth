/// @description When user mouses over object

// tell structure name box to display this structure's name
obj_structureNameBox.structureToDisplay = id

// if enemy hasn't captured structure
if !isCaptured
{
	// swap sprite to 'highlighted' version
	if sprite_index != myHighlightedSprite
		sprite_index = myHighlightedSprite
}