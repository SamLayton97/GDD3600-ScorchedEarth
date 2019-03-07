/// @description Draws on object's layer

draw_self()

// if user mouses over object, draw structures name
if isMousedOver
{
	// draw structure name textbox at user's mouse position
	draw_sprite(spr_structureNameBackground, 0, mouse_x, mouse_y)
	
	// set font and alignment of text
	draw_set_font(fnt_structureName)
	draw_set_halign(fa_left)
	draw_set_valign(fa_bottom)
	
	// draw structure's name at user's mouse position
	draw_text_color(mouse_x, mouse_y, myName, c_lime, c_lime, c_lime, c_lime, 1)
	
}