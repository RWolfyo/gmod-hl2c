if SERVER then AddCSLuaFile() end

Hl2c.Weapons = {}
Hl2c.Weapons.All = {
	["weapon_crowbar"] = true,
	["weapon_pipe"] = true,
	["weapon_stunstick"] = true,
	["weapon_physcannon"] = true,
	["weapon_physgun"] = true,
	["weapon_pistol"] = true,
	["weapon_357"] = true,
	["weapon_deagle"] = true,
	["weapon_flaregun"] = false,
	["weapon_mp5k"] = true,
	["weapon_mg1"] = true,
	["weapon_sl8"] = true,
	["weapon_smg1"] = true,
	["weapon_ar2"] = true,
	["weapon_shotgun"] = true,
	["weapon_crossbow"] = true,
	["weapon_frag"] = true,
	["weapon_rpg"] = true,
	["weapon_slam"] = true,
	["weapon_ion"] = true,
	["weapon_grapple"] = true,
	-- ["weapon_oicw"] = true,
	["custom_oicw"] = true,
	["custom_g36c"] = true,
	["weapon_ep2sniper"] = true,
	["weapon_sniperrifle"] = true,
	["weapon_minigun"] = true,
	["weapon_cass_dp"] = true,

}
Hl2c.Weapons.Hl2 = {
	["weapon_crowbar"] = true,
	["weapon_stunstick"] = true,
	["weapon_physcannon"] = true,
	["weapon_pistol"] = true,
	["weapon_357"] = true,
	["weapon_smg1"] = true,
	["weapon_ar2"] = true,
	["weapon_shotgun"] = true,
	["weapon_crossbow"] = true,
	["weapon_frag"] = true,
	["weapon_rpg"] = true,
	["weapon_slam"] = true
}

Hl2c.Weapons.Hl1 = {
	["weapon_crowbar"] = true,
	["weapon_9mmhandgun"] = true,
	["weapon_357"] = true,
	["weapon_9mmAR"] = true,
	["weapon_shotgun"] = true,
	["weapon_crossbow"] = true,
	["weapon_rpg"] = true,
	["weapon_gauss"] = true,
	["weapon_egon"] = true,
	["weapon_hornetgun"] = true,
	["weapon_handgrenade"] = true,
	["weapon_stachel"] = true,
	["weapon_tripmine"] = true,
	["weapon_snark"] = true,
}
Hl2c.Weapons.CD = {
	["weapon_crowbar"] = true,
	["weapon_stunstick"] = true,
	["weapon_physcannon"] = true,
	["weapon_physgun"] = true,
	["weapon_pistol"] = true,
	["weapon_357"] = true,
	["weapon_smg1"] = true,
	["weapon_ar2"] = true,
	["weapon_shotgun"] = true,
	["weapon_crossbow"] = true,
	["weapon_frag"] = true,
	["weapon_rpg"] = true,
	["weapon_slam"] = true
}
Hl2c.Weapons.OC = {
	["weapon_grapple"] = true,
	-- ["weapon_oicw"] = true,
	["custom_oicw"] = true,
	["custom_g36c"] = true,
	["weapon_sniperrifle"] = true
}
Hl2c.Weapons.Synergy = {
	["weapon_pipe"] = true,
	["weapon_deagle"] = true,
	["weapon_flaregun"] = false,
	["weapon_mp5k"] = true,
	["weapon_mg1"] = true,
	["weapon_sl8"] = true
}

Hl2c.Weapons.Custom = {
	["weapon_ion"] = true,
	["weapon_ep2sniper"] = true,
	["weapon_minigun"] = true,
	["weapon_physgun"] = true,
}



// Unsharable Weapons (Blacklisted weapons)
BLACKLIST_WEAPONS = {
	"weapon_physgun",
	"weapon_airboatgun_hl2c",
	"weapon_csniper_hl2c",
	"weapon_ioncannon_hl2c",
	"weapon_gr9_hl2c",
	"weapon_plasmapistol_hl2c",
	"weapon_pulsesmg",
	"weapon_combineshotgun",
	"weapon_combinemelee",
	"weapon_bfg_smg2",
	"weapon_bp_alyxgun",
	"weapon_bfg_mp7",
	"weapon_bfg_oicw",
	"weapon_bfg_hl2_sniper",
	"weapon_bfg_hl2_annabelle"
}

WHITELIST_WEAPONS = {
	"weapon_crowbar",
	"weapon_physcannon",
	"weapon_pistol",
	"weapon_357",
	"weapon_smg1",
	"weapon_ar2",
	"weapon_shotgun",
	"weapon_crossbow",
	"weapon_frag",
	"weapon_slam",
	"weapon_rpg",
	"weapon_bugbait",
	"weapon_stunstick",
	"weapon_medkit_hl2c"
}