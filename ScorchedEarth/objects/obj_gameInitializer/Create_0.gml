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
//ds_list_clear(global.FieldsLevels)
ds_list_add(global.FieldsLevels, rm_Fields)
ds_list_add(global.FieldsLevels, rm_Fields2)
ds_list_add(global.FieldsLevels, rm_Fields3)
ds_list_add(global.FieldsLevels, rm_Fields4)
ds_list_add(global.FieldsLevels, rm_Fields5)

// load "Farm" levels into chapter list
global.FarmLevels = ds_list_create()
//ds_list_clear(global.FarmLevels)
ds_list_add(global.FarmLevels, rm_Farm)
ds_list_add(global.FarmLevels, rm_Farm2)
ds_list_add(global.FarmLevels, rm_Farm3)
ds_list_add(global.FarmLevels, rm_Farm4)
ds_list_add(global.FarmLevels, rm_Farm5)

// load "Outskirts" levels into chapter list
global.TownOutskirtsLevels = ds_list_create()
//ds_list_clear(global.TownOutskirtsLevels)
ds_list_add(global.TownOutskirtsLevels, rm_townOutskirts)
ds_list_add(global.TownOutskirtsLevels, rm_townOutskirts2)
ds_list_add(global.TownOutskirtsLevels, rm_townOutskirts3)
ds_list_add(global.TownOutskirtsLevels, rm_townOutskirts4)
ds_list_add(global.TownOutskirtsLevels, rm_townOutskirts5)

// load "Depot" level into chapter list
global.DepotLevels = ds_list_create()
//ds_list_clear(global.DepotLevels)
ds_list_add(global.DepotLevels, rm_armsDepot)

show_debug_message(string(ds_list_size(global.FieldsLevels)))