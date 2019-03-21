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

// copy over destroyed structures info from GM
var destroyedStructureNames = ds_list_create()
ds_list_copy(destroyedStructureNames, obj_gameManager.destroyedStructureNames)
var destroyedStructureSprites = ds_list_create()
ds_list_copy(destroyedStructureSprites, obj_gameManager.destroyedStructureSprites)
var destroyedStructureValues = ds_list_create()
ds_list_copy(destroyedStructureValues, obj_gameManager.destroyedStructureValues)

// find 3 most valuable destroyed structures
mostValuableDestroyedNames = ds_list_create()
mostValuableDestroyedSprites = ds_list_create()
for (var i = 0; i < 3; i++)
{
	// define variables to track most valuable structure
	var highestValue = 0
	var highestValueIndex = -1
	
	// search destroyed structures for highest resource value
	for (var j = 0; j < ds_list_size(destroyedStructureValues); j++)
	{
		var currValue = ds_list_find_value(destroyedStructureValues, j)
		
		// if current structure has higher value than current highest, update highest
		if currValue > highestValue
		{
			highestValue = currValue
			highestValueIndex = j
		}
	}
	
	// if search found structure of highest value
	if highestValue > 0 and highestValueIndex != -1
	{
		// retrieve name and sprite of best structure in search
		var topName = ds_list_find_value(destroyedStructureNames, highestValueIndex)
		var topSprite = ds_list_find_value(destroyedStructureSprites, highestValueIndex)
		
		// add structure's info to top 3 destroyed lists
		ds_list_add(mostValuableDestroyedNames, topName)
		ds_list_add(mostValuableDestroyedSprites, topSprite)
		
		// remove structure from destroyed structures lists
		ds_list_delete(destroyedStructureNames, highestValueIndex)
		ds_list_delete(destroyedStructureSprites, highestValueIndex)
		ds_list_delete(destroyedStructureValues, highestValueIndex)
	}
}

// copy over remaining structures from GM
var remainingStructures = ds_list_create()
ds_list_copy(remainingStructures, obj_gameManager.structures)

// find 3 most valuable captured structures
mostValuableCaptured = ds_list_create()
for (var i = 0; i < 3; i++)
{
	// define variables to track most valuable structure
	var highestValue = 0
	var highestValueIndex = -1
	
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
		ds_list_add(mostValuableCaptured, valuableStructure)
		ds_list_delete(remainingStructures, highestValueIndex)
	}
}

// play 'message received' sound
audio_play_sound(sfx_messageReceived, 10, false)

// if player meets 'scorched earth' quota
if finalPercentage >= obj_gameManager.passThreshold
{
	// set sprite to reflect positive outcome
	sprite_index = missionSuccessSprite
	
	// spawn both retry and proceed buttons
	instance_create_layer(x - 85, y + 225, "TopUILayer", obj_retryMissionButton)
	if room != rm_townOutskirts
		instance_create_layer(x + 85, y + 225, "TopUILayer", obj_nextMissionButton)
	else
		instance_create_layer(x + 85, y + 225, "TopUILayer", obj_returnToMenuButton)
	
	// play 'success' music
	audio_play_sound(msc_successBackground, 3, false)
}
// otherwise (player failed to meet quota)
else
{
	// set sprite to reflect negative outcome
	sprite_index = missionFailedSprite
	
	// spawn only the retry button
	instance_create_layer(x, y + 225, "TopUILayer", obj_retryMissionButton)
	
	// play 'failure' music
	audio_play_sound(msc_failureMusic, 3, false)
}

// determine player's rank (x/3 stars) based off their performance in level
performanceStars = ds_list_create()
if finalPercentage >= obj_gameManager.passThreshold
	ds_list_add(performanceStars, filledStarSprite)
else
	ds_list_add(performanceStars, unfilledStarSprite)
if finalPercentage >= obj_gameManager.aboveAverageThreshold
	ds_list_add(performanceStars, filledStarSprite)
else
	ds_list_add(performanceStars, unfilledStarSprite)
if finalPercentage >= obj_gameManager.excellenceThreshold
	ds_list_add(performanceStars, filledStarSprite)
else
	ds_list_add(performanceStars, unfilledStarSprite)
