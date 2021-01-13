local MAPSCRIPT = {}

NEXT_MAP = "ep2_outland_11a"

-- VORTEX_POS = Vector(2027.304565, -10025.480469, -404.968750)

--Checkpoint
--setpos 1379.468750 -9893.275391 -1373.968750;setang 58.140636 43.176277 0.000000

--setpos 1302.890747, -9980.873047, -1223.993164;setang -89.000000 -125.819954 0.000000

--setpos 1311.848145, -9968.670898, -1307.973145;setang 89.000000 53.584431 0.000000
TRIGGER_CHECKPOINT = {
	
	{Vector(-672.029602, -10641.317383, 91.493042), Vector(-1070.916504, -10209.182617, 161.927078),false,function() 
	ents.GetMapCreatedEntity(2071):Fire("Enable")
	ents.GetMapCreatedEntity(2320):Fire("Enable")
	end},

	
	{Vector(-109, -10088, 74), 
	Vector(95, -9912, 119)},
	
	{Vector(1447, -10031, -313), Vector(1565, -9829, -276),false,function() LR_EP2_ONLIFTTOKLEINER = false end},
	{Vector(2058.315674, -9628.927734, -1392.817261), Vector(1969.711792, -9276.303711, -1330.807983),false,function() LR_EP2_ONLIFTTOSECONDSILO = false end},

	

	--{Vector(1302.890747, -9980.873047, -1223.993164), Vector(1311.848145, -9968.670898, -1257.973145)},
	
	--{Vector(1461.844604, -10022.494141, -1396.531250), Vector(1544.504150, -9833.147461, -1350.661377)},
	
	
	--{Vector(2000.031250, -9155.968750, -1403.423340), Vector(2138.875244, -9020.729492, -1414.381348)}

}



--Map Delay
TRIGGER_DELAYMAPLOAD = {Vector(1958.315674, -9127.673828, -1387.923096), Vector(1934.498047, -9020.754883, -1289.770142)}
/*
setpos 1958.315674, -9127.673828, -1387.923096;setang 37.324234 -146.458023 0.000000

setpos 1934.498047, -9020.754883, -1289.770142;setang 36.046093 -116.237724 0.000000

*/

CUSTOM_TELEPORT_HL2C = "npc_alyx"

EP2_LUA_RUN_ONE = [[
print("WORKING LUA SCRIPT ON LR_EP2_ONLIFTTOKLEINER") 
LR_EP2_ONLIFTTOKLEINER = true
GAMEMODE:HL2CForceRespawn()
for _, pl in pairs(player.GetAll()) do
	if IsValid(pl) and pl:Team() == TEAM_ALIVE then
		for k, v in pairs(ents.FindByClass("npc_alyx")) do
			pl:Teleport(v:GetPos()+Vector(0,-40,0))
		end
	end
end
]]

EP2_LUA_RUN_TWO = [[
print("WORKING LUA SCRIPT ON LR_EP2_ONLIFTTOSECONDSILO") 
LR_EP2_ONLIFTTOSECONDSILO = true
GAMEMODE:HL2CForceRespawn()
for _, pl in pairs(player.GetAll()) do
	if IsValid(pl) and pl:Team() == TEAM_ALIVE then
		pl:Teleport(ents.GetMapCreatedEntity(1997):GetPos()+Vector(0,0,10))
	end
end
]]
LR_EP2_ONLIFTTOKLEINER = LR_EP2_ONLIFTTOKLEINER or false
LR_EP2_ONLIFTTOSECONDSILO = LR_EP2_ONLIFTTOSECONDSILO or false


function MAPSCRIPT:InitPost()

-- setpos 456.431732 -9944.860352 113.073837;setang 19.599022 57.149231 0.000000
-- Coordinates for Teleport :D


