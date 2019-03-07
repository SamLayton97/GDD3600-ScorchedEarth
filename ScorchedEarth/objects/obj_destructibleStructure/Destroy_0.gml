/// @description When object is destroyed

// if structure was a building (resources >= 5), spawn rubble where structure was destroyed
if resourceValue >= 5
	instance_create_layer(x, y, "DestructibleStructures", obj_rubble)