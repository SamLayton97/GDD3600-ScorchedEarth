/// @description Used for initialization

// initialize non-customizable helper variables
fireValue = 0
isMousedOver = false

// add structure and its resource value to game manager
obj_gameManager.totalResources += resourceValue
ds_list_add(obj_gameManager.structures, id)