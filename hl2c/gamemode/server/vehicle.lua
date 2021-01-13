//Init Vehicles
function Hl2c.Init_Vehicles()
	// Jeep
	local jeep = {
		Name = "Jeep",
		Class = "prop_vehicle_jeep_old",
		Model = "models/buggy.mdl",
		KeyValues = {	
			vehiclescript =	"scripts/vehicles/jeep_test.txt",
			EnableGun = 1
		}
	}
	list.Set("Vehicles", "Jeep", jeep)
	
	// Named Jeep
	local namedjeep = {
		Name = "Jeep",
		Class = "prop_vehicle_jeep_old",
		Model = "models/buggy.mdl",
		KeyValues = {	
			vehiclescript =	"scripts/vehicles/jeep_test.txt",
			targetname = "jeep",
			EnableGun = 1
		}
	}
	list.Set("Vehicles", "Named Jeep", namedjeep)
	
	// Airboat
	local airboat = {
		Name = "Airboat",
		Class = "prop_vehicle_airboat",
		Category = Category,
		Model = "models/airboat.mdl",
		KeyValues = {
			vehiclescript = "scripts/vehicles/airboat.txt",
			EnableGun = 0
		}
	}
	list.Set("Vehicles", "Airboat", airboat)
	
	// Named Airboat
	local namedAirboat = {
		Name = "Named Airboat",
		Class = "prop_vehicle_airboat",
		Category = Category,
		Model = "models/airboat.mdl",
		KeyValues = {
			vehiclescript = "scripts/vehicles/airboat.txt",
			EnableGun = 0
		}
	}
	list.Set("Vehicles", "Named Airboat", airboat)
	
	// Airboat w/gun
	local airboatGun = {
		Name = "Airboat Gun",
		Class = "prop_vehicle_airboat",
		Category = Category,
		Model = "models/airboat.mdl",
		KeyValues = {
			vehiclescript = "scripts/vehicles/airboat.txt",
			EnableGun = 1
		}
	}
	list.Set("Vehicles", "Airboat Gun", airboatGun)
	
	// Jalopy
	local jalopy = {
		Name = "Jalopy",
		Class = "prop_vehicle_jeep",
		Model = "models/vehicle.mdl",
		Category = Category,
		KeyValues = {	
			vehiclescript =	"scripts/vehicles/jalopy.txt",
			--targetname = "jeep",
			VehicleLocked = 0
		}
	}
	list.Set("Vehicles", "Jalopy", jalopy)
	
	// Named Jalopy
	local namedjalopy = {
		Name = "Named Jalopy",
		Class = "prop_vehicle_jeep",
		Model = "models/vehicle.mdl",
		Category = Category,
		KeyValues = {	
			vehiclescript =	"scripts/vehicles/jalopy.txt",
			--targetname = "jeep",
			VehicleLocked = 0
		}
	}
	list.Set("Vehicles", "Named Jalopy", jalopy)
	
	// Jalopy_06
	local jalopy_06 = {
		Name = "Jalopy_06",
		Class = "prop_vehicle_jeep",
		Model = "models/vehicle.mdl",
		Category = Category,
		KeyValues = {	
			vehiclescript =	"scripts/vehicles/jalopy.txt",
			--targetname = "jeep",
			VehicleLocked = 0
		}
	}
	list.Set("Vehicles", "Jalopy_06", jalopy_06)
end

