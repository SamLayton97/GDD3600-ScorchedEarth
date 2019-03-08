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
structuresDestroyed = 0

// initialize efficiency variables
finalPlayerAP = -1
finalInvasionProgress = -1

// create list of structures on board
structures = ds_list_create()