if not SERVER then return end
local DbgPrint = GetLogging("Player_Meta_Server")
Hl2c.TELEPORT_QUEUE = {}

local oldPrint = print

local function print(...)
	-- oldPrint(...)
end

hook.Add("FinishMove", "Hl2c.PlayerTeleport", function(ply, mv)
	local tpData = Hl2c.TELEPORT_QUEUE[ply]
	if tpData != nil then
		ply:SetPos(tpData.Pos)
		ply:SetAngles(tpData.Angles)
		ply:SetVelocity(tpData.Velocity)
		Hl2c.TELEPORT_QUEUE[ply] = nil
		--print(tpData.Pos,tpData.Angles,tpData.Velocity)
		return true
	end
end)

local META_PLAYER = FindMetaTable("Player")

function META_PLAYER:SetUpMaxHP()
	-- self:SetMaxHealth(100 -5 + (self:GetCLevel() *5) + (self:GetNWInt("PSTAT_2") * 15 ) + self:GetNWInt("ISTAT_HP") )
	self:SetMaxHealth(100 -5 + (self:GetCLevel() *5) )
end
function META_PLAYER:SetUpHP()
	self:SetUpMaxHP()
	self:SetHealth(100 -5 + (self:GetCLevel() *5) )
	-- self:SetHealth(100 -5 + (self:GetCLevel() *5) + --(self:GetNWInt("PSTAT_2") * 15 ) 	)
	
end

function META_PLAYER:SetAch(name,num)

	self:SetAchi(name,num)
	-- if isstring(name) and
	-- self.setup_achi == true and
	-- isnumber(num)
	-- then
		-- self:SetNWInt(name,num)
	-- end
	-- error("[ERROR] Unkonwn Achievement Set Way".. tostring(name) .. " " .. tostring(num) )
end


function META_PLAYER:Teleport(pos, ang, vel)
	local data = {}
	data.Pos = pos
	data.Angles = ang or self:GetAngles()
	data.Velocity = Vector(0,0,0) --vel or self:GetVelocity()
	data.Ent = self
	Hl2c.TELEPORT_QUEUE[self] = data
