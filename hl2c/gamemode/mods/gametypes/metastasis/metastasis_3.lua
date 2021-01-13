--INFO_PLAYER_SPAWN = {Vector( -395, -1289, 32 ), 0}
INFO_PLAYER_SPAWN = {Vector( 4737, 13, 8040 ), 0}

NEXT_MAP = "metastasis_4a"
--SUPER_GRAVITY_GUN = true
TRIGGER_CHECKPOINT = {

	{Vector( 4576, 40, 7488 ), Vector( 4738, -63, 7567 )},
	{Vector( 6206.095703, -1104.877930, 1309.175171 ), Vector( 6096.723145, -564.729431, 1318.581909 )},
	{Vector( 940.128174, 87.359009, 222.709259 ), Vector( 838.541443, -102.997787, 254.011902 )},
	{Vector( 6190, -834, 3019 ), Vector( 6084, -949, 3001 )},
	
}
/*
setpos 1901.4, 94.6, 238.8
] getpos 
setpos 1774.8, 141, 330.6
*/
--TRIGGER_DELAYMAPLOAD = {Vector( 1901, 94, 238 ), Vector( 1774, 141, 330 )}

METASTASIS_MAP = true

local MAPSCRIPT = {}
SUPER_GRAVITY_GUN = SUPER_GRAVITY_GUN or false

MAPSCRIPT.EntityFilterByName = {
	["start-supplies"] = true,
	["start-supplies-spawn"] = true,
}
VORTEX_POS = Vector(3848.816162, 2.344546, 6480.031250)
META_LR_SUPERGRAVGUN = [[
	SUPER_GRAVITY_GUN = true
	for _, pl in pairs(player.GetAll()) do
		pl:StripWeapons()
		pl:Give("weapon_physcannon")
	end
]]

function MAPSCRIPT:InitPost()

	
	for k, v in pairs(ents.FindByName("weaponstripper-door-2")) do
		
		v:Fire("addoutput", "OnAnimationDone fp_1,Kill,,1,-1")
		
	end
	for k, v in pairs(ents.FindByName("weaponstripper-gate-1-start")) do
		
		--v:Fire("addoutput", "OnTrigger fp_1,Kill,,3,-1")
		
	end
	
	local ft = ents.Create("info_target")
	ft:SetKeyValue("targetname", "fp_1")
	ft:SetPos(Vector(0,0,0))
	ft:Spawn()
	ft:Activate()
	
	local ft = ents.Create("info_target")
	ft:SetKeyValue("targetname", "fp_2")
	ft:SetPos(Vector(0,0,0))
	ft:Spawn()
	ft:Activate()
	
	local ft = ents.Create("info_target")
	ft:SetKeyValue("targetname", "fp_3")
	ft:SetPos(Vector(0,0,0))
	ft:Spawn()
	ft:Activate()
	
	local ft = ents.Create("info_target")
	ft:SetKeyValue("targetname", "fp_4")
	ft:SetPos(Vector(0,0,0))
	ft:Spawn()
	ft:Activate()
	
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(6144, -1040, 7408))
	pt:SetKeyValue("targetname", "pt_1")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "50")
	pt:SetKeyValue("TriggerOnce", "0")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch fp_2,Kill,,3.0,1")
	pt:Spawn()
	pt:Activate()
	
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(6144, -1040, 1268))
	pt:SetKeyValue("targetname", "pt_2")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "100")
	pt:SetKeyValue("TriggerOnce", "0")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch fp_3,Kill,,3.0,1")
	pt:Spawn()
	pt:Activate()
	
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(-576, -128, 404))
	pt:SetKeyValue("targetname", "pt_3")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "100")
	pt:SetKeyValue("TriggerOnce", "1")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch fp_4,Kill,,3.0,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-fx-zap,PlaySound,,0,-1")
	pt:Fire("addoutput", "OnStartTouch inhibitor-smallflash,Fade,,0,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-relay,Enable,,1,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-relay,Trigger,,2,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-sprite-1,Color,255 128 0,0,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-sprite-2,Color,255 200 100,0,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-tesla,Turnon,,0,-1")
	--pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-relay,Enable,,1.0,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-inhibitor-siren,PlaySound,,1.0,-1")
	pt:Fire("addoutput", "OnStartTouch teleport-controlroom-disable,Trigger,,1.0,-1")
	pt:Spawn()
	pt:Activate()
	
	local auto = ents.Create("logic_auto") 
	auto:SetKeyValue("spawnflags", "1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies-spawn,Kill,,0.2,-1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies,Kill,,0.3,-1")
	auto:Spawn()
	auto:Activate()
	
	
	for k, v in pairs(ents.FindByName("teleport-controlroom-startup")) do
		
		v:Fire("addoutput","OnTrigger teleport-controlroom-door-1,Kill,,1,-1")
		v:Fire("addoutput","OnTrigger teleport-controlroom-door-2,Kill,,1,-1")
		
	end
	
	for k, v in pairs(ents.FindByName("post-teleport-setup")) do
		
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-2,Kill,,0,-1")
		v:Fire("addoutput","OnTrigger shaft-base-doors-1-1,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-lift-door-3,Open,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-teleport-1-start,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-teleport-2-start,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-teleport-3-start,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-teleport-4-start,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-teleport-5-start,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-teleport-1-start,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-base-doors-1-3,Open,,0,-1")
		
	end
	
	for k, v in pairs(ents.FindByName("shaft-base-button")) do
		
		v:Fire("addoutput","OnPressed shaft-base-doors-1-3,Kill,,0,-1")
		v:Fire("addoutput","OnPressed shaft-base-doors-1-2,Kill,,0,-1")
		v:Fire("addoutput","OnPressed shaft-base-doors-1-1,Kill,,0,-1")
		--v:Fire("addoutput","OnTrigger shaft-lift-door-3,Open,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-teleport-1-start,Kill,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-teleport-2-start,Kill,,0,-1")
		---v:Fire("addoutput","OnPressed shaft-teleport-3-start,Kill,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-teleport-4-start,Kill,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-teleport-5-start,Kill,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-teleport-1-start,Kill,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-base-doors-1-3,Open,,0,-1")
		--v:Fire("addoutput","OnPressed shaft-base-doors-1-3,Open,,0,-1")

	end
	
	local lua = ents.Create("lua_run")
	lua:SetName("lr_supergravgun")
	lua:SetKeyValue("Code",META_LR_SUPERGRAVGUN)
	lua:Spawn()
	
	ents.WaitForEntityByName("weaponstripper-strip-start", function(ent)
		ent:Remove()
	end)
	ents.WaitForEntityByName("weaponstripper-gate-2-stop", function(ent)
		ent:Fire("addoutput","OnTrigger lr_supergravgun,RunCode,,1.0,-1")
	end)

