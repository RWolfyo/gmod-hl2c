local MAPSCRIPT = {}

ALLOWED_VEHICLE = "Van"

INFO_PLAYER_SPAWN = {Vector(4679.638184, -11061.767578, -959.968750), 0}

NEXT_MAP = "ep2_outland_11"

VORTEX_POS = Vector(1514.585571, -2374.653809, 472.031250)


NEW_VEHICLE_SPAWN = true
TRIGGER_VEHICLESPAWN = {

{Vector(4543.240234, -10415.579102, -1024.717896), Vector(5012.227539, -9791.414063, -963.930054)},
{Vector(3454.027344, -8251.264648, -448.061890), Vector(3498.188477, -7518.707520, -329.459106)},


{Vector(3362.387207, -798.791016, -128.886047), Vector(3577.673096, -351.989502, -105.247009)},


{Vector(1252.543945, -1908.826904, 82.325531), Vector(1446.100220, -1594.528687, 128.103638)}




}

TRIGGER_CHECKPOINT = {
	/* 1st
	3669, -330, -100

	3310, -933, -6
	*/
	{Vector(3669, -330, -100), Vector(3310, -933, -6),false,function() 
	ALLOWED_VEHICLE = ""
	EP2_COMBINE_AMBUSH = true
	for _, pl in pairs(player.GetAll()) do 
		if IsValid(pl) then
			pl:RemoveVehicle()
		end
		
	end
	end},
	
	/* model
	garage_generatordown_relay
rockgranite01a.mdl

	*/
	{Vector(656, -2416, 178), Vector(401, -2243, 290),false,function() 
	EP2_COMBINE_AMBUSH = false
	end}
}

TRIGGER_DELAYMAPLOAD =  {
	Vector(1550.299927, 7766.066406, -1588.817017), 
	Vector(1074.838867, 8276.042969, -1270.723389)
}


EP2_LUA_RUN_ONE = [[
ALLOWED_VEHICLE = ""
EP2_COMBINE_AMBUSH = true
ents.WaitForEntityByName("jeep", function(ent)

	ent:SetPos(Vector(3464,-520,-8)) 
	local phys = ent:GetPhysicsObject()
	if phys then
		phys:EnableMotion( false )
	end
end)
ents.WaitForEntityByName("alyx", function(ent)
	timer.Simple(6,function()
	ent:SetPos(Vector(3360,-528,-8)) 
	end)
end)
]]

EP2_LUA_RUN_TWO = [[
ALLOWED_VEHICLE = "Van"
ents.WaitForEntityByName("jeep", function(ent)
 
	local phys = ent:GetPhysicsObject()
	if phys then
		phys:EnableMotion( true )
	end
end)
]]


function MAPSCRIPT:InitPost()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname","lr_gendown")
	lua:SetKeyValue("Code", EP2_LUA_RUN_TWO)
	lua:Spawn()
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname","lr_shieldon")
	lua:SetKeyValue("Code", EP2_LUA_RUN_ONE)
	lua:Spawn()
	
	ents.WaitForEntityByName("garage_turret", function(ent)
		print("Found garage_turret")
		ent:Fire("addoutput", "OnTipped garage_shield1_off_relay,Trigger,,0.0,-1")
	end)
	
	ents.WaitForEntityByName("garage_generatordown_relay", function(ent)
	
		ent:Fire("addoutput", "OnTrigger lr_gendown,RunCode,,0.0,-1")
	end)
	
	ents.WaitForEntityByName("relay_combineshieldwall1_on", function(ent)
	
		ent:Fire("addoutput", "OnTrigger lr_shieldon,RunCode,,0.0,-1")
	end)
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")
	
	if IsValid(pl) and EP2_COMBINE_AMBUSH == true then
		pl:Teleport(Vector(3384,-528,-40))
		
	end
	pl.vehicleAllowed = false
end

return MAPSCRIPT