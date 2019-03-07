/// @description Draws sprites and info to object's layer

// draw own sprite
draw_self()

// set font and text alignment
draw_set_font(myFont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// set color of font according to player's remaining ap
var textColor = c_white
var apPercent = obj_gameManager.currAP / maxAP
if apPercent <= .2
	textColor = c_red
else if apPercent <= .5
	textColor = c_yellow
	
// draw player's remaining AP
draw_text_color(x, y - 20, string(obj_gameManager.currAP) + " AP", 
	textColor, textColor, textColor, textColor, 1)
draw_text_color(x, y + 20, "Remaining", textColor, textColor, textColor, textColor, 1)