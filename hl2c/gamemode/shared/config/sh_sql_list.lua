if SERVER then AddCSLuaFile() end

// Shop Upgrades
Hl2C_SHOP_UPGRADE_P1 = {
	"SHOP_UPGRADE_001", -- HEV SUIT
	"SHOP_UPGRADE_003", -- HP REGEN RANKs
	"SHOP_UPGRADE_004", -- rebel suit
	"SHOP_UPGRADE_005", -- cop suit
	"SHOP_UPGRADE_006", -- 
	"SHOP_UPGRADE_007", -- 
	"SHOP_UPGRADE_008", -- 
	"SHOP_UPGRADE_009", -- 
	"SHOP_UPGRADE_010", -- 
	"SHOP_UPGRADE_011", -- melon hat
	"SHOP_UPGRADE_012",
	"SHOP_UPGRADE_013",
	"SHOP_UPGRADE_014",
	"SHOP_UPGRADE_015",
	"SHOP_UPGRADE_016",
	"SHOP_UPGRADE_017",
	"SHOP_UPGRADE_018",
	"SHOP_UPGRADE_019",
	"SHOP_UPGRADE_020"
}

//Custom Counters
HL2C_CCOUNTERS_P1 = {
	"CCustomCounterP1_00", --Antlion Kills in Hl2 150
	"CCustomCounterP1_01", -- Manhack kills in hl2 
	"CCustomCounterP1_02", -- Gunship kills in hl2
	"CCustomCounterP1_03", -- Count Flares (ep1 zombie ignite by flare)
	"CCustomCounterP1_04", -- Count Grenade Steal (zombine ep2)
	"CCustomCounterP1_05",
	"CCustomCounterP1_06",
	"CCustomCounterP1_07",
	"CCustomCounterP1_08",
	"CCustomCounterP1_09"
}
--DB.CustomSetUp.P1
HL2C_CSETUP_P1 = {
	"CustomSetUpP1_01", -- Perma Setup
	"CustomSetUpP1_02", -- Ravenholm HL2
	"CustomSetUpP1_03", -- True One Freeman (Active if 0)
	"CustomSetUpP1_04", -- Started True One Freeman (Active if 1)
	"CustomSetUpP1_05", -- Ep2 Event and Stop Lobby Invasion.
	"CustomSetUpP1_06",
	"CustomSetUpP1_07",
	"CustomSetUpP1_08",
	"CustomSetUpP1_09"
}

HL2C_PET_SHOP = {
	["PET_000"] = "000", -- hunter
	["PET_001"] = "001", -- combine_s
	["PET_002"] = "002", -- antlion
	["PET_003"] = "003", -- headcrab
	["PET_004"] = "004", -- Rollermine
	["PET_005"] = "005", -- fassassin
	["PET_006"] = "006", -- fast headcrab
	["PET_007"] = "007", -- black headcrab
	["PET_008"] = "008",
	["PET_009"] = "009",
	["PET_010"] = "010",
	["PET_011"] = "011",
	["PET_012"] = "012",
	["PET_013"] = "013",
	["PET_014"] = "014",
	["PET_015"] = "015",
	["PET_016"] = "016",
	["PET_017"] = "017",
	["PET_018"] = "018",
	["PET_019"] = "019",
	["PET_020"] = "020",
	["PET_021"] = "021",
	["PET_022"] = "022",
	["PET_023"] = "023",
	["PET_024"] = "024",
	["PET_025"] = "025",
	["PET_026"] = "026",
	["PET_027"] = "027",
	["PET_028"] = "028",
	["PET_029"] = "029",
	["PET_030"] = "030",
	["PET_031"] = "031",
	["PET_032"] = "032",
	["PET_033"] = "033",
	["PET_034"] = "034",
	["PET_035"] = "035",
	["PET_036"] = "036",
	["PET_037"] = "037",
	["PET_038"] = "038",
	["PET_039"] = "039"
}


--
-- Part1 Counter Kills
--

COUNT_KILLS_P1 = {
	"COUNT_KILLS_ANTLIONS",
	"COUNT_KILLS_ZOMBIES",
	"COUNT_KILLS_COMBINES",
	"COUNT_KILLS_REBELS",
	"COUNT_KILLS_VORTIGAUNTS",
	"COUNT_KILLS_HEADCRABS"
}

COUNT_KILLS_P1_SYNC_DB = {
	["COUNT_KILLS_ANTLIONS"] = "antlion-kills",
	["COUNT_KILLS_ZOMBIES"]  = "zombie-kills",
	["COUNT_KILLS_COMBINES"] = "combine-kills",
	["COUNT_KILLS_REBELS"] = "rebel-kills",
	["COUNT_KILLS_VORTIGAUNTS"] = "vortigaunt-kills",
	["COUNT_KILLS_HEADCRABS"] = "headcrab-kills"
}

