--INFO_PLAYER_SPAWN = {Vector( -395, -1289, 32 ), 0}
INFO_PLAYER_SPAWN = {Vector( -1000, -1229, -10728 ), 0}

NEXT_MAP = "metastasis_4b"

LIFT_ON_1 = false
LIFT_ON_2 = false

TRIGGER_CHECKPOINT = {

	{Vector( -509.068848, -2337.779053, -6031.602051 ), Vector( -406.726074, -2446.204834, -6013.991211 )},
	{Vector( -1119.907471, -2436.950439, -4378.769043 ), Vector( -982.233459, -2545.258789, -4352.485352 )},
	{Vector(-2411, -865, -3712 ), Vector( -2667, -991, -3735)}
	
}
/*
setpos 1901.4, 94.6, 238.8
] getpos 
setpos 1774.8, 141, 330.6
*/
TRIGGER_DELAYMAPLOAD = {Vector( -458, -1399, -104 ), Vector( -341, -1257, 61 )}

METASTASIS_MAP = true

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
}
VORTEX_POS = Vector(-1088.031250, -1444.105103, -477.968750)
function MAPSCRIPT:InitPost()

	local it = ents.Create("info_target")
	it:SetKeyValue("targetname", "it_1")
	it:SetPos(Vector(0,0,0))
	it:Spawn()
	it:Activate()
	local it = ents.Create("info_target")
	it:SetKeyValue("targetname", "it_3")
	it:SetPos(Vector(0,0,0))
	it:Spawn()
	it:Activate()
	local it = ents.Create("info_target")
	it:SetKeyValue("targetname", "it_2")
	it:SetPos(Vector(0,0,0))
	it:Spawn()
	it:Activate()
	local it = ents.Create("info_target")
	it:SetKeyValue("targetname", "it_4")
	it:SetPos(Vector(0,0,0))
	it:Spawn()
	it:Activate()
	
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(-1040, -1856, -10452))
	pt:SetKeyValue("targetname", "pt_1")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "50")
	pt:SetKeyValue("TriggerOnce", "0")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch it_1,Kill,,1.0,1")
	pt:Spawn()
	pt:Activate()
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(-469, -2390, -6039))
	pt:SetKeyValue("targetname", "pt_2")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "100")
	pt:SetKeyValue("TriggerOnce", "0")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch it_2,Kill,,1.0,1")
	pt:Spawn()
	pt:Activate()
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(-2984, -928, -4267))
	pt:SetKeyValue("targetname", "pt_3")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "75")
	pt:SetKeyValue("TriggerOnce", "0")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch it_3,Kill,,1.0,1")
	pt:Spawn()
	pt:Activate()
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(-656, -288, -1560))
	pt:SetKeyValue("targetname", "pt_4")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "100")
	pt:SetKeyValue("TriggerOnce", "0")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch it_4,Kill,,1.0,1")
	pt:Spawn()
	pt:Activate()
	
	local auto = ents.Create("logic_auto") 
	auto:SetKeyValue("spawnflags", "1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies-spawn,Kill,,0.2,-1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies,Kill,,0.3,-1")
	auto:Spawn()
	auto:Activate()
	
end

hook.Add("EntityRemoved", "hl2cEntityRemoved", function(ent)
	if ent:GetName() == "it_1" then
		LIFT_ON_1 = true
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) then
					if v:Team() == TEAM_DEAD or !v:Alive() then
					v:Spawn()
					end
					timer.Simple(1,function()
					v:Teleport(Vector(-1040, -1936, -10400))
					end)
			end
		end
		print("[hl2c] Minerva Lift Spawn On")
	end
	
	if ent:GetName() == "it_2" then
		LIFT_ON_1 = false
		print("[hl2c] Minerva Lift Spawn Off")
	end
	if ent:GetName() == "it_4" then
		LIFT_ON_2 = true
		print("[hl2c] Minerva Lift Spawn On")
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) then
					if v:Team() == TEAM_DEAD or !v:Alive() then
					v:Spawn()
					end
					timer.Simple(1,function()
					v:Teleport(Vector(-656, -288, -1520))
					end)
			end
		end
	end
	if ent:GetName() == "it_3" then
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) then
				v:SetAngles( Angle(0,0,0) )
				v:SetEyeAngles( Angle(0,0,0) )
				v:Teleport(Vector(-2496, -928, -3694))
				v:SetAngles( Angle(0,0,0) )
				v:SetEyeAngles( Angle(0,0,0) )
				timer.Simple(1,function()
				v:Teleport(Vector(-2496, -928, -3694))
				v:SetAngles( Angle(0,0,0) )
				v:SetEyeAngles( Angle(0,0,0) )
				end)
			end
		end
	end
end)

function MAPSCRIPT:PostPlayerSpawn(pl)
	-- Need Lift Parent Spawner.
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	-- timer.Simple(1,function()
		if IsValid(pl) then
			pl:SetAmmo(150, "Pistol")
		end
	-- end)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_357")
	pl:Give("weapon_ar2")
	pl:Give("weapon_smg1")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	
	if LIFT_ON_1 then
		for k, v in pairs(ents.FindByName("shaft-lift")) do
			M_LIFT_POS = v:GetPos() + Vector(0,0,90)
			
			
		end
		if IsValid(pl) then
			timer.Simple(0.1,function()
				pl:Teleport(M_LIFT_POS)
			end)
		end
	end
	if LIFT_ON_2 then
		for k, v in pairs(ents.FindByName("deeperlift-lift")) do
			M_LIFT_POS_2 = v:GetPos() + Vector(0,0,90)
			
			
		end
		if IsValid(pl) then
			timer.Simple(0.1,function()
				pl:Teleport(M_LIFT_POS_2)
			end)
		end
	end


end

return MAPSCRIPT