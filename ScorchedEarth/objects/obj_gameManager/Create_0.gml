/// @description Used for initialization

// initialize weapon placement variables
currAP = startingAP
playerRetreated = false
currLeftPressWeapon = LeftPressWeapon.molotov

// initialize state of level
currPhase = InvasionPhase.preInvasion

// initialize resource tracking variables
resourcesDestroyed = 0
totalResources = 0
totalStructures = 0

// initialize efficiency variables
finalPlayerAP = -1
finalInvasionProgress = -1

// create lists of remaining and destroyed structures
structures = ds_list_create()
destroyedStructureNames = ds_list_create()
destroyedStructureSprites = ds_list_create()
destroyedStructureValues = ds_list_create()