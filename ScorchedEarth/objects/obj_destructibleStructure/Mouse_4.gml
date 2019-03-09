/// @description When user clicks on this structure

// if enemy has not seized structure and player hasn't retreated
if !isCaptured and !obj_gameManager.playerRetreated
{
	// if player has molotovs equipped
	if obj_gameManager.currLeftPressWeapon == LeftPressWeapon.molotov
	{
		// if structure is flammable, isn't on fire, and player has AP to spend on a new fire
		if isFlammable and fireStrength == 0 and obj_gameManager.currAP >= obj_gameManager.fireCost
		{
			// set fire (of maximum strength) to structure
			fireStrength = obj_gameManager.maxFireStrength
	
			// deduct AP from player's count
			obj_gameManager.currAP -= obj_gameManager.fireCost
			
			// play 'set fire' sound effect
			audio_play_sound(sfx_setFire, 10, false)
		}
		// otherwise, play denied sound
		else
			audio_play_sound(sfx_denied, 10, false)
	}
	// otherwise (dynamite equipped as left-press weapon)
	else
	{
		// if player has AP to spend on dynamite
		if obj_gameManager.currAP >= obj_gameManager.explosivesCost
		{
			// deduct AP from player's count
			obj_gameManager.currAP -= obj_gameManager.explosivesCost
			
			// play 'explosion' sound effect
			audio_play_sound(sfx_dynamiteExploding, 10, false)
			
			// instantly destroy structure
			instance_destroy(id)
		}
		// otherwise (insufficient funds), play denied sound
		else
			audio_play_sound(sfx_denied, 10, false)
		
	}
}