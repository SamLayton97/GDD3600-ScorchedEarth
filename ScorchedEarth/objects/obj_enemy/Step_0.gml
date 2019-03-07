/// @description Called once per frame

// if enemy passes beyond right side of battlefield, destroy it
if x >= endXPosition
	instance_destroy(id)