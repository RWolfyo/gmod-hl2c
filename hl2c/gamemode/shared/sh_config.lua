PET_BUG_FIXED = true
Hl2c = Hl2c or {}
Hl2c.Admin = Hl2c.Admin or {}
LOBBY_TEXT_MAP = "winter_lobby_2012"
LOBBY_TEXT_MAP_OLD = "keyfox_lobby_summer"
ZONE = ZONE or {}
TRIGGER_MAPEND = TRIGGER_MAPEND or {}
Hl2c.PETS = Hl2c.PETS or {}
Hl2c.STATLIST = {
[1] = "lfg",
[2] = "hp",
[3] = "luck",
}

Hl2c.Admin.List={
["STEAM_0:1:4782422"]={[1]="superadmin",[2]=4},
["STEAM_0:1:9003091"]={[1]="superadmin",[2]=3},
["STEAM_0:1:94365139"]={[1]="superadmin",[2]=3},
["STEAM_0:0:97860967"]={[1]="admin",[2]=2},
["STEAM_0:1:7832469"]={[1]="admin",[2]=2},
["STEAM_0:1:44921897"]={[1]="admin",[2]=2},
["STEAM_0:1:5736612"]={[1]="admin",[2]=1},
["STEAM_0:1:5736612"]={[1]="admin",[2]=1},
}

function IsHl2cAdmin(pl)
	for k, v in pairs(Hl2c.Admin.List) do
		if k == pl:SteamID() and (v[1] == "admin" or v[1] =="superadmin") then return true end
	end
	
		return false
end

function IsHl2cSuperAdmin(pl)
	for k, v in pairs(Hl2c.Admin.List) do
		if k == pl:SteamID() and (v[1] =="superadmin") then return true end
	end
	
	return false
end
function IsHl2cAdvisor(pl)
	for k, v in pairs(Hl2c.Admin.List) do
		if k == pl:SteamID() and ( Hl2c.Admin.Ranks[v[2]]=="advisor" ) then return true end
	end
	
	return false
end


Hl2c.Admin.Ranks={
[4]="advisor",
[3]="administrator",
[2]="overwatch",
[1]="civilprotection"
}

-- function Color(r,g,b,t)
	-- return {r,g,b,t}
-- end
GM.MapScript = GM.MapScript or {}
GM.EntityFilterByClass = GM.EntityFilterByClass or {}
GM.EntityFilterByName = GM.EntityFilterByName or {}
Hl2c.Colors = {	["MyGreen"] = Color(102,255,102) }
Hl2c.Loading = {}
-- print(Hl2c.Colors["MyGreen"])
Administrator = {}
DEV_MODE = DEV_MODE or false
Hl2c.ANTLIONGRUB_COUNT = Hl2c.ANTLIONGRUB_COUNT or 0
Hl2c.ANTLIONGRUB_KILLS = Hl2c.ANTLIONGRUB_KILLS or 0
include("config/sh_ach_list.lua")
include("config/sh_ammo.lua")
include("config/sh_class.lua")
include("config/sh_gravgun.lua")
include("config/sh_items.lua")
include("config/sh_level_cfg.lua")
include("config/sh_maps.lua")
include("config/sh_models.lua")
include("config/sh_npc_cfg.lua")
include("config/sh_points.lua")
include("config/sh_report_cfg.lua")
include("config/sh_sounds.lua")
include("config/sh_spawnlist.lua")
include("config/sh_sql_list.lua")
include("config/sh_targethud_list.lua")
include("config/sh_targethud_list.lua")
include("config/sh_vortex.lua")
include("config/sh_weapons.lua")


nextAreaOpenTime = 0

HL2C_PET_LIKE_ANTLION = HL2C_PET_LIKE_ANTLION or false

// Top 5 Players Table
// Hl2c.TopList = Hl2c.TopList or {}
Hl2c.TopList = {
	[1] = nil,
	[2] = nil,
	[3] = nil,
	[4] = nil,
	[5] = nil
}


