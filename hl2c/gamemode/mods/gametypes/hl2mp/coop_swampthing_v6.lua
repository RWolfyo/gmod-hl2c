RESET_PL_INFO = true

NEXT_MAP = "winter_lobby_2012"

HL2MP_IS_COOP_MAP = true


local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["usedstripper"] = true,
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
	game.ConsoleCommand("sk_helicopter_blast_push 0\n")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_slam")
	pl:Give("weapon_frag")
end

return MAPSCRIPT