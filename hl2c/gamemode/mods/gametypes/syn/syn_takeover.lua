if SERVER then
	resource.AddWorkshop("653488095")	--	TAKEOVER CONTENT
end


--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--HL2MP_SPAWN_ENT = "info_player_rebel"
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
SYN_MAP = true
NEXT_MAP_TIME = 5
NEW_DIF = true

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
	
	if IsValid(pl) then
	pl:Give("weapon_crowbar")
	end
	difficulty = 1
	
	/*
	game.ConsoleCommand("sk_combine_s_health 175\n")
	game.ConsoleCommand("sk_metropolice_health 175\n")
	game.ConsoleCommand("sk_combine_guard_health 225\n")
	game.ConsoleCommand("sk_zombie_health 150\n")
	game.ConsoleCommand("sk_zombie_poison_health 250\n")
	*/

end

return MAPSCRIPT