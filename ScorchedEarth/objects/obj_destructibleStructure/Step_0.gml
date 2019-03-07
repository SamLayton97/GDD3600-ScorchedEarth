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
		// find destructible structures within fire propagation range
		with(obj_destructibleStructure)
		{
			// if destructible structure isn't this structure and is within certain range, add it to list
			if id != other.id and distance_to_point(other.x, other.y) <= obj_gameManager.fireSpreadRadius
				ds_list_add(other.nearbyStructures, id)
		}
		
		// if list of nearby structures isn't empty, set fire to each strucure within it
		if !ds_list_empty(nearbyStructures)
		{
			for (var i=0; i <= ds_list_size(nearbyStructures); i++)
			{
				// set fire to structure (of fire strength one less than that of this structure)
				var structure = ds_list_find_value(nearbyStructures, i)
				if structure.isFlammable and structure.fireStrength == 0
					structure.fireStrength = fireStrength - 1
			}
		}
		
		// destroy self (structure has burned down)
		instance_destroy(id)
	}
	
	// increment fire spread counter
	fireSpreadCounter++
}