Hl2c.Difficulty = {
-- ["easy"] = -1,
["easy"] = 0,
["normal"] = 1,
["hard"] = 2,
-- ["insane"] = 3,
-- ["nightmare"] = 4,
-- ["inferno"] = 5,
}
Hl2c.DifficultyCheck = {
--[] = "Default",
[0] = "Easy",
[1] = "Normal",
[2] = "Hard",
-- [3] = "Insane",
-- [4] = "Nightmare",
-- [5] = "Inferno",
}



// ITEM STAT ROLE BASED ON RARITY AND RANK
Hl2c.GearRole = {}
Hl2c.GearRole[1] = {} -- Common
Hl2c.GearRole[1][1] = {[1] ="hp",[2]=1,[3]=50  }
-- Hl2c.GearRole[1][4] = {[1] ="absorb",[2]=1,[3]=2  }
Hl2c.GearRole[1][3] = {[1] ="lfg",[2]=1,[3]=5  }
Hl2c.GearRole[1][2] = {[1] ="luck",[2]=1,[3]=2  }

Hl2c.GearRole[2] = {} -- Rare
Hl2c.GearRole[2][1] = {[1] ="hp",[2]=51,[3]=100  }
-- Hl2c.GearRole[2][4] = {[1] ="absorb",[2]=3,[3]=4  }
Hl2c.GearRole[2][3] = {[1] ="lfg",[2]=6,[3]=10  }
Hl2c.GearRole[2][2] = {[1] ="luck",[2]=3,[3]=4  }

Hl2c.GearRole[3] = {} -- Epic
Hl2c.GearRole[3][1] = {[1] ="hp",[2]=101,[3]=150  }
-- Hl2c.GearRole[3][4] = {[1] ="absorb",[2]=4,[3]=5  }
Hl2c.GearRole[3][3] = {[1] ="lfg",[2]=11,[3]=20  }
Hl2c.GearRole[3][2] = {[1] ="luck",[2]=4,[3]=5  }

Hl2c.GearRole[4] = {} -- Legendary
Hl2c.GearRole[4][1] = {[1] ="hp",[2]=151,[3]=200  }
Hl2c.GearRole[4][2] = {[1] ="absorb",[2]=3,[3]=4  }
Hl2c.GearRole[4][3] = {[1] ="lfg",[2]=21,[3]=40  }
Hl2c.GearRole[4][4] = {[1] ="luck",[2]=6,[3]=7  }

Hl2c.GearRole[5] = {} -- Legendary Rank 1
Hl2c.GearRole[5][1] = {[1] ="hp",[2]=201,[3]=300  }
Hl2c.GearRole[5][2] = {[1] ="absorb",[2]=4,[3]=5  }
Hl2c.GearRole[5][3] = {[1] ="lfg",[2]=41,[3]=45  }
Hl2c.GearRole[5][4] = {[1] ="luck",[2]=6,[3]=7  }

Hl2c.GearRole[6] = {} -- Legendary Rank 2
Hl2c.GearRole[6][1] = {[1] ="hp",[2]=301,[3]=400  }
Hl2c.GearRole[6][2] = {[1] ="absorb",[2]=4,[3]=5  }
Hl2c.GearRole[6][3] = {[1] ="lfg",[2]=46,[3]=50  }
Hl2c.GearRole[6][4] = {[1] ="luck",[2]=7,[3]=8  }

--Hl2c.GearRole[7] = {} -- Legendary Rank 3
--Hl2c.GearRole[7][1] = {[1] ="hp",[2]=401,[3]=600  }
--Hl2c.GearRole[7][2] = {[1] ="absorb",[2]=4,[3]=5  }
--Hl2c.GearRole[7][3] = {[1] ="lfg",[2]=51,[3]=60  }
--Hl2c.GearRole[7][4] = {[1] ="luck",[2]=9,[3]=10  }

-- WEAPON
Hl2c.WeaponRole = {}


// If Facepunch not fixed airboat server crash. ( True = Not fixed, False = Fixed )
AirboatBattle_Bug = false

// Allow admins to noclip [0 = No, 1 = Yes] (Default: 0)
ADMIN_NOCLIP = 0


// Give admins the physgun [0 = No, 1 = Yes] (Default: 0)
ADMIN_PHYSGUN = 0

//PowerUps Spawn
UP_JUMP = 0
UP_ARMOR = 0
UP_HP = 1

