ALLOWED_VEHICLE = "Jeep"

INFO_PLAYER_SPAWN = {Vector(-14200, 12494, 562), 0}

NEXT_MAP = "d2_coast_10"


TRIGGER_CHECKPOINT = {
	{Vector(10878, 8423, -183), Vector(11072, 8677, -148)}
}

if file.Exists("hl2c_data/hl2c_d2_coast_08.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_d2_coast_08.txt")
end

/*
setpos 11374.159180 3735.172852 272.392731;setang 48.663143 -106.726418 0.000000
VorTex point
*/

-- VORTEX_POS = Vector(11374.159180, 3735.172852, 272.392731)
VORTEX_POS = Vector(11073.023438, 9034.624023, 737.161255)
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
end

function MAPSCRIPT:InitPost()
	
	for k, v in pairs(ents.FindByName("song_zombietunnel")) do
		v:SetKeyValue("message", "music/hl2_song11.mp3")
	end
	
	for k, v in pairs(ents.FindByName("song_rollerhouse")) do
		v:SetKeyValue("message", "music/hl2_song8.mp3")
	end
	
end

return MAPSCRIPT