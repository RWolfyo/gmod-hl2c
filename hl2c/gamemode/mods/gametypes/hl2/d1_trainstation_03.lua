NEXT_MAP = "d1_trainstation_04"

PLAYER_IS_CITIZEN = true

TRIGGER_CHECKPOINT = {
	{Vector(-3672, -4524, 264), Vector(-3758, -4648, 368)},
	{Vector(-4988, -4664, 522), Vector(-5048, -4616, 628)},
	{Vector(-5103.480469, -4919.968750, 514.871399), Vector(-5054.503906, -4696.654297, 639.968750), false, function() 
	DbgPrint("All players inside trigger, closing door, swapping spawnpoint.")
			-- Everyone is inside, we can close the door.
			ents.WaitForEntityByName("lambda_attic_door_push", function(ent) ent:Fire("Kill") end)
			ents.WaitForEntityByName("lambda_attic_door_close_relay", function(ent) ent:Fire("Trigger") end)
			ents.WaitForEntityByName("lambda_attic_door_push_trigger", function(ent) ent:Fire("Kill") end)
			ents.WaitForEntityByName("lambda_brush_prevent_cops_getting_to_bracer", function(ent) ent:Fire("Enable") end)
			ents.WaitForEntityByName("gordon_criminal_global", function(ent) ent:Fire("TurnOff") end)
	
	end}
}

BRUSH_PLAYERCLIP = {

{Vector(-5205, -4161, 15), Vector(-4961, -4271, 126)}

}

-- VORTEX_POS = Vector(-5043, -4763, 228)

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["ai_breakin_cop3goal3"] = true,
	["ai_breakin_cop3goal3_blockplayer2"] = true,
	
	["logic_flr1tv_turnoffallscreens"] = true,
	["ai_breakin_cop3goal4_blockplayer"] = true,
	["ai_breakin_cop3goal4_blockplayer"] = true,
}

function MAPSCRIPT:InitPost()
	game.SetGlobalState("gordon_invulnerable", GLOBAL_ON)
	game.SetGlobalState("gordon_precriminal", GLOBAL_ON)
	GAMEMODE:WaitForInput("brush_breakin_blockplayer1", "Kill", function()
			ents.WaitForEntityByName("npc_breakincop3", function(ent) ent:SetName("lambda_npc_breakincop3") DbgPrint("Changed name") end)
			ents.WaitForEntityByName("ai_breakin_cop3goal3_blockplayer2", function(ent) ent:SetName("lambda_ai_breakin_cop3goal3_blockplayer2") end)
			ents.WaitForEntityByName("ai_breakin_cop3goal3_blockplayer", function(ent) ent:SetName("lambda_ai_breakin_cop3goal3_blockplayer") end)
		end)
		ents.WaitForEntityByName("mark_RaidEscape02", function(ent) ent:SetPos(Vector(-5017, -4637, 384)) end)
		local lcs_cit_RaidAnticipation
		ents.WaitForEntityByName("lcs_cit_RaidAnticipation", function(ent)
			ent:Fire("AddOutput", "OnCompletion !self,Start")
			ent:SetKeyValue("busyactor", "0")
			lcs_cit_RaidAnticipation = ent
		end)
		
		GAMEMODE:WaitForInput("trigger_rush_start", "Enable", function()
			DbgPrint("Preventing police rush")
			lcs_cit_RaidAnticipation:Fire("Start")
			return true
		end)

		ents.WaitForEntityByName("attic_door_close_relay", function(ent)
			ent:SetName("lambda_attic_door_close_relay")
		end)

		ents.WaitForEntityByName("attic_door_push", function(ent)
			ent:SetName("lambda_attic_door_push")
		end)

		ents.WaitForEntityByName("attic_door_push_trigger", function(ent)
			ent:SetName("lambda_attic_door_push_trigger")
		end)

		ents.WaitForEntityByName("brush_prevent_cops_getting_to_bracer", function(ent)
			ent:SetName("lambda_brush_prevent_cops_getting_to_bracer")
		end)
		
		
		-- FIX: For some reason the door pushed us away.
		--ents.WaitForEntityByName("door_bracerProp", function(ent) ent:Fire("DisablePlayerCollision") end)
		
		
		-- More subtle path blocking
		ents.CreateSimple("prop_physics",
		{
			Model = "models/props_interiors/furniture_couch01a.mdl",
			SpawnFlags = 11,
			Pos = Vector(-3948.116211, -4605.383301, 405.858459),
			Ang = Angle(0, -28, 0)
		})
		ents.CreateSimple("prop_physics",
		{
			Model = "models/props_interiors/furniture_shelf01a.mdl",
			SpawnFlags = 11,
			Pos = Vector(-3978.584961, -4591.714355, 428.674622),
			Ang = Angle(2.685, -43.640, -1.595)
		})
		ents.CreateSimple("prop_physics",
		{
			Model = "models/props_interiors/furniture_couch02a.mdl",
			SpawnFlags = 11,
			 Pos = Vector(-3991.768799 -4628.245117, 413.455383),
			 Ang = Angle(48.364, 2.325, -54.165)
		})
		ents.CreateSimple("prop_physics",
		{
			Model = "models/props_interiors/furniture_cabinetdrawer01a.mdl",
			SpawnFlags = 11,
			Pos = Vector(-4001.259521, -4626.048828, 451.491089),
			Ang = Angle(32.242, 48.029, -59.341)
		})
		ents.CreateSimple("prop_physics",
		{
			Model = "models/props_interiors/furniture_couch01a.mdl",
			SpawnFlags = 11,
			Pos = Vector(-4033.726074, -4614.500000, 405.713776),
			Ang = Angle(0.035, 151.586, 0.003)
		})
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	/*for k, v in pairs( player.GetAll() ) do
		v:GodEnable()
	end*/
end

return MAPSCRIPT