// Called when player wants a vehicle
function GM:ShowSpare1(pl, pos, range)
	if HL2MP_IS_COOP_MAP then return end
	if pl:Team() != TEAM_ALIVE || pl:InVehicle() then
		return
	end
	
	if pl.vehicleAllowed == true && NEW_VEHICLE_SPAWN == true then
	
		pl:RemoveVehicle()

	elseif NEW_VEHICLE_SPAWN != true then
		
		pl:RemoveVehicle()
	else
	
		pl:RemoveVehicle()
		
	end
	
	// Spawn the vehicle
	if ALLOWED_VEHICLE then
		local vehicleList = list.Get("Vehicles")
		local vehicle = vehicleList[ALLOWED_VEHICLE]
		
		if !vehicle then
			return
		end
		--print("New")
		if NEW_VEHICLE_SPAWN == true then
			if pl.vehicleAllowed != true then
				Hl2c.PersonDefaultChatPrint("You're not in a vehicle spawning area!",pl)
				return
			end
		end
		
		// Create the new entity
		pl.vehicle = ents.Create(vehicle.Class)
		--print(vehicle.Class)
		pl.vehicle:SetModel(vehicle.Model)
		
		// Set keyvalues
		if ALLOWED_VEHICLE == "Van" or ALLOWED_VEHICLE == "Truck" then
			if ( vehicle.Members ) then
				table.Merge( pl.vehicle, vehicle.Members )
				--duplicator.StoreEntityModifier( Ent, "VehicleMemDupe", vehicle.Members )
			end
		else
			for a, b in pairs(vehicle.KeyValues) do
				--print("Hi")
				pl.vehicle:SetKeyValue(a, b)
			end
		end
		// Enable name on Jeep
		if ALLOWED_VEHICLE == "Named Jeep" then
			pl.vehicle:Fire("addoutput", "targetname jeep")
		end
		
		// Enable name on Airboat
		if ALLOWED_VEHICLE == "Named Airboat" then
			pl.vehicle:Fire("addoutput", "targetname airboat")
		end
		
		// Enable name on Airboat Gun
		if ALLOWED_VEHICLE == "Airboat Gun" then
			pl.vehicle:Fire("addoutput", "targetname airboat")
		end
		//Enable name on Jalopy
		if ALLOWED_VEHICLE == "Named Jalopy" then
			pl.vehicle:Fire("addoutput", "targetname jeep")
		end
		
		if ALLOWED_VEHICLE == "Jalopy" then 
		pl.vehicle:Fire("addoutput", "targetname jalopy")
		end
		
		if ALLOWED_VEHICLE == "Jalopy_06" then
			pl.vehicle:Fire("addoutput", "targetname jeep_06")
			pl.vehicle:Fire("addoutput", "PlayerOn alyx,SetDamageFilter,alyx_invuln_filter,0,-1")
			pl.vehicle:Fire("addoutput", "PlayerOff alyx,SetDamageFilter,,0,-1")
			pl.vehicle:Fire("addoutput", "OnCompanionEnteredVehicle vort_charge_relay,Trigger,,1,1")
			pl.vehicle:Fire("addoutput", "PlayerOn alyx,EnterVehicle,jeep,0,-1")
			pl.vehicle:Fire("addoutput", "PlayerOff alyx,ExitVehicle,,0,-1")
			pl.vehicle:Fire("addoutput", "OnCompanionEnteredVehicle alyx_incar_timer,Enable,,1,1")
			pl.vehicle:Fire("addoutput", "PlayerOn player_incar_branch,SetValue,0,0,-1")
			pl.vehicle:Fire("addoutput", "PlayerOff player_incar_branch,SetValue,1,0,-1")
			pl.vehicle:Fire("addoutput", "PlayerOff player_off_relay,Trigger,,0,-1")
			--Outputs = {
		--"PlayerOn" "alyx,SetDamageFilter,alyx_invuln_filter,0,-1"
		--"PlayerOff" "alyx,SetDamageFilter,,0,-1"
		--"OnCompanionEnteredVehicle" "vort_charge_relay,Trigger,,1,1"
		--"PlayerOn" "alyx,EnterVehicle,jeep,0,-1"
		--"PlayerOff" "alyx,ExitVehicle,,0,-1"
		--"OnCompanionEnteredVehicle" "alyx_incar_timer,Enable,,1,1"
		--"PlayerOn" "player_incar_branch,SetValue,0,0,-1"
		--"PlayerOff" "player_incar_branch,SetValue,1,0,-1"
		--"PlayerOff" "player_off_relay,Trigger,,0,-1"
		--}
		end
		
		if ALLOWED_VEHICLE == "Van" then
			--print("Spawned a Synergy Van")
			pl.vehicle:Fire("addoutput", "targetname syn_car_van")
		end
		if ALLOWED_VEHICLE == "Truck" then
			--print("Spawned a Synergy Van")
			pl.vehicle:Fire("addoutput", "targetname syn_car_truck")
		end

		// Set pos/angle and spawn
		local plAngle = pl:GetAngles()
		pl.vehicle:SetPos(pl:GetPos() + Vector(0, 0, 10) + plAngle:Forward() * 80)
		pl.vehicle:SetAngles(Angle(0, plAngle.y + 180, 0))
		pl.vehicle:Spawn()
		pl.vehicle:Activate()
		pl.vehicle.creator = pl
		if ALLOWED_VEHICLE != "Van" then 
			--pl.vehicle:SetOwner(pl)
		end
		
		local hull_x, hull_y = pl:GetHull()
		local hull_x = hull_x + (pl:GetPos() + Vector(0, 0, 10) + plAngle:Forward() * 80)
		local hull_y = hull_y + (pl:GetPos() + Vector(0, 0, 10) + plAngle:Forward() * 80)
		local result = ents.FindInBox(hull_x,hull_y)
		for k, v in pairs(result) do
			if v:IsPlayer() or v:IsNPC() then
				SafeRemoveEntityDelayed(pl.vehicle,0.1)
				return
			end
		end
		// Passenger seats in Singleplayer are useless.
		if !game.SinglePlayer() then
			// Passenger Seats for Jeep
			if GetConVarNumber("hl2c_passenger_seats") >= 1 then
				if ALLOWED_VEHICLE == "Jeep" || ALLOWED_VEHICLE == "Named Jeep" then
					local spawnedvehicle = pl.vehicle
					local seat = ents.Create( "prop_vehicle_prisoner_pod" )
					seat:SetModel( "models/nova/jeep_seat.mdl" )
					seat:SetPos( pl.vehicle:LocalToWorld( Vector( 21,-32,18 ) ) )
					seat:SetAngles( pl.vehicle:LocalToWorldAngles( Angle( 0,-3.5,0 ) ) )
					seat:Spawn()
					seat:SetKeyValue( "limitview", "1" )
					seat:SetKeyValue( "targetname", "hl2c_passenger_seat" )
					seat:SetMoveType( MOVETYPE_NONE )
					seat:SetParent( spawnedvehicle, -1 )
					seat:SetSaveValue("m_bLocked", true)
					seat:SetNoDraw(true)
					-- pl.vehicel.seat = seat
					pl.seat = seat
					-- seat:SetNoDraw(true)
				end
			end
			
			// Passenger Seats for Jalopy
