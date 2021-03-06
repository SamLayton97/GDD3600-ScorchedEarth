/// @description Called once per frame

// if invasion counter exceeds max and invasion has not yet spawned
if invasionCounter >= framesToInvasion and obj_gameManager.currPhase == InvasionPhase.preInvasion
{
	// start invasion phase
	obj_gameManager.currPhase = InvasionPhase.invasion
	
	// play invasion sound
	audio_play_sound(sfx_invasionBegins, 5, false)
	
	// spawn in 7 random units in V formation
	for (var i = 0; i < 7; i++)
	{
		// if it exists, destroy frontline demarcation line
		if instance_exists(obj_frontline)
			instance_destroy(obj_frontline)
		
		// randomize what enemy to spawn
		randomize()
		var spawnValue = random_range(0, 1)
		
		// determine x and y position to spawn enemy
		var spawnY = firstEnemyY + enemySpawnYSpacing * i
		var spawnX =  0 - enemySpawnXSpacing / 2 - (enemySpawnYSpacing * abs(i - 3))
		
		// spawn enemy according to generated value
		if spawnValue >= 1 - mechanizedSpawnChance
			instance_create_layer(spawnX, spawnY, "Enemies", obj_mechanizedInfantry)
		else
			instance_create_layer(spawnX, spawnY, "Enemies", obj_infantry)
	}
}

// if game is still in pre-invasion phase and no UI messages exist, increment invasion counter
if obj_gameManager.currPhase == InvasionPhase.preInvasion and !instance_exists(obj_UIMessage)
	invasionCounter++
	
// if invasion has begun and no enemies remain (passed over map), end invasion phase
if obj_gameManager.currPhase == InvasionPhase.invasion and !instance_exists(obj_enemy)
{
	// set invasion phase to post-invasion
	obj_gameManager.currPhase = InvasionPhase.postInvasion
	
	// if final player AP hasn't been set, send evaluator final AP
	if obj_gameManager.finalPlayerAP == -1
		obj_gameManager.finalPlayerAP = obj_gameManager.currAP
	
	// if invasion progress percent hasn't been set, send evaluator invasion progress (at time of retreating)
	if obj_gameManager.finalInvasionProgress == -1
		obj_gameManager.finalInvasionProgress = 100
		
	// spawn evaluator to rate player's performance
	instance_create_layer(window_get_width() / 2, window_get_height() / 2, "UpperUILayer", obj_evaluator)
}