end
if SERVER then
	
	net.Receive( "HL2C.POWERSTAT.RECEIVE.DATA", function( len, pl )
		if ( IsValid( pl ) and pl:IsPlayer() ) then
			local tbl = net.ReadTable()
			pl:LoadPSTAT(tbl)
		end
	end )
	
	function META_PLAYER:LoadPSTAT(tbl)
		if tbl and istable(tbl) and self.database["powerstat"] != nil then
			for i=1,#tbl do
				self.database["powerstat"][i] = tbl[i]
				-- self:SetNWInt("PSTAT_"..tostring(i),tbl[i])
			end
		end
		self:databaseSetLFG()
		self:SetUpMaxHP()
	end
	
	function META_PLAYER:Spawning()
		if self and IsValid(self) then else return end
		if IsHl2cSuperAdmin(self) then
			self:SetUserGroup("superadmin")
		elseif IsHl2cAdmin(self) then
			self:SetUserGroup( "admin" )
		end
		-- if Hl2c.AddPlayerChallange then Hl2c:AddPlayerChallange(self) end
		
		if self:Team() == TEAM_DEAD or self:Team() == TEAM_COMBINE_DEAD or self:Team() == TEAM_COMPLETED_MAP then self:StripWeapons() return end
		-- if self:Team() == TEAM_DEAD then end
		-- if self:Team() == TEAM_ALIVE and !self:Alive() then print("Dead?") end
		net.Start("Theatre_Close")
		net.Send(self)
		if !table.HasValue(deadPlayers, self:UniqueID()) then
		DbgPrint( "Spawn Player:",self:Nick() )
		end
		if GAMEMODE.MapScript.PrePlayerSpawn ~= nil then
			GAMEMODE.MapScript:PrePlayerSpawn(self)
		end
		if GAME_IS_HL2 or GAME_IS_EP1 or GAME_IS_EP2 then
			Hl2c.BlockedItems["weapon_airboatgun_hl2c"] = true
			Hl2c.BlockedItems["weapon_ioncannon_hl2c"] = true
			--PrintTable(Hl2c.BlockedItems)
		else
			Hl2c.BlockedItems["weapon_airboatgun_hl2c"] = true
			Hl2c.BlockedItems["weapon_ioncannon_hl2c"] = false
		end
		--Hl2c.AddPet_SQL(self:SteamID(), "PET_000", 1, 0, 240)
		
		// Change the difficulty according to number of players
		if HL2MP_IS_COOP_MAP then 
			-- if difficulty then
				if NEW_DIF then
					--print("[hl2c Difficulty] ",difficulty)
				else
					difficulty = 0.7
					default_difficulty = difficulty
					-- timer.Simple(5, function()
						-- print("[hl2c Difficulty] ",difficulty)
					-- end)
				end
			-- end
		else
			--difficulty = math.Clamp((player.GetCount() + 1.5) / 3, DIFFICULTY_RANGE[1], DIFFICULTY_RANGE[2])
			if NEW_DIF then
			else
			-- difficulty = ( 4.5 + ( math.Round(#team.GetPlayers(TEAM_ALIVE) / 9,1) ) )
			if default_difficulty then
			default_difficulty = difficulty end
			end
			--print("[hl2c Difficulty] ",difficulty)
		end
		timer.Destroy("RestartNoPl")
		-- self:StripWeapons()
		-- if self:Team() == TEAM_DEAD or self:Team() == TEAM_COMBINE_DEAD or self:Team() == TEAM_COMPLETED_MAP then
			-- self:StripWeapons()
			-- net.Start("Player_Died")
			-- net.Send(self)
			-- self:SetNoTarget(true)
			-- self:Flashlight(false)
			-- self:AllowFlashlight( false )
			-- self:AddDeaths(1)
			-- self:Spectate( 4 )
			-- return
		-- end
		
		if self:Team() == TEAM_ALIVE then
			net.Start("Player_Spawn")
			net.Send(self)
			--self:AllowFlashlight( true )
			self:SetNoTarget(false)
			
		end
		
		if self:Team() == TEAM_COMBINE then
			net.Start("Player_Spawn")
			net.Send(self)
			self:SetNoTarget(true)
			--self:AllowFlashlight( true )
		end
		if self:Team() != TEAM_COMBINE then
		player_manager.SetPlayerClass( self, "player_coop" )
		else
		player_manager.SetPlayerClass( self, "player_combine" )
		end
		
		
		
		if GetConVarNumber("hl2c_drop_weapon_on_death") >= 1 && !game.SinglePlayer() then
			self:ShouldDropWeapon(true)
		else
			self:ShouldDropWeapon(false)
		end

		if self:IsBot() && GetConVarNumber("hl2c_bot_spectate") != 0 then
			self:SetTeam(TEAM_BOT_SPECTATOR)
		end
		
		if self:Team() == TEAM_BOT_SPECTATOR then
			self:Spectate(OBS_MODE_IN_EYE)
			self:SetNoTarget(true)
			return
		end
		
		
		
		// Player vars
		--self.CustomWeapon = {}
		self.energy = 100
		self.flashenergy = 100
		self.givenWeapons = {}
		self.healthRemoved = 0
		self.nextEnergyCycle = 0
		self.nextSetHealth = 0
		self.sprintDisabled = false
		self.flashlightDisabled = false
		self.vehicleAllowed = false
		self.vulnerable = true
		timer.Simple(VULNERABLE_TIME, function(self) if self && self:IsValid() then self.vulnerable = true end end, self)
		
		// Player buyable abilities
		self.abilityCycle = 0
		self.abilityEnergy = 100
		self.abilityInUse = false
		self.abilityInvis = false
		self.abilityInvinc = false
		self.abilityScaler = false
		self.voicePitch = 100
		self.abilitySuitCharge = false
		self.abilityHPCharge = false
		
		// Speed, loadout, and model
		GAMEMODE:SetPlayerSpeed(self, 190, 320)
		GAMEMODE:PlayerSetModel(self)
		GAMEMODE:PlayerLoadout(self)
		
		// Set more speed stuff.
		self:SetCrouchedWalkSpeed(0.3)
		self:SetDuckSpeed(0.3)
		self:SetUnDuckSpeed(0.3)
		if HL1_CAMPAIGN == true then
			self:SetJumpPower(200)
		end
		
		// Set stuff from last level
		if self.info then
			if self.info.health > 0 then
				self:SetHealth(self.info.health)
			end
			
			if self.info.armor > 0 then
				self:SetArmor(self.info.armor)
			end
			
			self:SetFrags(self.info.score)
	--		self:SetDeaths(self.info.deaths)
		end
		timer.Simple(0.1,function()
			
			Hl2c.OnSpawnSetUpHP(self)
		end)
		// Players should avoid players
		self:SetAvoidPlayers(false)
		self:SetNoTarget(false)
		
		//Admins always be Freeman
		-- if self:IsAdmin() and self:Team() != TEAM_COMBINE then
			-- local modelNameGender = self:GetModel()
			-- if CD_MAP then
			-- self:SetModel("models/player/combine_super_soldier.mdl")
			-- else
			-- if modelNameGender && table.HasValue(PLAYER_MODELS_ADMIN, string.lower(modelNameGender)) then
			-- self:SetSkin(1)
			-- self:SetModel("models/romsn/gordon_player.mdl")
			-- end
			-- if self:GetModel() == "models/romsn/gordon_player.mdl" then
			-- self:SetSkin(1)
			-- self:SetModel("models/romsn/gordon_player.mdl")
			-- end
			-- end
		-- end
		
		// If the player died before, kill them again
		if table.HasValue(deadPlayers, self:UniqueID()) then
			if GetConVarNumber("hl2c_classic") >= 1 then
				self:PrintMessage(HUD_PRINTTALK, "You may not respawn until the next map or when a checkpoint is reached. Nice try though.")
			elseif GetConVarNumber("hl2c_classic") == 0 then
				self:PrintMessage(HUD_PRINTTALK, "You may not respawn until the next map. Nice try though.")
			end

			if !HL2MP_IS_COOP_MAP then 
				self:RemoveVehicle()
			end

		end
		
		self:SetupHands()
		// Temporary feature.
		-- if !PLAYER_IS_CITIZEN then
			-- if !string.find(game.GetMap(), "d1_trainstation_") then
				-- if GetConVarString("hl2c_custom_weapon_1") != "" then
					-- self:Give(GetConVarString("hl2c_custom_weapon_1"))
				-- end
					
				-- if GetConVarString("hl2c_custom_weapon_2") != "" then
					-- self:Give(GetConVarString("hl2c_custom_weapon_2"))
				-- end
					
				-- if GetConVarString("hl2c_custom_weapon_3") != "" then
					-- self:Give(GetConVarString("hl2c_custom_weapon_3"))
				-- end
				
				-- if GetConVarString("hl2c_custom_weapon_4") != "" then
					-- self:Give(GetConVarString("hl2c_custom_weapon_4"))
				-- end
				
				-- if GetConVarString("hl2c_custom_weapon_5") != "" then
					-- self:Give(GetConVarString("hl2c_custom_weapon_5"))
				-- end
			-- end
		-- end
		self:Flashlight(false)
		
		util.RunNextFrame(function()
		
			if default_difficulty then
				difficulty = default_difficulty
			else
				default_difficulty = difficulty
			end
			
			if file.Exists("hl2c_data/hl2c_difficulty.txt", "DATA") then
				if LOBBY_MAP or HL2MP_IS_COOP_MAP then
					file.Delete("hl2c_data/hl2c_difficulty.txt")
				else
					diffRecover = util.KeyValuesToTable(file.Read("hl2c_data/hl2c_difficulty.txt", "DATA"))
					Hl2c.Diff_Selected = diffRecover.selected
				end
			else
				-- difficulty
			end
			if GAMEMODE.MapScript.PostPlayerSpawn ~= nil and IsValid(self) then
				GAMEMODE.MapScript:PostPlayerSpawn(self)
				
			end
			-- print(difficulty,default_difficulty)
		end)
		timer.Simple(3,function()
		if IsValid(self) then 
		self:databaseSetLFG() 
		self:SetUpMaxHP()
		end
		end)
		self:databaseSetLFG()
		self:SetUpHP()
		
		self:SpawnAsCombine()
		-- local ed = EffectData()
			-- ed:SetEntity( self )
		-- util.Effect( "propspawn", ed, true, true )
	end
	
	function META_PLAYER:SpawnAsCombine()
		if self:Team() == TEAM_COMBINE then
			self:StripWeapons()
			
			-- self:Give("weapon_shotgun")
			-- self:Give("weapon_smg1")
			-- self:Give("weapon_ar2")
			-- self:Give("weapon_pistol")
			-- self:Give("weapon_frag")
			-- self:Give("weapon_stunstick")
			
			self:Flashlight(false)
			self:AllowFlashlight( true )
			-- local value = math.random(6,9)
			-- local value = math.random(2,5)
			local value = 2
			if HL2C_COMBINE_CLASS == "Soldier" then
				value = math.random(2,4)
				if math.random(1,90) == 50 then
					value = 5
				end
			elseif HL2C_COMBINE_CLASS == "Prison" then
				value = math.random(6,8)
				if math.random(1,90) == 50 then
					value = 9
				end
			elseif HL2C_COMBINE_CLASS == "Metrocop" then
				value = 11
			else
				value = math.random(2,5)
			end
			if math.random(1,100) == 50 then
				value = 1
			elseif math.random(1,100) == 51 then
				value = 10
			end
			for k, v in pairs(Hl2c.Combine.Class) do
				-- print(k)
				if value == k then
					self:StripWeapons()
					for _, wep in pairs(v["Weapons"]) do
					self:Give(wep)
					end
					for ammotype, amount in pairs(v["Ammos"]) do
					self:SetAmmo( amount, ammotype )
					end
					util.PrecacheModel(v["Model"])
					self:SetModel(v["Model"])
					self:SetSkin(v["Skin"])
					-- PrintTable(self:GetBodyGroups())
				end
				
			end
			-- self:SetSkin(math.random(0,1))
			self:SetNoTarget(true)
			self:SetupHands()
			self:SetMaxHealth(150)
			self:SetHealth(150)
			-- print( player_manager.GetPlayerClass( self ) )
		end
	end
	
	

	function META_PLAYER:Pet_SetXP(value)
		if isnumber(value) then
			self:SetNWInt("pet_xp", value)
		end
	end
	function META_PLAYER:Pet_SetLevel(value)
		if isnumber(self:Pet_GetXP()) and 
		isnumber(self:Pet_GetLevel()) and
		isnumber(value) and
		value > 0 and
		value < 26
		then
			self:SetNWInt("pet_level", value)
			self:databaseSetPetLevel(self:GetNWInt("pet_level"))
		end
	end


	function META_PLAYER:Pet_LevelUp()
		if isnumber(self:Pet_GetLevel()) and
		self:Pet_GetLevel() < 25 and
		self:Pet_GetLevel() > 0 and
		isnumber(self:GetXP()) and
		isnumber(self:Pet_NextLevel()) and
		isnumber(self:Pet_NextLevelReq())
		then
			if self:Pet_GetLevel() != 25 then
				--print("XP: ", self:GetXP() )
				--print("NEXT XP: ", self:NextLevelReq() )
				--if isnumber(LevelCurve[self:GetCLevel() + 1 ]) and 
				--LevelCurve[self:GetCLevel() + 1] >= self:NextLevelReq() 
				if (isnumber(self:Pet_NextLevelReq()) and
				isnumber(self:Pet_GetXP()) ) and 
				(self:Pet_NextLevelReq() <= 0)
				then
					
					--print("XP ADDED")
					-- print("[hl2c]: Pet Level UP",self:Nick())
					-- PrintMessage(HUD_PRINTTALK, "[hl2c]: Pet Level UP: \t".. self:Nick() .." (".. self:Pet_NextLevel() ..")" )
					Hl2c.DefaultChatPrint("[hl2c]: Pet Level UP: ".. tostring(self:Nick()) .." (".. tostring(self:Pet_NextLevel()) ..")")
					-- PrintMessage(HUD_PRINTTALK, "[hl2c]: Pet Level UP: \t".. self:Nick() .." (".. self:Pet_NextLevel() ..")" )
					self:Pet_SetLevel(self:Pet_NextLevel())
					-- sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_LEVEL = ".. self:Pet_GetLevel() .." WHERE STEAMID = '".. self:SteamID() .."'")
					-- sql.Query("UPDATE ".. DB.Pet.List .." SET PET_LEVEL = ".. self:Pet_GetLevel() .." WHERE STEAMID = '".. self:SteamID() .."' AND PET_ID = '".. self:GetNWString("pet_id") .."'")
					--self:SaveXP()
					self:Pet_SetStat()
					if self:Pet_NextLevel() != 26 and 
					self:Pet_NextLevelReq() <= 0 
					then
						self:Pet_LevelUp()
					end
				end
			elseif self:Pet_GetLevel() == 25 then
				--self:Pet_SetStat()
			end
			--self:SetXP( self:GetXP() + amount )
		end
	end

	function META_PLAYER:Pet_SetStat()
		if self.petalive == true and
		IsValid(self.pet)
		then
			if isstring( self:GetNWString("pet_id") ) then
				
				if self:GetNWString("pet_id") == "PET_000" then
				self.pet:SetMaxHealth( 230 + (self:Pet_GetLevel() * 20) )
				self.pet:SetHealth( 230 + (self:Pet_GetLevel() * 20) )
				end
				
				if self:GetNWString("pet_id") == "PET_001" then
				self.pet:SetMaxHealth( 140 + (self:Pet_GetLevel() * 10) )
				self.pet:SetHealth( 140 + (self:Pet_GetLevel() * 10) )
				end
				
			end
		end
	end

	function META_PLAYER:Pet_AddXP(value)
		if HL2MP_IS_COOP_MAP == true then return end
		if isnumber(value) and 
		isnumber(self:Pet_GetXP()) and  
		isnumber(self:Pet_GetLevel()) and  
		self:Pet_GetLevel() > 0  and 
		self:Pet_GetLevel() < 25  and 
		self.petalive == true and
		IsValid(self.pet)
		then
			self:SetNWInt("pet_xp", value + self:Pet_GetXP() )
			self:databaseSetPetXP(self:GetNWInt("pet_xp"))
			--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_XP = ".. self:Pet_GetXP() .." WHERE STEAMID = '".. self:SteamID() .."'")
			-- sql.Query("UPDATE ".. DB.Pet.List .." SET PET_XP = ".. self:Pet_GetXP() .." WHERE STEAMID = '".. self:SteamID() .."' AND PET_ID = '".. self:GetNWString("pet_id") .."'")
			self:Pet_LevelUp()
		end
	end
	
	/*----------------------
	Pet HUD UPDATE
	-----------------------*/
	
	function META_PLAYER:Pet_HUD_UPDATE()
		self.pet_update_cur = self.pet_update_cur or 0
		if self.pet_update_cur + 1 < CurTime() then
			local tbl = {
				text = " ",
				cur = CurTime() + 3,
				xp = self:Pet_GetXP(),
				xpmax = self:Pet_MaxXP(),
				hp = self.pet:Health(),
				hpmax = self.pet:GetMaxHealth()
			}
			net.Start("HL2C.PET.HUD.UPDATE")
				net.WriteTable(tbl)
			net.Send(self)
		else
			self.pet_update_cur = CurTime()
		end
		-- umsg.Start("LA.PET.Notification",self)
			-- umsg.String( " " )
			-- umsg.Long( CurTime() + 3  )
		-- umsg.End()
		-- umsg.Start("LA.PET.XPUpdate",self)
			-- umsg.Long( self:Pet_GetXP() )
			-- umsg.Long( self:Pet_MaxXP()  )
		-- umsg.End()
		-- umsg.Start("LA.PET.HealthUpdate",self)
			-- umsg.Short( self.pet:Health() )
			-- umsg.Short( self.pet:GetMaxHealth()  )
		-- umsg.End()
	end
	
	/*-------------------------
	Player Level Up
	---------------------------*/
	function META_PLAYER:LevelUp()
		if isnumber(self:GetCLevel()) and
		self:GetCLevel() < EXP_MAX_LEVEL and
		self:GetCLevel() > 0 and
		isnumber(self:GetXP()) then
			-- if self:GetCLevel() < self:NextLevel() then
				--print("XP: ", self:GetXP() )
				--print("NEXT XP: ", self:NextLevelReq() )
				--if isnumber(LevelCurve[self:GetCLevel() + 1 ]) and 
				--LevelCurve[self:GetCLevel() + 1] >= self:NextLevelReq() 
				if (isnumber(self:NextLevelReq()) and
				isnumber(self:GetXP()) ) and 
				(self:NextLevelReq() <= 0)
				then
					--print("XP ADDED")
					--print("[hl2c]: Level UP",self:Nick())
					-- PrintMessage(HUD_PRINTTALK, "[hl2c]: Level UP: \t".. self:Nick() .." (".. self:NextLevel() ..")" )
					Hl2c.DefaultChatPrint("[hl2c]: Level UP: ".. tostring(self:Nick()) .." (".. tostring(self:NextLevel()) ..")" )
					if DISCORD_onPlayerLevelUp then DISCORD_onPlayerLevelUp(self,self:NextLevel()) end
					self:SetLevel(self:NextLevel())
					--self:SaveXP()
					if self:NextLevelReq() != 50000 and 
					self:NextLevelReq() <= 0 
					then
						self:LevelUp()
					end
				end
				
			-- end
			--self:SetXP( self:GetXP() + amount )
		-- elseif self:GetCLevel() >= 30 then
			-- if (isnumber(self:NextPLevelReq()) and
			-- isnumber(self:GetPXP()) ) and 
			-- (self:NextPLevelReq() <= 0)
			-- then
				-- local text = "[hl2c]: Power Level UP: ".. tostring(self:Nick()) .." (".. tostring(self:NextPLevel()) ..")"
				-- Hl2c.DefaultChatPrint( tostring(text) )
				-- if DISCORD_onPlayerPLevelUp then DISCORD_onPlayerPLevelUp(self,self:NextPLevel()) end
				-- self:SetPLevel( self:NextPLevel() ) 
				-- if self:NextPLevelReq() != 999999999 and 
				-- self:NextPLevelReq() <= 0 
				-- then
					-- self:LevelUp()
				-- end
			-- end
		end
		self:SetUpMaxHP()
	end
	
	/*-------------------------
	Player Add XP
	---------------------------*/
	function META_PLAYER:AddXP(amount)
		if HL2MP_IS_COOP_MAP == true then return end
		-- 
		amount = tonumber(amount)
		if isnumber(amount) and
		amount > 0 then
			self:AddPerma(amount)
			--continue
		else

			return
		end
		
		
		
		if self.xpsetup == false then
			return
		end
		-- DbgPrint("HAPPEN?")
		if isnumber(self:GetCLevel()) then
		
			if self:GetCLevel() == EXP_MAX_LEVEL and self:GetPLevel() == EXP_POWER_MAX_LEVEL
			then
				self:SetXP(LevelCurve[EXP_MAX_LEVEL])
				self:SetPXP(PowerLevelCurve[EXP_POWER_MAX_LEVEL])
				
			elseif self:GetCLevel() == EXP_MAX_LEVEL --and self:GetPLevel() < EXP_POWER_MAX_LEVEL 
			then
				self:SetXP(LevelCurve[EXP_MAX_LEVEL])
				--self:SetPXP(self:GetPXP() + amount )
				--self:LevelUp()
				-- Msg("working")
				
			else
				
				local set_xp = self:GetXP() + amount
				self:SetXP( set_xp )
				
				self:LevelUp()
			end
		end
		/*
		if isnumber(self:GetCLevel()) and
		self:GetCLevel() < EXP_MAX_LEVEL and
		self:GetCLevel() > 0 and
		isnumber(self:GetXP()) then
			if self:GetCLevel() < self:NextLevel() then
				print("XP: ", self:GetXP() )
				print("NEXT XP: ", self:NextLevelReq() )
				--if isnumber(LevelCurve[self:GetCLevel() + 1 ]) and 
				--LevelCurve[self:GetCLevel() + 1] >= self:NextLevelReq() 
				if (isnumber(self:NextLevelReq()) and
				isnumber(self:GetXP()) ) and 
				(self:NextLevelReq() <= 0)
				then
					print("XP ADDED")
					print("[hl2c]: Level UP",self:Nick())
					self:SetLevel(self:NextLevel())
				end
				
			end
			--self:SetXP( self:GetXP() + amount )
		end
		--if self:NextLevelReq() 
		*/
	end

--if SERVER then
	/*-------------------------
	Player Set XP
	---------------------------*/
	function META_PLAYER:SetXP(amount)
		--print(amount)
		amount = tonumber(amount)
		if isnumber(amount)
		then
			self:SetNWInt( "XP", amount )
			self:SaveXP()	
		end
		if isnumber(self:GetCLevel()) then
			if self:GetCLevel() < EXP_MAX_LEVEL and self:GetXP() >= LevelCurve[EXP_MAX_LEVEL] then
				self:SetLevel(EXP_MAX_LEVEL)
			else
				-- self:SetLevel(EXP_MAX_LEVEL)
			end
		end
		
	end
	
	function META_PLAYER:SetPXP(amount)
		amount = tonumber(amount)
		if isnumber(amount)
		then
			self:SetNWInt( "Power-XP", amount )
			self:SavePXP()	
			-- print("set power xp")
		end
		if isnumber(self:GetPLevel()) then
			if self:GetPLevel() < EXP_POWER_MAX_LEVEL and self:GetPXP() >= PowerLevelCurve[EXP_POWER_MAX_LEVEL] then
				self:SetPLevel(EXP_POWER_MAX_LEVEL)
			else
				-- self:SetLevel(EXP_MAX_LEVEL)
			end
		end
	end
	 
	/*-------------------------
	Player Set Level
	---------------------------*/
	function META_PLAYER:SetLevel(amount)
		amount = tonumber(amount)
		--self:SetNWInt("XP", LevelCurve[amount] + 1)
		if amount > 0 then
			DbgPrint("-- Level: ".. tostring(amount) .." --")
			self:SetNWInt("Level", amount)	
			
			if self.database then
				-- PrintTable(self.database["stat"]["normal-level"])
				self.database["stat"]["normal-level"]["level"] = amount
			end
		end
		
	end 
	
	function META_PLAYER:SetPLevel(amount)
		print(amount)
		amount = tonumber(amount)
		--self:SetNWInt("XP", LevelCurve[amount] + 1)
		if amount > 0 then
			DbgPrint("-- Level: ".. tostring(amount) .." --")
			self:SetNWInt("Power-Level", amount)	
			
			if self.database then
				-- PrintTable(self.database["stat"]["normal-level"])
				self.database["stat"]["power-level"]["level"] = amount
			end
		end
		
	end 
	 
	 /*-------------------------
	Player Save XP
	---------------------------*/
	function META_PLAYER:SaveXP()
	
		local xp = self:GetXP()
		
		if self.database then
		
			self.database["stat"]["normal-level"]["xp"] = xp
			
		else
		
		
		end
	end
	
	function META_PLAYER:SavePXP()
	
		local pxp = self:GetPXP()
		
		if self.database then
		
			self:databaseGet("stat")["power-level"]["xp"] = pxp
		else
		
		
		end
		
	end

	function META_PLAYER:SaveXPTXT()
		--file.Write(gmod.GetGamemode().Name .."/XP/".. string.gsub(self:SteamID(), ":", "_") ..".txt", self:GetXPString())
	end
	
	/*-------------------------
	Player Take XP
	---------------------------*/
	function META_PLAYER:TakeXP(amount)
		amount = tonumber(amount)
		--Add XP function here
		local xp_take = 0
		if isnumber(amount) and
		amount < 1 
		then
			return
		end
		xp_take = (self:GetXP() - amount)

		if xp_take <= 0 then
			self:SetXP(1)
		else
			self:SetXP(xp_take)
		end
	end

	/*-------------------------
	Player Set Level Stat
	---------------------------*/
	function META_PLAYER:SetPLevelStat()
		-- if self:GetXP() and self:GetCLevel() and self:GetCLevel() >= EXP_MAX_LEVEL then
		
			for i=1, EXP_POWER_MAX_LEVEL do
				-- if player xp is equal or lower than current i value and
				-- player xp is higher than the previous i value
				-- xp <= levelxp and xp > levelxp -1
				if i == 1 and
				self:GetPXP() > PowerLevelCurve[i] 
				then
					self:SetPLevel(i)
				elseif self:GetPXP() >= PowerLevelCurve[i] and 
				self:GetPXP() > PowerLevelCurve[i - 1] 
				then
					if i == EXP_POWER_MAX_LEVEL then
						self.maxplevel = true
						self:SetPLevel(EXP_POWER_MAX_LEVEL)
						self:SetPXP(PowerLevelCurve[i])
					else
						self:SetPLevel(i)
					end
				end
			end
		-- end
	end
	
	function META_PLAYER:SetLevelStat(amount)
		if isnumber(amount) and
		amount > 0 and 
		amount < 151 then
			-- self:SetNWInt("Level", amount)
			self:SetLevel(amount)
			if amount == EXP_MAX_LEVEL then
				self.maxlevel = true
				--self:SetLevel(amount)
			end

			return
		end
		if isnumber(self:GetXP()) --and
		--isnumber(self:GetCLevel()) and
		--self:GetCLevel() < EXP_MAX_LEVEL 
		then
			for i=1, EXP_MAX_LEVEL do
				-- if player xp is equal or lower than current i value and
				-- player xp is higher than the previous i value
				-- xp <= levelxp and xp > levelxp -1
				if i == 1 and
				self:GetXP() > LevelCurve[i] 
				then
					self:SetLevel(i)
				elseif self:GetXP() >= LevelCurve[i] and 
				self:GetXP() > LevelCurve[i - 1] 
				then
					if i == EXP_MAX_LEVEL then
						self.maxlevel = true
						self:SetLevel(EXP_MAX_LEVEL)
						self:SetXP(LevelCurve[i])
					else
						self:SetLevel(i)
					end
				end
			end
		end
		
	end


	/*-------------------------
	Player Add Perma
	---------------------------*/
	function META_PLAYER:AddPerma(value)
		perma_expr_add = tonumber(value) + self:GetNWInt("Perma_Number")
		self:SetNWInt("Perma_Number", tonumber(perma_expr_add))
		if self:GetNWInt("Perma_Number") >= 999999 then
			self:SetNWInt("Perma_Number", 999999)
		end
		Player_PermaPoint_Save(self)
	end


	/*-------------------------
	Player Take Perma
	---------------------------*/
	function META_PLAYER:TakePerma(value)
		perma_expr_sub = self:GetNWInt("Perma_Number") - tonumber(value)
		if perma_expr_sub <= 0 then
			perma_expr_sub = 0
		end
		self:SetNWInt("Perma_Number", tonumber(perma_expr_sub))
		if self:GetNWInt("Perma_Number") >= 999999 then
			self:SetNWInt("Perma_Number", 999999)
		end
		Player_PermaPoint_Save(self)
	end


	
	function META_PLAYER:SetAchi(name, value)
		if name and value and isstring(name) and isnumber(value) and self.setup_achi
		then
			if self:GetNWInt(name) != 1 then
				-- reward
			end
			self:SetNWInt(name, value)
			
		end
	end
	
	function META_PLAYER:AddAchi(name)
		if name and isstring(name) and self.setup_achi
		then
			if self:GetNWInt(name) != 1 then
				Hl2c.Achievement_Notify_V1(name,self)
				self:SetNWInt(name, 1)
				
				if isnumber(Hl2c.Ach.XP[name]) then // add xp as reward
					META_PLAYER:AddXP(Hl2c.Ach.XP[name])
					// Send Message on Chat
					
				end
				for i=1,#Hl2c.HL2_ACH_LIST do
					if Hl2c.HL2_ACH_LIST[i] == name then
						self:databaseGet("ach")["hl2"][i] = 1
					end
				end
				for i=1,#Hl2c.EP1_ACH_LIST do
					if Hl2c.EP1_ACH_LIST[i] == name then
						self:databaseGet("ach")["ep1"][i] = 1
					end
				end
				for i=1,#Hl2c.EP2_ACH_LIST do
					if Hl2c.EP2_ACH_LIST[i] == name then
						self:databaseGet("ach")["ep2"][i] = 1
					end
				end
				for i=1,#Hl2c.GEN_ACH_LIST do
					if Hl2c.GEN_ACH_LIST[i] == name then
						self:databaseGet("ach")["gen"][i] = 1
					end
				end
				for i=1,#Hl2c.HL2_LAMBDA_LIST do
					if Hl2c.HL2_LAMBDA_LIST[i] == name then
						self:databaseGet("lambda")["hl2"][i] = 1
					end
				end
				for i=1,#Hl2c.EP2_WEBCACHE_LIST do
					if Hl2c.EP2_WEBCACHE_LIST[i] == name then
						self:databaseGet("lambda")["ep2_web"][i] = 1
					end
				end
				for i=1,#Hl2c.EP2_RADARCACHE_LIST do
					if Hl2c.EP2_RADARCACHE_LIST[i] == name then
						self:databaseGet("lambda")["ep2_radar"][i] = 1
					end
				end
				for i=1,#Hl2c.VORTEX_HL2_LIST do
					if Hl2c.VORTEX_HL2_LIST[i] == name then
						self:databaseGet("vortex")["hl2"][i] = 1
					end
				end
				for i=1,#Hl2c.VORTEX_EP1_LIST do
					if Hl2c.VORTEX_EP1_LIST[i] == name then
						self:databaseGet("vortex")["ep1"][i] = 1
					end
				end
				for i=1,#Hl2c.VORTEX_EP2_LIST do
					if Hl2c.VORTEX_EP2_LIST[i] == name then
						self:databaseGet("vortex")["ep2"][i] = 1
					end
				end
				for i=1,#Hl2c.VORTEX_CD_LIST do
					if Hl2c.VORTEX_CD_LIST[i] == name then
						self:databaseGet("vortex")["cd"][i] = 1
					end
				end
				for i=1,#Hl2c.VORTEX_EP3_LIST do
					if Hl2c.VORTEX_EP3_LIST[i] == name then
						self:databaseGet("vortex")["ep3"][i] = 1
					end
				end
				for i=1,#Hl2c.VORTEX_LT_LIST do
					if Hl2c.VORTEX_LT_LIST[i] == name then
						self:databaseGet("vortex")["lostcoast"][i] = 1
					end
				end
				for i=1,#Hl2c.VORTEX_META_LIST do
					if Hl2c.VORTEX_META_LIST[i] == name then
						self:databaseGet("vortex")["metastasis"][i] = 1
					end
				end
			end
			
			
		end
	end

 
	function META_PLAYER:SetUpAchi()
		self.setup_achi = true
	end
	
	
		
	function META_PLAYER:SetVortex(vortex, amount)
		if isstring(vortex) and isnumber(amount) and
		(amount == 0 or amount == 1) 
		then
			self:SetNWInt( vortex, amount )
		else
			
		end
	end
	
end


//////////////////////////////////////////////////////
// 			Player Control Setup & Counters			//
//////////////////////////////////////////////////////
function META_PLAYER:SetCounter(id,value)
	local id = tonumber(id)
	local value = tonumber(value)
	self:SetNWInt("customcounter_"..tostring(id),value)
	if self.database and self:databaseHasCustom() then
		
		for i=1,#self.database["custom"]["counter"] do
			if id == i then
				-- if id == 7 then oldPrint("CALLED"..id.." "..value) end
				self:databaseGet("custom")["counter"][i] = value
				-- oldPrint(id,value)
			end
		end
		
	end
end

function META_PLAYER:AddCounter(id,value)
	local id = tonumber(id)
	local value = tonumber(value)
	if self.database and self:databaseHasCustom() then
		
		
		local sol = value + self:GetNWInt("customcounter_"..tostring(id))
		self:SetCounter(id,sol)
	end
end

function META_PLAYER:SetSetup(id,value)
	local id = tonumber(id)
	local value = tonumber(value)
	self:SetNWInt("customsetup_"..tostring(id),value)
	if self.database and self:databaseHasCustom() then
		
		for i=1,#self.database["custom"]["setup"] do
			if id == i then
				self:databaseGet("custom")["setup"][i] = value
				
			end
		end
		
	end
end

function META_PLAYER:SetPlan(id,value)
	if self.database and self:databaseHasCustom() then
		local id = tonumber(id)
		local value = tonumber(value)
		self:SetNWInt("customplan_"..tostring(id),value)
		for i=1,#self.database["custom"]["plan"] do
			if id == i then
				self:databaseGet("custom")["plan"][i] = value
				
			end
		end
		
	end
end


//////////////////////////////////////////////////////
// 				Clear Parent from player			//
//////////////////////////////////////////////////////

function META_PLAYER:ClearParent()
	if !SERVER then	return end
	
	if IsValid(self) and
	self:IsPlayer() --and
	--IsValid(self:GetParent())
	then
		if IsValid(self:GetParent()) then
			--print(self:GetParent():GetClass())
		end
		self:Fire("ClearParent")
		self:Fire("Clearparent")
		self:Fire("ClearParent")
		self:Fire("Clearparent")
		--print("\nCleared Entity's parent\n")
	else
		--print("\nEntity has no parent\n")
	end
	
end

//////////////////////////////////////////////////////
// 		Get Ammo Count of the Current Weapons		//
//////////////////////////////////////////////////////

function META_PLAYER:GetFirstAmmoCount()
	if ( !IsValid( self ) ) then return false end

	local wep = self:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return false end
	if tonumber(wep:GetPrimaryAmmoType()) < 1 then return false end
	if tonumber(wep:GetPrimaryAmmoType()) == -1 then return false end
	if self:GetAmmoCount( wep:GetPrimaryAmmoType() ) < 1 then return false end
	return self:GetAmmoCount( wep:GetPrimaryAmmoType() )
end
function META_PLAYER:GetSecondAmmoCount()
	if ( !IsValid( self ) ) then return false end

	local wep = self:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return false end
	if wep:GetSecondaryAmmoType() < 1 then return false end
	if self:GetAmmoCount( wep:GetSecondaryAmmoType() ) < 1 then return false end
	return self:GetAmmoCount( wep:GetSecondaryAmmoType() )
end

function META_PLAYER:GetFirstAmmoType()
	if ( !IsValid( self ) ) then return false end

	local wep = self:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return false end
	if tonumber(wep:GetPrimaryAmmoType()) == -1 then return false end
	if tonumber(wep:GetPrimaryAmmoType()) < 1 then return false end
	-- print("workign?")
	return wep:GetPrimaryAmmoType()
end
function META_PLAYER:GetSecondAmmoType()
	if ( !IsValid( self ) ) then return false end

	local wep = self:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return false end
	if wep:GetSecondaryAmmoType() < 1 then return false end
	return wep:GetSecondaryAmmoType()
end

function META_PLAYER:GetFirstAmmoName()
	if ( !IsValid( self ) ) then return false end

	local wep = self:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return false end
	if wep:GetPrimaryAmmoType() < 1 then return false end
	return game.GetAmmoName( wep:GetPrimaryAmmoType() )
end

function META_PLAYER:GetSecondAmmoName()
	if ( !IsValid( self ) ) then return false end

	local wep = self:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return false end
	
	if wep:GetSecondaryAmmoType() < 1 then return false end
	return game.GetAmmoName( wep:GetSecondaryAmmoType() )
end

//////////////////////////////////////////////////////
// 		Fail Freeman Ach Setup for player			//
//////////////////////////////////////////////////////

function META_PLAYER:FailFreeman()
	if !SERVER then	return end
	
	if
	IsValid(self) and
	self:IsPlayer() and
	(game.GetMap() == "winter_lobby_2012" or
	game.GetMap() == "keyfox_lobby_summer" )
	then
	
	elseif 
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_HL2 and
	game.GetMap() != "d1_trainstation_01" and
	game.GetMap() != "d1_trainstation_02" and
	game.GetMap() != "d1_trainstation_03" and
	game.GetMap() != "d1_trainstation_04" and
	game.GetMap() != "d1_trainstation_05" and
	self:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR") != 1 and
	self:GetNWInt("CustomSetUpP1_03") != 1 and
	self:GetNWInt("CustomSetUpP1_04") != 0 and
	(sql.TableExists( DB.AchHlTwo.Table ) == true) and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")

		self:SetNWInt("CustomSetUpP1_03", 1)
		self:SetNWInt("CustomSetUpP1_04", 0)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR"] .." Failed")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " ".. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR"]) .." Failed")
		
		
		
	elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP1 and
	self:GetNWInt("ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR") != 1 and
	self:GetNWInt("CustomSetUpP1_03") != 1 and
	self:GetNWInt("CustomSetUpP1_04") != 0 and
	(sql.TableExists( DB.AchEpOne.Table ) == true) and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 1)
		self:SetNWInt("CustomSetUpP1_04", 0)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..EP1_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR"] .." Failed")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " ".. tostring(EP1_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR"]) .." Failed")
	elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP2 and
	self:GetNWInt("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR") != 1 and
	self:GetNWInt("CustomSetUpP1_03") != 1 and
	self:GetNWInt("CustomSetUpP1_04") != 0 and
	(sql.TableExists( DB.AchEpTwo.Table ) == true) and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")

		self:SetNWInt("CustomSetUpP1_03", 1)
		self:SetNWInt("CustomSetUpP1_04", 0)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..EP2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"] .." Failed")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " ".. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"]) .." Failed")
	end
	
