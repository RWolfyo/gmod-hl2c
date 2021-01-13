INFO_PLAYER_SPAWN = {Vector(4935, -2887, 4), 90}

NEXT_MAP = "d3_citadel_01"

--NEXT_MAP_TIME = 0

TRIGGER_CHECKPOINT = {
	-- 5653, -1239, 28
	{Vector(5553.580566, -1519.037354, 0.031250), Vector(5808.698242, -912.031250, 126.787323)},
	
	{Vector(5799.594238, -407.240967, 281.070709), Vector(5629.344727, -839.554871, 375.007690)},
	
	{Vector(8328, 1202, -412), Vector(8450, 1242, -292)},

	{Vector(8439, 974, -289), Vector(8323, 1086, -383)}
	
}

TRIGGER_DELAYMAPLOAD = {Vector(8321.934570, 1248.943115, -415.876740), Vector(8445.530273, 1376.347900, -290.214935)}


-- VORTEX_POS = Vector(5857.791992, 31.133974, 320.031250)
VORTEX_POS = Vector(7187.177734, -2378.332031, 1171.414062)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("gunship_music")) do
		v:SetKeyValue("message", "music/hl2_song28.mp3")
	end
	
	for k, v in pairs(ents.FindByName("allstridersdead_song")) do
		v:SetKeyValue("message", "music/hl2_song16.mp3")
	end
	for k, v in pairs(ents.FindInSphere( Vector(5079, -456, -101), 5 )) do
		if v:GetClass() == "item_battery" then
			
			v:Fire("addoutput", "OnCacheInteraction relay_achievement_cache_van,Trigger,,0.0,-1")
			
		end
	end
	
	
	local relay = ents.Create("logic_relay")
	relay:SetPos(Vector(1065, 353, -631))
	relay:SetKeyValue("targetname", "relay_achievement_cache_van")
	relay:SetKeyValue("spawnflags", "1")
	relay:SetKeyValue("StartDisabled", "0")
	relay:Fire("addoutput", "OnTrigger achievement_cache_van,FireEvent,,0.0,-1")
	relay:Spawn()
	relay:Activate()
	
	local achi = ents.Create("logic_achievement")
	achi:SetPos(Vector(1065, 353, -631))
	achi:SetKeyValue("targetname", "achievement_cache_van")
	achi:SetKeyValue("StartDisabled", "0")
	achi:SetKeyValue("AchievementEvent", "ACHIEVEMENT_EVENT_HL2_LAMDACACHE_WHITEVAN")
	achi["AchievementEvent"] = "ACHIEVEMENT_EVENT_HL2_LAMDACACHE_WHITEVAN"
	achi:Spawn()
	
	
	
	ents.WaitForEntityByName("replenish_3_trickle", function(ent)
		ent:SetKeyValue("maxallies","1")
		ent:SetKeyValue("maxmedics","1")
		ent:Fire("addoutput","SpawnAlly0 !self,Kill,,0.1,-1")
	end)
	ents.WaitForEntityByName("replenish_3", function(ent)
		ent:SetKeyValue("maxallies","1")
		ent:SetKeyValue("maxmedics","1")
		ent:Fire("addoutput","SpawnAlly0 !self,Kill,,0.1,-1")
	end)
	ents.WaitForEntityByName("replenish_2_trickle", function(ent)
		ent:SetKeyValue("maxallies","1")
		ent:SetKeyValue("maxmedics","1")
		ent:Fire("addoutput","SpawnAlly0 !self,Kill,,0.1,-1")
	end)
	ents.WaitForEntityByName("replenish_2", function(ent)
		ent:SetKeyValue("maxallies","1")
		ent:SetKeyValue("maxmedics","1")
		ent:Fire("addoutput","SpawnAlly0 !self,Kill,,0.1,-1")
	end)
	ents.WaitForEntityByName("replenish_1", function(ent)
		ent:SetKeyValue("maxallies","1")
		ent:SetKeyValue("maxmedics","1")
		ent:Fire("addoutput","SpawnAlly0 !self,Kill,,0.1,-1")
	end)
	ents.WaitForEntityByName("replenish_1_trickle", function(ent)
		ent:SetKeyValue("maxallies","1")
		ent:SetKeyValue("maxmedics","1")
		ent:Fire("addoutput","SpawnAlly0 !self,Kill,,0.1,-1")
	end)
	ents.WaitForEntityByName("replenish_0", function(ent)
		ent:SetKeyValue("maxallies","1")
		ent:SetKeyValue("maxmedics","1")
		ent:Fire("addoutput","SpawnAlly0 !self,Kill,,0.1,-1")
	end)
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_bugbait")
	--timer.Simple(4, function()
	--pl:SetAmmo( 0, "rpg_round")
	--end)
end

return MAPSCRIPT