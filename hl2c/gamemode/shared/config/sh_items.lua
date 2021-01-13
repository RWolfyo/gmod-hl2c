if SERVER then AddCSLuaFile() end

if Hl2c then else return end

Hl2c.BlockedItems = Hl2c.BlockedItems or {}
Hl2c.Items = {}

/*
	Type = 0,	// 0 = weapon, 1 = ammo, 2 = powerup, 3 = suit, 4 = pet, 5 = ammobox, 6 = hat/Accs
	Perma = false, // if false not perma item if true then perma and it will cost PERMA
	Name = "weapon_pipe",
	Cost = 15,
	Amount = 0, // 0 = Frags, 1 = Perma
	Model = "",
	Tip = "",
	Block = false
*/
----------
-- Items List
-- Here you can add items
----------
Hl2c.Items[1] = {
	Perma = false,
	Type = 0,
	Name = "weapon_pipe",
	Cost = 5,
	Model = "models/props_canal/mattpipe.mdl",
	Tip = ""
}
Hl2c.Items[2] = {
	Perma = false,
	Type = 0,
	Name = "weapon_deagle",
	Cost =5,
	Model = "models/weapons/w_synergy_deagle.mdl",
	Tip = ""
}
Hl2c.Items[3] = {
	Perma = false,
	Type = 0,
	Name = "weapon_flaregun",
	Cost = 5,
	Model = "models/weapons/w_flaregun.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[4] = {
	Perma = false,
	Type = 0,
	Name = "weapon_mp5k",
	Cost = 5,
	Model = "models/weapons/w_mp5k.mdl",
	Tip = ""
}
Hl2c.Items[5] = {
	Perma = false,
	Type = 0,
	Name = "weapon_mg1",
	Cost = 5,
	Model = "models/weapons/w_mg1.mdl",
	Tip = ""
}
Hl2c.Items[6] = {
	Perma = false,
	Type = 0,
	Name = "weapon_sl8",
	Cost = 5,
	Model = "models/weapons/w_sl8.mdl",
	Tip = ""
}

Hl2c.Items[7] = {
	Perma = false,
	Type = 0,
	Name = "weapon_airboatgun_hl2c",
	Cost = 300,
	Model = "models/airboatgun.mdl",
	Tip = ""
}

Hl2c.Items[8] = {
	Perma = false,
	Type = 0,
	Name = "weapon_ioncannon_hl2c",
	Cost = 100,
	Model = "models/combine_turrets/combine_cannon_gun.mdl",
	Tip = ""
}
Hl2c.Items[9] = {
	Perma = false,
	Type = 0,
	Name = "weapon_csniper_hl2c",
	Cost = 50,
	Model = "models/weapons/w_combinesniper_e2.mdll",
	Tip = "",
	Block = true
}
Hl2c.Items[10] = {
	Perma = false,
	Type = 0,
	Name = "weapon_gr9_hl2c",
	Cost = 50,
	Model = "models/weapons/w_combine_gr9.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[11] = {
	Perma = false,
	Type = 0,
	Name = "weapon_bp_alyxgun",
	Cost = 5,
	Model = "models/weapons/w_alex_gun.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[12] = {
	Type = 0,
	Name = "weapon_bp_alyxgun",
	Cost = 5,
	Model = "models/airboatgun.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[13] = {
	Perma = false,
	Type = 0,
	Name = "weapon_bfg_smg2",
	Cost = 5,
	Model = "models/weapons/w_smg2.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[14] = {
	Perma = false,
	Type = 2,
	Name = "Suit Recharger",
	Cost = 5,
	Model = "models/props_combine/suit_charger001.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[15] = {
	Perma = false,
	Type = 2,
	Name = "HP Recharger",
	Cost = 5,
	Model = "models/props_combine/health_charger001.mdl",
	Tip = "",
	Block = true
}

