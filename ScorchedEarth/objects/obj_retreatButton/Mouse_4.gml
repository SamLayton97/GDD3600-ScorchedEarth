/// @description When user clicks on button

// if button isn't disabled (cannot retreat after retreating)
if !disabled
{
	// Inherit the parent event
	event_inherited();
	
	// if final player AP hasn't been set, send evaluator final AP
	if obj_evaluationManager.endPlayerAP == -1
		obj_evaluationManager.endPlayerAP = obj_gameManager.currAP
	
	// if invasion progress percent hasn't been set, send evaluator invasion progress (at time of retreating)
	if obj_evaluationManager.endInvasionProgressPercent == -1
		obj_evaluationManager.endInvasionProgressPercent = 
			(obj_invasionManager.invasionCounter / obj_invasionManager.framesToInvasion) * 100
	
	// disable selection of new weapons
	obj_explosivesSelectButton.disabled = true
	obj_fireSelectButton.disabled = true
	
	// disable placement of new fires or explosives
	obj_gameManager.playerRetreated = true
	
	// if invasion has not already started, do so now
	obj_invasionManager.invasionCounter = obj_invasionManager.framesToInvasion
	
	// disable button
	disabled = true
	sprite_index = myDisabledSprite
}