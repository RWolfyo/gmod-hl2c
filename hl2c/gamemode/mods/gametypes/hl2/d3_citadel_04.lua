INFO_PLAYER_SPAWN = {Vector(712.66, -329.28, 2399.34), 180}

NEXT_MAP = "d3_citadel_05"

SUPER_GRAVITY_GUN = true

TRIGGER_CHECKPOINT = {
	{Vector(67, 687, 2536), Vector(453, 1065, 2578)},
	{Vector(194, 543, 6402), Vector(316, 664, 6523)},
	{Vector(191, 502, 6401), Vector(313, 542, 6522)}
}

-- VORTEX_POS = Vector(1203.955688, 1107.999878, 2368.031250)

BRUSH_PLAYERCLIP = {

	{Vector(797, -257, 2374), Vector(943, -378, 2491)}
	
}

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	--local func_brushes = ents.FindByName("citadel_brush_elevcage1_2")
	--func_brushes[1]:Remove()
	

	for k, v in pairs(ents.FindByName("sound_strider_song")) do
		v:SetKeyValue("message", "music/hl1_song19.mp3")
	end
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
end

return MAPSCRIPT