/// @description Draws sprites and other info to this object's layer

draw_self()

// if structure is on fire, draw fire animation above self
if fireStrength > 0
{
	draw_sprite(fireAnimation, currSubImage, x, y)
}