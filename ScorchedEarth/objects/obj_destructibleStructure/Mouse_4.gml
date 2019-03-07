/// @description When user clicks on this structure

// if enemy has not seized structure
if !isCaptured
{
	// if structure is flammable, isn't on fire, and player has AP to spend on a new fire
	if isFlammable and fireStrength == 0 and obj_gameManager.currAP >= obj_gameManager.fireCost
	{
		// set fire (of maximum strength) to structure
		fireStrength = obj_gameManager.maxFireStrength
	
		// deduct AP from player's count
		obj_gameManager.currAP -= obj_gameManager.fireCost
	}
}