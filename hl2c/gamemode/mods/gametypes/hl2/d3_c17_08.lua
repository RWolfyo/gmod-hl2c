NEXT_MAP = "d3_c17_10a"

TRIGGER_CHECKPOINT = {

	{Vector( 1406, -662, 93 ), Vector( 1257, -827, 172 )},
	{Vector( 1187, 462, 402 ), Vector( 891, 630, 536 )}
}

-- VORTEX_POS = Vector(918.942261, 332.436646, 882.349976)
VORTEX_POS = Vector(-1036.635620, -1232.031250, 491.031250)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("song_hl1_14")) do
		v:SetKeyValue("message", "music/hl1_song14.mp3")
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