end

//////////////////////////////////////////////////////
// 		Clear Freeman Ach Setup from player			//
//////////////////////////////////////////////////////

function META_PLAYER:ClearFreeman()
	if !SERVER then	return end
	
	if
	IsValid(self) and
	self:IsPlayer() and
	(game.GetMap() == "winter_lobby_2012" or game.GetMap() == "keyfox_lobby_summer" )and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 0)
		self:SetNWInt("CustomSetUpP1_04", 0)
		
	elseif 
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_HL2 and
	(game.GetMap() == "d1_trainstation_01" or
	game.GetMap() == "d1_trainstation_02" or
	game.GetMap() == "d1_trainstation_03" or
	game.GetMap() == "d1_trainstation_04" or
	game.GetMap() == "d1_trainstation_05") and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 0)
		self:SetNWInt("CustomSetUpP1_04", 1)
		--PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..HL2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR"] .." Set Up")
		
		
		
	elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP1
	then
	
	
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 0)
		self:SetNWInt("CustomSetUpP1_04", 1)
	
	elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP2
	then
		
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 0)
		self:SetNWInt("CustomSetUpP1_04", 1)
		
	end
	
end




//////////////////////////////////////////////////////
// 		Setup Freeman Ach Setup for player			//
//////////////////////////////////////////////////////

