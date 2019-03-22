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
	// retrieve current level index and chapter length from GM
	var levelIndex = obj_gameManager.levelIndex
	var chapterLength = obj_gameManager.chapterLength
	
	// set sprite to reflect positive outcome
	sprite_index = missionSuccessSprite
	
	// calculate player's performance-excellency ratio for current level and across chapter so far
	var levelPerformanceExcellency = finalPercentage / obj_gameManager.excellenceThreshold
	if global.PlayerExcellenceRatio == 0
		global.PlayerExcellenceRatio = levelPerformanceExcellency
	else
		global.PlayerExcellenceRatio = (levelPerformanceExcellency + global.PlayerExcellenceRatio) / 2

	// if player beat last level in chapter
	if levelIndex + 1 == chapterLength
	{
		// spawn both retry and next chapter buttons
		instance_create_layer(x - 85, y + 240, "TopUILayer", obj_retryMissionButton)
		if room != rm_armsDepot
			instance_create_layer(x + 85, y + 240, "TopUILayer", obj_nextChapterButton)
		else
			instance_create_layer(x + 85, y + 240, "TopUILayer", obj_returnToMenuButton)
	}
	// if player is now past 3rd level in chapter and has necessary excellence ratio
	else if levelIndex >= 2 and global.PlayerExcellenceRatio >= 1 - ((levelIndex - 1.2) / 10)
	{
		// spawn retry, proceed, and next chapter buttons
		instance_create_layer(x - 170, y + 240, "TopUILayer", obj_retryMissionButton)
		instance_create_layer(x, y + 240, "TopUILayer", obj_nextMissionButton)
		instance_create_layer(x + 170, y + 240, "TopUILayer", obj_nextChapterButton)
	}
	// otherwise (player beat level but hasn't proven mastery of technique)
	else
	{
		// spawn both retry and proceed buttons
		instance_create_layer(x - 85, y + 240, "TopUILayer", obj_retryMissionButton)
		instance_create_layer(x + 85, y + 240, "TopUILayer", obj_nextMissionButton)
	}
	
	// play 'success' music
	audio_play_sound(msc_successBackground, 3, false)
}
// otherwise (player failed to meet quota)
else
{
	// set sprite to reflect negative outcome
	sprite_index = missionFailedSprite
	
	// spawn only the retry button
	instance_create_layer(x, y + 240, "TopUILayer", obj_retryMissionButton)
	
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

// Determine which tip to give players through a decision tree
performanceTip = ""

// if player met passing threshold
if finalPercentage >= obj_gameManager.passThreshold
{
	// if player met above-average threshold
	if finalPercentage >= obj_gameManager.aboveAverageThreshold
	{
		// if player met excellence threshold
		if finalPercentage >= obj_gameManager.excellenceThreshold
		{
			// set tip for excellent player
			performanceTip = "None. Glory to the Motherland!"
		}
		// otherwise (player is just above average)
		else
		{
			// randomly choose 1 of 2 tips for above-average player
			randomize()
			var randAATip = random_range(0, 1)
			if randAATip >= .5
				performanceTip = "Fires can spread in all directions. Start them in the middle of groups of structures."
			else
				performanceTip = "The dryer the conditions, the farther fire will spread."
		}
	}
	// otherwise (player is merely passing)
	else
	{
		// if player has destroyed less than 50% of structures
		if destructionPercentage < 50
		{
			// set tip to clarify spreading of fire
			performanceTip = "Fire spreads, eventually destroying more than its initial target."
		}
		// otherwise (player destroyed more than 50% of structures)
		else
		{
			// randomly choose 1 of 2 tips for passing player
			randomize()
			var randPTip = random_range(0, 1)
			if randPTip >= .5
				performanceTip = "Bigger buildings tend to house more resources than small homes."
			else
				performanceTip = "The enemy covets buildings storing food, machinery, and weapons."
		}
	}
}
// otherwise (player failed to meet pass threshold)
else
{
	// if player has access to explosives
	if obj_gameManager.allowExplosives
	{
		// determine if any of top 3 captured buildings were inflammable
		var inflammableAmongTop3 = false
		for (var i = 0; i < ds_list_size(mostValuableCaptured); i++)
		{
			var currStructure = ds_list_find_value(mostValuableCaptured, i)
			if !currStructure.isFlammable
				inflammableAmongTop3 = true
		}
		
		// if inflammable building was among top 3 structures
		if inflammableAmongTop3
		{
			// set tip to remind players how to destroy inflammable buildings
			performanceTip = "Concrete buildings, like bunkers, are inflammable and require explosives to destroy."
		}
		// otherwise (all top 3 captured were flammable)
		else
		{
			performanceTip = "Explosives won't start raging fires."
		}
	}
	// otherwise (player does not yet have access to explosives)
	else
	{
		// if player has destroyed more than 25% of structures
		if destructionPercentage > 25
		{
			// if player has destroyed less than 30% of resources
			if resourcePercentage < 30
			{
				// set tip to remind players to prioritize man-made things
				performanceTip = "Man-made structures hold resources for the enemy to co-opt while plants do not."
			}
			// otherwise (player's scorched earth had some depth)
			else
			{
				// set tip to remind players that fire spreads
				performanceTip = "Fire will spread from flammable structure to flammable structure."
			}
		}
		// otherwise (player's scorched earth lacked any breadth)
		else
		{
			// if the player retreated from battle
			if obj_gameManager.finalInvasionProgress < 100
			{
				// set tip to remind players that they destroy anything more after retreating
				performanceTip = "After retreating, you cannot throw more molotovs or plant more explosives."
			}
			// otherwise (player stuck it to the end)
			else
			{
				// set tip to remind players of enemy's quick advance
				performanceTip = "The enemy approaches quickly. Act on your instincts and destroy what you feel is most important."
			}
		}
	}
}

// save height of performance tip string
tipStringHeight = string_height(performanceTip)