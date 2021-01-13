NEXT_MAP = "d2_coast_12"	//Add Next Map

RESPAWN_ALLOWED = true

--Create Checkpoints
TRIGGER_CHECKPOINT = {
/*
setpos 4844.482910 6990.797363 229.259735;setang 13.512295 -54.071110 0.000000
] getpos 
setpos 4285.681152 7479.257813 239.379440;setang 10.606012 -64.283127 -0.310200

*/
	{Vector( 4844.482910, 6990.797363, 229.259735 ), Vector( 4285.681152, 7479.257813, 239.379440 )},
	{Vector( 5192.342773, 10042.263672, 174.269562 ), Vector( 4908.761230, 9809.803711, 356.252075 ), false, function()
	HL2C_PET_LIKE_ANTLION = true
	print("[hl2c] Pet Like Antlions") 
	end},
	{Vector( 719.388123, 11598.656250, 530.898743 ), Vector( 807.783569, 11483.974609, 751.559021 )},
	{Vector( -544.937134, 11667.891602, 286.934326 ), Vector( -826.662354, 11932.392578, 519.129395 )}
	
}
--Old
--TRIGGER_DELAYMAPLOAD = {Vector(4241, 6827, 576), Vector(4654, 6807, 696)}

//setpos 6087.935547 916.383728 622.716431
//Good for Vortex

-- VORTEX_POS = Vector(6087.935547, 916.383728, 622.716431)
VORTEX_POS = Vector(7171.484863, -12444.104492, 3683.031250)
ANTLION_FARM = false

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()

	for k, v in pairs(ents.FindByName("music_antlionguard_1")) do
		v:SetKeyValue("message", "music/stingers/hl1_stinger_song16.mp3")
	end
	
	for k, v in pairs(ents.FindByName("music_antlionguard_2")) do
		v:SetKeyValue("message", "music/stingers/hl1_stinger_song28.mp3")
	end
	
	for k, v in pairs(ents.FindByName("camp_music")) do
		v:SetKeyValue("message", "music/hl2_song30.mp3")
	end
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)

	-- Fix antlions not spawning on players
	pl:SetName("!player")
	
	-- Give items
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

return MAPSCRIPT