Hl2c.Items[16] = {
	Type = 2,
	Name = "HP Recharger",
	Cost = 5,
	Model = "models/airboatgun.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[17] = {
	Perma = false,
	Type = 1,
	Name = "Pistol",
	Cost = 2,
	Amount = 150,
	Model = "models/items/boxsrounds.mdl",
	Tip = ""
}
Hl2c.Items[18] = {
	Perma = false,
	Type = 1,
	Name = "357",
	Cost = 2,
	Amount = 12,
	Model = "models/items/357ammo.mdl",
	Tip = ""
}
Hl2c.Items[19] = {
	Perma = false,
	Type = 1,
	Name = "SMG1",
	Amount = 225,
	Cost = 2,
	Model = "models/items/boxmrounds.mdl",
	Tip = ""
}
Hl2c.Items[20] = {
	Perma = false,
	Type = 1,
	Name = "AR2",
	Amount = 60,
	Cost = 2,
	Model = "models/items/combine_rifle_cartridge01.mdl",
	Tip = ""
}
Hl2c.Items[21] = {
	Perma = false,
	Type = 1,
	Name = "Buckshot",
	Amount = 30,
	Cost = 2,
	Model = "models/items/boxbuckshot.mdl",
	Tip = ""
}
Hl2c.Items[22] = {
	Perma = false,
	Type = 1,
	Name = "XBowBolt",
	Amount = 10,
	Cost = 2,
	Model = "models/items/crossbowrounds.mdl",
	Tip = ""
}
Hl2c.Items[23] = {
	Perma = false,
	Type = 1,
	Name = "7x107_AIT-44M",
	Amount = 400,
	Cost = 2,
	Model = "models/items/boxmrounds.mdl",
	Tip = ""
}
Hl2c.Items[24] = {
	Perma = false,
	Type = 1,
	Name = "SniperRound",
	Amount = 30,
	Cost = 2,
	Model = "models/items/boxsniperrounds.mdl",
	Tip = ""
}
Hl2c.Items[25] = {
	Perma = false,
	Type = 1,
	Name = "pulse_shotgun",
	Amount = 30,
	Cost = 2,
	Model = "models/items/battery.mdl",
	Tip = ""
}
Hl2c.Items[26] = {
	Perma = false,
	Type = 1,
	Name = "bp_small",
	Amount = 100,
	Cost = 2,
	Model = "models/items/boxsrounds.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[27] = {
	Perma = false,
	Type = 1,
	Name = "bp_medium",
	Amount = 180,
	Cost = 2,
	Model = "models/items/boxmrounds.mdl",
	Tip = "",
	Block = true
}
Hl2c.Items[28] = {
	Perma = false,
	Type = 1,
	Name = "bp_sniper",
	Amount = 30,
	Cost = 2,
	Model = "models/items/boxsniperrounds.mdl",
	Tip = "",
	Block = true
}

Hl2c.Items[29] = {
	Perma = false,
	Type = 1,
	Name = "bfg_shotgun",
	Amount = 12,
	Cost = 2,
	Model = "models/items/boxbuckshot.mdl",
	Tip = "",
	Block = true
}


table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_bombhead",
	Amount = 0,
	Cost = 400,
	Model = "models/Combine_Helicopter/helicopter_bomb01.mdl",
	Tip = "",
	Accs = {Attachment = "eyes",Scale = 0.5,Pos = -2.5, Ang = -80},
	Buyable = true,
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Inventory = true,
	Type = 5,
	Name = "hat_skull",
	Amount = 0,
	Cost = 400,
	Model = "models/Gibs/HGIBS.mdl",
	Tip = "",
	Accs = {Attachment = "eyes",Scale = 2.5,Pos = 0, Ang = -10},
	Requirement = {Level = 0, Vortex = 0, Achievement = "ACHIEVEMENT_EVENT_GEN_KILL_1000ANTLIONS"},
	Reward = true,
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_headcrabclassic",
	Amount = 0,
	Cost = 400,
	Model = "models/headcrabclassic.mdl",
	Tip = "HeadCrab Classic Hat Required: 1000 Headcrab Kills!",
	Accs = {Attachment = "eyes",Scale = 0.8,Pos = 7, Ang = 20},
	Requirement = {Level = 0, Vortex = 0, Achievement = "ACHIEVEMENT_EVENT_GEN_KILL_1000HEADCRABS"},
	Reward = true,
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_melon",
	Amount = 0,
	Cost = 400,
	Model = "models/props_junk/watermelon01.mdl",
	Tip = "Be a Water Melon",
	Accs = {Attachment = "eyes",Scale = 1.3,Pos = -0.5, Ang = 150},
	Buyable = true,
	Block = false 	
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_monitor",
	Amount = 0,
	Cost = 400,
	Model = "models/props_lab/monitor01a.mdl",
	Tip = "HAX!",
	Accs = {Attachment = "eyes",Scale = 0.8,Pos = 1, Ang = 20},
	Block = false,
	Buyable = true,
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_antlion",
	Amount = 0,
	Cost = 0,
	Model = "models/gibs/antlion_gib_large_2.mdl",
	Tip = "Antlion's Head",
	Accs = {Attachment = "eyes",Scale = 0.8,Pos = 4, Ang = -20},
	Block = false,
	Requirement = {Level = 0, Vortex = 0, Achievement = "ACHIEVEMENT_EVENT_GEN_KILL_1000ANTLIONS"},
	Reward = true,
	}
)


