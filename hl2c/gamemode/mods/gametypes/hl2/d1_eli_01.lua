NEXT_MAP = "d1_eli_02"

INFO_PLAYER_SPAWN = {Vector( 982, 4167, -1371 ), 180}

TRIGGER_CHECKPOINT = {
	{Vector(-174, 2777, -1280), Vector(29, 2818, -1119)},
	{Vector(214, 2040, -1277), Vector(254, 2124, -1171)},
	{Vector(371, 1760, -2736), Vector(533, 1801, -2615)},
	{Vector(154, 2042, -2735), Vector(191, 2211, -2629)},
	{Vector(-574, 2049, -2736), Vector(-536, 2217, -2629)},
	{Vector(-692, 1053, -2688), Vector(-490, 1093, -2527)}	
}

TRIGGER_DELAYMAPLOAD = {Vector(-703, 989, -2688), Vector(-501, 1029, -2527)}

//Vortex
// 265.39 3088.03 -831.97

-- VORTEX_POS = Vector(265.39, 3088.03, -831.97)
VORTEX_POS = Vector(9007.789062, 7028.580078, 970.649841)

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()

	for k, v in pairs(ents.FindByName("song_dam")) do
		v:SetKeyValue("message", "music/hl1_song20.mp3")
	end
	
	ents.WaitForEntityByName("elevator_trigger_go_up_1", function(ent)
		//-- DbgPrint("Setting up elevator team wait")
		-- ent:SetKeyValue("teamwait", "1")
		-- ent.OnTrigger = function(self)

			//DbgPrint("All players in elevator")

			-- local elevator_lab = ents.FindFirstByName("elevator_lab")
			-- local checkpoint = ents.CreateSimple("lambda_checkpoint", { Pos = Vector(454.184753, 1670.932373, -1281.335693), Ang = Angle(0, 90, 0) })
			-- checkpoint:SetParent(elevator_lab)

			-- GAMEMODE:SetPlayerCheckpoint(checkpoint)

		-- end
		
		ent:Fire("addoutput","OnTrigger lr_setspawn,RunCode,,1.0,-1")
	end)
	
	-- What is it with NPCs being busy?
	ents.WaitForEntityByName("lcs_alyxtour01", function(ent)
		ent:SetKeyValue("busyactor", "0")
	end)

	ents.WaitForEntityByName("lcs_alyxtour03", function(ent)
		ent:SetKeyValue("busyactor", "0")
	end)

	ents.WaitForEntityByName("lcs_alyxtour04", function(ent)
		ent:SetKeyValue("busyactor", "0")
	end)

	ents.WaitForEntityByName("lcs_Labtalk04", function(ent)
		ent:SetKeyValue("busyactor", "0")
	end)

	-- ents.WaitForEntityByName("trigger_alyxtour04b", function(ent)
		-- ent:SetKeyValue("teamwait", "1")
	-- end)

end


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:GodDisable()
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
end

return MAPSCRIPT