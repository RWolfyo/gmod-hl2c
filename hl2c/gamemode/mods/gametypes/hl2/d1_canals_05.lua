NEXT_MAP = "d1_canals_06"



TRIGGER_VEHICLESPAWN = {
{Vector(7414.728516, 1545.904541, -445.968750), Vector(6816.353027, 1345.784912, -403.711975)}
}

TRIGGER_CHECKPOINT = {
	{Vector(4096, 1553, -463), Vector(4288, 1593, -352)},
	{Vector(7010, 1533, -448), Vector(7091, 1613, -327), false, function() 
	ALLOWED_VEHICLE = "Airboat" 
	NEW_VEHICLE_SPAWN = true
	for k, v in pairs(ents.FindByName("lr_sniper_spawn")) do
		v:Fire("RunCode")
	end
	end}
}

BRUSH_PLAYERCLIP = {

	{Vector(3733, 6690, -297), Vector(3822, 6591, -204)}
	
}

HL2_LUA_RUN_ONE = [[
local ent = ents.Create("npc_combine_sniper")
ent:SetPos( Vector(-26.574936, -1132.872559, -129.956329) )
ent:Spawn()
ent:Activate()
]]

-- Need Vehicle Brush
-- VORTEX_POS = Vector(-31.450768, -1500.551025, -57.354202)

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	for k, v in pairs(ents.FindByName("music_sewer")) do
		
		v:SetKeyValue("message", "music/hl2_song17.mp3")
		
	end
	
	for k, v in pairs(ents.FindByName("music_shanty")) do 
		v:SetKeyValue("message", "music/hl2_song33.mp3")
	end
	
	local relay = ents.Create("logic_relay")
	relay:SetKeyValue("targetname", "mod_relay")
	relay:Fire("addoutput", "OnTrigger ss_arlene_opengate,BeginSequence,,0,-1")
	relay:Spawn()
	
	for k, v in pairs(ents.FindByName("global_newgame_spawner_airboat")) do
		
		v:Fire("addoutput", "PlayerOn mod_relay,Trigger,,0.0,-1")
		v:Fire("addoutput", "PlayerOn mod_relay,Kill,,0.1,-1")
		
	end
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_sniper_spawn")
	lua:SetKeyValue("Code", HL2_LUA_RUN_ONE)
	lua:Spawn()
	--ents.GetMapCreatedEntity(1962):Fire("addoutput","OnTrigger lr_cops_spawn,RunCode,,1.0,-1")
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT