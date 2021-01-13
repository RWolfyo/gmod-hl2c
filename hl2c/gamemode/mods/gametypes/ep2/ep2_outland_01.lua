local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

NEXT_MAP = "ep2_outland_01a"

RESET_PL_INFO = true
LCS_ALYX_VISTA = false
LCS_ALYX_FINDPLAYER = false
LCS_ALYX_MINE = false
ROCK_01a = false
ROCK_01b = false
POINT_TRIGGER_DEBUG = true
--CUSTOM_TELEPORT_HL2C = "npc_alyx"
HL2C_DISABLE_WEAPONS = true

TRIGGER_CHECKPOINT = {


	{Vector(421.441833, -729.199890, 14.169785), Vector(132.938568, -823.593201, -13.695677)},
	{Vector(-2646.203613, -690.097900, 299.294342),Vector(-2810.302734, -789.883484, 239.065918),false,function() 
	
	end},
	{Vector(-3947.580566, 1671.496460, 208.461807), Vector(-3721.924072, 1793.260010, 173.840225)},


	{Vector(-5830.243164, 3683.965576, -159.044815), Vector(-4964.969727, 4297.457520, -6.183977)},
	{Vector(-5784.812988, 4418.944336, -124.268173), Vector(-5488.106445, 4595.742188, -54.044716)}

}

TRIGGER_DELAYMAPLOAD = {Vector( -6327.915527, 3794.296631, -137.986847 ), Vector( -6229.643066, 3855.636475, -328.485199 )}


-- VORTEX_POS = Vector(687, 449, 398)

MAPSCRIPT.EntityFilterByName =
{
	-- ["lcs.alyx.mine"] = true,
	-- ["lcs.alyx.vista"] = true,
	["door_traincar.03"] = true,
	-- ["door_traincar.02"] = true,
	-- ["lcs.alyx.findplayer"] = true,
	--["SS_alyx_scrapyard_down"] = true,
	["prop_traincar_panel_02"] = true,
	["camera_intro"] = true,
}
MAPSCRIPT.EntityFilterByClass =
{
}


function MAPSCRIPT:EntityRemoved(ent)
	
	if ent:GetName() == "gravgun_prop_grabbed" then
	
		ALLOW_GRAVGUN = true
		Hl2c.DefaultChatPrint("[hl2c] Gravity Gun is now Available!")
		--print("[hl2c] Gravity Gun is now Available!")
		for k, v in pairs(player.GetAll()) do
			
			if v:IsValid() and v:Alive() and v:Team() == TEAM_ALIVE then
				v:Give("weapon_physcannon")
			end
		end
	
	end
	
	
	
end

