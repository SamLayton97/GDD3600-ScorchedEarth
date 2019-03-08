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

// calculate player's score (accounts for their efficiency)
var unusedAPRatio = obj_gameManager.finalPlayerAP / obj_gameManager.startingAP
var unusedTimeRatio = obj_gameManager.finalInvasionProgress / 100
finalScore = round(finalPercentage * (1 + unusedAPRatio) * (1 + unusedTimeRatio) * 100)

// copy over remaining structures from GM
var remainingStructures = ds_list_create()
ds_list_copy(remainingStructures, obj_gameManager.structures)

// find 3 most valuable captured structures
mostValuableStructures = ds_list_create()
for (var i = 0; i < 3; i++)
{
	// define variables to track most valuable structure
	var highestValue = 0
	var highestValueIndex = 0
	
	// search remaining structures for highest value
	for (var j = 0; j < ds_list_size(remainingStructures); j++)
	{
		var currStructure = ds_list_find_value(remainingStructures, j)
		
		// if current structure has higher value than current highest, update highest
		if currStructure.resourceValue > highestValue
		{
			highestValue = currStructure.resourceValue
			highestValueIndex = j
		}
	}
	
	// if highest value structure wasn't nothing
	if highestValue > 0 and highestValueIndex != -1
	{
		// remove structure from remaining list and add to top 3
		var valuableStructure = ds_list_find_value(remainingStructures, highestValueIndex)
		ds_list_add(mostValuableStructures, valuableStructure)
		ds_list_delete(remainingStructures, highestValueIndex)
	}
}

// if player meets 'scorched earth' quota
if finalPercentage >= passThreshold
{
	// set sprite to reflect positive outcome
	sprite_index = missionSuccessSprite
}
// otherwise (player failed)
else
{
	// set sprite to reflect negative outcome
	sprite_index = missionFailedSprite
}