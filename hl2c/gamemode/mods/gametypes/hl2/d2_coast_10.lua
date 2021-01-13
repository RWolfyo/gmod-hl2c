ALLOWED_VEHICLE = "Jeep"

INFO_PLAYER_SPAWN = {Vector(-4773.39, -1387.10, 1472.03), 0}

NEXT_MAP = "d2_coast_11"

TRIGGER_CHECKPOINT = {

	{Vector(5635.184082, -1027.405762, 919.338074), 
	Vector(5049.627930, 31.406879, 1034.052490)},
	
	
	{Vector(8297, 1759, 969), 
	Vector(8137, 1815, 1032)}
	
}

TRIGGER_DELAYMAPLOAD = {Vector(5017, 2698, 323), Vector(4946, 3105, 520)}

-- VORTEX_POS = Vector(1927.640381, 5894.504395, 2291.421387)
VORTEX_POS = Vector(10903.747070, 8965.172852, 1123.917236)
local MAPSCRIPT = {}

function MAPSCRIPT:PostPlayerSpawn(pl)
	if IsValid(pl)
	then
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
end
-- wave_counter_case

MAPSCRIPT.EntityFilterByName = {
	["citizen_spawner_3"] = true,
}

function MAPSCRIPT:InitPost()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_novehicle")
	lua:SetKeyValue("Code", "ALLOWED_VEHICLE = NULL")
	lua:Spawn()
	
	

	local exit = ents.FindByName("logic_start_leader_exit")
	exit[1]:Fire("addoutput", "OnTrigger lighthouse_secret_door,Open,5.00,1")
	
	for k, v in pairs(ents.FindByName("music")) do
		v:SetKeyValue("message", "music/hl1_song15.mp3")
	end
	
	for k, v in pairs(ents.FindByName("wave_counter_case")) do
		v:Fire("addoutput", "OnCase05 lighthouse_bottom_door,Unlock,,1.0,-1")
		-- print("** Found Gunship Spawner **")
	end
	
	for k, v in pairs(ents.FindByName("lighthouse_bottom_door")) do
		v:Fire("Lock")
		-- print("** Found RPG Door **")
	end
	
	for k, v in pairs(ents.FindInSphere(Vector(5104, -480, 944),5)) do
		if IsValid(v) and 
		v:GetClass() == "trigger_once" and 
		v:GetPos() == Vector(5104, -480, 944)
		then
			v:Fire("addoutput", "OnTrigger lr_novehicle,RunCode,,0.1,-1")
			-- print("*****************************")
			-- print("** Found Encounter Trigger **")
			-- print("*****************************")
		end
	end
	
end

return MAPSCRIPT