/*
"TableToKeyValues"
{
	"counter"
	{
		"1"		"1" -- bone breaker ep2
		"2"		"0" -- hit and run ep1
		"3"		"0" -- antlion with cars ep1
		"4"		"0" -- with sniper alyx ep1
		"5"		"0" -- Legendary Finding Gear
		"6"		"0" -- Legendary Finding Material
		"7"		"0"
		"8"		"0"
		"9"		"0"
		"10"		"0"
		"11"		"0"
		"12"		"0"
		"13"		"0"
		"14"		"0"
		"15"		"0"
		"16"		"0"
		"17"		"0"
		"18"		"0"
		"19"		"0"
		"20"		"0"
		"21"		"0"
		"22"		"0"
		"23"		"0"
		"24"		"0"
		"25"		"0"
		"26"		"0"
		"27"		"0"
		"28"		"0"
		"29"		"0"
		"30"		"0"
		"31"		"0"
		"32"		"0"
		"33"		"0"
		"34"		"0"
		"35"		"0"
		"36"		"0"
		"37"		"0"
		"38"		"0"
		"39"		"0"
		"40"		"0"
		"41"		"0"
		"42"		"0"
		"43"		"0"
		"44"		"0"
		"45"		"0"
		"46"		"0"
		"47"		"0"
		"48"		"0"
		"49"		"0"
		"50"		"0"
		"51"		"0"
		"52"		"0"
		"53"		"0"
		"54"		"0"
		"55"		"0"
		"56"		"0"
		"57"		"0"
		"58"		"0"
		"59"		"0"
		"60"		"0"
		"61"		"0"
		"62"		"0"
		"63"		"0"
		"64"		"0"
		"65"		"0"
		"66"		"0"
		"67"		"0"
		"68"		"0"
		"69"		"0"
		"70"		"0"
		"71"		"0"
		"72"		"0"
		"73"		"0"
		"74"		"0"
		"75"		"0"
		"76"		"0"
		"77"		"0"
		"78"		"0"
		"79"		"0"
		"80"		"0"
		"81"		"0"
		"82"		"0"
		"83"		"0"
		"84"		"0"
		"85"		"0"
		"86"		"0"
		"87"		"0"
		"88"		"0"
		"89"		"0"
		"90"		"0"
		"91"		"0"
		"92"		"0"
		"93"		"0"
		"94"		"0"
		"95"		"0"
		"96"		"0"
		"97"		"0"
		"98"		"0"
		"99"		"0"
		"100"		"0"
	}
	"setup"
	{
		"1"		"0" -- secret hl2 ach
		"2"		"0" -- secret lostcoast ach
		"3"		"0" -- cop mask
		"4"		"0"
		"5"		"0"
		"6"		"0"
		"7"		"0"
		"8"		"0"
		"9"		"0"
		"10"		"0"
		"11"		"0"
		"12"		"0"
		"13"		"0"
		"14"		"0"
		"15"		"0"
		"16"		"0"
		"17"		"0"
		"18"		"0"
		"19"		"0"
		"20"		"0"
		"21"		"0"
		"22"		"0"
		"23"		"0"
		"24"		"0"
		"25"		"0"
		"26"		"0"
		"27"		"0"
		"28"		"0"
		"29"		"0"
		"30"		"0"
		"31"		"0"
		"32"		"0"
		"33"		"0"
		"34"		"0"
		"35"		"0"
		"36"		"0"
		"37"		"0"
		"38"		"0"
		"39"		"0"
		"40"		"0"
		"41"		"0"
		"42"		"0"
		"43"		"0"
		"44"		"0"
		"45"		"0"
		"46"		"0"
		"47"		"0"
		"48"		"0"
		"49"		"0"
		"50"		"0"
		"51"		"0"
		"52"		"0"
		"53"		"0"
		"54"		"0"
		"55"		"0"
		"56"		"0"
		"57"		"0"
		"58"		"0"
		"59"		"0"
		"60"		"0"
		"61"		"0"
		"62"		"0"
		"63"		"0"
		"64"		"0"
		"65"		"0"
		"66"		"0"
		"67"		"0"
		"68"		"0"
		"69"		"0"
		"70"		"0"
		"71"		"0"
		"72"		"0"
		"73"		"0"
		"74"		"0"
		"75"		"0"
		"76"		"0"
		"77"		"0"
		"78"		"0"
		"79"		"0"
		"80"		"0"
		"81"		"0"
		"82"		"0"
		"83"		"0"
		"84"		"0"
		"85"		"0"
		"86"		"0"
		"87"		"0"
		"88"		"0"
		"89"		"0"
		"90"		"0"
		"91"		"0"
		"92"		"0"
		"93"		"0"
		"94"		"0"
		"95"		"0"
		"96"		"0"
		"97"		"0"
		"98"		"0"
		"99"		"0"
		"100"		"0"
	}
}



*/