table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_chefhat",
	Amount = 0,
	Cost = 0,
	Model = "models/chefhat.mdl",
	Tip = "Chef's Hat",
	Accs = {Attachment = "eyes",Scale = 0.8,Pos = 0, Ang = 0,Z=0},
	Block = false,
	Requirement = {Level = 0, Vortex = 0, Achievement = "ACHIEVEMENT_EVENT_HL2_FIND_VORTIGAUNTCAVE"},
	Reward = true
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_lamp",
	Amount = 0,
	Cost = 0,
	Model = "models/props_c17/lampShade001a.mdl",
	Tip = "Lamp Hat",
	Accs = {Attachment = "eyes",Scale = 1,Pos = -5, Ang = 20},
	Block = false,
	Requirement = {Level = 5, Vortex = 0, Achievement = "NO_ACHI"},
	Reward = true
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_stalkermask",
	Amount = 0,
	Cost = 0,
	Model = "models/props_combine/stalkerpod_lid.mdl",
	Tip = "Stalker's Mask",
	Accs = {Attachment = "eyes",Scale = 0.8,Pos = 5, Ang = -50,Z=6},
	Block = false,
	Requirement = {Level = 0, Vortex = 0, Achievement = "ACHIEVEMENT_EVENT_EP1_BEAT_CITADELCORE_NOSTALKERKILLS"},
	Reward = true
	}
)

table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_sawblade",
	Amount = 0,
	Cost = 0,
	Model = "models/props_junk/sawblade001a.mdl",
	Tip = "Sawblade Hat",
	Accs = {Attachment = "eyes",Scale = 0.5,Pos = 0, Ang = -180},
	Block = false,
	Requirement = {Level = 0, Vortex = 0, Achievement = "ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END"},
	Reward = true
	}
)


table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_mask1",
	Amount = 0,
	Cost = 400,
	Model = "models/nova/w_headgear.mdl",
	Tip = "Police Mask",
	Accs = {Attachment = "eyes",Scale = 1.1,Pos = -6, Ang = 90},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_buckethat",
	Amount = 0,
	Cost = 0,
	Model = "models/props_junk/MetalBucket01a.mdl",
	Tip = "Bucket Hat",
	Accs = {Attachment = "eyes",Scale =0.7,Pos = 0, Ang = 0},
	Requirement = {Level = 10, Vortex = 0, Achievement = "NO_ACHI"},
	Block = false,
	Reward=true
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_clockmask",
	Amount = 0,
	Cost = 0,
	Model = "models/props_c17/clock01.mdl",
	Tip = "Clock Mask",
	Accs = {Attachment = "eyes",Scale =1.0,Pos = 0, Ang = 0},
	Requirement = {Level = 15, Vortex = 0, Achievement = "NO_ACHI"},
	Block = false,
	Reward=true
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_conehat",
	Amount = 0,
	Cost = 0,
	Model = "models/props_junk/TrafficCone001a.mdl",
	Tip = "Clock Mask",
	Accs = {Attachment = "eyes",Scale =0.8,Pos = 0, Ang = 0},
	Requirement = {Level = 20, Vortex = 0, Achievement = "NO_ACHI"},
	Block = false,
	Reward=true
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Inventory = true,
	Name = "hat_tvhead",
	Amount = 0,
	Cost = 0,
	Model = "models/props_c17/tv_monitor01.mdl",
	Tip = "TV Head",
	Accs = {Attachment = "eyes",Scale =0.8,Pos = 0, Ang = 0},
	Requirement = {Level = 25, Vortex = 0, Achievement = "NO_ACHI"},
	Block = false,
	Reward=true
	}
)
-- table.insert(
	-- Hl2c.Items,
	-- #Hl2c.Items+1,
	-- { 
	-- Perma = true,
	-- Type = 5,
	-- Inventory = true,
	-- Name = "hat_mask2",
	-- Amount = 0,
	-- Cost = 15000,
	-- Model = "models/combine/soldier_helmet.mdl",
	-- Tip = "Combine Default Mask",
	-- Accs = {Attachment = "eyes",Scale = 1.6,Pos = 0, Ang = 0},
	-- Block = false 
	-- }
-- )
-- table.insert(
	-- Hl2c.Items,
	-- #Hl2c.Items+1,
	-- { 
	-- Perma = true,
	-- Type = 5,
	-- Inventory = true,
	-- Name = "hat_mask3",
	-- Amount = 0,
	-- Cost = 15000,
	-- Model = "models/combine/elite_helmet.mdl",
	-- Tip = "Combine Elit Mask",
	-- Accs = {Attachment = "chest",Scale = 1.6,Pos = 0, Ang = 0},
	-- Block = false 
	-- }
-- )


