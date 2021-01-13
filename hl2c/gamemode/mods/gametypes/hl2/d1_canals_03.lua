NEXT_MAP = "d1_canals_05"

TRIGGER_CHECKPOINT = {
	{Vector(-1824.031250, -768.031250, -895.968750), Vector(-1935.968750, -1103.968750, -797.484070),false,function() end,Vector(-1866.323608, -845.938171, -880.348816)}
}


HL2_LUA_RUN_ONE = [[
local ent = ents.Create("npc_combine_assassin")
ent:SetPos( Vector(-1727.968750, 129.098190, -927.968750) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_assassin")
ent:SetPos( Vector(-1440.031250, 47.696598, -895.968750) )
ent:Spawn()
ent:Activate()
]]
HL2_LUA_RUN_TWO = [[
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(63.518456, -1213.853638, -896.314148) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(168.680710, -1200.078369, -896.314148) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(-258.617035, -1149.103394, -959.968750) )
ent:Spawn()
ent:Activate()
]]

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	for k, v in pairs(ents.FindByName("song_4")) do
		v:Fire("addoutput", "message music/hl2_song4.mp3")
	end
	
	for k, v in pairs(ents.FindByName("song20_submix4")) do
		v:Fire("addoutput", "message music/hl2_song20_submix4.mp3")
	end
	
	for k, v in pairs(ents.FindByName("song_hl1_stinger27")) do
		v:Fire("addoutput", "message music/stingers/hl1_stinger_song27.mp3")
	end
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_ambush_spawn")
	lua:SetKeyValue("Code", HL2_LUA_RUN_ONE)
	lua:Spawn()
	ents.GetMapCreatedEntity(2105):Fire("addoutput","OnSpawnNPC lr_ambush_spawn,RunCode,,1.0,-1")
	ents.GetMapCreatedEntity(2105):Fire("addoutput","OnSpawnNPC lr_ambush_spawn,Kill,,1.1,-1")
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_cops_spawn")
	lua:SetKeyValue("Code", HL2_LUA_RUN_TWO)
	lua:Spawn()
	ents.GetMapCreatedEntity(1962):Fire("addoutput","OnTrigger lr_cops_spawn,RunCode,,1.0,-1")
end

-- VORTEX_POS = Vector(-2383.986816, -1.512930, -890.624695)
VORTEX_POS = Vector(-1100.468750, -800.200378, -737.468750)

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT