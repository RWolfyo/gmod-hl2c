INFO_PLAYER_SPAWN = {Vector(2895, -2262, -636), 90}

NEXT_MAP = "d1_canals_03"

BRUSH_PLAYERCLIP = {

	{Vector(2577, -2335, -728), Vector(3218, -2713, -397)}
	
}

HL2_LUA_RUN_ONE = [[
local ent = ents.Create("npc_combine_sniper")
ent:SetPos( Vector(1691.682007, -454.582642, -32.817234) )
ent:SetAngles( Angle(0, -179, 0) )
ent:Spawn()
ent:Activate()
ent:SetAngles( Angle(0, -179, 0) )
local ent = ents.Create("npc_combine_burner")
ent:SetPos( Vector(-24.251255, 1685.780151, -760.265869) )
ent:Spawn()
ent:Activate()
]]

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()

	for k, v in pairs(ents.FindByName("song1")) do
		v:Fire("addoutput", "message music/hl1_song6.mp3")
	end
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_sniper_spawn")
	lua:SetKeyValue("Code", HL2_LUA_RUN_ONE)
	lua:Spawn()
	ents.GetMapCreatedEntity(1626):Fire("addoutput","OnPass lr_sniper_spawn,RunCode,,1.0,-1")

end

-- VORTEX_POS = Vector(-199.081085, 1831.484619, -533.050110)
VORTEX_POS = Vector(1704.772339, -452.660706, -12.968750)
function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT