local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(120,-3275,339),90}
CD_MAP = true
NEXT_MAP = "winter_lobby_2012"
/*
RESPAWN_ALLOWED = true

TRIGGER_CHECKPOINT = {
	{Vector(394, -6942, 531), Vector(434, -7104, 576)},
	{Vector(386, -4257, 523), Vector(447, -4206, 563)},
	{Vector(824, 2605, -37), Vector(887, 2668, 49)},
	{Vector(704, 2707, -94), Vector(747, 2759, 3)}
}

BRUSH_PLAYERCLIP = {

	{Vector(1461, -8257, 221), Vector(1481, -8317, 340)}
	
}
*/


TRIGGER_DELAYMAPLOAD = {Vector(-321.844727, 8392.447266, 307.973785), Vector(506.656921, 7895.273926, 1034.203247)}

VORTEX_POS = Vector(-33.157848, -2828.401611, 102.031250)

hook.Add("InitPostEntity", "hl2cInitPostEntity", function()
	
	
	--[[
	local point_t = ents.Create("point_trigger")
	--	COMBINE DESTINY END TRIGGER
	point_t:SetPos(Vector(133, 7168, 349))
	point_t:SetKeyValue("origin", "133 7168 349")
	point_t:SetKeyValue("targetname", "debug_point_trigger")
	point_t:SetKeyValue("spawnflags", "1")
	point_t:SetKeyValue("StartDisabled", "1")
	point_t:SetKeyValue("TriggerRadius", "520")
	point_t:SetKeyValue("TriggerOnce", "1")
	/*
	{
		"OnTrigger" "fade_end,Fade,,0,1"
		"OnTrigger" "Credits,RollOutroCredits,,5,1"
		"OnTrigger" "viewcontrol_bg1,Enable,,4,1"
		"OnTrigger" "weapons_gone,StripWeaponsAndSuit,,4,-1"
		"OnTrigger" "end_theme,PlaySound,,4,1"
		"OnTrigger" "music_end,Volume,0,4,1"
	}
	*/
	--point_t:Fire("addoutput", "OnStartTouch !self,Kill,,0.1,1")
	point_t:Fire("addoutput", "OnStartTouch fade_end,Fade,,1.0,1")
	point_t:Fire("addoutput", "OnStartTouch Credits,RollOutroCredits,,5.0,1")
	point_t:Fire("addoutput", "OnStartTouch end_theme,PlaySound,,4.0,1")
	point_t:Fire("addoutput", "OnStartTouch music_end,Volume,0,4.0,1")
	point_t:Fire("addoutput", "OnStartTouch hl2c_endgame,EndGame,,1.0,1")
	point_t:Spawn()
	point_t:Activate()
	]]--
	for k, v in pairs(ents.FindByClass("point_viewcontrol")) do
		v:Remove()
	end
	
	for k, v in pairs(ents.FindInSphere(Vector(88, 6688, 628),10)) do
		--v:Remove()
		v:Fire("addoutput", "OnTrigger end_game,EndGame,,1.0,1")
	end
	
	for k, v in pairs(ents.FindByName("path4")) do
		v:Fire("addoutput", "OnPass debug_point_trigger,Enable,,5.0,1")
	end
	
end)

function MAPSCRIPT:PostPlayerSpawn(pl)
	NEXT_MAP_TIME = 15
	NEXT_MAP_TIME_CLASSIC = 15
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
end

return MAPSCRIPT
