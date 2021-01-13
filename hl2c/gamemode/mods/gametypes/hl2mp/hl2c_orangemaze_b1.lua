RESET_PL_INFO = true
-- INFO_PLAYER_SPAWN = {Vector(-2238.65, 3766.00, 156.03),0}

NEXT_MAP = "winter_lobby_2012"

HL2MP_IS_COOP_MAP = true
HL2MP_SPAWN_ENT = "info_player_spawn"
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	-- local add_spawn = ents.Create("info_player_deathmatch")
	-- add_spawn:SetPos(Vector( -2238.65, 3766.00, 156.03))
	-- add_spawn:Spawn()
	-- add_spawn:Activate()
end

function MAPSCRIPT:PlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
	pl:Give("weapon_crossbow")
end

return MAPSCRIPT