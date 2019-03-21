/// @description Used for initialization

// define enumeration of invasion phases
enum InvasionPhase
{
	preInvasion,
	invasion,
	postInvasion
}

// define enumeration of weapons / tools
enum LeftPressWeapon
{
	molotov,
	dynamite
}

// load 'Fields' levels into chapter list
global.FieldsLevels = ds_list_create()
ds_list_clear(global.FieldsLevels)
ds_list_add(global.FieldsLevels, rm_Fields)
ds_list_add(global.FieldsLevels, rm_Fields2)
ds_list_add(global.FieldsLevels, rm_Fields3)
ds_list_add(global.FieldsLevels, rm_Fields4)
ds_list_add(global.FieldsLevels, rm_Fields5)

// load "Farm" levels into chapter list
global.FarmLevels = ds_list_create()
ds_list_clear(global.FarmLevels)
ds_list_add(global.FarmLevels, rm_Farm)
ds_list_add(global.FarmLevels, rm_Farm2)
ds_list_add(global.FarmLevels, rm_Farm3)
ds_list_add(global.FarmLevels, rm_Farm4)
ds_list_add(global.FarmLevels, rm_Farm5)

// TODO: load "Outskirts" levels into chapter list
global.TownOutskirtsLevel = ds_list_create()
ds_list_clear(global.TownOutskirtsLevel)
ds_list_add(global.TownOutskirtsLevel, rm_townOutskirts)
ds_list_add(global.TownOutskirtsLevel, rm_townOutskirts2)
ds_list_add(global.TownOutskirtsLevel, rm_townOutskirts3)
ds_list_add(global.TownOutskirtsLevel, rm_townOutskirts4)
ds_list_add(global.TownOutskirtsLevel, rm_townOutskirts5)