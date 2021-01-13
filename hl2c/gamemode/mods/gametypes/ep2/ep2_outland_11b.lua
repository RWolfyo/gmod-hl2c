local MAPSCRIPT = {}


INFO_PLAYER_SPAWN = {Vector(419.468414, -9462.102539, -293.463104),0}

-- VORTEX_POS = Vector(133.948105, -8716.088867, -33.968750)

NEXT_MAP = "ep2_outland_12" -- BUG
--NEXT_MAP = "ep2_outland_12a"

-- Checkpoints
MAPSCRIPT.EntityFilterByClass = {
["logic_auto"]=true
}
TRIGGER_CHECKPOINT = {

/*
setpos 300.200073, -8727.993164, -299.005066

setpos 428.587402, -8667.056641, -225.567261


*/
	{Vector(418.103119, -8811.475586, -291.574066), Vector(304.477814, -8583.733398, -244.151245),false,function()
		for _, pl in pairs(player.GetAll()) do
			if pl and IsValid(pl) then
			
				pl:Teleport(Vector(362.045837, -8796.082031, -284.968750))
			end

		end
	ents.GetMapCreatedEntity(1735):Fire("Enable")
	end},
	{Vector(263.066711, -9179.397461, -319.968750), Vector(102.297844, -9059.503906, -252.147049),false,function()
	ents.GetMapCreatedEntity(1330):Fire("Enable")
	
	for _, pl in pairs(player.GetAll()) do
			if pl and IsValid(pl) then
			
				pl:Teleport(Vector(182.682281, -9119.451172, -284.302094))
			end

		end
	end
	HL2C_SPECIAL_EVENT = false
	},
	{Vector(-77.218384, -9151.968750, -319.968750), Vector(-222.820099, -9009.225586, -216.683502),false,function()
	ents.GetMapCreatedEntity(1331):Fire("Enable")
	
	for _, pl in pairs(player.GetAll()) do
			if pl and IsValid(pl) then
			
				pl:Teleport(Vector(-194.178848, -9101.010742, -307.483429))
			end

		end

	end}

}

HL2C_EP2_GAME_START = HL2C_EP2_GAME_START or false
--TRIGGER_DELAYMAPLOAD
TRIGGER_DELAYMAPLOAD = {Vector(-491.015411, -8924.450195, -336.561584), Vector(-368.178986, -8444.865234, -193.888809)}
HL2C_SPECIAL_SPAWN = Vector(387.903381, -9008.847656, -284.968750)
HL2C_SPECIAL_EVENT = HL2C_SPECIAL_EVENT or false

