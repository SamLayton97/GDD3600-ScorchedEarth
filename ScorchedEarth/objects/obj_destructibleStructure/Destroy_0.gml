/// @description When object is destroyed

// if structure had any resource value
if resourceValue > 0
{
	// add resources to total number of resources destroyed and remove self from list of valuable structures
	with obj_gameManager
	{
		resourcesDestroyed += other.resourceValue
		structureIndex = ds_list_find_index(structures, other)
		ds_list_delete(structures, structureIndex)
	}
}

// if structure was a building (resources >= 5), spawn rubble where structure was destroyed
if resourceValue >= 5
	instance_create_layer(x, y, "DestructibleStructures", obj_rubble)
	
// stop displaying structures name
if obj_structureNameBox.structureToDisplay == id
	obj_structureNameBox.structureToDisplay = noone