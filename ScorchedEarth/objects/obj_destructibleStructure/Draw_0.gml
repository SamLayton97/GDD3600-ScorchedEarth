/// @description Draws sprites and other info to this object's layer

draw_self()

// if structure is on fire, draw fire animation above self
if fireStrength > 0
{
	// scale fire animation's width and height to match structure's fire strength
	var newAnimWidth = fireAnimWidth * sqrt(fireStrength / obj_gameManager.maxFireStrength)
	var newAnimHeight = fireAnimHeight * sqrt(fireStrength / obj_gameManager.maxFireStrength)
	
	// draw fire animation at structure's position
	var fireDrawX = x - newAnimWidth / 2
	var fireDrawY = y - newAnimHeight / 2
	draw_sprite_stretched(fireAnimation, currSubImage, fireDrawX, fireDrawY, newAnimWidth, newAnimHeight)
}