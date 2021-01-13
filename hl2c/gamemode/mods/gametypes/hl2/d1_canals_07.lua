ALLOWED_VEHICLE = "Airboat"

NEXT_MAP = "d1_canals_08"

BRUSH_PLAYERCLIP = {

	{Vector(5802, 7656, -511), Vector(5559, 8696, -91)}
	
}
BRUSH_VEHICLECLIP = {

	{Vector(5802, 7656, -511), Vector(5559, 8696, -91)}
	
}
--Must Put a Prop Brush too

-- VORTEX_POS = Vector(6362.298340, 1251.864990, -194.684357)
VORTEX_POS = Vector(8460.866211, 2775.205078, 355.031250)

HL2_LUA_RUN_ONE = [[
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(10562.143555, 1950.175293, -255.968750) )
ent:Spawn()
ent:Activate()

local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(10390.396484, 1890.994629, -255.968750) )
ent:Spawn()
ent:Activate()
]]

HL2_LUA_RUN_TWO = [[
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(7830.388672, 1706.124390, -255.532166) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(8226.967773, 1955.213623, -255.968750) )
ent:Spawn()
ent:Activate()
]]

HL2_LUA_RUN_THREE = [[
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(7411.903320, 1638.691772, -383.968750) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(7375.418945, 1928.314697, -383.968750) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(7394.229492, 1548.077515, -383.968750) )
ent:Spawn()
ent:Activate()
]]
HL2_LUA_RUN_FOUR = [[

local ent = ents.Create("npc_combine_hg")
ent:SetPos( Vector(9066.255859, 1944.164917, -225.968750) )
ent:Spawn()
ent:Activate()

local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(8966.469727, 1795.309692, -255.968750) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(8940.584961, 1658.093384, -255.968750) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(8623.708984, 1790.500854, -255.968750) )
ent:Spawn()
ent:Activate()

local ent = ents.Create("npc_combine_hg")
ent:SetPos( Vector(10969.268555, 1855.879517, -228.614105) )
ent:Spawn()
ent:Activate()

local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(10603.705078, 1626.112061, -255.968750) )
ent:Spawn()
ent:Activate()
local ent = ents.Create("npc_combine_shield")
ent:SetPos( Vector(10641.092773, 2185.486816, -255.968750) )
ent:Spawn()
ent:Activate()
]]



-- On entering the building 1378 OnTrigger
-- On entering the building then go through turret 1945 OnTrigger
-- On entering the building then go through for open gate 2492 OnSpawnNPC
-- After finished gate and escape 1872 OnTrigger
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_enemy_spawn_1")
	lua:SetKeyValue("Code", HL2_LUA_RUN_ONE)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_enemy_spawn_2")
	lua:SetKeyValue("Code", HL2_LUA_RUN_TWO)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_enemy_spawn_3")
	lua:SetKeyValue("Code", HL2_LUA_RUN_THREE)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_enemy_spawn_4")
	lua:SetKeyValue("Code", HL2_LUA_RUN_FOUR)
	lua:Spawn()
	
	ents.GetMapCreatedEntity(1378):Fire("addoutput", "OnTrigger lr_enemy_spawn_1,RunCode,,1.0,-1")
	ents.GetMapCreatedEntity(1945):Fire("addoutput", "OnTrigger lr_enemy_spawn_2,RunCode,,1.0,-1")
	ents.GetMapCreatedEntity(2492):Fire("addoutput", "OnSpawnNPC lr_enemy_spawn_3,RunCode,,1.0,-1")
	ents.GetMapCreatedEntity(1872):Fire("addoutput", "OnTrigger lr_enemy_spawn_4,RunCode,,1.0,-1")
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT