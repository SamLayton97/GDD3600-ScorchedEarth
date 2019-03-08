/// @description Used for initialization

// calculate quality of player's scorched earth implementation (Resource Percentage)
resourcesDestroyed = obj_gameManager.resourcesDestroyed
totalResources = obj_gameManager.totalResources
var resourcePercentage = (resourcesDestroyed / totalResources) * 100

// calculate quantity of player's scorched earth implementation (Destruction Percentage)
totalStructures = obj_gameManager.totalStructures
structuresDestroyed = totalStructures - ds_list_size(obj_gameManager.structures)
var destructionPercentage = structuresDestroyed / totalStructures * 100

// calculate final percentage (average of RP and DP; determines whether player can progress)
finalPercentage = (resourcePercentage + destructionPercentage) / 2