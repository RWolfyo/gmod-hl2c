
NEXT_MAP = "d3_c17_06b"	//Add Next Map

	--Create Checkpoints
TRIGGER_CHECKPOINT = {

	{Vector(2638, 1947, -302), Vector(3036, 1681, -218)}

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
	
	for k, v in pairs(ents.FindByName("song_hl1_5")) do
		v:SetKeyValue("message", "music/hl1_song5.mp3")
	end
	
end

-- VORTEX_POS = Vector(2640.031250, 6178.935547, -61.941170)

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