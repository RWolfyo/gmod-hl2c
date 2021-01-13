if SERVER then AddCSLuaFile() end

Hl2c.GravGun_Dmg_List = {
	["npc_alyx"] = true,
	["npc_antlionguard"] = true,
	["npc_barnacle"] = true,
	["npc_barney"] = true,
	["npc_breen"] = true,
	["npc_bullseye"] = true,
	["npc_citizen"] = true,
	["npc_combine_s"] = true,
	["npc_cremator"] = true,
	["npc_dog"] = true,
	["npc_eli"] = true,
	["npc_fassassin"] = true,
	["npc_fastzombie"] = true,
	["npc_fisherman"] = true,
	["npc_gman"] = true,
	["npc_hunter"] = true,
	["npc_kleiner"] = true,
	["npc_magnusson"] = true,
	["npc_metropolice"] = true,
	["npc_monk"] = true,
	["npc_mossman"] = true,
	["npc_poisonzombie"] = true,
	["npc_sniper"] = true,
	["npc_strider"] = true,
	["npc_turret_ceiling"] = true,
	["npc_turret_ground"] = true,
	["npc_vortigaunt"] = true,
	["npc_zombie"] = true,
	["npc_zombie_torso"] = true,
	["npc_zombine"] = true
}

Hl2c.Ravenholm = Hl2c.Ravenholm or {}
Hl2c.Ravenholm.Maps = {
	["d1_town_01"] = true,
    ["d1_town_01a"] = true,
    ["d1_town_02"] = true,
    ["d1_town_02a"] = true,
    ["d1_town_03"] = true,
    ["d1_town_04"] = true
}

// Filter weapon use in Ravenholm to check the player only used these weapons.
Hl2c.Ravenholm.Weapons = {
	["weapon_physcannon"] = true,
	["prop_physics"] = true
}