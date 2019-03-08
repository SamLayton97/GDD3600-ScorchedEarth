/// @description Called once per frame

// if button is disabled but sprite has not yet switched to disabled version, do so
if disabled and sprite_index != myDisabledSprite
	sprite_index = myDisabledSprite
	
// if player has equipped molotovs, set flag to true
if obj_gameManager.currLeftPressWeapon == LeftPressWeapon.dynamite
	equipped = true
else
	equipped = false
	
// change sprite according to equipped / moused over state
if (equipped or mousedOver) and sprite_index != myHighlightedSprite
	sprite_index = myHighlightedSprite
else if !(equipped or mousedOver) and sprite_index != myNormalSprite
	sprite_index = myNormalSprite