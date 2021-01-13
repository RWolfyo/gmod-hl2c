INFO_PLAYER_SPAWN = {Vector( -395, -1289, 32 ), 0}
--INFO_PLAYER_SPAWN = {Vector( 5024, -5952, -53 ), 0}

NEXT_MAP = "metastasis_3"

TRIGGER_CHECKPOINT = {

	{Vector( -436, -1147, -248 ), Vector( -488, -743, -136 )},
	{Vector( -931, -238, -1551 ), Vector( -601, -327, -1456 )}
	
}
/*
setpos 1901.4, 94.6, 238.8
] getpos 
setpos 1774.8, 141, 330.6
*/
--TRIGGER_DELAYMAPLOAD = {Vector( 1901, 94, 238 ), Vector( 1774, 141, 330 )}

METASTASIS_MAP = true

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["intro-spawn-items"] = true,
}
VORTEX_POS = Vector(2080.031250, -927.678772, 288.031250)
function MAPSCRIPT:InitPost()

	
	
	--for k, v in pairs(ents.FindByClass("npc_helicopter")) do
	--	v:Remove()
	--end
	
	--for k, v in pairs(ents.FindByName("deeperlift-lift-top")) do
	--	v:Fire("addoutput", "OnPass fp_1,Kill,,1,-1")
	--end
	
	local pt1 = ents.Create("point_trigger")
	pt1:SetPos(Vector(-656, -288, -480))
	pt1:SetKeyValue("targetname", "debug_point_trigger")
	pt1:SetKeyValue("spawnflags", "1")
	pt1:SetKeyValue("StartDisabled", "0")
	pt1:SetKeyValue("TriggerRadius", "50")
	pt1:SetKeyValue("TriggerOnce", "0")
	--pt1:SetKeyValue("filtername", "blahblah")
	pt1:Fire("addoutput", "OnStartTouch fp_1,Kill,,3.0,1")
	pt1:Spawn()
	pt1:Activate()
	
	local ft1 = ents.Create("info_target")
	ft1:SetKeyValue("targetname", "fp_1")
	ft1:SetPos(Vector(0,0,0))
	ft1:Spawn()
	ft1:Activate()
	
	local auto = ents.Create("logic_auto") 
	auto:SetKeyValue("spawnflags", "1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies-spawn,Kill,,0.2,-1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies,Kill,,0.3,-1")
	auto:Spawn()
	auto:Activate()
	
	for k, v in pairs(ents.FindByName("ramphall-door-4")) do
		
		v:Fire("addoutput","OnFullyOpen !self,Kill,,0,-1")
		
	end
	for k, v in pairs(ents.FindByName("storagehall-basher-button")) do
		
		v:Fire("addoutput","OnPressed storagehall-basher-door-relay,Trigger,,0,-1")
		
	end
	/*
	for k, v in pairs(ents.FindByName("teleport-controlroom-startup")) do
		
		v:Fire("addoutput","OnTrigger teleport-controlroom-door-1,Kill,,1,-1")
		v:Fire("addoutput","OnTrigger teleport-controlroom-door-2,Kill,,1,-1")
		
	end
	for k, v in pairs(ents.FindByName("post-teleport-setup")) do
		
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-2,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-1,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-lift-door-3,Open,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-teleport-1-start,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-teleport-2-start,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-teleport-3-start,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-teleport-4-start,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-teleport-5-start,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-teleport-1-start,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")

	end*/
end

hook.Add("EntityRemoved", "hl2cEntityRemoved", function(ent)
	if ent:GetName() == "fp_1" then 
		print("FOUND FP_1")
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) then
				v:Spawn()
				v:SetPos(Vector(-656, -288, -512))
			end
		end
		
	end
end)

function MAPSCRIPT:PostPlayerSpawn(pl)
	-- Need Lift Parent Spawner.
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	
		if IsValid(pl) then
			pl:SetAmmo(150, "Pistol")
		end
	pl:Give("weapon_crowbar")
	pl:Give("weapon_357")
	pl:Give("weapon_ar2")
	pl:Give("weapon_smg1")


end

return MAPSCRIPT