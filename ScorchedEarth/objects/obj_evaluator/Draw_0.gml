/// @description Draws information to layer of this object

// draw background panel
draw_self()

// set font and text alignment for quota information
draw_set_font(myFont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)

// draw resources destroyed, structures destroyed, and scorched earth fullfillment percentage
var quotaDrawX = x
var quotaDrawY = y - (sprite_height / 2) + 125
draw_text_color(quotaDrawX, quotaDrawY, 
	"Resources Destroyed: " + string(resourcesDestroyed) + "/" + string(totalResources),
	c_white, c_white, c_white, c_white, 1)
draw_text_color(quotaDrawX, quotaDrawY + 30,
	"Structures Destroyed: " + string(structuresDestroyed) + "/" + string(totalStructures),
	c_white, c_white, c_white, c_white, 1)
draw_text_color(quotaDrawX - 25, quotaDrawY + 90, "Scorched Earth Quota ...", 
	c_white, c_white, c_white, c_white, 1)
draw_text_transformed_color(quotaDrawX, quotaDrawY + 120, string(finalPercentage) + "%", 1.1, 1.1, 0,
	c_white, c_white, c_white, c_white, 1)
draw_text_color(quotaDrawX + 60, quotaDrawY + 150, "... fulfilled.",
	c_white, c_white, c_white, c_white, 1)