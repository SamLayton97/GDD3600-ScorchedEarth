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
ds_list_add(global.FieldsLevels, rm_Fields)
ds_list_add(global.FieldsLevels, rm_Fields2)
ds_list_add(global.FieldsLevels, rm_Fields3)
ds_list_add(global.FieldsLevels, rm_Fields4)
ds_list_add(global.FieldsLevels, rm_Fields5)

// TODO: load "Farm" levels into chapter list
global.FarmLevels = ds_list_create()

// TODO: load "Outskirts" levels into chapter list
global.TownOutskirtsLevel = ds_list_create()

// TODO: load "Depot" level into chapter list