-- setpos 1325.129028 -9940.085938 -507.968750;setang 37.232929 46.828182 0.000000
--other teleport

	timer.Simple(3, function()
	local tp_alyx = ents.Create("point_c_tp")
	tp_alyx:SetKeyValue("targetname", "hl2c_tp_alyx")
	tp_alyx:SetPos(Vector(-689, -10453, 101))
	tp_alyx:Spawn()
	
	//trigger_dog_walk On Touch Player force alyx to tp
	local trigger_dog = ents.FindByName("trigger_dog_walk")
	for _, dog_walk in pairs(trigger_dog) do
		dog_walk:Fire("addoutput", "OnStartTouch hl2c_tp_alyx,Teleport,,4,-1")
		dog_walk:Fire("addoutput", "OnStartTouch hl2c_tp_alyx,Kill,,4.1,-1")
	end
	
	local tpp_alyx = ents.Create("point_c_tp")
	tpp_alyx:SetKeyValue("targetname", "hl2c_tpp_alyx")
	tpp_alyx:SetPos(Vector(-49, -10006, 100))
	tpp_alyx:Spawn()
	
	//trigger_start_entry_01 tp alyx
	
	local trigger_start = ents.FindByName("trigger_start_entry_01")
	for _, entry_01 in pairs(trigger_start) do
		entry_01:Fire("addoutput", "OnTrigger hl2c_tpp_alyx,Teleport,,4,-1")
		entry_01:Fire("addoutput", "OnTrigger hl2c_tpp_alyx,Kill,,4.1,-1")
	end
	
	//door_silo_lab_outside_1_door_open_rl
	//exit_airlock_blastdoor_lever
	
	--local exit_airlock = ents.FindByName("exit_airlock_blastdoor_lever")
	--for _, blastdoor_lever in pairs(exit_airlock) do
		--blastdoor_lever:Fire("addoutput", "OnOpen door_silo_lab_outside_1_door_open_rl,Trigger,,6,-1")
	--end
	
	for k, v in pairs(ents.FindByName("door_garage_fence_1")) do
		v:Remove()
	end
	for k, v in pairs(ents.FindByName("pclip_garage_eli")) do
		v:Remove()
	end
	for k, v in pairs(ents.FindByName("door_garage_eli")) do
		v:Remove()
	end
	
	
	
	end)
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname","lr_onlifttokleiner")
	lua:SetKeyValue("Code", EP2_LUA_RUN_ONE)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname","lr_onlifttosecondsilo")
	lua:SetKeyValue("Code", EP2_LUA_RUN_TWO)
	lua:Spawn()
	
	--print( tostring( ents.FindByPos( Vector( 2032, -8984.5, -1352 ), "trigger_once" ) ) )
	--print( ents.FindByPos( Vector( 2032, -8984.5, -1352 ), "trigger_once" )[1]:MapCreationID() )
	
	-- Trigger_Once which contains the door which close on when we go to the end map.
	ents.GetMapCreatedEntity(1655):Fire("addoutput", "OnTrigger door_silo_lab_4,Open,,0.5,-1")
	ents.GetMapCreatedEntity(1655):Fire("addoutput", "OnTrigger brush_pclip_door_silo_lab_4,Disable,,0.5,-1")
	ents.GetMapCreatedEntity(1655):Fire("addoutput", "OnTrigger brush_pclip_door_silo_lab_4,Disable,,1,-1")
	
	
	ents.GetMapCreatedEntity(1368):Fire("addoutput", "OnTrigger door_silo_lab_outside_1_door_open_rl,Trigger,,11,-1")
	
	ents.GetMapCreatedEntity(1424):Fire("addoutput","OnTrigger lr_onlifttokleiner,RunCode,,1,-1")
	
	ents.GetMapCreatedEntity(2003):Fire("addoutput","OnPressed lr_onlifttosecondsilo,RunCode,,1,-1")
	--print( tostring( ents.FindFirstByName("door_silo_lab_outside_1_summon_uriah_rl"):MapCreationID() ) )

	-- ents.GetMapCreatedEntity(1368)
	-- door_silo_lab_outside_1_summon_uriah_rl 1368

	-- ents.GetMapCreatedEntity(1361)
	-- door_silo_lab_outside_1_malfunction_timer 1361
	
	-- ents.GetMapCreatedEntity(1997)
	-- lift_2 1997
	
	-- ents.GetMapCreatedEntity(2003)
	-- button_ele_2 2003
	
	-- ents.GetMapCreatedEntity(2166)
	-- mark_kl_lift_1 2166
	
	-- ents.GetMapCreatedEntity(1424)
	-- trigger_start_lift_1 1424

	-- 1739 logic auto -947.7 -11269 76.5012
	-- 1752 logic_auto -1022 -11347 69
	
	for k, v in pairs(ents.FindByName("button_ele_2")) do
		print(v:MapCreationID(),v:GetClass())
	end
	for k, v in pairs(ents.FindByName("pclip_fence")) do
		if v:GetClass() == "func_brush" then
		print(v:MapCreationID(),v:GetClass())
		end
	end
end

function MAPSCRIPT:KeyValue(ent, key, value)

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	if LR_EP2_ONLIFTTOKLEINER == true then
		for k, v in pairs(ents.FindByClass("npc_alyx")) do
			if IsValid(pl) and pl:Team() == TEAM_ALIVE then
				pl:Teleport(v:GetPos()+Vector(0,-40,0))
			end
		end
	end
	if LR_EP2_ONLIFTTOSECONDSILO == true then
		if IsValid(pl) and pl:Team() == TEAM_ALIVE then
			pl:Teleport(ents.GetMapCreatedEntity(1997):GetPos()+Vector(0,0,10))
		end
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