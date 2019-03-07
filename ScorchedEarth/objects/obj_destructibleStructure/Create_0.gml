/// @description Used for initialization

// initialize non-customizable helper variables
fireStrength = 0

// add structure and its resource value to game manager
obj_gameManager.totalResources += resourceValue
ds_list_add(obj_gameManager.structures, id)

// create list to store neighboring structures
nearbyStructures = ds_list_create()