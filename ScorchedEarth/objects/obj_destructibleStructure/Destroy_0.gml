/// @description When object is destroyed

// if structure had any resource value
if resourceValue > 0
{
	with obj_gameManager
	{
		// add resources to total number of resources destroyed
		resourcesDestroyed += other.resourceValue
		
		// remove self from list of valuable remaining structures
		structureIndex = ds_list_find_index(structures, other)
		ds_list_delete(structures, structureIndex)
		
		// add structure info to destroyed structure lists
		ds_list_add(destroyedStructureNames, other.myName)
		ds_list_add(destroyedStructureSprites, other.mySprite)
		ds_list_add(destroyedStructureValues, other.resourceValue)
	}
}

// if structure was a building (resources >= 5), spawn rubble where structure was destroyed
if resourceValue >= 5
{
	// spawn rubble
	instance_create_layer(x, y, "MiscellaneousGroundObjects", obj_rubble)
	
	// play "structure destroyed" sound effect -- indicates structure was an important asset
	audio_play_sound(sfx_structureDestroyed, 5, false)
}
	
// stop displaying structures name
if obj_structureNameBox.structureToDisplay == id
	obj_structureNameBox.structureToDisplay = noone