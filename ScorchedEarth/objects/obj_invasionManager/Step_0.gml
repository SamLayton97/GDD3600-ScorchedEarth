/// @description Called once per frame

// if invasion counter exceeds max and invasion has not yet spawned
if invasionCounter >= framesToInvasion and obj_gameManager.currPhase == InvasionPhase.preInvasion
{
	// start invasion phase
	obj_gameManager.currPhase = InvasionPhase.invasion
	
	// spawn in 7 random units in V formation
	for (var i = 0; i < 7; i++)
	{
		instance_create_layer(0, firstEnemyX + enemySpawnSpacing * i, "Enemies", obj_infantry)
	}
}
// otherwise, increment counter
else
	invasionCounter++