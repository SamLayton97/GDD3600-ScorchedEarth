/// @description Draws on layer of this object

draw_self()

// set font and alignment of text
draw_set_font(myConditionsFont)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

// draw location, weather conditions, time, and date
var drawX = x - (sprite_width / 5) - 20
var drawY = y - (sprite_height / 2) + 40
draw_text_color(drawX, drawY, levelLocation, c_white, c_white, c_white, c_white, 1)
draw_text_color(drawX, drawY + 20, "Conditions: " + weatherConditions, c_white, c_white, c_white, c_white, 1)
draw_text_color(drawX, drawY + 40, levelTime + " - " + levelDate, c_white, c_white, c_white, c_white, 1)

// set font and alignment of quota text
draw_set_font(myQuotaFont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// draw quota player must reach to pass
var quotaDrawX = x + (sprite_width / 3) + 10
var quotaDrawY = y + (sprite_height / 2) - 70
draw_text_color(quotaDrawX, quotaDrawY, "Scorched Earth", c_white, c_white, c_white, c_white, 1)
draw_text_color(quotaDrawX, quotaDrawY + 30, "Quota: " + string(obj_gameManager.passThreshold) + "%",
	c_white, c_white, c_white, c_white, 1)