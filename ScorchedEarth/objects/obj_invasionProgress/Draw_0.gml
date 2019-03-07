/// @description Draw info to layer of this object

draw_self()

// set font and alignment of text
draw_set_font(myFont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)

// draw "Invasion Progress" text
draw_text_color(x, y - 35, "Invasion", c_white, c_white, c_white, c_white, 1)
draw_text_color(x, y - 5, "Progress", c_white, c_white, c_white, c_white, 1)

// draw bar representing time until invasion arrives
var invasionPercentage = (obj_invasionManager.invasionCounter / obj_invasionManager.framesToInvasion) * 100
draw_healthbar(x - sprite_width / 2 + 15, y + 20, x + sprite_width / 2 - 15, y + sprite_height / 2 - 15,
	invasionPercentage, c_navy, c_white, c_red, 0, true, true)