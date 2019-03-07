/// @description Used for initialization

// initialize player's current AP
currAP = startingAP

// initialize resource and score tracking variables
resourcesDestroyed = 0
totalResources = 0
structuresDestroyed = 0

// create list of structures on board
structures = ds_list_create()