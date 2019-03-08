/// @description Draws on same layer as object

draw_self()

// set font and alignment
draw_set_font(fnt_frontline)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// draw frontline text
draw_text_transformed_color(x - 30, y, "FRONTLINE", 1, 1, 90, c_red, c_red, c_red, c_red, 1)