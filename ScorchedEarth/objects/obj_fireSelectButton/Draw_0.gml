/// @description Draw onto layer of object

// set font and alignment of button's text
draw_set_font(myFont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// if button is disabled, draw 'grayed out text
if disabled 
{
	// draw self and message to screen
	draw_self()
	draw_text_color(x, y, myMessage, c_dkgray, c_dkgray, c_dkgray, c_dkgray, 1)
}
// otherwise, draw text like standard button
else
{
	// draw self and message to screen
	draw_self()
	if !(mousedOver or equipped)
		draw_text_color(x, y, myMessage, c_white, c_white, c_white, c_white, 1)
	else
		draw_text_color(x, y, myMessage, c_navy, c_navy, c_navy, c_navy, 1)
}
