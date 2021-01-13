if SERVER then AddCSLuaFile() end 

// Models the player is restricted by
PLAYER_MODELS = {
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_06.mdl",
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
	--"models/player/group03/female_01.mdl",
	--"models/player/group03/female_02.mdl",
	--"models/player/group03/female_03.mdl",
	--"models/player/group03/female_04.mdl",
	--"models/player/group03/female_06.mdl",
	--"models/player/group03/male_01.mdl",
	--"models/player/group03/male_02.mdl",
	--"models/player/group03/male_04.mdl",
	--"models/player/group03/male_05.mdl",
	--"models/player/group03/male_06.mdl",
	--"models/player/group03/male_07.mdl",
	--"models/player/group03/male_08.mdl",
	--"models/player/group03/male_09.mdl",
	--"models/player/group03m/female_01.mdl",
	--"models/player/group03m/female_02.mdl",
	--"models/player/group03m/female_03.mdl",
	--"models/player/group03m/female_04.mdl",
	--"models/player/group03m/female_06.mdl",
	--"models/player/group03m/male_01.mdl",
	--"models/player/group03m/male_02.mdl",
	--"models/player/group03m/male_03.mdl",
	--"models/player/group03m/male_04.mdl",
	--"models/player/group03m/male_05.mdl",
	--"models/player/group03m/male_06.mdl",
	--"models/player/group03m/male_07.mdl",
	--"models/player/group03m/male_08.mdl",
	--"models/player/group03m/male_09.mdl",
	-- "models/romsn/gordon_player.mdl"
}



// Determine between female or male
PLAYER_MODELS_MALE = {
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
	--"models/player/group03/male_01.mdl",
	--"models/player/group03/male_02.mdl",
	--"models/player/group03/male_03.mdl",
	--"models/player/group03/male_04.mdl",
	--"models/player/group03/male_05.mdl",
	--"models/player/group03/male_06.mdl",
	--"models/player/group03/male_07.mdl",
	--"models/player/group03/male_08.mdl",
	--"models/player/group03/male_09.mdl",
	--"models/player/group03m/male_01.mdl",
	--"models/player/group03m/male_02.mdl",
	--"models/player/group03m/male_03.mdl",
	--"models/player/group03m/male_04.mdl",
	--"models/player/group03m/male_05.mdl",
	--"models/player/group03m/male_06.mdl",
	--"models/player/group03m/male_07.mdl",
	--"models/player/group03m/male_08.mdl",
	--"models/player/group03m/male_09.mdl",
	-- "models/romsn/gordon_player.mdl"
}


// Determine between female or male
PLAYER_MODELS_FEMALE = {
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_06.mdl",
	--"models/player/group03/female_01.mdl",
	--"models/player/group03/female_02.mdl",
	--"models/player/group03/female_03.mdl",
	--"models/player/group03/female_04.mdl",
	--"models/player/group03/female_06.mdl",
	--"models/player/group03m/female_01.mdl",
	--"models/player/group03m/female_02.mdl",
	--"models/player/group03m/female_03.mdl",
	--"models/player/group03m/female_04.mdl",
	--"models/player/group03m/female_06.mdl"
}


// Combine Playermodels are also given a hurt sound so they're not left out.
PLAYER_MODELS_COMBINE = {
	"models/player/combine_soldier.mdl",
	"models/player/combine_soldier_prisonguard.mdl",
	"models/player/combine_super_soldier.mdl",
	"models/shotgun_soldier.mdl",
	-- Metrocop playermodels are going to be in the same catergory because I'm too lazy to add more.
	"models/player/police.mdl",
	
}
PLAYER_MODELS_COMBINE_SUIT = {
	["models/player/combine_soldier.mdl"] = true,
	["models/player/combine_soldier_prisonguard.mdl"] = true,
	["models/player/combine_super_soldier.mdl"] = true,
	["models/shotgun_soldier.mdl"] = true,
	-- Metrocop playermodels are going to be in the same catergory because I'm too lazy to add more.
	["models/player/police.mdl"] = true,
	
}

