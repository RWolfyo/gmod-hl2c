// Include the required lua files
include("sh_debug.lua")
include("sh_config.lua")
include("player/sh_player.lua")
include("npc/sh_init.lua")
include("sh_utils.lua")
include("sh_ents_extend.lua")
include("sh_entity_extend.lua")
include("sh_string_extend.lua")
//include("../player_class/player_coop.lua")


// General gamemode information

oc = oc or {}

oc.timertitle = oc.timertitle or {}


function CL_FT()
	return math.Clamp(FrameTime(), 1/(60*4), 1)
end
if !ConVarExists("hl2c_passenger_seats") then
	CreateConVar("hl2c_passenger_seats", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_REPLICATED, FCVAR_ARCHIVE }, "Make HL2C spawn in unstable passenger seats in Vehicles.")
end
if CLIENT then
concommand.Add("hl2c_respawn_dead_players", function(pl) 
	if pl:IsAdmin() && !game.SinglePlayer() then 
		net.Start( "HL2CForceRespawn_com" )
	--net.WriteString( "Hi" )
		net.SendToServer()
	elseif !pl:IsAdmin() then 
		// pl:PrintMessage(HUD_PRINTTALK, "Only admins can use this, sorry.") 
	elseif game.SinglePlayer() then 
		// pl:PrintMessage(HUD_PRINTTALK, "You cannot use this command in Singleplayer.") 
	end 
end)
end
concommand.Add("hl2c_lobby", function(pl) 
	if pl:IsPlayer() && pl:IsAdmin() && !pl:IsBot() && !game.SinglePlayer() then 
		net.Start( "HL2CLobby" )
	--net.WriteString( "Hi" )
		net.SendToServer()
	elseif pl:IsPlayer() && !pl:IsBot() then 
		// pl:PrintMessage(HUD_PRINTTALK, "Only admins can use this, sorry.") 
	elseif game.SinglePlayer() then 
		// pl:PrintMessage(HUD_PRINTTALK, "You cannot use this command in Singleplayer.") 
	--elseif pl:IsListenServerHost() then
	--	PrintMessage(HUD_PRINTTALK, "Server Forced Lobby!") 
	--	timer.Simple(5, function()
	--	game.ConsoleCommand("changelevel winter_lobby_2012\n")
	--	end)
	else 
		print("Server Forced Lobby!")
		PrintMessage(HUD_PRINTTALK, "Server Forced Lobby!") 
		timer.Simple(2.5, function()
		-- game.ConsoleCommand("changelevel winter_lobby_2012\n")
		game.ConsoleCommand("changelevel keyfox_lobby_summer\n")
		end)
	end 
end)



concommand.Add("hl2c_test", function(pl) 
	if pl:IsPlayer() && pl:IsAdmin() && !pl:IsBot() && !game.SinglePlayer() then 
		net.Start( "HL2CTest" )
	--net.WriteString( "Hi" )
		net.SendToServer()
	elseif pl:IsPlayer() && !pl:IsBot() then 
		// pl:PrintMessage(HUD_PRINTTALK, "Only admins can use this, sorry.") 
	elseif game.SinglePlayer() then 
		// pl:PrintMessage(HUD_PRINTTALK, "You cannot use this command in Singleplayer.") 
	--elseif pl:IsListenServerHost() then
	--	PrintMessage(HUD_PRINTTALK, "Server Forced Lobby!") 
	--	timer.Simple(5, function()
	--	game.ConsoleCommand("changelevel gm_flatgrass\n")
	--	end)
	else 
		-- PrintMessage(HUD_PRINTTALK, "Server Forced Test!")
		DbgPrint("Server Forced Test!")
		timer.Simple(2.5, function()
		game.ConsoleCommand("changelevel gm_flatgrass\n")
		end)
	end 
end)

if CLIENT then
	CreateClientConVar( "hl2c_autojump", 1, true, true )
