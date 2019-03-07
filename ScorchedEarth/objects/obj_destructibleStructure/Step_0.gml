/// @description Called once per frame

// if structure is on fire, update fire animation
if fireStrength > 0
{
	// if flame sub image counter exceeds max
	if frameCounter >= subImageFrames
	{
		// increment current sub image of flame animation and wrap oop if necessary
		currSubImage++
		if currSubImage > fireAnimationLength - 1
			currSubImage = 0

		// reset counter
		frameCounter = 0
	}

	// increment counter
	frameCounter++
}