// Head models
HL2C_REBEL_HEAD = {
	["models/player/group01/female_01.mdl"] = true,
	["models/player/group01/female_02.mdl"] = true,
	["models/player/group01/female_03.mdl"] = true,
	["models/player/group01/female_04.mdl"] = true,
	["models/player/group01/female_05.mdl"] = true,
	["models/player/group01/female_06.mdl"] = true,
	["models/player/group01/male_01.mdl"] = true,
	["models/player/group01/male_02.mdl"] = true,
	["models/player/group01/male_03.mdl"] = true,
	["models/player/group01/male_04.mdl"] = true,
	["models/player/group01/male_05.mdl"] = true,
	["models/player/group01/male_06.mdl"] = true,
	["models/player/group01/male_07.mdl"] = true,
	["models/player/group01/male_08.mdl"] = true,
	["models/player/group01/male_09.mdl"] = true,
	-- ["models/romsn/gordon_player.mdl"] = true,

}
HL2C_REBEL_MALE = {
	["models/player/group01/male_01.mdl"] = true,
	["models/player/group01/male_02.mdl"] = true,
	["models/player/group01/male_03.mdl"] = true,
	["models/player/group01/male_04.mdl"] = true,
	["models/player/group01/male_05.mdl"] = true,
	["models/player/group01/male_06.mdl"] = true,
	["models/player/group01/male_07.mdl"] = true,
	["models/player/group01/male_08.mdl"] = true,
	["models/player/group01/male_09.mdl"] = true,
}
HL2C_REBEL_FEMALE = {
	["models/player/group01/female_01.mdl"] = true,
	["models/player/group01/female_02.mdl"] = true,
	["models/player/group01/female_03.mdl"] = true,
	["models/player/group01/female_04.mdl"] = true,
	["models/player/group01/female_05.mdl"] = true,
	["models/player/group01/female_06.mdl"] = true,
}

HL2C_GORDON_HEAD = {
	["models/player/gordon_citizen.mdl"] = true,
}

HL2C_CITIZEN_SUIT = {
	["models/player/group01/female_01.mdl"] = true,
	["models/player/group01/female_02.mdl"] = true,
	["models/player/group01/female_03.mdl"] = true,
	["models/player/group01/female_04.mdl"] = true,
	["models/player/group01/female_05.mdl"] = true,
	["models/player/group01/female_06.mdl"] = true,
	["models/player/group01/male_01.mdl"] = true,
	["models/player/group01/male_02.mdl"] = true,
	["models/player/group01/male_03.mdl"] = true,
	["models/player/group01/male_04.mdl"] = true,
	["models/player/group01/male_05.mdl"] = true,
	["models/player/group01/male_06.mdl"] = true,
	["models/player/group01/male_07.mdl"] = true,
	["models/player/group01/male_08.mdl"] = true,
	["models/player/group01/male_09.mdl"] = true,
	["models/player/gordon_citizen.mdl"] = true,
}
HL2C_CITIZEN_SUIT_LIST = {
	"models/player/group01/female_01.mdl",
	"models/player/group01/female_02.mdl",
	"models/player/group01/female_03.mdl",
	"models/player/group01/female_04.mdl",
	"models/player/group01/female_05.mdl",
	"models/player/group01/female_06.mdl",
	"models/player/group01/male_01.mdl",
	"models/player/group01/male_02.mdl",
	"models/player/group01/male_03.mdl",
	"models/player/group01/male_04.mdl",
	"models/player/group01/male_05.mdl",
	"models/player/group01/male_06.mdl",
	"models/player/group01/male_07.mdl",
	"models/player/group01/male_08.mdl",
	"models/player/group01/male_09.mdl",
	"models/player/gordon_citizen.mdl",
}

HL2C_REBEL_SUIT = {
	["models/player/group03/male_01.mdl"] = true,
	["models/player/group03/male_02.mdl"] = true,
	["models/player/group03/male_03.mdl"] = true,
	["models/player/group03/male_04.mdl"] = true,
	["models/player/group03/male_05.mdl"] = true,
	["models/player/group03/male_06.mdl"] = true,
	["models/player/group03/male_07.mdl"] = true,
	["models/player/group03/male_08.mdl"] = true,
	["models/player/group03/male_09.mdl"] = true,
	["models/player/group03/female_01.mdl"] = true,
	["models/player/group03/female_02.mdl"] = true,
	["models/player/group03/female_03.mdl"] = true,
	["models/player/group03/female_04.mdl"] = true,
	["models/player/group03/female_06.mdl"] = true,
}

