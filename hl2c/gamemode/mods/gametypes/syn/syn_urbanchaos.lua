--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--HL2MP_SPAWN_ENT = "info_player_start"
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"



HL2MP_IS_COOP_MAP = true
SYN_MAP = true
NEW_DIF = true
NEXT_MAP_TIME = 5

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
}

function MAPSCRIPT:InitPost()
/*
	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()
	local end1 = ents.FindByName("door05")
	end1[1]:Fire("addoutput", "OnFullyOpen hl2c_changelevel,Changelevel,,18,1")
	-- remove weapon remover on spawn fuck this stripper
	local remove1 = ents.FindByName("usedstripper")
	remove1[1]:Remove()	
*/
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	

	difficulty = 1 + ( math.Round( player.GetCount()/9,1 ) )

	GAMEMODE:DMSkills()
	if IsValid(pl) then
	pl:Give("weapon_crowbar")
	pl:Give("weapon_mp5k")
	end
end

return MAPSCRIPT