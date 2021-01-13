local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector( -292.923157, -8832.399414, -254.968750 ), 90}

ALLOWED_VEHICLE = "Van"
VORTEX_POS = Vector(-989.095459, 5447.554688, 564.881409)

NEXT_MAP = "ep2_outland_12a"

TRIGGER_CHECKPOINT = {
	{Vector(-404, -6862, -279), Vector(-1139, -6272, -165), false, function() 
		
	end},
	{Vector(-1141.208984, -6122.272949, -280.524872), Vector(-30.909142, -5560.880371, -58.395248), false, function() 
		
		ents.FindByName("jeep")[1]:Fire("EnableRadarDetectEnemies")
		ents.FindByName("jeep")[1]:Fire("EnableRadar")
		ents.FindByName("jeep")[1]:Fire("SetCargoHopperVisibility","1")
	end}
}
/*
setpos 1489, -5290, -208
] getpos 
setpos -1761, -3666, 222

*/
NEW_VEHICLE_SPAWN = true
TRIGGER_VEHICLESPAWN = {
	{Vector(1068.467041, -5652.324707, -261.379761), Vector(-1455.923584, -711.279663, 378.746277)}
}
DISABLE_CUSTOM_WEAPON = false
HL2C_EP2_GAME_START = false

MAPSCRIPT.EntityFilterByName = {
}

function MAPSCRIPT:PostPlayerSpawn(pl)
	if HL2C_EP2_GAME_START == false then
		HL2C_EP2_GAME_START = true
		
		timer.Simple(10,function()
			
			for k, v in pairs(ents.FindByName("relay_start")) do
				v:Fire("Trigger")
				
			end
			timer.Simple(1,function()
			ents.FindByName("jeep")[1]:Fire("EnableRadarDetectEnemies")
			ents.FindByName("jeep")[1]:Fire("EnableRadar")
			ents.FindByName("jeep")[1]:Fire("SetCargoHopperVisibility","1")
			end)
		end)
		
	end
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_rpg")

end

--base_destroy_relay
--point_map_failed



