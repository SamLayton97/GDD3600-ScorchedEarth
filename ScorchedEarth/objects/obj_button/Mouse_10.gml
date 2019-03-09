/// @description When user mouses over button

// swap sprite for highlighted version
if sprite_index != myHighlightedSprite
{
	sprite_index = myHighlightedSprite
	mousedOver = true
}

// play button highlight noise
audio_play_sound(myHighlightNoise, 4, false)