function META_PLAYER:SetUpFreeman()
	if !SERVER then	return end
	
	if
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_HL2 and
	(game.GetMap() == "d1_trainstation_06") and
	self:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR") != 1 and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 0)
		self:SetNWInt("CustomSetUpP1_04", 1)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " True One Freeman Started")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " True One Freeman Started")
	
	
		elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP1 and
	(game.GetMap() == "ep1_citadel_00") and
	self:GetNWInt("ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR") != 1 and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 0)
		self:SetNWInt("CustomSetUpP1_04", 1)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " True One Freeman Started")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " True One Freeman Started")
	
	
	elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP2 and
	(game.GetMap() == "ep2_outland_01") and
	self:GetNWInt("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR") != 1 and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = 0 WHERE UniqueID = '"..  self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = 1 WHERE UniqueID = '"..  self:UniqueID() .."'")
		
		self:SetNWInt("CustomSetUpP1_03", 0)
		self:SetNWInt("CustomSetUpP1_04", 1)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " True One Freeman Started")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " True One Freeman Started")
		
		
	end
end


//////////////////////////////////////////////////////
// 				Add Freeman Ach for player			//
//////////////////////////////////////////////////////

function META_PLAYER:AddFreeman(data)
	if !SERVER then	return end
	
	if
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_HL2 and
	game.GetMap() == "d3_breen_01" and
	self:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR") != 1 and
	self:GetNWInt("CustomSetUpP1_03") != 1 and
	self:GetNWInt("CustomSetUpP1_04") != 0 and
	(sql.TableExists( DB.AchHlTwo.Table ) == true) and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		self:AddXP(800)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..HL2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR"] .." Earned + 800 Points")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " ".. tostring(HL2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR"]) .." Earned + 800 Points")
		-- sql.Query("UPDATE ".. DB.AchHlTwo.P2.Table .." SET ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = ".. 0 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		self:AddAchi("ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR")
		
	elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP1 and
	game.GetMap() == "ep1_c17_06" and
	self:GetNWInt("ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR") != 1 and
	self:GetNWInt("CustomSetUpP1_03") != 1 and
	self:GetNWInt("CustomSetUpP1_04") != 0 and
	(sql.TableExists( DB.AchEpOne.Table ) == true) and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		self:AddXP(400)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..EP1_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR"] .." Earned + 400 Points")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " ".. tostring(EP1_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR"]) .." Earned + 400 Points")
		-- sql.Query("UPDATE ".. DB.AchEpOne.P2.Table .." SET ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		self:AddAchi("ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = ".. 0 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		
	elseif
	IsValid(self) and
	self:IsPlayer() and
	GAME_IS_EP2 and
	game.GetMap() == "ep2_outland_12a" and
	self:GetNWInt("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR") != 1 and
	self:GetNWInt("CustomSetUpP1_03") != 1 and
	self:GetNWInt("CustomSetUpP1_04") != 0 and
	(sql.TableExists( DB.AchEpTwo.Table ) == true) and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		
		self:AddXP(500)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..EP2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"] .." Earned + 500 Points")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " ".. tostring(EP2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"]) .." Earned + 500 Points")
		self:AddAchi("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR")
		-- sql.Query("UPDATE ".. DB.AchEpTwo.P2.Table .." SET ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = ".. 0 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		
		
	end
	
	if self:GetNWInt("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR") != 1 and
	data == "EP2"
	then
		self:AddXP(500)
		-- PrintMessage(HUD_PRINTTALK, "[hl2c Achievement]: ".. self:Nick() .. " "..EP2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"] .." Earned + 500 Points")
		Hl2c.DefaultChatPrint("[hl2c Achievement]: ".. tostring(self:Nick()) .. " ".. tostring(EP2_P2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"]) .." Earned + 500 Points")
		self:AddAchi("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR")
		-- sql.Query("UPDATE ".. DB.AchEpTwo.P2.Table .." SET ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = ".. 0 .." WHERE UniqueID = '".. self:UniqueID() .."'")
		sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = ".. 1 .." WHERE UniqueID = '".. self:UniqueID() .."'")
	end
end

--[[
--------------------------------
Checkout last Checkpoint Vector
Desc:	It will give us back
		a value of vector
		which will return
		the current vector
		Also other function
		to set vector
--------------------------------
]]
function META_PLAYER:SetLastCP(vec)
if !SERVER then print("PERMISSION: You are not the server") return end
	if isvector(vec) then
		self:SetNWVector("lastcp", vec)
	end
end

//////////////////////////////////////////////////////
// 		Remove vehicle the player currently owns	//
//////////////////////////////////////////////////////
function META_PLAYER:RemoveVehicle()
	if CLIENT or !self:IsValid() then return end
	if !IsValid(self.vehicle) then return end
	-- print(self.vehicle:GetClass())
	if GAME_IS_HL2 then
	if ( self.vehicle:GetClass() == "prop_vehicle_airboat" or
	self.vehicle:GetClass() == "prop_vehicle_jeep" or
	self.vehicle:GetClass() == "gmod_sent_vehicle_fphysics_base")
	then
		--print( self.vehicle:GetClass() ) --callback what the hell the player remove.
		-- print("Called?")
		if self:InVehicle() then
		self:ExitVehicle()
		end
		self.vehicle:Remove()
		
	end
	end
	if GAME_IS_EP2 then
	if ( self.vehicle:GetClass() == "prop_vehicle_airboat" or
	-- self.vehicle:GetClass() == "prop_vehicle_jeep" or
	self.vehicle:GetClass() == "gmod_sent_vehicle_fphysics_base")
	then
		--print( self.vehicle:GetClass() ) --callback what the hell the player remove.
		-- print("Called?")
		if self:InVehicle() then
		self:ExitVehicle()
		end
		self.vehicle:Remove()
		
	end
	end
	if game.GetMap() == "gm_flatgrass" or game.GetMap() == "gm_construct" then
	if ( self.vehicle:GetClass() == "prop_vehicle_airboat" or
	-- self.vehicle:GetClass() == "prop_vehicle_jeep" or
	self.vehicle:GetClass() == "gmod_sent_vehicle_fphysics_base")
	then
		--print( self.vehicle:GetClass() ) --callback what the hell the player remove.
		-- print("Called?")
		if self:InVehicle() then
		self:ExitVehicle()
		end
		self.vehicle:Remove()
		
	end
	end
end

function META_PLAYER:SaveHeadModel(model,callback)
	sql.Query("UPDATE ".. DB.Player.Appear .." SET HEAD = '".. model .."' WHERE STEAMID = '".. self:SteamID() .."'")
end

function META_PLAYER:SaveSuitModel(model,callback)
	sql.Query("UPDATE ".. DB.Player.Appear .." SET MODEL = '".. model .."' WHERE STEAMID = '".. self:SteamID() .."'")
end

function META_PLAYER:SetHeadModel(model)
	
	-- print("Call Back")
	if CD_MAP then return end
	if self:Team() == TEAM_ALIVE and self:Alive() then else return end
	if HL2C_ALL_PLAYER_MODELS[model] then else return end
	-- print(model)
	if HL2C_HEV_SUIT[self:GetSuitModel()] then
		self:SetNWString( "Head_Model", model )
		self:SaveHeadModel(model)
		return
	end
	if HL2C_GORDON_HEAD[model] and self:IsAdmin() then
		
		self:SetNWString( "Head_Model", model )
		self:SetSuitModel(model)
		self:SaveHeadModel(model)
		return
	end

	if HL2C_REBEL_FEMALE[model] then
		
		self:SetNWString( "Head_Model", model )
		self:SetSuitModel(model)
		self:SaveHeadModel(model)
		-- print("Called")
		return
	end
	if HL2C_REBEL_MALE[model] and !HL2C_GORDON_HEAD[model] then
		
		self:SetNWString( "Head_Model", model )
		self:SetSuitModel(model)
		self:SaveHeadModel(model)
		-- print("Called")
		return
	end

	-- if HL2C_CITIZEN_SUIT[self:GetModel()] and HL2C_GORDON_HEAD[model] then
		-- self:SetSuitModel("models/player/gordon_citizen.mdl",model)
		-- self:SetNWString( "Head_Model", model )
		-- return
	-- end
	-- print("Called")
end

function META_PLAYER:SetUpSuit(model,head)
	if HL2C_CITIZEN_SUIT[model] and (HL2C_REBEL_HEAD[self:GetHeadModel()] and !HL2C_GORDON_HEAD[self:GetHeadModel()]) then
		util.PrecacheModel(self:GetHeadModel())
		self:SetNWString( "Suit_Model", self:GetHeadModel() )
		self:SetModel(self:GetHeadModel())
		self:SaveSuitModel(self:GetHeadModel())
		-- print("SetUp Head and Model Together CITIZEN",self:GetHeadModel())
		return true
	end
	
	// Combine Suits
	if HL2C_COMBINE_SUIT_LIST[model] then
		util.PrecacheModel(self:GetHeadModel())
		self:SetNWString( "Suit_Model", model )
		self:SetModel(model)
		self:SaveSuitModel(model)
		
		return true
		
	end
	
	
	if model == "models/player/breen.mdl" then
		util.PrecacheModel(self:GetHeadModel())
		self:SetNWString( "Suit_Model", model )
		self:SetModel(model)
		self:SaveSuitModel(model)
		
		return true
		
	end
	
	
	//Female Rebel
	if HL2C_REBEL_FEMALE[self:GetHeadModel()] and HL2C_REBEL_SUIT[model] then
		util.PrecacheModel(self:GetHeadModel())
		self:SetNWString( "Suit_Model", "models/player/group03/female_01.mdl" )
		self:SetModel("models/player/group03/female_01.mdl")
		self:SaveSuitModel("models/player/group03/female_01.mdl")
		-- print("SetUp Head and Model Together CITIZEN",self:GetHeadModel())
		return true
	end
	//Male Rebel
	if (HL2C_GORDON_HEAD[self:GetHeadModel()] or HL2C_REBEL_MALE[self:GetHeadModel()]) and HL2C_REBEL_SUIT[model] then
		util.PrecacheModel(self:GetHeadModel())
		self:SetNWString( "Suit_Model", "models/player/group03/male_01.mdl" )
		self:SetModel("models/player/group03/male_01.mdl")
		self:SaveSuitModel("models/player/group03/male_01.mdl")
		-- print("SetUp Head and Model Together CITIZEN",self:GetHeadModel())
		return true
	end
	
	if HL2C_CITIZEN_SUIT[model] and (!HL2C_REBEL_HEAD[self:GetHeadModel()] and HL2C_GORDON_HEAD[self:GetHeadModel()]) then
		util.PrecacheModel(self:GetHeadModel())
		self:SetNWString( "Suit_Model", self:GetHeadModel() )
		self:SetModel(self:GetHeadModel())
		self:SaveSuitModel(self:GetHeadModel())
		-- print("SetUp Head and Model Together FREEMAN")
		return true
	end
	
	if HL2C_HEV_SUIT[self:GetSuitModel()] and HL2C_CITIZEN_SUIT[model] or HL2C_GORDON_HEAD[model] then
		util.PrecacheModel(model)
		self:SetNWString( "Suit_Model", model )
		self:SetModel(model)
		self:SetHeadModel(self:GetHeadModel())
		self:SaveSuitModel(model)
		-- print("SetUp Hev Suit Well?")
		return true
	end
	
	if HL2C_HEV_SUIT[model] then
		if self:IsAdmin() or (self:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR") and self:GetNWInt("SHOP_UPGRADE_001") == 1) then else return end
		util.PrecacheModel(model)
		self:SetNWString( "Suit_Model", model )
		self:SetModel(model)
		self:SaveSuitModel(model)
		return true
	end
end

function META_PLAYER:SetSuitModel(model)
	-- print("Call Back")
	if CD_MAP then return end
	if self:Team() == TEAM_ALIVE and self:Alive() then else return end
	if HL2C_ALL_PLAYER_MODELS[model] then else return end
	-- util.PrecacheModel(model)
	-- if ( HL2C_CITIZEN_SUIT[model] or HL2C_HEV_SUIT[model] ) then else return end
	-- oldPrint("works")
	if self:SetUpSuit(model) == true then
		
		self:SetupHands()
	end
	-- if model == HL2C_HEV_SUIT[1] then
	-- self:SetSkin(1)
	-- self:SetBodyGroups( "026")
	-- self:SetBodygroup( 1, 5 )
	-- PrintTable(self:GetBodyGroups())
	-- end
end

function META_PLAYER:UpdateXP()
	umsg.Start( "Hl2c.Update.Xp.Stat", self )
		umsg.Long( self:GetXP() )
		umsg.Long( self:MaxXP() )
		umsg.Short( self:GetCLevel() )
	umsg.End()

end
function META_PLAYER:UpdateFlashLight(energy)
	umsg.Start( "Hl2c.Update.Flash.Energy", self )
		umsg.Short( energy )
	umsg.End()
end
function META_PLAYER:UpdateSprint(energy)
	umsg.Start( "Hl2c.Update.Sprint.Energy", self )
		umsg.Short( energy )
	umsg.End()
end

-- attila.gyarmati1994@gmail.com
-- Boost2016ma