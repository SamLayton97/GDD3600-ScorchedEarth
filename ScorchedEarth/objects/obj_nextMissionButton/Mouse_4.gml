/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// proceed to next level in the chapter
var nextLevel = ds_list_find_value(obj_gameManager.currChapter, obj_gameManager.levelIndex + 1)
room_goto(nextLevel)