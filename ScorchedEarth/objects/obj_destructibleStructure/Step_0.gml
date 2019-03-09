/// @description Called once per frame

// if structure is on fire, update fire animation
if fireStrength > 0
{
	// if flame sub image counter exceeds max
	if fireFrameCounter >= subImageFrames
	{
		// increment current sub image of flame animation and wrap oop if necessary
		currSubImage++
		if currSubImage > fireAnimationLength - 1
			currSubImage = 0

		// reset counter
		fireFrameCounter = 0
	}
	
	// increment fire animation counter
	fireFrameCounter++
	
	// if fire spread counter exceeds max
	if fireSpreadCounter >= framesToSpreadFire
	{
		// spread fire to neighboring structures
		for (var i = 0; i < instance_number(obj_destructibleStructure); i++)
		{
			var structure = instance_find(obj_destructibleStructure, i)
			
			// if destructible structure isn't this structure and is within certain range
			if (structure != id and 
			distance_to_point(structure.x, structure.y) <= obj_gameManager.fireSpreadRadius)
			{
				// set fire to it if structure isn't flammable or currently on fire
				if structure.isFlammable and structure.fireStrength == 0
					structure.fireStrength = fireStrength - 1
					
				// if not already playing, play "fire spread" noise
				if !audio_is_playing(sfx_fireSpread)
					audio_play_sound(sfx_fireSpread, 5, false)
			}
		}
		
		// destroy self (structure has burned down)
		instance_destroy(id)
	}
	
	// increment fire spread counter
	fireSpreadCounter++
}