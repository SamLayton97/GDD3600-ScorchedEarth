/// @description DEBUGGING

// FOR DEBUGGING: proceed to next level
var nextLevel = noone
if levelIndex + 1 != chapterLength
{
	var nextLevel = ds_list_find_value(obj_gameManager.currChapter, obj_gameManager.levelIndex + 1)
}
else
{
	var currChapter = obj_gameManager.currChapter
	if currChapter == global.FieldsLevels
		nextLevel = ds_list_find_value(global.FarmLevels, 0)
	else if currChapter == global.FarmLevels
		nextLevel = ds_list_find_value(global.TownOutskirtsLevels, 0)
	else if currChapter == global.TownOutskirtsLevels
		nextLevel = ds_list_find_value(global.DepotLevels, 0)
	else
		nextLevel = rm_MainMenu
}
room_goto(nextLevel)