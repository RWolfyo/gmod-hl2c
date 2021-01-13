RESET_PL_INFO = true
INFO_PLAYER_SPAWN = {Vector(382.39, -9774.26, 92.03),0}
NEXT_MAP = "winter_lobby_2012"
HL2MP_IS_COOP_MAP = true

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	local remove_spawn = ents.FindByClass("info_player_deathmatch")
	for _, removal_spawn in pairs(remove_spawn) do
			removal_spawn:Remove()
	end
	
	local add_spawn = ents.Create("info_player_deathmatch")
	add_spawn:SetPos(Vector(382.39, -9774.26, 92.03) )
	add_spawn:Spawn()
	add_spawn:Activate()
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	
	pl:Give("weapon_crowbar")

end

return MAPSCRIPT