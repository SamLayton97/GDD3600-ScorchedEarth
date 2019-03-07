/// @description When destructible structure collides with enemy

// if structure had any resource value and it isn't on fire, enemy 'captures' it
if resourceValue > 0 and fireStrength == 0
{
	isCaptured = true
	
	// swap sprite to 'captured' variant
	sprite_index = myCapturedSprite
}
// otherwise, destroy structure
else
	instance_destroy(id)