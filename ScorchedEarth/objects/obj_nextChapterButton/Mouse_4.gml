/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

// find first level of next chapter
var currChapter = obj_gameManager.currChapter
var nextRoom = noone
if currChapter == global.FieldsLevels
	nextRoom = ds_list_find_value(global.FarmLevels, 0)
else if currChapter == global.FarmLevels
	nextRoom = ds_list_find_value(global.TownOutskirtsLevels, 0)
else if currChapter == global.TownOutskirtsLevels
	nextRoom = ds_list_find_value(global.DepotLevels, 0)
else
	nextRoom = rm_MainMenu

// proceed to first level of next chapter
room_goto(nextRoom)