end

hook.Add("EntityRemoved", "hl2cEntityRemoved", function(ent)
	if ent:GetName() == "fp_2" then
		LIFT_ON_1 = true
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) then
					if v:Team() == TEAM_DEAD or !v:Alive() then
					v:Spawn()
					end
					timer.Simple(1,function()
					v:Teleport(Vector(6144, -1040, 7408))
					end)
			end
		end
		print("[hl2c] Minerva Lift Spawn On")
	end
	
	if ent:GetName() == "fp_3" then 
		LIFT_ON_1 = false
		print("[hl2c] Minerva Lift Spawn Off")
	end
	if ent:GetName() == "fp_4" then 
		LIFT_ON_1 = true
		SUPER_GRAVITY_GUN = false
		print("[hl2c] Minerva Super Gravity Gun Off")
	end
	
	if ent:GetName() == "fp_1" then 
		SUPER_GRAVITY_GUN = true
		print("[hl2c] Minerva Super Gravity Gun On")
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) then
				if v:Alive() then
					v:Give("weapon_physcannon")
					--v:SetPos(Vector(-656, -288, -512))
				end
			end
		end
		
	end
end)

function MAPSCRIPT:PostPlayerSpawn(pl)
	-- Need Lift Parent Spawner.
	pl:Give("weapon_physcannon")
	if SUPER_GRAVITY_GUN != true then
		pl:Give("weapon_pistol")
		
		if IsValid(pl) then
			pl:SetAmmo(150, "Pistol")
		end
		
		pl:Give("weapon_crowbar")
		pl:Give("weapon_357")
		pl:Give("weapon_ar2")
		pl:Give("weapon_smg1")
		pl:Give("weapon_frag")
	end
	if LIFT_ON_1 then
		for k, v in pairs(ents.FindByName("shaft-lift")) do
			M_LIFT_POS = v:GetPos() + Vector(0,0,30)
			
			
		end
		if IsValid(pl) then
			timer.Simple(1,function()
				pl:Teleport(M_LIFT_POS)
			end)
		end
	end


end

return MAPSCRIPT