end
local band = bit.band
local bor = bit.bor
local bnot = bit.bnot
--hook.Add("SetupMove", "HL2C_AutoJump", function(ply, uc)
function HL2C_AutoJump(ply, uc)
	if CLIENT and GetConVarNumber( "hl2c_autojump" ) ~= 1 then return end
	if SERVER and ply:GetInfoNum( "hl2c_autojump", 1 ) ~= 1 then return end
	
	-- if ( ply:Alive() && (ply:IsAdmin() || ply:GetCLevel() >= 100 ) ) and ply:GetMoveType() == MOVETYPE_WALK and not ply:InVehicle() and ply:WaterLevel() <= 1 and band(uc:GetButtons(), IN_JUMP) == IN_JUMP then		
		-- if ply:IsOnGround() then
			-- uc:SetButtons( bor( uc:GetButtons(), IN_JUMP) )
			-- local divide = 15
			-- local vel = ply:GetVelocity()/divide
			-- ply:SetVelocity(vel) 
		-- else
			-- uc:SetButtons( band( uc:GetButtons(), bnot(IN_JUMP)) )
		-- end
	-- end
end
hook.Add("SetupMove", "_HL2C_AutoJump", HL2C_AutoJump)




// Create the teams that we are going to use throughout the game
function GM:CreateTeams()
	TEAM_ALIVE = 1
	team.SetUp(TEAM_ALIVE, "Alive", Color(81, 124, 199, 255))
	
	TEAM_COMPLETED_MAP = 2
	team.SetUp(TEAM_COMPLETED_MAP, "Completed Map", Color(81, 124, 199, 255))
	
	TEAM_DEAD = 3
	team.SetUp(TEAM_DEAD, "Dead", Color(81, 124, 199, 255))
	
	TEAM_BOT_SPECTATOR = 4
	team.SetUp(TEAM_BOT_SPECTATOR, "BOT", Color(81, 124, 199, 255))
	
	TEAM_COMBINE = 5
	team.SetUp(TEAM_COMBINE, "Combine", Color(50, 50, 255, 255))
	
	TEAM_COMBINE_DEAD = 6
	team.SetUp(TEAM_COMBINE_DEAD, "Combine Dead", Color(50, 50, 255, 255))
end


// Called when a gravity gun is attempting to punt something
function GM:GravGunPunt(pl, ent) 

	if SUPER_GRAVITY_GUN != true and IsValid(ent) and ent:IsNPC() and isstring(ent:GetClass()) and Hl2c.GravGun_Dmg_List[ent:GetClass()] then
		return false
	end
	
	
	-- print(ent:IsVehicle())
	-- print(ent)
	-- print(ent.creator)
	-- print(pl.vehicle)
	if IsValid(ent) and ent:IsVehicle() and pl.ep2jeep and ent.ep2player and (pl.ep2jeep != ent or ent.ep2player != pl) then
		return false
	end
	
 	if IsValid(ent) && ent:IsVehicle() && ent != pl.vehicle && ent.creator then
		return false
	end
 	if IsValid(ent) and isstring(ent:GetClass()) and ent:GetClass() == "gmod_sent_vehicle_fphysics_base" and ent != pl.vehicle and ent.creator then
		return false
	end
	
	if IsValid(ent) && ent:IsPet() && ent:GetOwner() != pl then
		return false
	end
	
	return true
end 

// Called when a gravity gun is attempting to pickup something
function GM:GravGunPickupAllowed( ply, ent )

	if ent && ent:IsPet() && ent:GetOwner() != ply then
		return false
	end
	
	return true
end


// Called when a physgun tries to pick something up
function GM:PhysgunPickup(pl, ent)
	if string.find(ent:GetClass(), "trigger_") || ent:GetClass() == "player" || ent:GetClass() == "prop_vehicle_prisoner_pod" || ent:GetClass() == "brush_" then
		return false
	end
	
	
	
	if ent:IsPet() and ent:GetOwner() != pl then 
	 return false
	end
	return true
end


// Called when a player entered a vehicle
function GM:PlayerEnteredVehicle(pl, vehicle, role)
	if IsEp2() and vehicle:GetClass() == "prop_vehicle_jeep" then pl.ep2jeep = vehicle vehicle.ep2player = pl end
	if vehicle:GetClass() == "prop_vehicle_jeep" then return end
	if vehicle:GetClass() == "prop_vehicle_prisoner_pod" then return end
	if pl.vehicle and vehicle:GetClass() == "prop_vehicle_prisoner_pod" and pl.vehicle:GetClass() == "gmod_sent_vehicle_fphysics_base" then return end
	if pl.vehicle != vehicle then
		pl.vehicle = vehicle
		
		if vehicle.creator then
			vehicle.creator.vehicle = nil
		end
		
		vehicle.creator = pl
	end
	
end

function IsEp2()
	if Hl2c.Maps.Ep2[game.GetMap()] then return true else return false end
end
function IsEp1()
	if Hl2c.Maps.Ep1[game.GetMap()] then return true else return false end
end
function IsHl2()
	if Hl2c.Maps.Hl2[game.GetMap()] then return true else return false end
end

--[[---------------------------------------------------------
   Name: gamemode:KeyPress( )
   Desc: Player pressed a key (see IN enums)
-----------------------------------------------------------]]
-- function GM:KeyPress( pl, key )
hook.Add("KeyPress","KeyPress_Server",function(pl,key)

end)
-- end

--[[---------------------------------------------------------
   Name: gamemode:KeyRelease( )
   Desc: Player released a key (see IN enums)
-----------------------------------------------------------]]
-- function GM:KeyRelease( pl, key )
hook.Add("KeyRelease","KeyRelease_Server",function(pl,key)

end)

// Players should never collide with each other or NPC's
hook.Remove("hl2cShouldCollide")
hook.Add("ShouldCollide", "hl2cShouldCollide", function(entA, entB)
--function GM:ShouldCollide(entA, entB)
	
	if IsEp2() != true then
	-- print("hi")
	// We must Set Up Collision between players and cars
	-- if entA:IsPlayer() and entB:IsVehicle() and entA.vehicle and entA.vehicle != entB then return false end
	-- if entB:IsPlayer() and entA:IsVehicle() and entB.vehicle and entB.vehicle != entA then return false end
	
	-- if entA:IsPlayer() and entB:IsVehicle() and entB.creator and entB.creator != entA then return false end
	-- if entB:IsPlayer() and entA:IsVehicle() and entA.creator and entA.creator != entB then return false end
	end
	// We must Set Up Collision between players and their teams
	if entA:IsPlayer() and entB:IsPlayer() and entB:Team() == entA:Team() then return false end
	if entA:IsPlayer() and entB:IsPlayer() and entB:Team() != entA:Team() then return true end
	
	// Set Up Pets Collision with Players
	if entB:IsPet() and entA:IsPlayer() then return false end
	if entA:IsPet() and entB:IsPlayer() then return false end
	
	
	
	if HL2MP_IS_COOP_MAP then
		if entA && entB && ((entA:IsPlayer() && (entB:IsPlayer() || table.HasValue(GODDLIKE_NPCS, entB:GetClass()) || table.HasValue(FRIENDLY_NPCS, entB:GetClass()))) || (entB:IsPlayer() && (entA:IsPlayer() || table.HasValue(GODDLIKE_NPCS, entA:GetClass()) || table.HasValue(FRIENDLY_NPCS, entA:GetClass())))) then
			return false
		end
	elseif CD_MAP then
		if entA && entB && entA:IsPlayer() && entB:IsPlayer() || table.HasValue(GODLIKE_CD, entB:GetClass()) || entB:IsPlayer() && entA:IsPlayer() || table.HasValue(GODLIKE_CD, entA:GetClass()) then
			return false
		end
	else
		if entA && entB && ((entA:IsPlayer() && (entB:IsPlayer() || table.HasValue(GODLIKE_NPCS, entB:GetClass()) || table.HasValue(FRIENDLY_NPCS, entB:GetClass()))) || (entB:IsPlayer() && (entA:IsPlayer() || table.HasValue(GODLIKE_NPCS, entA:GetClass()) || table.HasValue(FRIENDLY_NPCS, entA:GetClass())))) then
			return false
		end
	end
--end	
end)

// Called when a player is being attacked
hook.Add("PlayerShouldTakeDamage", "hl2cPlayerShouldTakeDamage", function(pl, attacker)
--function GM:PlayerShouldTakeDamage(pl, attacker)
	-- print(attacker:GetOwner())
	if pl and attacker and attacker:IsPlayer() and pl == attacker then
		return true
	end
	if pl and attacker and attacker:IsPlayer() and pl:IsPlayer() and pl:Team() == attacker:Team() then
		return false
	end
	if pl:Team() == TEAM_ALIVE and attacker and attacker:IsPlayer() and attacker:Team() == TEAM_COMBINE then
		return true
	end
	if pl:Team() == TEAM_COMBINE and attacker and attacker:IsPlayer() and attacker:Team() == TEAM_ALIVE then
		return true
	end
	
	if pl:Team() == TEAM_COMBINE and attacker and table.HasValue(GODLIKE_CD,attacker:GetClass() ) then
		return false
	end
	if HL2MP_IS_COOP_MAP then
		if pl:Team() != TEAM_ALIVE || !pl.vulnerable || (attacker:IsPlayer() && attacker != pl) || (attacker:IsVehicle() && attacker:GetDriver():IsPlayer()) || table.HasValue(GODDLIKE_NPCS, attacker:GetClass()) || table.HasValue(FRIENDLY_NPCS, attacker:GetClass()) then
			return false
			
		else
			return true
		end
	elseif CD_MAP then
		if pl:Team() != TEAM_ALIVE || !pl.vulnerable || (attacker:IsPlayer() && attacker != pl) || (attacker:IsVehicle() && attacker:GetDriver():IsPlayer()) || table.HasValue(GODLIKE_CD, attacker:GetClass()) then
			return false
		else
			return true
		end
	else
		if (pl:Team() != TEAM_ALIVE) || !pl.vulnerable || (attacker:IsPlayer() && attacker != pl) || (attacker:IsVehicle() && attacker:GetDriver():IsPlayer()) || table.HasValue(GODLIKE_NPCS, attacker:GetClass()) || table.HasValue(FRIENDLY_NPCS, attacker:GetClass()) then
			-- print("World Dmg")
			if (pl:Team() == TEAM_COMBINE) || !pl.vulnerable || (attacker:IsPlayer() && attacker != pl) || (attacker:IsVehicle() && attacker:GetDriver():IsPlayer()) || table.HasValue(GODLIKE_NPCS, attacker:GetClass()) || table.HasValue(FRIENDLY_NPCS, attacker:GetClass()) then return true end
			return false
		
		else
			return true
		end
	end
	-- print("World Dmg")
	return true
--end
end)

function GM:StartCommand(ply,cmd)
	if cmd:KeyDown(IN_SPEED) == true and (ply:IsSuitEquipped() ~= true or ply:WaterLevel() >= 1) and ply:InVehicle() == false then
		cmd:SetButtons(bit.band(cmd:GetButtons(), bit.bnot(IN_SPEED)))
	end
	if ply:Crouching() == true and ply:KeyDown(IN_DUCK) == false and cmd:KeyDown(IN_DUCK) == true then
		cmd:SetButtons(bit.band(cmd:GetButtons(), bit.bnot(IN_DUCK)))
	end
end

function GM:PlayerFootstep( pl, pos, foot, sound, volume, filter )
	
	if pl:KeyDown(IN_WALK) then
		return true
	end
	if pl:Team() == TEAM_ALIVE then
		// Somehow Rebel team footstep buggy.
		--pl:EmitSound( "player/footsteps/concrete" .. math.random( 1, 4 ) .. ".wav", 75, 100, volume )
		return false -- Allow Default footsteps
	elseif pl:Team() == TEAM_COMBINE then
		
		pl:EmitSound( "npc/combine_soldier/gear" .. math.random( 1, 6 ) .. ".wav", 75, 100, volume )
		
	end
	
	return true -- Don't allow default footsteps
end

// Players shouldn't be mute when being hurt.
function GM:PlayerHurt(pl, attacker, healthRemaining, damageTaken)
	-- If the HL2C Additions is set to 0 OR the game is in singleplayer, just forgot about this function.
	if GetConVarNumber("hl2c_additions") == 0 || game.SinglePlayer() then return end
	-- Make sure the player is valid and alive.
	if pl:Alive() and (pl:Team() == TEAM_ALIVE or pl:Team() == TEAM_COMBINE ) then else return end
	if (!pl:Alive()) then return end
	
	--local modelNameShared = player_manager.TranslatePlayerModel(pl:GetInfo("cl_playermodel"))
	--local modelNameShared = (pl:GetInfo("cl_playermodel"))
	local modelNameShared = pl:GetHeadModel()
	-- print( pl:GetHeadModel() )
	-- print(pl:GetNWString("Head_Model"))
	
	-- COMBINE --
	-- math.random it so players don't emit the pain sound all the time.
	if ( math.random( 1, 4 ) <= 3 ) and (CD_MAP or pl:Team() == TEAM_COMBINE ) then
		-- if modelNameShared && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameShared)) then
			pl:EmitSound(COMBINE_HURT_SOUNDS[math.random(1, #COMBINE_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
			return
		-- end
	end
	-- COMBINE --
	if modelNameShared and pl:Team() == TEAM_ALIVE and !CD_MAP and ( math.random( 1, 4 ) <= 3 ) and table.HasValue(PLAYER_MODELS_COMBINE, string.lower( modelNameShared ) )  then
		-- if modelNameShared && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameShared)) then
			pl:EmitSound(COMBINE_HURT_SOUNDS[math.random(1, #COMBINE_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
			return
		-- end
	end
	
	-- MALE --
	-- math.random it so players don't emit the pain sound all the time.
	if pl:Team() == TEAM_ALIVE and ( math.random( 1, 4 ) <= 3 ) then
		if modelNameShared && table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameShared)) then
			pl:EmitSound(MALE_HURT_SOUNDS[math.random(1, #MALE_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
			return
		end
	end
	-- MALE --
	
	-- FEMALE --
	-- math.random it so players don't emit the pain sound all the time.
	if pl:Team() == TEAM_ALIVE and ( math.random( 1, 4 ) <= 3 ) then
		if modelNameShared && table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameShared)) then
			pl:EmitSound(FEMALE_HURT_SOUNDS[math.random(1, #FEMALE_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
			return
		end
	end
	-- FEMALE --


	// Do we really want these custom voice lines playing when playermodel restrictions are on? We're gonna have combine rebels if I don't do this.
	-- if GetConVarNumber("hl2c_playermodel_restrictions") == 0 then
	
		-- COMBINE --
		-- math.random it so players don't emit the pain sound all the time.
		-- if ( math.random( 1, 4 ) <= 3 ) then
			-- if modelNameShared && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameShared)) then
				-- pl:EmitSound(COMBINE_HURT_SOUNDS[math.random(1, #COMBINE_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
			-- end
		-- end
		-- COMBINE --
		
		-- ALYX --
		-- Even though she isn't on the player_models list, she doesn't need to be mute.
		-- math.random it so players don't emit the pain sound all the time.
		-- if ( math.random( 1, 4 ) <= 3 ) then
			-- if modelNameShared == "models/player/alyx.mdl" then
				-- pl:EmitSound(ALYX_HURT_SOUNDS[math.random(1, #ALYX_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
				-- return
			-- end
		-- end
		-- ALYX --
		
		-- BARNEY --
		-- Even though barney is a custom playermodel from the list, he shouldn't be mute.
		-- math.random it so players don't emit the pain sound all the time.
		-- if ( math.random( 1, 4 ) <= 3 ) then
			-- if modelNameShared == "models/player/barney.mdl" then
				-- pl:EmitSound(BARNEY_HURT_SOUNDS[math.random(1, #BARNEY_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
				-- return
			-- end
		-- end
		-- BARNEY --
	-- end
	
	-- if GetConVarNumber("hl2c_playermodel_restrictions") == 0 then
		-- if ( math.random( 1, 4 ) <= 3 ) then
			-- if modelNameShared != "models/player/alyx.mdl" && modelNameShared != "models/player/barney.mdl" && (modelNameShared && !table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameShared))) && (modelNameShared && !table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameShared))) && (modelNameShared && !table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameShared))) then
				-- pl:EmitSound(PLAYER_HURT_SOUNDS[math.random(1, #PLAYER_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
			-- end
		-- end
	-- else
		-- if ( math.random( 1, 4 ) <= 3 ) then
			-- if (modelNameShared && !table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameShared))) && (modelNameShared && !table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameShared))) then
				-- pl:EmitSound(PLAYER_HURT_SOUNDS[math.random(1, #PLAYER_HURT_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
			-- end
		-- end
	-- end
end

function GM:OnPlayerAmmoDepleted(ply, wep)

	-- DbgPrint("Ammo Depleted: " .. tostring(ply) .. " - " .. tostring(wep) )

	if SERVER then
		-- self:SelectBestWeapon(ply)
	end

	if CLIENT then
		ply:EmitSound("hl1/fvox/ammo_depleted.wav", 75, 100, 0.5)
	end

end

-- function GM:EntityFireBullets(ent, data)
hook.Add("EntityFireBullets", "Hl2c.OnPlayerAmmoDepleted", function(ent, data)

	local wep

	if ent:IsPlayer() then


		-- We have to assume its fired by the weapon.
		wep = ent:GetActiveWeapon()
		if IsValid(wep) then


			local ammo = game.GetAmmoName(wep:GetPrimaryAmmoType())

			if ent:IsPlayer() then

				local primaryAmmo = ent:GetAmmoCount(wep:GetPrimaryAmmoType())
				local secondaryAmmo = ent:GetAmmoCount(wep:GetSecondaryAmmoType())
				local clip1 = wep:Clip1()
				local clip2 = wep:Clip2()

				-- Treat as empty.
				if clip2 == -1 then clip2 = 0 end

				if primaryAmmo == 0 and secondaryAmmo == 0 and clip1 == 0 and clip2 == 0 and IsFirstTimePredicted() then
					GAMEMODE:OnPlayerAmmoDepleted(ent, wep)
				end



			end

		end

	end


end)
-- end

if CLIENT then
	language.Add("HL2_Chapter1_Title", "POINT INSERTION")
	language.Add("HL2_Chapter2_Title", "\"A RED LETTER DAY\"")
	language.Add("HL2_Chapter3_Title", "ROUTE KANAL")
	language.Add("HL2_Chapter4_Title", "WATER HAZARD")
	language.Add("HL2_Chapter5_Title", "BLACK MESA EAST")
	language.Add("HL2_Chapter6_Title", "\"WE DON'T GO TO RAVENHOLM...\"")
	language.Add("CHAPTER6_TITLE", "\"WE DON'T GO TO RAVENHOLM...\"")
	language.Add("HL2_Chapter7_Title", "HIGHWAY 17")
	language.Add("HL2_Chapter8_Title", "SANDTRAPS")
	language.Add("HL2_Chapter9_Title", "NOVA PROSPEKT")
	language.Add("HL2_Chapter9a_Title", "ENTANGLEMENT")
	language.Add("HL2_Chapter10_Title", "ANTICITIZEN ONE")
	language.Add("HL2_Chapter11_Title", "\"FOLLOW FREEMAN!\"")
	language.Add("HL2_Chapter12_Title", "OUR BENEFACTORS")
	language.Add("HL2_Chapter13_Title", "DARK ENERGY")
	language.Add("HL2_Chapter14_Title", "CREDITS")

	language.Add("hl2_AmmoFull", "FULL")

	language.Add("HL2_GameOver_Object", "ASSIGNMENT: TERMINATED\nSUBJECT: FREEMAN\nREASON: FAILURE TO PRESERVE MISSION-CRITICAL RESOURCES")
	language.Add("HL2_GameOver_Ally", "ASSIGNMENT: TERMINATED\nSUBJECT: FREEMAN\nREASON: FAILURE TO PRESERVE MISSION-CRITICAL PERSONNEL")
	language.Add("HL2_GameOver_Timer", "ASSIGNMENT: TERMINATED\nSUBJECT: FREEMAN\nREASON: FAILURE TO PREVENT TIME-CRITICAL SEQUENCE")
	language.Add("HL2_GameOver_Stuck", "ASSIGNMENT: TERMINATED\nSUBJECT: FREEMAN\nREASON: DEMONSTRATION OF EXCEEDINGLY POOR JUDGMENT")

	language.Add("HL2_357Handgun", ".357 MAGNUM")
	language.Add("HL2_Pulse_Rifle", "PULSE-RIFLE")
	language.Add("HL2_Bugbait", "BUGBAIT")
	language.Add("HL2_Crossbow", "CROSSBOW")
	language.Add("HL2_Crowbar", "CROWBAR")
	language.Add("HL2_Grenade", "GRENADE")
	language.Add("HL2_GravityGun", "GRAVITY GUN")
	language.Add("HL2_Pistol", "9MM PISTOL")
	language.Add("HL2_RPG", "RPG")
	language.Add("HL2_Shotgun", "SHOTGUN")
	language.Add("HL2_SMG1", "SMG")

	language.Add("HL2_Saved", "Saved...")

	language.Add("HL2_Credits_VoicesTitle", "Voices:")
	language.Add("HL2_Credits_Eli", "Robert Guillaume - Dr. Eli Vance")
	language.Add("HL2_Credits_Breen", "Robert Culp - Dr. Wallace Breen")
	language.Add("HL2_Credits_Vortigaunt", "Lou Gossett, Jr. - Vortigaunt")
	language.Add("HL2_Credits_Mossman", "Michelle Forbes - Dr. Judith Mossman")
	language.Add("HL2_Credits_Alyx", "Merle Dandridge - Alyx Vance")
	language.Add("HL2_Credits_Barney", "Mike Shapiro - Barney Calhoun")
	language.Add("HL2_Credits_Gman", "Mike Shapiro - Gman")
	language.Add("HL2_Credits_Kleiner", "Harry S. Robins - Dr. Isaac Kleiner")
	language.Add("HL2_Credits_Grigori", "Jim French - Father Grigori")
	language.Add("HL2_Credits_Misc1", "John Patrick Lowrie - Citizens\\Misc. characters")
	language.Add("HL2_Credits_Misc2", "Mary Kae Irvin - Citizens\\Misc. characters")
	language.Add("HL2_Credits_Overwatch", "Ellen McLain - Overwatch")

	language.Add("HL2_Credits_VoiceCastingTitle", "Voice Casting:")
	language.Add("HL2_Credits_VoiceCastingText", "Shana Landsburg\\Teri Fiddleman")

	language.Add("HL2_Credits_VoiceRecordingTitle", "Voice Recording:")
	language.Add("HL2_Credits_VoiceRecordingText1", "Pure Audio, Seattle, WA")
	language.Add("HL2_Credits_VoiceRecordingText2", "LA Studios, LA, CA")

	language.Add("HL2_Credits_VoiceSchedulingTitle", "Voice recording scheduling and logistics:")
	language.Add("HL2_Credits_VoiceSchedulingText", "Pat Cockburn, Pure Audio")

	language.Add("HL2_Credits_LegalTeam", "Crack Legal Team:")
	language.Add("HL2_Credits_FacesThanks", "Thanks to the following for the use of their faces:")
	language.Add("HL2_Credits_SpecialThanks", "Special thanks to everyone at:")

	language.Add("HL2_HIT_CANCOP_WITHCAN_NAME", "Defiant")
	language.Add("HL2_HIT_CANCOP_WITHCAN_DESC", "Hit the trashcan cop with the can.")
	language.Add("HL2_PUT_CANINTRASH_NAME", "Submissive")
	language.Add("HL2_PUT_CANINTRASH_DESC", "Put the can in the trash.")
	language.Add("HL2_ESCAPE_APARTMENTRAID_NAME", "Malcontent")
	language.Add("HL2_ESCAPE_APARTMENTRAID_DESC", "Escape the apartment block raid.")
	language.Add("HL2_BREAK_MINITELEPORTER_NAME", "What cat?")
	language.Add("HL2_BREAK_MINITELEPORTER_DESC", "Break the mini-teleporter in Kleiner's lab.")
	language.Add("HL2_GET_CROWBAR_NAME", "Trusty Hardware")
	language.Add("HL2_GET_CROWBAR_DESC", "Get the crowbar.")
	language.Add("HL2_KILL_BARNACLESWITHBARREL_NAME", "Barnacle Bowling")
	language.Add("HL2_KILL_BARNACLESWITHBARREL_DESC", "Kill five barnacles with one barrel.")
	language.Add("HL2_GET_AIRBOAT_NAME", "Anchor's Aweigh!")
	language.Add("HL2_GET_AIRBOAT_DESC", "Get the airboat.")
	language.Add("HL2_FLOAT_WITHAIRBOAT_NAME", "Catching Air")
	language.Add("HL2_FLOAT_WITHAIRBOAT_DESC", "Float five seconds in the air with the airboat.")
	language.Add("HL2_GET_AIRBOATGUN_NAME", "Heavy Weapons")
	language.Add("HL2_GET_AIRBOATGUN_DESC", "Get the airboat's mounted gun.")
	language.Add("HL2_FIND_VORTIGAUNTCAVE_NAME", "Vorticough")
	language.Add("HL2_FIND_VORTIGAUNTCAVE_DESC", "Discover the hidden singing vortigaunt cave in chapter Water Hazard.")
	language.Add("HL2_KILL_CHOPPER_NAME", "Revenge!")
	language.Add("HL2_KILL_CHOPPER_DESC", "Destroy the hunter-chopper in Half-Life 2.")
	language.Add("HL2_FIND_HEVFACEPLATE_NAME", "Blast from the Past")
	language.Add("HL2_FIND_HEVFACEPLATE_DESC", "Find the HEV Suit Charger faceplate in Eli's scrapyard.")
	language.Add("HL2_GET_GRAVITYGUN_NAME", "Zero-Point Energy")
	language.Add("HL2_GET_GRAVITYGUN_DESC", "Get the Gravity Gun in Black Mesa East.")
	language.Add("HL2_MAKEABASKET_NAME", "Two Points")
	language.Add("HL2_MAKEABASKET_DESC", "Use DOG's ball to make a basket in Eli's scrapyard.")
	language.Add("HL2_BEAT_RAVENHOLM_NOWEAPONS_NAME", "Zombie Chopper")
	language.Add("HL2_BEAT_RAVENHOLM_NOWEAPONS_DESC", "Play through Ravenholm using only the Gravity Gun.")
	language.Add("HL2_BEAT_CEMETERY_NAME", "Hallowed Ground")
	language.Add("HL2_BEAT_CEMETERY_DESC", "Escort Grigori safely through the church cemetery.")
	language.Add("HL2_KILL_ENEMIES_WITHCRANE_NAME", "OSHA Violation")
	language.Add("HL2_KILL_ENEMIES_WITHCRANE_DESC", "Kill 3 enemies using the crane.")
	language.Add("HL2_PIN_SOLDIER_TOBILLBOARD_NAME", "Targetted Advertising")
	language.Add("HL2_PIN_SOLDIER_TOBILLBOARD_DESC", "Pin a soldier to the billboard in chapter Highway 17.")
	language.Add("HL2_KILL_ODESSAGUNSHIP_NAME", "Where Cubbage Fears to Tread")
	language.Add("HL2_KILL_ODESSAGUNSHIP_DESC", "Defend Little Odessa from the gunship attack.")
	language.Add("HL2_KILL_THREEGUNSHIPS_NAME", "One Man Army")
	language.Add("HL2_KILL_THREEGUNSHIPS_DESC", "Destroy six gunships in Half-Life 2.")
	language.Add("HL2_BEAT_DONTTOUCHSAND_NAME", "Keep Off the Sand!")
	language.Add("HL2_BEAT_DONTTOUCHSAND_DESC", "Cross the antlion beach in chapter Sandtraps without touching the sand.")
	language.Add("HL2_KILL_BOTHPRISONGUNSHIPS_NAME", "Uninvited Guest")
	language.Add("HL2_KILL_BOTHPRISONGUNSHIPS_DESC", "Kill both gunships in the Nova Prospekt courtyard.")
	language.Add("HL2_KILL_ENEMIES_WITHANTLIONS_NAME", "Bug Hunt")
	language.Add("HL2_KILL_ENEMIES_WITHANTLIONS_DESC", "Use the antlions to kill 50 enemies.")
	language.Add("HL2_KILL_ENEMY_WITHTOILET_NAME", "Flushed")
	language.Add("HL2_KILL_ENEMY_WITHTOILET_DESC", "Kill an enemy with a toilet.")
	language.Add("HL2_BEAT_TURRETSTANDOFF2_NAME", "Warden Freeman")
	language.Add("HL2_BEAT_TURRETSTANDOFF2_DESC", "Survive the second turret standoff in Nova Prospekt.")
	language.Add("HL2_FOLLOWFREEMAN_NAME", "Follow Freeman")
	language.Add("HL2_FOLLOWFREEMAN_DESC", "Gain command of a squad of rebels in the uprising.")
	language.Add("HL2_BEAT_TOXICTUNNEL_NAME", "Radiation Levels Detected")
	language.Add("HL2_BEAT_TOXICTUNNEL_DESC", "Get through the toxic tunnel under City 17 in Half-Life 2.")
	language.Add("HL2_BEAT_PLAZASTANDOFF_NAME", "Plaza Defender")
	language.Add("HL2_BEAT_PLAZASTANDOFF_DESC", "Survive the generator plaza standoff in chapter Anticitizen One.")
	language.Add("HL2_KILL_ALLC1709SNIPERS_NAME", "Counter-Sniper")
	language.Add("HL2_KILL_ALLC1709SNIPERS_DESC", "Kill all of the snipers in City 17.")
	language.Add("HL2_BEAT_SUPRESSIONDEVICE_NAME", "Fight the Power")
	language.Add("HL2_BEAT_SUPRESSIONDEVICE_DESC", "Shut down the supression device by disabling its generators.")
	language.Add("HL2_BEAT_C1713STRIDERSTANDOFF_NAME", "Giant Killer")
	language.Add("HL2_BEAT_C1713STRIDERSTANDOFF_DESC", "Survive the rooftop strider battle in the ruins of City 17.")
	language.Add("HL2_DISINTEGRATE_SOLDIERSINFIELD_NAME", "Atomizer")
	language.Add("HL2_DISINTEGRATE_SOLDIERSINFIELD_DESC", "Disintegrate 15 soldiers by throwing them into a Combine ball field.")
	language.Add("HL2_BEAT_GAME_NAME", "Singularity Collapse")
	language.Add("HL2_BEAT_GAME_DESC", "Destroy the Citadel's reactor core.")
	language.Add("HL2_FIND_ALLLAMBDAS_NAME", "Lambda Locator")
	language.Add("HL2_FIND_ALLLAMBDAS_DESC", "Find all lambda caches in Half-Life 2.")

	language.Add("World", "Cruel World")
	language.Add("base_ai", "Creature")
end
// SpawnMenu Addin new items.
function Add_Spawn(cl,nm,ofs,icn,kv,sf,mdl,sk)
	if cl and cl != nil and isstring(cl) then else return end
	if nm and nm != nil and isstring(nm) then else nm = "UNNAMED" end
	if ofs and ofs != nil and isvector(ofs) then else ofs = Vector(0,0,30) end
	if icn and icn != nil and isstring(icn) then else icn = "entities/".. tostring(cl) ..".png" end
	if kv and kv != nil and istable(kv) then else kv = {targetname = "spawn_noname"} end
	if sf and sf != nil and istable(sf) then else sf = {[1] = 0} end
	if mdl and mdl != nil and isstring(mdl) then else mdl = "" end
	if sk and sk != nil and isnumber(sk) then else sk = 0 end
	
	table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
		{ 
		classname = cl,
		name = nm,
		model = mdl,
		skin = sk,
		icon = icn,
		spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
		Spawnflags = sf,
		offset = ofs,
		KeyValues = kv,
		}
	)
end



Add_Spawn("npc_strider","Strider",Vector(0,0,100))
Add_Spawn("npc_helicopter","Helicopter",Vector(0,0,150))
Add_Spawn("npc_combinegunship","Gunship",Vector(0,0,150))

/*
Need:
what kind of Achievement you want,
what is the id must be a string,
what is the title,
what is the detail text,
what material use.
*/
function Add_Achievement(knd,id,tl,txt,mat)
	if type(id) == string
	then else return end
	if type(tl) == string then else tl = "UNNAMED" end
	if type(txt) == string then else txt = "no detail" end
	if type(mat) == string then else mat = "vgui/achievements/hl2_find_alllambdas" end
	
	if knd == "hl2" then 
	table.insert(Hl2c.Ach.Hl2,#Hl2c.Ach.Hl2+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "episodic" or knd == "ep1" then 
	table.insert(Hl2c.Ach.Ep1,#Hl2c.Ach.Ep1+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "ep2" then 
	table.insert(Hl2c.Ach.Ep2,#Hl2c.Ach.Ep2+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "ep3" then 
	table.insert(Hl2c.Ach.Ep3,#Hl2c.Ach.Ep3+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "cd" then 
	table.insert(Hl2c.Ach.Cd,#Hl2c.Ach.Cd+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "metastasis" then 
	table.insert(Hl2c.Ach.Meta,#Hl2c.Ach.Meta+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "oc" then 
	elseif knd == "hl2mp" then 
	elseif knd == "syn" then 
	elseif knd == "coastline" then 
	table.insert(Hl2c.Ach.Coastline,#Hl2c.Ach.Coastline+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "lambdahl2" then 
	table.insert(Hl2c.Ach.Hl2Lambda,#Hl2c.Ach.Hl2Lambda+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "ep2webcache" then 
	table.insert(Hl2c.Ach.Ep2WebCache,#Hl2c.Ach.Ep2WebCache+1,{ id = id,title = tl,text = txt,material = mat,})
	elseif knd == "ep2lambda" then 
	table.insert(Hl2c.Ach.Ep2Lambda,#Hl2c.Ach.Ep2Lambda+1,{ id = id,title = tl,text = txt,material = mat,})
	else
	table.insert(Hl2c.Ach.Custom,#Hl2c.Ach.Custom+1,{ id = id,title = tl,text = txt,material = mat,})
	end
end

for i, item in pairs(HL2_ACH_LIST) do
Add_Achievement("hl2",item,HL2_ACH_LIST_TITLE[item],HL2_ACH_LIST_TEXT[item],HL2_ACH_LIST_MAT[item])
end
for i, item in pairs(EP1_ACH_LIST) do
Add_Achievement("ep1",item,EP1_ACH_LIST_TITLE[item],EP1_ACH_LIST_TEXT[item],EP1_ACH_LIST_MAT[item])
end

for i, item in pairs(EP2_ACH_LIST) do
Add_Achievement("ep2",item,EP2_ACH_LIST_TITLE[item],EP2_ACH_LIST_TEXT[item],EP2_ACH_LIST_MAT[item])
end

for i, item in pairs(GEN_ACH_LIST) do
Add_Achievement("gen",item,GEN_ACH_LIST_TITLE[item],GEN_ACH_LIST_TEXT[item],GEN_ACH_LIST_MAT[item])
end

-- for i, item in pairs(GEN_P2_ACH_LIST) do
-- Add_Achievement("gen",item,GEN_P2_ACH_LIST_TITLE[item],GEN_P2_ACH_LIST_TEXT[item],GEN_P2_ACH_LIST_MAT[item])
-- end
/*

*/
