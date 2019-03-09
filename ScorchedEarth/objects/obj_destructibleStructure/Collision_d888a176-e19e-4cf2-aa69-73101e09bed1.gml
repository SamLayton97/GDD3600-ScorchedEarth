/// @description When destructible structure collides with enemy

// if structure had any resource value and it isn't on fire, enemy 'captures' it
if resourceValue > 0 and fireStrength == 0 and !isCaptured
{
	isCaptured = true
	
	// play capture sound
	audio_play_sound(sfx_enemyCapturesStructure, 3, false)
	
	// swap sprite to 'captured' variant
	sprite_index = myCapturedSprite
}