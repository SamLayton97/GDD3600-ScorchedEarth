/// @description Used for initialization

// initialize non-customizable helper variables
fireStrength = 0

// add structure and its resource value to game manager
obj_gameManager.totalResources += resourceValue
ds_list_add(obj_gameManager.structures, id)

// create list to store neighboring structures
nearbyStructures = ds_list_create()

// initialize fire animation variables
fireAnimationLength = sprite_get_number(fireAnimation)
subImageFrames = flameAnimationTime * (room_speed / fireAnimationLength)
currSubImage = 0
fireFrameCounter = 0
fireAnimWidth = sprite_get_width(spr_structureFire)
fireAnimHeight = sprite_get_height(spr_structureFire)

// initialize fire propagation variables
framesToSpreadFire = room_speed * obj_gameManager.fireSpreadTime
fireSpreadCounter = 0