function MAPSCRIPT:InitPost()
	
	local dynamic = ents.Create("prop_dynamic")
	dynamic:SetKeyValue("targetname", "hl2c_fix")
	dynamic:SetKeyValue("model", "models/props_trainstation/wrecked_boxcar_gate_door.mdl")
	dynamic:SetKeyValue("solid", "6")
	dynamic:SetSolid(6)
	dynamic:SetPos(Vector(306, 197, 10))
	dynamic:Spawn()
	dynamic:Activate()
	
	local dynamic = ents.Create("prop_dynamic")
	dynamic:SetKeyValue("targetname", "hl2c_fix")
	dynamic:SetKeyValue("model", "models/props_trainstation/wrecked_boxcar_gate_door.mdl")
	dynamic:SetKeyValue("solid", "6")
	dynamic:SetSolid(6)
	dynamic:SetPos(Vector(306, 111, 9))
	dynamic:Spawn()
	dynamic:Activate()
	
	local dynamic = ents.Create("prop_dynamic")
	dynamic:SetKeyValue("targetname", "hl2c_fix")
	dynamic:SetKeyValue("model", "models/props_trainstation/wrecked_boxcar_gate_door.mdl")
	dynamic:SetKeyValue("solid", "6")
	dynamic:SetSolid(6)
	dynamic:SetPos(Vector(307, 20, 9))
	dynamic:Spawn()
	dynamic:Activate()
	
	local dynamic = ents.Create("prop_dynamic")
	dynamic:SetKeyValue("targetname", "hl2c_fix")
	dynamic:SetKeyValue("model", "models/props_trainstation/wrecked_boxcar_gate_door.mdl")
	dynamic:SetKeyValue("solid", "6")
	dynamic:SetSolid(6)
	dynamic:SetPos(Vector(302, 1, -33))
	dynamic:Spawn()
	dynamic:Activate()
	
	local dynamic = ents.Create("prop_dynamic")
	dynamic:SetKeyValue("targetname", "hl2c_fix")
	dynamic:SetKeyValue("model", "models/props_trainstation/wrecked_boxcar_gate_door.mdl")
	dynamic:SetKeyValue("solid", "6")
	dynamic:SetSolid(6)
	dynamic:SetPos(Vector(305, 100, -6))
	dynamic:Spawn()
	dynamic:Activate()
	
	
	local tele = ents.Create("point_alyx_teleport")
	tele:SetPos(Vector(185, -1101, 75))
	tele:SetKeyValue("targetname", "tp_alyx01")
	tele:Spawn()
	tele:Activate()
	
	timer.Simple(2.2,function()
		for k, v in pairs(ents.FindInSphere(Vector(-3262, -778, 286),500)) do
			if v:GetClass() == "prop_ragdoll" then
				v:Remove()
				--print("")
				--print("** HL2c Removed:",v:GetClass())
				--print("")
			end
		end
	end)
	/* Need to remove becuz of new fix in 2017.10.26
	timer.Simple(1.3, function()
		--lcs.alyx.findplayer
		for k, v in pairs(ents.FindByName("lcs.alyx.findplayer")) do v:Remove()	end
		for k, v in pairs(ents.FindByName("lcs.alyx.mine")) do v:Remove() end
		for k, v in pairs(ents.FindByName("lcs.alyx.vista")) do v:Remove() end
		for k, v in pairs(ents.FindByName("env_fog_controller")) do v:Remove() end
		for k, v in pairs(ents.FindInSphere(Vector(82.36, -1210.4, 39.38),1)) do
			v:Fire("addoutput", "OnTrigger tp_alyx01,Teleport,,0.0,-1")
		end
	
	end)*/
	
	-- Global list:
	-- hunters_to_run_over
	-- ep_alyx_darknessmode -- maybe ep1
	-- ep2_alyx_injured
	
	-- -384.35 -726.9 76.61
	local tele = ents.Create("point_alyx_teleport")
	tele:SetKeyValue("targetname", "alyx_tp_01")
	tele:SetPos(Vector(176, -814, 49))
	tele:Spawn()
	tele:Activate()
	/* Need to remove becuz of new fix in 2017.10.26
	timer.Simple(2,function()
	
	
	
		local scene = ents.Create("logic_choreographed_scene")
		scene:SetPos(Vector(896, 408, 57))
		scene:SetKeyValue("busyactor", "2")
		scene:SetKeyValue("onplayerdeath", "0")
		scene:SetKeyValue("SceneFile", "scenes/outland_01/intro_alyx_findplayer.vcd")
		scene:SetKeyValue("targetname", "lcs.alyx.findplayer")
		scene:Fire("addoutput", "OnStart alyx,StartScripting,,0,-1")
		scene:Fire("addoutput", "OnTrigger1 aisc.alyxfind,Enable,,0,-1")
		scene:Fire("addoutput", "OnTrigger2 SS_Alyx_gravgunGet2,BeginSequence,,0,-1")
		scene:Fire("addoutput", "OnTrigger3 lcs.alyx.findplayer,Pause,,0,-1")
		scene:Fire("addoutput", "OnTrigger4 trigger_Get_physgun,Enable,,0,-1")
		scene:Fire("addoutput", "OnTrigger5 relay_player_hasgravgun,Trigger,,0,-1")
		scene:Fire("addoutput", "OnTrigger6 alyx,UnholsterWeapon,,0,-1")
		scene:Fire("addoutput", "OnTrigger7 relay_vcd_cancel,Trigger,,0,-1")
		scene:Fire("addoutput", "OnTrigger8 relay_vcd_cancel,Trigger,,0,-1")
		scene:Fire("addoutput", "OnTrigger9 follow.alyx,Activate,,0,-1")
		scene:Fire("addoutput", "OnTrigger1 relay.pause.vcd,Trigger,,0,-1")
		scene:Fire("addoutput", "OnTrigger10 relay_vcd_cancel,Trigger,,0,-1")
		scene:Fire("addoutput", "OnTrigger11 relay_vcd_cancel,Trigger,,0,-1")
		scene:Fire("addoutput", "OnCompletion relay_vcd_cancel,Trigger,,0,-1")
		scene:Spawn()
		scene:Activate()
		
	end)
	
	*/
	--Make shit movement
	if !game.SinglePlayer() then
	-- local speedy = ents.FindByName("speedmod")
	-- speedy[1]:Remove()
	--Force us to crouch :(
	local cmove = ents.FindByName("trigger_crouch")
	cmove[1]:Remove()
	local autosaves = ents.FindByName("autosave")
	autosaves[1]:Remove()
	--if !game.SinglePlayer then
	
	
	local mypsc = ents.Create("point_servercommand")
	mypsc:SetKeyValue("targetname", "servercom")
	mypsc:SetPos(Vector(0, 0, 0))
	mypsc:Spawn()
	mypsc:Activate()
	
	--local force_alyx = ents.Create("point_c_tp")
	local force_alyx = ents.Create("point_alyx_teleport")
	--force_alyx:SetPos(Vector(-3965.598389, 1763.564331, 231.293579))
	--	-3965.598389 1763.564331 170
	force_alyx:SetPos( Vector(-3984.360107, 1706.057861, 144.031250) )
	force_alyx:SetKeyValue("targetname", "force_alyx_teleport")
	force_alyx:Spawn()
	force_alyx:Activate()
	
	local force_player = ents.Create("point_hl2cteleport")
	force_player:SetPos( Vector( -5364, 4185, -119 ) )
	force_player:SetKeyValue("targetname", "force_player_tp")
	force_player:Spawn()
	force_player:Activate()
	
	
		--SS_alyx_scrapyard_down
		 --Need to remove becuz of new fix in 2017.10.26
	ents.WaitForEntityByName("lcs_alyx_monitorsout_2",function(ent)
		ent:Fire("addoutput", "OnTrigger8 force_alyx_teleport,teleport,,0.9,-1")
		ent:Fire("addoutput", "OnTrigger8 force_alyx_teleport,kill,,1.2,-1")
		ent:Fire("addoutput", "OnTrigger8 alyx,EnableShadow,,1.5,-1")
		ent:Fire("addoutput", "OnTrigger8 lcs_alyx_intro_teleconf01,Start,,1.5,-1")
	end)
	ents.WaitForEntityByName("lcs_alyx_monitorsout",function(ent)
		ent:Fire("addoutput", "OnStart !self,Resume,,1.5,-1") -- Why the fuk we stop working we must resume :p
		ent:Fire("addoutput", "OnTrigger8 force_alyx_teleport,teleport,,0.9,-1")
		ent:Fire("addoutput", "OnTrigger8 force_alyx_teleport,kill,,1.2,-1")
		ent:Fire("addoutput", "OnTrigger8 alyx,EnableShadow,,1.5,-1")
		ent:Fire("addoutput", "OnTrigger8 lcs_alyx_intro_teleconf01,Start,,1.5,-1")
	end)



	ents.WaitForEntityByName("relay_bulleye_dead",function(ent)
		ent:Fire("addoutput", "OnTrigger force_player_tp,Teleport,,0.8,-1")
		ent:Fire("addoutput", "OnTrigger coreo_vehicle_01,Unlock,,0.5,-1")
		ent:Fire("addoutput", "OnTrigger coreo_vehicle_01,ExitVehicle,,0.6,-1")
		ent:Fire("addoutput", "OnTrigger player,ExitVehicle,,0.6,-1")
		ent:Fire("addoutput", "OnTrigger player,ClearParent,,0.6,-1")
		ent:Fire("addoutput", "OnTrigger coreo_vehicle_01,Kill,,0.7,-1")
	end)
	
	local ent = ents.FindFirstByName("plug_lightning_filter_1")
	ent:Fire("Enable")
	ent:SetKeyValue("StartDisabled", "0")
	ent:Fire("addoutput", "OnTrigger trigger_plug_connect,Enable,,0,-1")
	ent:Fire("addoutput", "OnEndTouch trigger_plug_connect,Disable,,0,-1")
	
	end
	
	 --Need to remove becuz of new fix in 2017.10.26
	ents.WaitForEntityByName("aisc_alyxfindradio",function(ent)
		-- ent:SetKeyValue("MaximumState","3")
		ent:SetKeyValue("MaxTimeout","3")
	end)

	ents.WaitForEntityByName("trigger.lcs.mine",function(ent)
		-- DbgPrint("Found trigger.lcs.mine")
		ent:Fire("Enable")
		-- ent:Fire("addoutput", "OnTrigger alyx_tp_01,Teleport,,1.3,-1")
		-- ent:Fire("addoutput", "OnTrigger lcs.alyx.mine,Start,,1.3,-1")
		-- ent:Fire("addoutput", "OnTrigger lcs.alyx.mine,Enable,,1.3,-1")
		ent:Fire("addoutput", "OnTrigger relay.coreball.large,Trigger,,15,-1")
		ent:Fire("addoutput", "OnTrigger relay.rockslide.trigger,Trigger,,21,-1")
		-- ent:Fire("addoutput", "OnTrigger lcs.alyx.findplayer,Pause,,1.0,-1")
		-- ent:Fire("addoutput", "OnTrigger lcs.alyx.findplayer,Resume,,1.0,-1")
		-- ent:Fire("addoutput", "OnTrigger lcs.alyx.findplayer,Cancel,,1.01,-1")
		-- ent:Fire("addoutput", "OnTrigger lcs.alyx.findplayer,Kill,,1.02,-1")
	end)
	
	ents.WaitForEntityByName("physbox.rock.01a",function(ent)
		ent:Fire("addoutput", "OnMotionEnabled physbox.rock.01a,Kill,,1,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.broken.1,Kill,,8,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.broken.2,Kill,,8,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.02,Kill,,8,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.01a,Kill,,8,-1")
	end)
	
	ents.WaitForEntityByName("physbox.rock.01b",function(ent)
		ent:Fire("addoutput", "OnMotionEnabled physbox.rock.01b,Kill,,1,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.broken.1,Kill,,8,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.broken.2,Kill,,8,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.02,Kill,,8,-1")
		ent:Fire("addoutput", "OnMotionEnabled prop.fence.01a,Kill,,8,-1")
	end)
	
	--prop_traincar_panel_3
	ents.GetMapCreatedEntity(2257):SetCollisionGroup(2)
	ents.GetMapCreatedEntity(2838):Remove()
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	--timer.Simple(10, function()
	if ALLOW_GRAVGUN then
		if IsValid(pl) and
		pl:Team() == TEAM_ALIVE and
		pl:Alive()
		then
			pl:Give("weapon_physcannon")
		end
	end
	--end)
end


function MAPSCRIPT:KeyValue(ent,key,value)
	
	if IsValid(ent) and
	key == "origin" and
	value == "-96 64 448"
	then
		timer.Simple(1.5,function()
			if IsValid(ent) then
				--print("\nFound clip_player_train\n")
				if IsValid(ent) then
				ent:Remove()
				end
			end
		end)
	end 
	
end

return MAPSCRIPT