table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = false,
	Type = 0,
	Name = "custom_oicw",
	Amount = 0,
	Cost = 10,
	Model = "models/weapons/w_oicw.mdl",
	Tip = "",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = false,
	Type = 0,
	Name = "custom_g36c",
	Amount = 0,
	Cost = 10,
	Model = "models/weapons/w_hex_g36c.mdl",
	Tip = "",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = false,
	Type = 0,
	Name = "weapon_sniperrifle",
	Amount = 0,
	Cost = 10,
	Model = "models/weapons/w_sniper.mdl",
	Tip = "",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 0,
	Name = "weapon_ep2sniper",
	Inventory = true,
	Amount = 0,
	Cost = 0,
	Model = "models/weapons/w_combinesniper_e2.mdl",
	Tip = "",
	Requirement = {Level = 0, Vortex = 0, Achievement = "ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"},
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 0,
	Name = "weapon_minigun",
	Inventory = true,
	Amount = 0,
	Cost = 0,
	Model = "models/weapons/w_minigun.mdl",
	Tip = "",
	Requirement = {Level = 20, Vortex = 0, Achievement = "NO_ACHI"},
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 0,
	Name = "weapon_cass_dp",
	Inventory = true,
	Amount = 0,
	Cost = 0,
	Model = "models/weapons/w_pistol.mdl",
	Tip = "Dual Pistols",
	Requirement = {Level = 10, Vortex = 0, Achievement = "NO_ACHI"},
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 0,
	Name = "weapon_ion",
	Inventory = true,
	Amount = 0,
	Cost = 0,
	Model = "models/weapons/w_ion.mdl",
	Tip = "",
	Requirement = {Level = 0, Vortex = 30, Achievement = "NO_ACHI"},
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Inventory = true,
	Type = 0,
	Name = "weapon_plasmapistol_hl2c",
	Amount = 0,
	Cost = 0,
	Model = "models/weapons/w_pistol.mdl",
	Tip = "",
	Requirement = {Level = 15, Vortex = 0, Achievement = "NO_ACHI"},
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Inventory = true,
	Type = 0,
	Name = "weapon_pulsesmg",
	Amount = 0,
	Cost = 0,
	Model = "models/weapons/w_irifle.mdl",
	Tip = "",
	Requirement = {Level = 30, Vortex = 0, Achievement = "NO_ACHI"},
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Inventory = true,
	Type = 0,
	Name = "weapon_combinemelee",
	Amount = 0,
	Cost = 0,
	Model = "models/weapons/w_stunbaton.mdl",
	Tip = "",
	Requirement = {Level = 70, Vortex = 0, Achievement = "NO_ACHI"},
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)

table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Name = "hp_regen_rank1",
	Amount = 0,
	Cost = 3000,
	Model = "models/props_combine/health_charger001.mdl",
	Tip = "Buy Health Regen Rank1\nCost: 3 000 PERMA\nRegenerate Health 25/sec",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Name = "hp_regen_rank2",
	Amount = 0,
	Cost = 15000,
	Model = "models/props_combine/health_charger001.mdl",
	Tip = "Buy Health Regen Rank2\nCost: 15 000 PERMA\nRegenerate Health 50/sec",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Name = "hp_regen_rank3",
	Amount = 0,
	Cost = 35000,
	Model = "models/props_combine/health_charger001.mdl",
	Tip = "Buy Health Regen Rank3\nCost: 35 000 PERMA\nRegenerate Health 75/sec",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Name = "hp_regen_rank4",
	Amount = 0,
	Cost = 75000,
	Model = "models/props_combine/health_charger001.mdl",
	Tip = "Buy Health Regen Rank4\nCost: 75 000 PERMA\nRegenerate Health 100/sec",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Name = "hp_regen_rank5",
	Amount = 0,
	Cost = 110000,
	Model = "models/props_combine/health_charger001.mdl",
	Tip = "Buy Health Regen Rank5\nCost: 110 000 PERMA\nRegenerate Health 125/sec",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
table.insert(
	Hl2c.Items,
	#Hl2c.Items+1,
	{ 
	Perma = true,
	Type = 5,
	Name = "hp_regen_rank6",
	Amount = 0,
	Cost = 160000,
	Model = "models/props_combine/health_charger001.mdl",
	Tip = "Buy Health Regen Rank6\nCost: 160 000 PERMA\nRegenerate Health 150/sec",
	--Accs = {Attachment = "eyes",Scale = 0.8,Pos = 2.5, Ang = 20},
	Block = false 
	}
)
/* WE need this for the derma shit */
Hl2c.Shops = {

}

