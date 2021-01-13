NEXT_MAP = "d3_citadel_03"

NEXT_MAP_PERCENT = 1

TRIGGER_DELAYMAPLOAD = {Vector(3781, 13186, 3900), Vector(3984, 13590, 4000)}

POD_SETPOS = true

-- VORTEX_POS = Vector(6959.968750, 800.026672, 2332.012939)

local MAPSCRIPT = {}

function MAPSCRIPT:EntityRemoved(ent)
	if ent:GetClass() == "point_viewcontrol" then
		POD_SETPOS = false
	end
end

function MAPSCRIPT:InitPost()
	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()
	change:Fire("Changelevel")
	

	
	for k, v in pairs(ents.FindByName("podride_song")) do
		v:SetKeyValue("message", "music/hl1_song5.mp3")
	end
	
end

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

return MAPSCRIPT