NEXT_MAP = "d1_trainstation_05"

PLAYER_IS_CITIZEN = true

TRIGGER_CHECKPOINT = {
	
{Vector(-4112.031250, -3586.113525, 512.031250), Vector(-4163.607422, -3345.349854, 693.861877),false,function() end,Vector(-4377.602051, -3465.061768, 578.945374)},
{Vector(-4873.560547, -3350.012695, 711.688599), Vector(-5235.031250, -4248.258301, 769.520630),false,function() end,Vector(-4915.053711, -3496.075439, 718.538269)},
	{Vector(-7174, -4048, 530), Vector(-6796, -4208, 620)},
	{Vector(-7208, -4038, 394), Vector(-7144, -3930, 502)},
	{Vector(-7645, -4029, -247), Vector(-7610, -3897, -115)}
}

BRUSH_PLAYERCLIP = {

{Vector(-3096, -3769, 395), Vector(-3015, -3524, 535)}
--{Vector(-3311, -3631, 155), Vector(-3273, -3704, 562)}

}


-- VORTEX_POS = Vector(-6001, -4039, 1008)
VORTEX_POS = Vector(-9121.453125, -4103.008789, 1379.031250)
local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["destination_knockout_1"] = true,
}

function MAPSCRIPT:InitPost()

	if !game.SinglePlayer() then
		local telepl = ents.Create("point_hl2cteleport")
		telepl:SetPos(Vector(-7740, -3960, 389))
		telepl:SetKeyValue("targetname", "hl2c_teleport")
		telepl:Spawn()
		telepl:Activate()
		
		local trigger = ents.FindByName("trigger_elevator_go_down")
		trigger[1]:Fire("addoutput", "OnTrigger hl2c_teleport,Teleport,,0.1,-1")
		
		local door = ents.FindByName("door_inside_secret")
		door[1]:Fire("addoutput", "OnFullyClosed !self,Unlock,,0.4,-1")
		door[1]:Fire("addoutput", "OnFullyClosed !self,Open,,0.5,-1")
		
		local teledest = ents.FindByName("destination_knockout_1")
		teledest[1]:Remove()
		
		/*
		local envG11 = ents.Create("env_global")
		envG11:SetPos(Vector(150, -100, 150))
		envG11:SetKeyValue("targetname", "hl2c_gordon_criminal_global")
		envG11:SetKeyValue("globalstate", "gordon_precriminal")
		envG11:SetKeyValue("spawnflags", "1")
		envG11:SetKeyValue("initialstate", "0")
		envG11:Spawn()
		envG11:Activate()
		envG11:Fire("turnoff", "", "1.0")
		envG11:Fire("kill", "", "5.0")
			
		local envG21 = ents.Create("env_global")
		envG21:SetPos(Vector(-150, 100, -150))
		envG21:SetKeyValue("targetname", "hl2c_gordon_invulnerable_global")
		envG21:SetKeyValue("globalstate", "gordon_invulnerable")
		envG21:SetKeyValue("spawnflags", "1")
		envG21:SetKeyValue("initialstate", "0")
		envG21:Spawn()
		envG21:Activate()
		envG21:Fire("turnoff", "", "1.0")
		envG21:Fire("kill", "", "5.0")
		*/
	end

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	--for _, v in pairs( player.GetAll() ) do
	--v:GodDisable()
	--end
end

return MAPSCRIPT