Hl2c.Shops.List = {
	Perma = {
	Powerup = {},
	Suit = {},
	Pet = {}
	},
	Temp = {
	Weapon = {},
	Ammo = {},
	Powerup = {}
	}
}
/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXX */

/* We Need this for Derma Shit Set Up */

Hl2c.Inventory = {}

Hl2c.Inventory.List = {
	Perma = {
	Powerup = {},
	Suit = {},
	Pet = {},
	Weapon = {}
	},
	Temp = {
	Weapon = {},
	Ammo = {},
	Powerup = {}
	}
}
/* XXXXXXXXXXXXXXXXXXXXXXXXXXXXX */

Hl2c.Shops.List.Perma.Pet[1] = nil

Hl2c.Shops.List.Temp.Weapon[1] = Hl2c.Items[1]

for k, v in pairs(Hl2c.Items) do
	if v["Block"] then
		--print(v["Block"])
	else
		if v["Perma"] == true and v["Type"] == 0 and v["Inventory"] == true then
			Hl2c.Inventory.List.Perma.Weapon[k] = v
		end
		if v["Perma"] == true and v["Type"] == 5 and v["Inventory"] != true then
			Hl2c.Inventory.List.Perma.Powerup[k] = v
		end
		if v["Perma"] == false and v["Type"] == 0 and v["Inventory"] != true then
			--print(v["Type"])
			Hl2c.Shops.List.Temp.Weapon[k] = v
		end
		if v["Perma"] == false and v["Type"] == 1 and v["Inventory"] != true then
			--print(v["Type"])
			Hl2c.Shops.List.Temp.Ammo[k] = v
			--print
		end
		if v["Perma"] == false and v["Type"] == 2 and v["Inventory"] != true then
			--print(v["Type"])
			Hl2c.Shops.List.Temp.Ammo[k] = v
			--print
		end
	end
	/*print(" ")
	print("--------------")
	print("Type","=",v["Type"])
	print("Name","=",v["Name"])
	print("Cost","=",v["Cost"])
	print("Model","=",v["Model"])
	print("Tip","=",v["Tip"])
	print("---------------")
	print(" ")*/
end
--PrintTable(Hl2c.Shops.List.Temp.Ammo) 
if CLIENT then
	--PrintTable(Hl2c.Items)
end




function Hl2c.Item_CheckReq(pl,item)
	--print("Checking...",item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if v["Requirement"]["Level"] > 0 and 
			v["Requirement"]["Vortex"] > 0 and 
			v["Requirement"]["Achievement"] != "NO_ACHI" 
			then
				
				if v["Requirement"]["Level"] <= pl:GetCLevel() and v["Requirement"]["Vortex"] <= pl:GetVortexNum() and pl:GetNWInt(v["Requirement"]["Achievement"]) == 1 then return true end 
			
			elseif v["Requirement"]["Level"] > 0 and 
			v["Requirement"]["Vortex"] > 0
			then
				
				if v["Requirement"]["Level"] <= pl:GetCLevel() and v["Requirement"]["Vortex"] <= pl:GetVortexNum() then return true end
			
			elseif v["Requirement"]["Vortex"] > 0 and 
			v["Requirement"]["Achievement"] != "NO_ACHI" 
			then
				
				if v["Requirement"]["Vortex"] <= pl:GetVortexNum() and pl:GetNWInt(v["Requirement"]["Achievement"]) == 1 then return true end
				
			elseif v["Requirement"]["Level"] > 0 and
			v["Requirement"]["Achievement"] != "NO_ACHI" 
			then
				
				if v["Requirement"]["Level"] <= pl:GetCLevel() and pl:GetNWInt(v["Requirement"]["Achievement"]) == 1 then return true end
				
			elseif v["Requirement"]["Level"] > 0 then
				--pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Working Check Requirement")
				if v["Requirement"]["Level"] <= pl:GetCLevel() then return true end
				
			elseif v["Requirement"]["Vortex"] > 0 then
				
				if v["Requirement"]["Vortex"] <= pl:GetVortexNum() then return true end
				
			elseif v["Requirement"]["Achievement"] != "NO_ACHI" then
				
				if pl:GetNWInt(v["Requirement"]["Achievement"]) == 1 then return true end
				
			end
			
			--if v["Requirement"]["Level"] <= pl:GetCLevel() then return true end
			
			
		end
	end
	return false 
end