function MAPSCRIPT:InitPost()
	/*
	for k,v in pairs(ents.FindByName("victory_alyx_trigger") ) do
		print(v:MapCreationID(),v:GetClass(),v:GetPos()) -- 3400
	end
	/*
	for k,v in pairs(ents.FindByName("victory_counter") ) do
		print(v:MapCreationID(),v:GetClass(),v:GetPos()) -- 1497
	end
	/*
	for k,v in pairs(ents.FindByPos(Vector(-664, 5152, 151.5),"trigger_once") ) do
		--if v:GetClass() == "trigger_once" then
		print(v:MapCreationID(),v:GetClass(),v:GetPos()) -- 3184
	end
	
	for k,v in pairs(ents.FindByPos(Vector(344,-5350,-238),"logic_auto") ) do
		--if v:GetClass() == "trigger_once" then
		print(v:MapCreationID(),v:GetClass(),v:GetPos()) -- 3407
	end
	*/
	/*
	entity
	{
		"id" "2189560"
		"origin" "344.214 -5349.59 -237.593"
		"spawnflags" "1"
		"classname" "logic_auto"
		connections
		{
			"OnMapSpawn" "base_citizen,StartScripting,,0,-1"
			"OnNewGame" "startitems_template,ForceSpawn,,0,-1"
			"OnMapSpawn" "mirt_lcs_1,Start,,0.5,-1"
			"OnMapSpawn" "outpost_citizen_maker,Spawn,,0,-1"
			"OnMapSpawn" "lodge_citizen_maker,Spawn,,0,-1"
			"OnMapSpawn" "cabin_citizen_maker,Spawn,,0,-1"
			"OnMapSpawn" "defence_cit_ar2,StartScripting,,0,-1"
			"OnMapSpawn" "defence_cit_rpg,StartScripting,,0,-1"
			"OnMapSpawn" "jeep,EnableRadarDetectEnemies,,0,-1"
			"OnMapSpawn" "teleporters_spawnmags_relay,Trigger,,0,-1"
			"OnMapSpawn" "mirt,StartScripting,,0,-1"
			"OnMapSpawn" "jeep,EnableRadar,,0,-1"
			"OnMapSpawn" "base_front_door_linear1,Open,,0,-1"
			"OnMapSpawn" "base_front_door_linear2,Open,,0,-1"
			"OnMapSpawn" "jeep,SetCargoHopperVisibility,1,0,-1"
			"OnNewGame" "tonemap,SetTonemaprate,.25,0,-1"
			"OnNewGame" "tonemap,SetAutoExposureMax,4,0,-1"
			"OnNewGame" "tonemap,SetAutoExposureMin,0.5,0,-1"
			"OnNewGame" "tonemap,SetBloomScale,.05,0,-1"
			"OnMapTransition" "tonemap,SetBloomScale,.05,0,-1"
			"OnMapTransition" "tonemap,SetAutoExposureMin,0.5,0,-1"
			"OnMapTransition" "tonemap,SetAutoExposureMax,4,0,-1"
			"OnMapTransition" "tonemap,SetTonemaprate,.25,0,-1"
			"OnMapTransition" "climactic finish to level,Disable,,1,-1"
			"OnMapTransition" "Custom Autosaves,Disable,,1,-1"
			"OnNewGame" "Custom Autosaves,Disable,,1,-1"
			"OnNewGame" "climactic finish to level,Disable,,1,-1"
		}
	}
	*/
	ents.GetMapCreatedEntity(3407):Remove()
	ents.GetMapCreatedEntity(3184):Fire("addoutput","OnTrigger sawmill_briefing_needsnag_trigger,Enable,,30,-1")
	ents.GetMapCreatedEntity(1497):Fire("addoutput","OnHitMax base_gate_door,Open,,2,-1")
	ents.GetMapCreatedEntity(3400):Fire("addoutput","OnTrigger base_gate_door,Open,,2,-1")
	
	local ent = ents.Create("logic_relay")
	ent:SetKeyValue("targetname","relay_start")
	ent:SetKeyValue("StartDisabled","0")
	ent:Fire("addoutput","OnTrigger base_citizen,StartScripting,,0,-1")
	ent:Fire("addoutput","OnTrigger startitems,Kill,,0,-1")
	ent:Fire("addoutput","OnTrigger startitems_template,ForceSpawn,,0,-1")
	ent:Fire("addoutput","OnTrigger mirt_lcs_1,Start,,0.5,-1")
	ent:Fire("addoutput","OnTrigger outpost_citizen_maker,Spawn,,0,-1")
	ent:Fire("addoutput","OnTrigger lodge_citizen_maker,Spawn,,0,-1")
	ent:Fire("addoutput","OnTrigger cabin_citizen_maker,Spawn,,0,-1")
	ent:Fire("addoutput","OnTrigger defence_cit_ar2,StartScripting,,0,-1")
	ent:Fire("addoutput","OnTrigger defence_cit_rpg,StartScripting,,0,-1")
	ent:Fire("addoutput","OnTrigger jeep,EnableRadarDetectEnemies,,0,-1")
	ent:Fire("addoutput","OnTrigger teleporters_spawnmags_relay,Trigger,,0,-1")
	ent:Fire("addoutput","OnTrigger mirt,StartScripting,,0,-1")
	ent:Fire("addoutput","OnTrigger jeep,EnableRadar,,0,-1")
	ent:Fire("addoutput","OnTrigger base_front_door_linear1,Open,,0,-1")
	ent:Fire("addoutput","OnTrigger base_front_door_linear2,Open,,0,-1")
	ent:Fire("addoutput","OnTrigger jeep,SetCargoHopperVisibility,1,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetTonemaprate,.25,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetAutoExposureMax,4,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetAutoExposureMin,0.5,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetBloomScale,.05,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetBloomScale,.05,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetAutoExposureMin,0.5,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetAutoExposureMax,4,0,-1")
	ent:Fire("addoutput","OnTrigger tonemap,SetTonemaprate,.25,0,-1")
	ent:Fire("addoutput","OnTrigger climactic finish to level,Disable,,1,-1")
	ent:Fire("addoutput","OnTrigger Custom Autosaves,Disable,,1,-1")
	ent:Fire("addoutput","OnTrigger Custom Autosaves,Disable,,1,-1")
	ent:Fire("addoutput","OnTrigger climactic finish to level,Disable,,1,-1")
	ent:Spawn()
end

function MAPSCRIPT:KeyValue(ent, key, value)
	if IsValid(ent) and
	key == "origin" and
	value == "232 -7088 16"
	then
	
		--timer.Simple(3, function()
			if IsValid(ent) then
				-- print("\nMODIFIED BASE DESTROY RELAY\n")
				ent:Fire("addoutput", "OnTrigger hl2c_fail,Fail,,1,-1")
			end
		--end)
	end
end


return MAPSCRIPT