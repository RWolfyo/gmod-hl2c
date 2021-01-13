NEXT_MAP = "d3_c17_01"

TRIGGER_CHECKPOINT = {
	{Vector(-1013, 953, 960), Vector(-803, 1001, 1122)},
	{Vector(-496, 631, 928), Vector(-355, 672, 1083)},
	{Vector(-184, 388, 981), Vector(-247, 333, 1080)},
	{Vector(95, -26, 1044), Vector(156, 34, 1125)}
}

TRIGGER_DELAYMAPLOAD = {Vector(-954, -1049, 912), Vector(-868, -965, 995)}

HL2C_COMBINE_CLASS = "Prison"

HL2_LUA_RUN_ONE = [[
Hl2c.CombineLoyal()
]]
HL2_LUA_RUN_TWO = [[
Hl2c.CombineLoyalOver()
]]

local MAPSCRIPT = {}

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
end

-- VORTEX_POS = Vector(124.579613, 3260.870850, 1500.031250)

HL2_LUA_RUN_ONE = [[
Hl2c.CombineLoyal()
]]
HL2_LUA_RUN_TWO = [[
Hl2c.CombineLoyalOver()
]]

Hl2c.Spawn_shield = {
-- Vector(-2204.344727, 1941.717651, 960.031250),
-- Vector(-2144.698730, 1940.694458, 960.031250),
-- Vector(-2079.276367, 1954.833130, 960.031250),
-- Vector(-2054.712891, 1717.484375, 960.031250),
Vector(-2125.872559, 1718.704956, 960.031250)
}
Hl2c.Spawn_burner = {
-- Vector(-2379.244141, 1943.837036, 960.031250),
-- Vector(-2440.705322, 1664.533936, 960.031250),
Vector(-2425.303467, 1247.948364, 960.031250)
}
Hl2c.Spawn_medic = {
-- Vector(-2185.518555, 1719.728027, 960.031250),
-- Vector(-2007.832642, 1604.619385, 960.031250),
Vector(-2195.518066, 1482.350342, 960.031250)
}
Hl2c.Spawn_heavy = {
Vector(-2302.729248, 1189.807007, 960.031250)
}
Hl2c.Spawn_assassin = {
Vector(-2122.655273, 1259.558228, 960.031250),
-- Vector(-2413.647705, 2448.435303, 960.031250),
Vector(-1883.872925, 1659.791748, 960.031250)
}

HL2_LUA_RUN_THREE = [[
//Ambush attack some shield
for k, v in pairs(Hl2c.Spawn_shield) do
local ent = ents.Create("npc_combine_shield")
ent:SetPos( v + Vector(0,0,30) )
ent:Spawn()
ent:Activate()
end

//Amubsh burner
for k, v in pairs(Hl2c.Spawn_burner) do
local ent = ents.Create("npc_combine_burner")
ent:SetPos( v + Vector(0,0,30) )
ent:Spawn()
ent:Activate()
end



//Ambush Medic
for k, v in pairs(Hl2c.Spawn_medic) do
local ent = ents.Create("npc_combine_medic")
ent:SetPos( v + Vector(0,0,30) )
ent:Spawn()
ent:Activate()
end

//Ambush Assassin
for k, v in pairs(Hl2c.Spawn_assassin) do
local ent = ents.Create("npc_combine_assassin")
ent:SetPos( v + Vector(0,0,30) )
ent:Spawn()
ent:Activate()
end

//Ambush Heavy
for k, v in pairs(Hl2c.Spawn_heavy) do
local ent = ents.Create("npc_combine_hg")
ent:SetPos( v + Vector(0,0,30) )
ent:Spawn()
ent:Activate()
end

]]

function MAPSCRIPT:InitPost()
	--aft = ents.Create("ai_goal_follow")
	--aft:SetPos(Vector(1065, 353, -631))
	--aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	--aft:SetKeyValue("actor", "alyx")
	--aft:SetKeyValue("goal", "!player")
	--aft:Spawn()
	
	--local timer = ents.Create( "logic_timer" )
	--timer:SetPos(Vector(1066, 353, -631))
	--timer:SetKeyValue( "RefireTime", "5" )
	--timer:SetKeyValue( "targetname", "hl2c_timer_follow" )
	--timer:SetKeyValue( "StartDisabled", "0" )
	--timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "25")
	--timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "25")
	--timer:Spawn()
	Hl2c.AddCombineLoyalSpawn( Vector(-450.412933, 138.662064, 1216.031250) )
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_comevevent_on")
	lua:SetKeyValue("Code", HL2_LUA_RUN_ONE)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_comevevent_off")
	lua:SetKeyValue("Code", HL2_LUA_RUN_TWO)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_ambush")
	lua:SetKeyValue("Code", HL2_LUA_RUN_THREE)
	lua:Spawn()
	
	ents.GetMapCreatedEntity(1643):Fire("addoutput", "OnTrigger lr_comevevent_on,RunCode,,1.0,-1") // logic_relay for combine wave start Loyal to Combine
	ents.GetMapCreatedEntity(1589):Fire("addoutput", "OnStart lr_comevevent_off,RunCode,,1.0,-1") // logic_chereograph for combine wave stop Loyal to Combine
	ents.GetMapCreatedEntity(2166):Fire("addoutput", "OnTrigger lr_ambush,RunCode,,4.0,-1") // Combine Ambush
end

return MAPSCRIPT