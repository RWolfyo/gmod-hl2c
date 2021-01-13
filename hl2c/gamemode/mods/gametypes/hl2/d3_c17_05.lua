
NEXT_MAP = "d3_c17_06a"	//Add Next Map

--Create Checkpoints
TRIGGER_CHECKPOINT = {

	{Vector(1802, -3594, 469), Vector(1686, -3636, 582)}

}

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("song_cut")) do
		v:SetKeyValue("message", "music/hl2_song12_long.mp3")
	end
	
end

-- VORTEX_POS = Vector(1040.031250, -4830.156250, 319.998962)
VORTEX_POS = Vector(3234.590332, -3894.770996, 1239.011353)
function MAPSCRIPT:PostPlayerSpawn(pl)

	--Give items
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