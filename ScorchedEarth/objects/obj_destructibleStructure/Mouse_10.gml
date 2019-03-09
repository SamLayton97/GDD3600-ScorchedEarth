/// @description When user mouses over object

// tell structure name box to display this structure's name
obj_structureNameBox.structureToDisplay = id

// play highlight sound
audio_play_sound(sfx_highlightStructure, 3, false)

// if enemy hasn't captured structure
if !isCaptured
{
	// swap sprite to 'highlighted' version
	if sprite_index != myHighlightedSprite
		sprite_index = myHighlightedSprite
}