HL2C_REBEL_MALE_SUIT = {
	["models/player/group03/male_01.mdl"] = true,
	["models/player/group03/male_02.mdl"] = true,
	["models/player/group03/male_03.mdl"] = true,
	["models/player/group03/male_04.mdl"] = true,
	["models/player/group03/male_05.mdl"] = true,
	["models/player/group03/male_06.mdl"] = true,
	["models/player/group03/male_07.mdl"] = true,
	["models/player/group03/male_08.mdl"] = true,
	["models/player/group03/male_09.mdl"] = true,
	-- ["models/player/group03/female_01.mdl"] = true,
	-- ["models/player/group03/female_02.mdl"] = true,
	-- ["models/player/group03/female_03.mdl"] = true,
	-- ["models/player/group03/female_04.mdl"] = true,
	-- ["models/player/group03/female_06.mdl"] = true,
}
HL2C_REBEL_FEMALE_SUIT = {
	-- ["models/player/group03/male_01.mdl"] = true,
	-- ["models/player/group03/male_02.mdl"] = true,
	-- ["models/player/group03/male_03.mdl"] = true,
	-- ["models/player/group03/male_04.mdl"] = true,
	-- ["models/player/group03/male_05.mdl"] = true,
	-- ["models/player/group03/male_06.mdl"] = true,
	-- ["models/player/group03/male_07.mdl"] = true,
	-- ["models/player/group03/male_08.mdl"] = true,
	-- ["models/player/group03/male_09.mdl"] = true,
	["models/player/group03/female_01.mdl"] = true,
	["models/player/group03/female_02.mdl"] = true,
	["models/player/group03/female_03.mdl"] = true,
	["models/player/group03/female_04.mdl"] = true,
	["models/player/group03/female_06.mdl"] = true,
}
HL2C_REBEL_SUIT_LIST = {
	"models/player/group03/male_01.mdl",
	"models/player/group03/male_02.mdl",
	"models/player/group03/male_03.mdl",
	"models/player/group03/male_04.mdl",
	"models/player/group03/male_05.mdl",
	"models/player/group03/male_06.mdl",
	"models/player/group03/male_07.mdl",
	"models/player/group03/male_08.mdl",
	"models/player/group03/male_09.mdl",
	"models/player/group03/female_01.mdl",
	"models/player/group03/female_02.mdl",
	"models/player/group03/female_03.mdl",
	"models/player/group03/female_04.mdl",
	"models/player/group03/female_06.mdl",
}

HL2C_HEV_SUIT = {
	-- ["models/romsn/gordon_player.mdl"] = true
	["models/player/gordon_hev.mdl"] = true
}
HL2C_HEV_SUIT_LIST = {
	-- ["models/romsn/gordon_player.mdl"] = true
	"models/player/gordon_hev.mdl"
}

HL2C_COMBINE_SUIT_LIST = {
	["models/player/combine_soldier.mdl"] = true,
	["models/player/combine_soldier_prisonguard.mdl"] = true,
	["models/player/combine_super_soldier.mdl"] = true,
	["models/shotgun_soldier.mdl"] = true,
	["models/player/police.mdl"] = true,
}

HL2C_ALL_PLAYER_MODELS = {
	["models/player/group01/female_01.mdl"] = true,
	["models/player/group01/female_02.mdl"] = true,
	["models/player/group01/female_03.mdl"] = true,
	["models/player/group01/female_04.mdl"] = true,
	["models/player/group01/female_05.mdl"] = true,
	["models/player/group01/female_06.mdl"] = true,
	["models/player/group01/male_01.mdl"] = true,
	["models/player/group01/male_02.mdl"] = true,
	["models/player/group01/male_03.mdl"] = true,
	["models/player/group01/male_04.mdl"] = true,
	["models/player/group01/male_05.mdl"] = true,
	["models/player/group01/male_06.mdl"] = true,
	["models/player/group01/male_07.mdl"] = true,
	["models/player/group01/male_08.mdl"] = true,
	["models/player/group01/male_09.mdl"] = true,
	["models/player/gordon_citizen.mdl"] = true,
	["models/player/gordon_hev.mdl"] = true,
	["models/player/combine_soldier.mdl"] = true,
	["models/player/combine_soldier_prisonguard.mdl"] = true,
	["models/player/combine_super_soldier.mdl"] = true,
	["models/shotgun_soldier.mdl"] = true,
	["models/player/police.mdl"] = true,


	["models/player/group03/male_01.mdl"] = true,
	["models/player/group03/male_02.mdl"] = true,
	["models/player/group03/male_03.mdl"] = true,
	["models/player/group03/male_04.mdl"] = true,
	["models/player/group03/male_05.mdl"] = true,
	["models/player/group03/male_06.mdl"] = true,
	["models/player/group03/male_07.mdl"] = true,
	["models/player/group03/male_08.mdl"] = true,
	["models/player/group03/male_09.mdl"] = true,
	["models/player/group03/female_01.mdl"] = true,
	["models/player/group03/female_02.mdl"] = true,
	["models/player/group03/female_03.mdl"] = true,
	["models/player/group03/female_04.mdl"] = true,
	["models/player/group03/female_06.mdl"] = true,
	
	["models/player/breen.mdl"] = true,
	
	
	[""] = false,
	[" "] = false,
	["  "] = false,
	["   "] = false,
	["    "] = false,
}