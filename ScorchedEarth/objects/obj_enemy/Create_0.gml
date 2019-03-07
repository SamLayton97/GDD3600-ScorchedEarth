/// @description Used for initialization

// send enemy moving from left to right of screen
motion_set(0, mySpeed)

// determine point beyond right-screen to destroy self
endXPosition = window_get_width() + (sprite_get_width(mySprite) / 2)