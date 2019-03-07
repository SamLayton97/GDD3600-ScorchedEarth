/// @description Called once per frame

// if invasion counter exceeds max and invasion has not yet spawned
if invasionCounter >= framesToInvasion and obj_gameManager.currPhase == InvasionPhase.preInvasion
{
	// start invasion phase
	obj_gameManager.currPhase = InvasionPhase.invasion
	
	// spawn in 7 random units in V formation
	for (var i = 0; i < 7; i++)
	{
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
// otherwise, increment counter
else
	invasionCounter++