EP2_LUA_RUN_ONE = [[
HL2C_SPECIAL_EVENT = true
for k, v in pairs(player.GetAll()) do
	v:Teleport(HL2C_SPECIAL_SPAWN)
end
]]
function MAPSCRIPT:InitPost()
	//ents.GetMapCreatedEntity(1911):Remove() -- logic_auto starts game
	//ents.GetMapCreatedEntity(1912):Remove() -- logic_auto starts game
	//ents.GetMapCreatedEntity(5415):Remove()

	ents.GetMapCreatedEntity(1590):Fire("addoutput","OnTrigger hl2c_magnusson_courtyard_exitdoor_brush,Disable,,9.0,-1") -- logic_relay ends game
	ents.GetMapCreatedEntity(1590):Fire("addoutput","OnTrigger hl2c_magnusson_courtyard_exitdoor,Open,,1.0,-1") -- logic_relay ends game
	
	-- ents.FindByName("door_silo_lab_1")[1]:SetKeyValue("targetname","hl2c_door_silo_lab_1")
	-- ents.FindByName("prop_door_silo_lab_1")[1]:SetKeyValue("targetname","hl2c_prop_door_silo_lab_1")
	ents.FindByName("magnusson_training_lcs1")[1]:SetKeyValue("targetname","hl2c_magnusson_training_lcs1")

	ents.FindByName("magnusson_courtyard_exitdoor_brush")[1]:SetKeyValue("targetname","hl2c_magnusson_courtyard_exitdoor_brush")
	ents.FindByName("magnusson_courtyard_exitdoor")[1]:SetKeyValue("targetname","hl2c_magnusson_courtyard_exitdoor")
	ents.FindByName("hl2c_magnusson_courtyard_exitdoor_brush")[1]:Fire("Disable")
	ents.FindByName("hl2c_magnusson_courtyard_exitdoor")[1]:Fire("Open")
	ents.FindByName("hl2c_magnusson_courtyard_exitdoor")[1]:Fire("SetAnimation","unlock",0)
	
	
	-- ents.GetMapCreatedEntity(1735):SetKeyValue("targetname","hl2c_brush_1")
	ents.GetMapCreatedEntity(1735):Fire("Enable")
	
	ents.GetMapCreatedEntity(1330):SetKeyValue("targetname","hl2c_brush_2")
	
	ents.GetMapCreatedEntity(1331):SetKeyValue("targetname","hl2c_brush_3")
	-- ents.GetMapCreatedEntity(1727):Fire("Disable")
	-- ents.GetMapCreatedEntity(1727):Fire("addoutput","OnStartTouch relay_begin_mag_training,Trigger,,0,-1")
	ents.GetMapCreatedEntity(1748):Fire("addoutput","OnTrigger lr_special_spawn,RunCode,,1.0,-1")
	
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_special_spawn")
	lua:SetKeyValue("Code", EP2_LUA_RUN_ONE)
	lua:Spawn()
	//PrintTable(ents.FindInSphere(Vector(353.0,-8521.0,-105.0),10))
	//print(Entity(534):GetCreationID())
	/*
		
	entity
	{
		"id" "2799823"
		"origin" "352.994 -8521 -105.371"
		"spawnflags" "1"
		"classname" "logic_auto"
		connections
		{
			"OnMapSpawn" "lcs_silo_entry_04,Start,,0.1,1"
			"OnMapSpawn" "door_silo_lab_1,Open,,2.5,1"
			"OnMapSpawn" "prop_door_silo_lab_1,SetAnimation,unlock,2,1"
			"OnMapSpawn" "template_npcs_1,ForceSpawn,,0,1"
			"OnMapSpawn" "matmod_silodisplay,StartAnimSequence,0 0 1 0,0.1,-1"
		}
	}
	entity
	{
		"id" "2799825"
		"origin" "440.339 -9459.9 -288.501"
		"spawnflags" "1"
		"classname" "logic_auto"
		connections
		{
			"OnNewGame" "global_newgame_template_base_items,ForceSpawn,,0,1"
			"OnNewGame" "global_newgame_template_local_items,ForceSpawn,,0.2,1"
			"OnNewGame" "global_newgame_template_ammo,ForceSpawn,,0.5,1"
			"OnNewGame" "template_alyx,ForceSpawn,,0.1,-1"
			"OnMapTransition" "global_friendly_encounter,TurnOn,,0,-1"
			"OnNewGame" "global_friendly_encounter,TurnOn,,0,-1"
		}
	}
	*/
	
	/*
	for k, v in pairs(ents.FindByName("brush_pclip_door_silo_lab_1")) do
		print(v:MapCreationID(),v:GetClass()) -- 1735
	end
	for k, v in pairs(ents.FindByName("door_silo_lab_3_brush")) do
		print(v:MapCreationID(),v:GetClass()) -- 1330
	end
	for k, v in pairs(ents.FindByName("magnusson_ragdoll_door_brush")) do
		print(v:MapCreationID(),v:GetClass()) -- 1331
	end
	for k,v in pairs(ents.FindByName("level_exit_relay") ) do
		--if v:GetClass() == "trigger_once" then
		print(v:MapCreationID(),v:GetClass(),v:GetPos()) -- 1590
	end
	*/
	
	
	local ent = ents.Create("logic_choreographed_scene")
	ent:SetKeyValue("busyactor","0")
	ent:SetKeyValue("onplayerdeath","0")
	ent:SetKeyValue("SceneFile","scenes/outland_12/mag_training1.vcd")
	ent:SetKeyValue("targetname","magnusson_training_lcs1")
	ent:Fire("addoutput","OnCompletion magnusson_training_lcs2,Start,,1.0,1")
	ent:Fire("addoutput","OnTrigger1 door_silo_lab_3,Open,,0,-1")
	ent:Fire("addoutput","OnTrigger2 magnusson_training_lcs1_resume_listerner,Test,,0.5,-1")
	ent:Fire("addoutput","OnTrigger2 mag_training_lcs1_resume_branch_mag,SetValue,1,0,-1")
	ent:Fire("addoutput","OnTrigger4 magnusson_ragdoll_door,Open,,0,-1")
	ent:Fire("addoutput","OnTrigger3 stickybombroom_cits_looklively_lcs,Start,,0,-1")
	ent:Fire("addoutput","OnStart kleiner,Kill,,0,-1")
	-- ent:Fire("addoutput","OnStart kleiner,Kill,,0,-1")
	-- ent:Fire("addoutput","OnStart kleiner,Kill,,0,-1")
	ent:Spawn()
	ent:Activate()
	/*
	"OnTrigger2" "magnusson_training_lcs1,Pause,,0,-1"
		"OnCompletion" "magnusson_training_lcs2,Start,,1,1"
		"OnTrigger1" "door_silo_lab_3,Open,,0,-1"
		"OnTrigger2" "magnusson_training_lcs1_resume_listerner,Test,,0.5,-1"
		"OnTrigger2" "mag_training_lcs1_resume_branch_mag,SetValue,1,0,-1"
		"OnTrigger4" "magnusson_ragdoll_door,Open,,0,-1"
		"OnTrigger3" "stickybombroom_cits_looklively_lcs,Start,,0,-1"
		"OnStart" "kleiner,Kill,,0,-1"
	*/
	
	
	local ent = ents.Create("logic_relay")
	ent:SetKeyValue("targetname","relay_start")
	ent:SetKeyValue("StartDisabled","0")
	ent:Fire("addoutput", "OnTrigger template_alyx,ForceSpawn,,0.1,-1")
	
	
	-- ent:Fire("addoutput", "OnTrigger hl2c_brush_pclip_door_silo_lab_1,Enable,,0.1,-1")
	-- ent:Fire("addoutput", "OnTrigger brush_pclip_door_silo_lab_1,Enable,,4,-1")
	-- ent:Fire("addoutput", "OnTrigger brush_pclip_door_silo_lab_1,Enable,,10,-1")
	-- ent:Fire("addoutput", "OnTrigger brush_pclip_door_silo_lab_1,Enable,,8,-1")
	-- ent:Fire("addoutput", "OnTrigger brush_pclip_door_silo_lab_1,Enable,,13,-1")
	ent:Fire("addoutput", "OnTrigger global_friendly_encounter,TurnOn,,0,-1")
	ent:Fire("addoutput", "OnTrigger lcs_silo_entry_04,Start,,0.1,-1")
	ent:Fire("addoutput", "OnTrigger door_silo_lab_1,Open,,2.5,-1")
	-- ent:Fire("addoutput", "OnTrigger hl2c_door_silo_lab_1,Open,,2.5,-1")
	ent:Fire("addoutput", "OnTrigger prop_door_silo_lab_1,SetAnimation,unlock,2,-1")
	-- ent:Fire("addoutput", "OnTrigger hl2c_prop_door_silo_lab_1,SetAnimation,unlock,2,-1")
	ent:Fire("addoutput", "OnTrigger template_npcs_1,ForceSpawn,,0,-1")
	ent:Fire("addoutput", "OnTrigger matmod_silodisplay,StartAnimSequence,0 0 1 0,0.1,-1")
	ent:Fire("addoutput", "OnTrigger brush_pclip_door_silo_lab_1,Disable,,37,-1")
	ent:Fire("addoutput", "OnTrigger !self,Kill,,0,-1")
	ent:Spawn()

	--ents.GetMapCreatedEntity(1836):Fire("Stop") -- scene starts game
	--ents.GetMapCreatedEntity(1836):Fire("Cancel") -- scene starts game
	--ents.GetMapCreatedEntity(1836):Fire("Pause") -- scene starts game
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	if HL2C_EP2_GAME_START == false then
		
		timer.Simple(10,function()
			
			for k, v in pairs(ents.FindByName("relay_start")) do
				v:Fire("Trigger")
			end
			
		end)
		
	end
	HL2C_EP2_GAME_START = true
	
	if HL2C_SPECIAL_EVENT then
		pl:Teleport(HL2C_SPECIAL_SPAWN)
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

end


return MAPSCRIPT