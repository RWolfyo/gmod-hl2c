local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(1171.105591, 432.041443, 2726.031250),0}

resource.AddWorkshop( "743294633" )

EP3_MAP = true
GAME_IS_EP3 = true

EP3_IN_BOAT = false
EP3_IN_ESC = false

NEXT_MAP = "winter_lobby_2012"

TRIGGER_CHECKPOINT = {
-- 2481, -1531, -1818	1907, -1565, -1912
	{Vector(1292, 1545, 2480), Vector(1092, 1619, 2437)},
	{Vector(965.217224, 2335.452881, 2588.737549), Vector(1093.285034, 2431.685059, 2448.031250)},


	--{Vector(1223, 2325, 2457), Vector(1082, 2458, 2517)}
}
TRIGGER_DELAYMAPLOAD = {Vector(2247, -413, -1899), Vector(2644, -493, -1852)}

VORTEX_POS = Vector(1114.556763, 2616.005371, 2048.031250)

local function Find_Alyx()
	local ent
	for k, v in pairs(ents.FindByClass("npc_alyx")) do
		ent = v
	end
	return ent
end

local function Find_Barney()
	local ent
	for k, v in pairs(ents.FindByClass("npc_barney")) do
		ent = v
	end
	return ent
end

local function Find_Boat()
	local ent
	for k, v in pairs(ents.FindByName("boat_train")) do
		ent = v
	end
	return ent
end

function MAPSCRIPT:EntityRemoved(ent)
	if ent:GetName() == "ep3_in_esc"
	then
		print("IN ESC")
		EP3_IN_BOAT = false
		EP3_IN_ESC = true
		if IsValid( Find_Alyx() ) then
		Find_Alyx():SetPos(Vector(-8695, -5830, 8333))
		Find_Alyx():SetPos(Vector(-8695, -5830, 8333))
		end
		if IsValid( Find_Barney() ) then
		Find_Barney():SetPos(Vector(-8695, -5830, 8333))
		Find_Barney():SetPos(Vector(-8695, -5830, 8333))
		end
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) and
			v:Alive() and
			v:Team() == TEAM_ALIVE
			then
				v:Teleport(Vector(-8695, -5830, 8333))
				
			end
		end
	end
	
	if ent:GetName() == "ep3_in_boat"
	then
		print("IN BOAT")
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) and
			v:Alive() and
			v:Team() == TEAM_ALIVE
			then
				if IsValid(Find_Boat()) then
					v:Teleport( Find_Boat():GetPos() + Vector(0, 0, 100) )
				end
				
			end
		end
		EP3_IN_BOAT = true
		EP3_IN_ESC = false
	end
end


function MAPSCRIPT:InitPost()
	timer.Simple(0.5, function()
		for k, v in pairs(ents.FindByName("stuff")) do
			v:Remove()
		end
		
		for k, v in pairs(ents.FindByClass("item_ammo_ar2")) do
			v:Remove()
		end
		
		for k, v in pairs(ents.FindByName("exp_rock")) do
			v:SetKeyValue("iMagnitude", "1")
		end
		
		for k, v in pairs(ents.FindByName("expfinal1")) do
			v:SetKeyValue("iMagnitude", "1")
		end
		
		for k, v in pairs(ents.FindInSphere(Vector(1524, 1552, 2783),5)) do
			if v:GetName() == "trigger_block" then
				print("FOUND ESC TRIGGER")
				v:Fire("addoutput", "OnTrigger ep3_in_esc,Kill,,1,-1")
			end
		end
		
		
	end)
	
	ents.WaitForEntityByName("counter_com5",function(ent)
		ent:Fire("addoutput","OnHitMax playerclip1,Disable,,0.0,-1")
		ent:Fire("addoutput","OnHitMax playerclip2,Disable,,0.0,-1")
		ent:Fire("addoutput","OnHitMax tele,Enable,,0.0,-1")
	end)
	
	local in_esc = ents.Create("info_target")
	in_esc:SetKeyValue("targetname", "ep3_in_esc")
	in_esc:Spawn()
	in_esc:SetPos(Vector(0,0,0))
	in_esc:Activate()
	
	local in_boat = ents.Create("info_target")
	in_boat:SetKeyValue("targetname", "ep3_in_boat")
	in_boat:Spawn()
	in_boat:SetPos(Vector(0,0,0))
	in_boat:Activate()
	
	local hl2c_auto = ents.Create("logic_auto")
	hl2c_auto:SetPos(Vector(776, 2592, 333.524))
	hl2c_auto:SetKeyValue( "spawnflags", "1" )
	hl2c_auto:Fire("addoutput", "OnMapSpawn stuff,Kill,,0.3,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn stuff,Kill,,0.5,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn point_template,Kill,,0.5,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn stuff,Kill,,0.6,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn playerclip1,Kill,,0.3,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn rot_but2,Kill,,0.3,-1")
	
	for k, v in pairs(ents.FindInSphere(Vector(-8541.84, -6558.91, 8202),10)) do
		if v:GetClass() == "trigger_once" then
			print("FOUND BOAT TRIGGER")
			v:Fire("addoutput", "OnTrigger ep3_in_boat,Kill,,1,-1")
		end
	end
	
	for k, v in pairs(ents.FindByClass("trigger_teleport")) do
		--if v:GetClass() == "trigger_teleport" then
			print("FOUND TELEPORT TRIGGER")
			v:Fire("addoutput", "OnStartTouch ep3_in_esc,Kill,,1,-1")
		--end
	end
	for k, v in pairs(ents.FindByName("p6")) do
		--if v:GetClass() == "trigger_teleport" then
			print("FOUND PASS ENTITY")
			v:Fire("addoutput", "OnPass mapchange,Changelevel,,16,-1")
		--end
	end
	
	local end_map = ents.Create("point_changelevel")
	end_map:SetKeyValue("targetname", "mapchange")
	end_map:Spawn()
end



function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")
	if EP3_IN_BOAT then
		timer.Simple(1.3,function()
			if IsValid(pl) and
			pl:Alive()
			then
				pl:Teleport( Find_Boat():GetPos() + Vector(0, 0, 100) )
			end
		end)
	end
	if EP3_IN_ESC then
		for k, v in pairs(ents.FindByName("tele_dest")) do
			timer.Simple(1.1,function()
				if IsValid(pl) and
				pl:Alive() and
				IsValid(v) and
				isvector(v:GetPos())
				then
					pl:Teleport(v:GetPos() + Vector(0,0,30))
				end
			end)
		end
	end

end


return MAPSCRIPT