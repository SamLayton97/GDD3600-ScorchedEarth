/// @description Draws on layer of this object

draw_self()

// set font and alignment of text
draw_set_font(myFont)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)

// draw location, weather conditions, time, and date
var drawX = x - (sprite_width / 5) - 20
var drawY = y - (sprite_height / 2) + 40
draw_text_color(drawX, drawY, levelLocation, c_white, c_white, c_white, c_white, 1)
draw_text_color(drawX, drawY + 20, "Conditions: " + weatherConditions, c_white, c_white, c_white, c_white, 1)
draw_text_color(drawX, drawY + 40, levelTime + " - " + levelDate, c_white, c_white, c_white, c_white, 1)