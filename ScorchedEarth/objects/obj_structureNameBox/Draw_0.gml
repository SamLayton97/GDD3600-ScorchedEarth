/// @description Draws name textbox and current structure's name

// if textbox is over a structure to display name of
if showName
{
	// set font and alignment of textbox
	draw_set_font(fnt_structureName)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	
	// calculate string name height and width and calculate position to draw textbox
	var nameWidth = string_width(nameToDisplay)
	var nameHeight = string_height(nameToDisplay)
	var drawX = mouse_x + xOffset
	var drawY = mouse_y + yOffset
	
	// draw textbox background (scaled to fit structure's name)
	draw_sprite_stretched(textboxSprite, 0, drawX, drawY, nameWidth + (textboxStretchOffset * 2), 
		nameHeight + (textboxStretchOffset * 2))
		
	// draw name of structure
	draw_text_color(drawX + (nameWidth / 2) + textboxStretchOffset, drawY + nameHeight / 2 + textboxStretchOffset, 
		nameToDisplay, c_lime, c_lime, c_lime, c_lime, 1)
}