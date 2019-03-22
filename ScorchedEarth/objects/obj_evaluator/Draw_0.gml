/// @description Draws information to layer of this object

// draw background panel
draw_self()

// set font and text alignment for quota information
draw_set_font(myFont)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)

// calculate initial coordinates to draw performance info
var quotaDrawX = x
var quotaDrawY = y - (sprite_height / 2) + 140

// rank player's performance w/ number of stars
for (var i = 0; i < 3; i++)
{
	var currStar = ds_list_find_value(performanceStars, i)
	draw_sprite(currStar, 0, quotaDrawX - 96 + (96 * i), quotaDrawY)
}

// draw number of resources and structures destroyed
draw_text_color(quotaDrawX, quotaDrawY + 60, 
	"Resources: " + string(resourcesDestroyed) + "/" + string(totalResources) + 
	" Structures: " + string(structuresDestroyed) + "/" + string(totalStructures),
	c_white, c_white, c_white, c_white, 1)
	
// draw final percentage and score
draw_set_font(myLargeFont)
draw_text_color(quotaDrawX, quotaDrawY + 100, "Total Destruction: " + string(finalPercentage) + "%",
	c_white, c_white, c_white, c_white, 1)
draw_text_color(quotaDrawX, quotaDrawY + 130, "Final Score: " + string(finalScore),
	c_white, c_white, c_white, c_white, 1)
	
// draw top 3 destroyed structures
draw_set_font(myFont)
draw_text_color(quotaDrawX - 140, quotaDrawY + 180, "-Top Destroyed-", 
	c_white, c_white, c_white, c_white, 1)
for (var i = 0; i < ds_list_size(mostValuableDestroyedSprites); i++)
{
	var currStructureSprite = ds_list_find_value(mostValuableDestroyedSprites, i)
	draw_sprite(currStructureSprite, 0, quotaDrawX - 224 + (i * 80), quotaDrawY + 230)
}

// draw top 3 captured structures
draw_text_color(quotaDrawX + 140, quotaDrawY + 180, "-Top Captured-",
	c_white, c_white, c_white, c_white, 1)
for (var i = 0; i < ds_list_size(mostValuableCaptured); i++)
{
	var currStructure = ds_list_find_value(mostValuableCaptured, i)
	draw_sprite(currStructure, 0, quotaDrawX + 224 - (i * 80), quotaDrawY + 230)
}

// draw tip to improve player's performance in subsequent levels
//draw_text_color(quotaDrawX, quotaDrawY + 300, "Tip: " + performanceTip, 
//	c_white, c_white, c_white, c_white, 1)
draw_text_ext_color(quotaDrawX, quotaDrawY + 310, "Tip: " + performanceTip,
	tipStringHeight * 1.4, sprite_width * 0.8, c_white, c_white, c_white, c_white, 1)