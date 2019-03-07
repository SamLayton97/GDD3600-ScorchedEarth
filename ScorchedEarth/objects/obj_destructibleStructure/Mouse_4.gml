/// @description When user clicks on this structure

// if structure is flammable, isn't on fire, and player has AP to spend on a new fire
if isFlammable and fireStrength == 0 and obj_gameManager.currAP >= obj_gameManager.fireAPCost
{
	// set fire (of maximum strength) to structure
	fireStrength = obj_gameManager.maxFireStrength
}