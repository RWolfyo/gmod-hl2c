ALLOWED_VEHICLE = "Jeep"

NEW_VEHICLE_SPAWN = true

TRIGGER_VEHICLESPAWN = {
	{Vector(-8009, -9601, 905), Vector(-7658, -8136, 905)}
}

NEXT_MAP = "d2_coast_03"

local MAPSCRIPT = {}

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
end

-- VORTEX_POS = Vector(-9159.743164, -9243.679688, 1088.031250)
VORTEX_POS = Vector(-4865.695312, -13295.799805, 1322.105347)
MAPSCRIPT.EntityFilterByName = {
	["warehouse_exitdoor"] = true,
}

D2_COAST_01_LUA_01 = [[
file.Write("hl2c_data/d2_coast_01_secret.txt")
]]

function MAPSCRIPT:InitPost()
	local lua = ents.Create("lua_run")
	lua:SetName("lr_run")
	lua:SetKeyValue("Code",D2_COAST_01_LUA_01)
	lua:Spawn()
	local photo = ents.Create("prop_physics_override")
	photo:SetPos( Vector(-517.383545, -7439.132324, 276) )
	photo:SetKeyValue("targetname", "hl2c_easteregg")
	photo:SetKeyValue("angles", "0 180 0")
	photo:SetKeyValue("spawnflags", "8448")
	photo:SetKeyValue("health", "1")
	photo:SetKeyValue("model", "models/props_canal/boat001a.mdl")
	photo:Spawn()
	photo:Activate()
	photo:Fire("addoutput", "OnBreak lr_run,RunCode,,6.0,-1", "1.0")
	local phys = photo:GetPhysicsObject()
	if phys then
		phys:EnableMotion(false)
	end
	
	-- Prevent players going through the door back to the base
	
	-- Jeep spawned naturally doesn't have the HL2C features
	ents.WaitForEntityByName("jeep",function(ent)
	ent:Fire("enablegun", "1")
	ent:SetBodygroup(1, 1)
		if !game.SinglePlayer() then
			if GetConVarNumber("hl2c_passenger_seats") >= 1 then
				local seat = ents.Create( "prop_vehicle_prisoner_pod" )
				seat:SetModel( "models/nova/jeep_seat.mdl" )
				seat:SetPos( ent:LocalToWorld( Vector( 21,-32,18 ) ) )
				seat:SetAngles( ent:LocalToWorldAngles( Angle( 0,-3.5,0 ) ) )
				seat:Spawn()
				seat:SetKeyValue( "limitview", "1" )
				seat:SetKeyValue( "targetname", "hl2c_passenger_seat" )
				seat:SetMoveType( MOVETYPE_NONE )
				seat:SetParent( ent, -1 )
			end
		end
	end)

	ents.WaitForEntityByName("push_car_superjump_01",function(ent)
		ent:Fire("addoutput", "StartDisabled 0", "0")
	end)
	
	local push_timer = ents.Create( "logic_timer" )
	push_timer:SetPos( Vector( -7940,303,1063 ) )
	push_timer:SetKeyValue( "RefireTime", "3" )
	push_timer:SetKeyValue( "targetname", "hl2c_push_timer" )
	push_timer:Fire("addoutput", "OnTimer push_car_superjump_01,Enable,,0.00,-1", "0")
	push_timer:Spawn()
	
	if GetConVarNumber("hl2c_additions") >= 1 then
		local map_model = ents.FindByModel("maps/"..game.GetMap()..".bsp")
		local prec = ents.Create("func_precipitation")
		prec:SetKeyValue("model", map_model[1]:GetModel())
		prec:SetKeyValue("preciptype", "0")
		prec:SetKeyValue("renderamt", "50")
		prec:SetKeyValue("rendercolor", "200 200 200")
		prec:Spawn()
		prec:Activate()
	end
	
	for k, v in pairs(ents.FindByName("driving_music")) do
		v:SetKeyValue("message", "music/hl2_song3.mp3")
	end
	
end


return MAPSCRIPT