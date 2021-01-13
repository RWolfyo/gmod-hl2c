if SERVER then AddCSLuaFile() end

Hl2c.Ach = Hl2c.Ach or {}

include("ach/sh_hl2_ach.lua")
include("ach/sh_lambda.lua")
include("ach/sh_ep1_ach.lua")
include("ach/sh_ep2_ach.lua")
include("ach/sh_gen_ach.lua")
include("ach/sh_ach_title.lua")
-- HL2_LAMDACACHE_COUNT_MAT = ""



EP2_P3_ACH_LIST = {


}
/*
EP2 Ach
Hot Potat0wned
Kill a Combine soldier with his own grenade.

Grave Robber
Steal a Zombine's grenade.
*/




Hl2c.Ach.Text = {}
Hl2c.Ach.Material = {}

-- Hl2c.Ach.Detail = {}
-- Hl2c.Ach.Mat = {}
Hl2c.Ach.Hl2 = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Hl2Lambda = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Ep1 = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Ep2 = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Ep2WebCache = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Ep2Lambda = {
	[1] = {
	Id = "",
	Title = "",
	Detail = "",
	Material = "",
	}
}
Hl2c.Ach.Ep3 = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Cd = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Meta = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Coastline = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}


Hl2c.Ach.Custom = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- },
}
Hl2c.Ach.Syn = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}
Hl2c.Ach.Oc = {
	-- [1] = {
	-- Id = "",
	-- Title = "",
	-- Detail = "",
	-- Material = "",
	-- }
}

SECRET_ACHIEVEMENT_HL2_ID = "ACHIEVEMENT_EVENT_HL2_SECRET_BOX"
SECRET_ACHIEVEMENT_HL2_TITLE = "Gman Hmmm... (SECRET)"
SECRET_ACHIEVEMENT_HL2_DETAIL = "Find the mystic secret in Half-Life 2"
SECRET_ACHIEVEMENT_HL2_MATERIAL = "vgui/achievements/hl2_beat_game"


SECRET_ACHIEVEMENT_LT_ID = "ACHIEVEMENT_EVENT_LT_SECRET_BOAT"
SECRET_ACHIEVEMENT_LT_TITLE = "My boat... (SECRET)"
SECRET_ACHIEVEMENT_LT_DETAIL = "Get Into Lostcoast"
SECRET_ACHIEVEMENT_LT_MATERIAL = "vgui/achievements/hl2_beat_game"

SECRET_ACHIEVEMENT_EP2_ID = "ACHIEVEMENT_EVENT_EP2_SECRET_FIST"
SECRET_ACHIEVEMENT_EP2_TITLE = "Taste my fist... (SECRET)"
SECRET_ACHIEVEMENT_EP2_DETAIL = "Find the AR3"
SECRET_ACHIEVEMENT_EP2_MATERIAL = "vgui/achievements/hl2_beat_game"

SECRET_ACHIEVEMENT_MASK1_ID = "ACHIEVEMENT_EVENT_MASK1_SECRET"
SECRET_ACHIEVEMENT_MASK1_TITLE = "My Mask... (SECRET)"
SECRET_ACHIEVEMENT_MASK1_DETAIL = "Find a Cop Mask"
SECRET_ACHIEVEMENT_MASK1_MATERIAL = "vgui/achievements/hl2_beat_game"

Hl2c.Ach.XP={}
Hl2c.Ach.XP["ACHIEVEMENT_EVENT_MASK1_SECRET"]=500