/// @description Used for initialization

// set dryness of map according max fire strength (dryness)
var dryness = ""
var drynessScore = obj_gameManager.maxFireStrength
if drynessScore > 3
	dryness = "Very Dry"
else if drynessScore > 2
	dryness = "Dry"
else if drynessScore > 1
	dryness = "Wet"
else
	dryness = "Very Wet"
	
// set wind conditions of map according to fire spread rate
var windiness = ""
var windinessScore = obj_gameManager.fireSpreadTime
if windinessScore > 4
	windiness = "Calm"
else if windinessScore > 3
	windiness = "Slight Breeze"
else if windinessScore > 2
	windiness = "Windy"
else
	windiness = "Very Windy"
	
// set combined weather conditions
weatherConditions = dryness + ", " + windiness