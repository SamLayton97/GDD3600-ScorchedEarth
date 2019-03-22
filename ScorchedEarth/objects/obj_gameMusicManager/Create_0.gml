/// @description Used for initialization

// depending on current level, select background music
bgrMusic = noone
if room == rm_armsDepot
	bgrMusic = msc_finalLevelBackground
else
	bgrMusic = msc_gameplayBackground

// play gameplay background music on loop
audio_play_sound(bgrMusic, 1, true)