// Range the difficulty scale can be in [{Min, Max}] (Default: {0, 3 })
DIFFICULTY_RANGE = {0, 3}


//Allow point farm from Antlions
ANTLION_FARM = true

// If all players die, one of these will be played
// Leave blank to disable
FAILURE_SOUNDS = {}

// Percent of players that need to be in the loading section for the next map to load (Default: 60)
NEXT_MAP_PERCENT = NEXT_MAP_PERCENT or 60

// Disable Custom Weapons from Shop
DISABLE_CUSTOM_WEAPON = false

// Disable Airboat Gun Weapons from Shop (TOO POWERFUL)
DISABLE_ABG_WEAPON = true

// Disable CSniper Weapons from Shop
DISABLE_CSNIPER_WEAPON = false

// Disable Gr9 Weapons from Shop
DISABLE_GR9_WEAPON = false

// Disable Ioncannon Weapons from Shop
DISABLE_IONCANNON_WEAPON = true

//ALLOW_GRAVGUN
ALLOW_GRAVGUN = false

//ALLOW_TEST - It allows testing stuffs...
ALLOW_TEST = false

//HL2DM Skills for coop maps.
HL2DM_SKILL = false

//Return last checkpoint
// Later need for players
RETURN_CP = false

// Seconds before the next map loads (Default: 60)
NEXT_MAP_TIME = NEXT_MAP_TIME or 60

// Seconds before the next map loads (Default: 15)
NEXT_MAP_TIME_CLASSIC = NEXT_MAP_TIME_CLASSIC or 15

// HL2MP Spawn Points
HL2MP_SPAWN_ENT = "info_player_deathmatch"

// HL2 Spawn Points
HL2_SPAWN_ENT = "info_player_start"

// Seconds before the map is restarted (Default: 10)
RESTART_MAP_TIME = RESTART_MAP_TIME or 5

//RTV DELAY

//RTV COMPLETE CHANGELEVEL TIME

//TIME LONG WHEN RTV DISABLE BECAUSE EXTEND MAP

//RTV ENABLE

//

// Number of seconds before a player is vulnerable after they spawn (Default: 10)
VULNERABLE_TIME = 0

// Beta tester list
BETA_TESTERS = {
	"STEAM_0:0:49332102",
	"STEAM_0:0:16219541",
	"STEAM_0:1:51097609",
	"STEAM_0:1:6499275",
	"STEAM_0:1:49002796",
	"STEAM_0:0:13501595",
	"STEAM_0:0:63261691",
	"STEAM_0:1:4782422"
}

SNDLVL_NONE		= 0
SNDLVL_25dB		= 25
SNDLVL_30dB		= 30
SNDLVL_35dB		= 35
SNDLVL_40dB		= 40
SNDLVL_45dB		= 45
SNDLVL_50dB		= 50	//= 3.9
SNDLVL_55dB		= 55	//= 3.0
SNDLVL_IDLE		= 60	//= 2.0
SNDLVL_TALKING		= 60//,	= 2.0
SNDLVL_60dB		= 60//,	= 2.0
SNDLVL_65dB		= 65//,	= 1.5
SNDLVL_STATIC		= 66//,	= 1.25
SNDLVL_70dB		= 70//,	= 1.0
SNDLVL_NORM		= 75//,
SNDLVL_75dB		= 75//,	= 0.8
SNDLVL_80dB		= 80//,	= 0.7
SNDLVL_85dB		= 85//,	= 0.6
SNDLVL_90dB		= 90//,	= 0.5
SNDLVL_95dB		= 95//,
SNDLVL_100dB	= 100//,	= 0.4
SNDLVL_105dB	= 105//,
SNDLVL_120dB	= 120//,
SNDLVL_130dB	= 130//,
SNDLVL_GUNFIRE	= 140//, = 0.27
SNDLVL_140dB	= 140//,	= 0.2
SNDLVL_150dB	= 150//,	= 0.2

// OBSOLETE. The list is kept so people can look at what the bots used to be named.
BOT_NAMES = {
	"Bob"
}

-- DbgPrint("-------------------------")
DbgPrint("[hl2c] sh_config loaded")
-- DbgPrint("-------------------------")
