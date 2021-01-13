NEXT_MAP = "d1_town_01"
--EXTRA_MAP = "t0a0"

TRIGGER_CHECKPOINT = {
	{Vector(-684, 845, -2688), Vector(-501, 886, -2567)},
	{Vector(-1427, 25, -2671), Vector(-1201, -136, -2575)},
	{Vector(-706, 1212, -2688), Vector(-524, 1253, -2567)},
	{Vector(-1939, 1833, -2736), Vector(-1897, 2001, -2629),false,function() 
	timer.Simple(0.1,function()
		for _, pl in pairs(player.GetAll() ) do
			if pl and IsValid(pl) and pl.setup_achi and pl:Team() != TEAM_COMPLETED_MAP then
				pl:Teleport(Vector(-2064.892334, 1895, -2635))
			end
		end
	end)
	end,Vector(-1962.892334, 1934.844971, -2710.055420)}
}

local MAPSCRIPT = {}

function MAPSCRIPT:EntityRemoved(ent)
/*
	if ent:GetName() == "hl2c_easteregg" then
		for _, pl in pairs(player.GetAll()) do
			pl:EmitSound("music/radio1.mp3", 75, 100, 1, CHAN_STATIC)
		end
	end
*/
	
	if ent:GetName() == "gravgun_prop" then
		ALLOW_GRAVGUN = true
		for _, pl in pairs(player.GetAll()) do
		if pl:IsValid() and pl:Alive() and pl:Team() == TEAM_ALIVE then
			pl:Give("weapon_physcannon")
		end
		end
		Hl2c.DefaultChatPrint("[hl2c] Gravity Gun is Available!")
	end
end

-- VORTEX_POS = Vector(-406.598541, 344.663269, -2213.650146)

function MAPSCRIPT:InitPost()
	--local wep = ents.Create("weapon_physcannon")
	--wep:SetPos(Vector(-473, 814, -2590))
	--wep:Spawn()
	--wep:Activate()
	/*
	if (IsMounted("hl1") && !game.IsDedicated(true)) then
		if GetConVarNumber("hl2c_additions") >= 1 then
			local change2 = ents.Create("point_changelevel_extra")
			change2:SetPos(Vector(-183, 855, -2446))
			change2:SetKeyValue("targetname", "hl2c_changelevel_extra")
			change2:Spawn()
			change2:Activate()
			
			local photo = ents.Create("prop_physics_override")
			photo:SetPos(Vector(-2381, -421, -2679))
			photo:SetKeyValue("targetname", "hl2c_easteregg")
			photo:SetKeyValue("angles", "0 180 0")
			photo:SetKeyValue("spawnflags", "8448")
			photo:SetKeyValue("health", "1")
			photo:SetKeyValue("model", "models/props_lab/frame002a.mdl")
			photo:Spawn()
			photo:Activate()
			photo:Fire("addoutput", "OnPlayerPickup hl2c_changelevel_extra,Changelevel,,6.0,-1", "1.0")
			photo:Fire("addoutput", "OnPlayerPickup hl2c_shake,StartShake,,0.0,-1", "1.0")
			photo:Fire("addoutput", "OnPlayerPickup hl2c_fade,Fade,,0.0,-1", "1.0")
			photo:Fire("addoutput", "OnPlayerPickup hl2c_easteregg,Kill,,0.5,-1", "1.0")
			
			local sound = ents.Create("env_shake")
			sound:SetPos(Vector(-189, 736, -2487))
			sound:SetKeyValue("targetname", "hl2c_shake")
			sound:SetKeyValue("amplitude", "16")
			sound:SetKeyValue("duration", "40")
			sound:SetKeyValue("frequency", "255.0")
			sound:SetKeyValue("spawnflags", "29")
			sound:Spawn()
			sound:Activate()
			
			local fade1 = ents.Create("env_fade")
			fade1:SetPos(Vector(-184, 855, -2446))
			fade1:SetKeyValue("targetname", "hl2c_fade")
			fade1:SetKeyValue("duration", "4")
			fade1:SetKeyValue("spawnflags", "8")
			fade1:SetKeyValue("rendercolor", "255 255 255")
			fade1:Spawn()
			fade1:Activate()
		end
	end
	*/
	
	-- airlock_south_door_exit
	-- brush_doorAirlock_PClip_2
	ents.WaitForEntityByName("trigger_attack02", function(ent)
		ent:Fire("addoutput","OnTrigger airlock_south_door_exit,Open,,0.2,-1")
		ent:Fire("addoutput","OnTrigger brush_doorAirlock_PClip_2,Disable,,0.2,-1")
	end)
	for k, v in pairs(ents.FindByName("song_eli_02_scrapyard")) do
		v:SetKeyValue("message", "music/hl1_song3.mp3")
	end
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	if ALLOW_GRAVGUN then
	pl:Give("weapon_physcannon")
	end
end

return MAPSCRIPT