/*				if ALLOWED_VEHICLE == "Jalopy" || ALLOWED_VEHICLE == "Named Jalopy" then
					local spawnedvehicle = pl.vehicle
					local seat = ents.Create( "prop_vehicle_prisoner_pod" )
					seat:SetModel( "models/nova/jeep_seat.mdl" )
					seat:SetPos( pl.vehicle:LocalToWorld( Vector( 21,-32,18 ) ) )
					seat:SetAngles( pl.vehicle:LocalToWorldAngles( Angle( 0,-3.5,0 ) ) )
					seat:Spawn()
					seat:SetKeyValue( "limitview", "1" )
					seat:SetKeyValue( "targetname", "hl2c_passenger_seat" )
					seat:SetMoveType( MOVETYPE_NONE )
					seat:SetParent( spawnedvehicle, -1 )
				end
			end*/
			
			// Passenger Seats for Airboat
			if GetConVarNumber("hl2c_passenger_seats") >= 1 then
				if ALLOWED_VEHICLE == "Airboat" || ALLOWED_VEHICLE == "Named Airboat" || ALLOWED_VEHICLE == "Airboat Gun" then
					local spawnedvehicle2 = pl.vehicle
					local seat2 = ents.Create( "prop_vehicle_prisoner_pod" )
					seat2:SetModel( "models/nova/airboat_seat.mdl" )
					seat2:SetPos( pl.vehicle:LocalToWorld( Vector( 0,-48,68 ) ) )
					seat2:SetAngles( pl.vehicle:LocalToWorldAngles( Angle( 0,0,0 ) ) )
					seat2:Spawn()
					seat2:SetKeyValue( "limitview", "1" )
					seat2:SetKeyValue( "targetname", "hl2c_passenger_seat" )
					seat2:SetMoveType( MOVETYPE_NONE )
					seat2:SetParent( spawnedvehicle2, -1 )
					seat2:SetSaveValue("m_bLocked", true)
					seat2:SetNoDraw(true)
					pl.seat = seat2
				end
			end
		end
		-- pl:EnterVehicle( pl.vehicle )
	else
		Hl2c.PersonDefaultChatPrint("You may not spawn a vehicle at this time.",pl)
	end
	-- print("hi")
end
--

// Called when player wants to remove their vehicle
function GM:ShowSpare2(pl)
	if HL2MP_IS_COOP_MAP then return end
	--if pl.veh
	if pl.vehicleAllowed == true && NEW_VEHICLE_SPAWN == true then	
		-- pl:ExitVehicle()
		pl:RemoveVehicle()
		--PrintMessage(HUD_PRINTTALK, "Called Remove Car")
	-----
	elseif NEW_VEHICLE_SPAWN != true then
		-- pl:ExitVehicle()
		pl:RemoveVehicle()
		if IsValid( pl.vehicle ) and isstring( pl.vehicle:GetClass() ) then
			-- PrintMessage(HUD_PRINTTALK, "Called Remove Car: "..tostring(pl.vehicle:GetClass()))
		end
		
	else

		pl:RemoveVehicle()
		--PrintMessage(HUD_PRINTTALK, "Called Remove Car")

	end
	if IsValid( pl.vehicle ) and isstring( pl.vehicle:GetClass() ) then
	-- pl:ExitVehicle()
	pl:RemoveVehicle()
	
		-- PrintMessage(HUD_PRINTTALK, "Called Remove Car: "..tostring(pl.vehicle:GetClass()))
	end
end

