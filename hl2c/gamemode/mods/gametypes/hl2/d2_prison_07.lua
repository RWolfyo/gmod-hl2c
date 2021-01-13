NEXT_MAP = "d2_prison_08"

TRIGGER_CHECKPOINT = {
	{Vector(-529, -2946, -240), Vector(-359, -2897, -91)},
	{Vector(4538, -3949, -517), Vector(3789, -4047, -423)}

}
BRUSH_PLAYERCLIP = {

{Vector(-81.381927, -4021.858398, -61.227467), Vector(-494.677155, -4043.103027, 91.356087)},
{Vector(-680.748535, -4018.481689, 44.774460), Vector(-893.975220, -4041.807861, -84.661011)}

}

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

-- VORTEX_POS = Vector(744.668457, -4019.757080, -103.968750)
VORTEX_POS = Vector(-193.649399, -3648.031250, 156.910156)
HL2C_COMBINE_CLASS = "Prison"

HL2_LUA_RUN_ONE = [[
Hl2c.CombineLoyal()
]]
HL2_LUA_RUN_TWO = [[
Hl2c.CombineLoyalOver()
]]
HL2_LUA_RUN_THREE = [[
Hl2c.RemoveCombineLoyalSpawns()
Hl2c.AddCombineLoyalSpawn(Vector(3975.613037, -3388.013672, -415.968750))
Hl2c.AddCombineLoyalSpawn(Vector(4127.448730, -5014.384766, -543.968750))
Hl2c.AddCombineLoyalSpawn(Vector(3490.262939, -4033.301270, -415.968750))
]] 

function MAPSCRIPT:InitPost()
	
	ents.GetMapCreatedEntity(1410):Fire("addoutput", "OnTrigger lr_comevevent_off,RunCode,,1.0,-1") // "logic_croom2_assault_finished" Finish Wave when we stop combine loyal
	ents.GetMapCreatedEntity(1543):Fire("addoutput", "OnCase01 lr_comevevent_on,RunCode,,1.0,-1") // "logic_croom2_spawn_assault_wave" First Wave when we start combine loyal
	ents.GetMapCreatedEntity(1612):Fire("addoutput", "OnTrigger lr_setup_second_wave,RunCode,,1.0,-1") // When enter last room 5 clear old spawnpoints add new ones
	ents.GetMapCreatedEntity(1617):Fire("addoutput", "OnTrigger lr_comevevent_on,RunCode,,1.0,-1") // "logic_room5_begin_assault" When combine loyal starts
	ents.GetMapCreatedEntity(1620):Fire("addoutput", "OnTrigger lr_comevevent_off,RunCode,,1.0,-1") // "logic_room5_assault_finished" When combine loyal stops
	ents.GetMapCreatedEntity(2135):Fire("addoutput", "OnTrigger logic_finished_betrayal,Trigger,,15.0,-1") // 
	ents.GetMapCreatedEntity(2059):Fire("addoutput", "OnTrigger door_exit_gate_1,Open,,15.0,-1") // 
	
	local ent = ents.Create("info_player_combine")
	ent:SetPos( Vector(47.968750, -4101.895508, -39.968750) )
	ent:Spawn()
	ent:Activate()
	local ent = ents.Create("info_player_combine")
	ent:SetPos( Vector(-786.121460, -4626.053223, -39.968750) )
	ent:Spawn()
	ent:Activate()
	
	for k, v in pairs(ents.FindByName("music_waterroom")) do
		v:SetKeyValue("message", "music/hl1_song21.mp3")
	end
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_comevevent_on")
	lua:SetKeyValue("Code", HL2_LUA_RUN_ONE)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_comevevent_off")
	lua:SetKeyValue("Code", HL2_LUA_RUN_TWO)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_setup_second_wave")
	lua:SetKeyValue("Code", HL2_LUA_RUN_THREE)
	lua:Spawn()
end

return MAPSCRIPT
