if SERVER then AddCSLuaFile() end

Hl2c.Combine = {}
Hl2c.Combine.Class = {
	[1] = {
		Name = "COMBINE_CLASS_01",
		Model = "models/player/combine_super_soldier.mdl",
		-- Description = "Combine elit soldier",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_ar2",
		-- "weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["AR2"] = 999,
		["AR2AltFire"] = 10
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		}
	},
	[10] = {
		Name = "COMBINE_CLASS_10",
		Model = "models/player/combine_super_soldier.mdl",
		-- Description = "Combine elit soldier",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_shotgun",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["Buckshot"] = 999,
		["Grenade"] = 10
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		}
	},
	[2] = {
		Name = "COMBINE_CLASS_02",
		Model = "models/player/combine_soldier.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_ar2",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["AR2"] = 999,
		["Grenade"] = 3
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		}
	},
	[3] = {
		Name = "COMBINE_CLASS_03",
		Model = "models/shotgun_soldier.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_shotgun",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["Buckshot"] = 999,
		["Grenade"] = 3
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
	[4] = {
		Name = "COMBINE_CLASS_04",
		Model = "models/player/combine_soldier.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_smg1",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["SMG1"] = 999,
		["Grenade"] = 5
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
	[5] = {
		Name = "COMBINE_CLASS_05",
		Model = "models/player/combine_soldier.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_ep2sniper",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["AR2"] = 999,
		["Grenade"] = 3
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
	[6] = {
		Name = "COMBINE_CLASS_06",
		Model = "models/player/combine_soldier_prisonguard.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_smg1",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["SMG1"] = 999,
		["Grenade"] = 5
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
	[7] = {
		Name = "COMBINE_CLASS_07",
		Model = "models/player/combine_soldier_prisonguard.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_ar2",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["AR2"] = 999,
		["Grenade"] = 3
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
	[8] = {
		Name = "COMBINE_CLASS_08",
		Model = "models/player/combine_soldier_prisonguard.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 1,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_shotgun",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["Buckshot"] = 999,
		["Grenade"] = 3
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
	[9] = {
		Name = "COMBINE_CLASS_09",
		Model = "models/player/combine_soldier_prisonguard.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_ep2sniper",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["AR2"] = 999,
		["Grenade"] = 3
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
	[11] = {
		Name = "COMBINE_CLASS_11",
		Model = "models/player/metropolice.mdl",
		ClassType = "player_combine",
		Faction = "TEAM_COMBINE",
		Skin = 0,
		Weapons = {
		"weapon_stunstick",
		"weapon_pistol",
		"weapon_smg1",
		"weapon_frag"
		},
		Ammos = {
		["Pistol"] = 999,
		["SMG1"] = 999,
		["Grenade"] = 3
		},
		Client = {
		Image = "spawnicons/models/combine_super_soldier.png",
		Title = "",
		Killstreak = ""
		},
	},
}