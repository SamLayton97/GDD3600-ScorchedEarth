/// @description Used for initialization

// initialize invasion spawn time variables
framesToInvasion = room_speed * invasionPrepTime
invasionCounter = 0

// initialize enemy spawning variables
firstEnemyY = 320
enemySpawnXSpacing = sprite_get_width(spr_infantry)
enemySpawnYSpacing = 64
enemySpriteWidth = sprite_get_width(spr_infantry)