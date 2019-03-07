/// @description draws to layer object is on

// set font and alignment of button's text
draw_set_font(myFont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// draw self and message to screen
draw_self()
if !mousedOver
	draw_text_color(x, y, myMessage, c_white, c_white, c_white, c_white, 1)
else
	draw_text_color(x, y, myMessage, c_navy, c_navy, c_navy, c_navy, 1)