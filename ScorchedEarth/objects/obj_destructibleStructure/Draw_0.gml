/// @description Draws sprites and other info to this object's layer

draw_self()

// if structure is on fire, draw fire animation above self
if fireStrength > 0
{
	// draw sprite scaled to strength of fire
	//draw_sprite(fireAnimation, currSubImage, x, y)
	draw_sprite_stretched(fireAnimation, currSubImage, x - fireAnimWidth / 2, y - fireAnimHeight / 2, 
		fireAnimWidth, fireAnimHeight)
}