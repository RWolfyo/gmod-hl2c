if SERVER then AddCSLuaFile() end
// Entity information
-- ENT.Base = "base_anim"
-- ENT.Type = "anim"
ENT.Type = "brush"
ENT.Base = "base_brush"

// Called when the entity first spawns
function ENT:Initialize()
	local w = self.max.x - self.min.x
	local l = self.max.y - self.min.y
	local h = self.max.z - self.min.z
	
	local min = Vector(0 - (w / 2), 0 - (l / 2), 0 - (h / 2))
	local max = Vector(w / 2, l / 2, h / 2)
	
	-- self:DrawShadow(false)
	-- self:SetCollisionBounds(min, max)
	-- self:SetSolid(SOLID_BBOX)
	-- self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	-- self:SetMoveType(0)
	-- self:SetTrigger(true)

	self:DrawShadow(false)
	self:SetMoveType(MOVETYPE_NONE);
	self:SetSolid(SOLID_OBB);
	self:SetNotSolid(true)
	self:SetTrigger(true)
	self:SetCollisionBounds(min, max)
	self:UseTriggerBounds(true)
	--self.xp_num = 0
	self.change = false
	
end

// Called when an entity touches me :D
function ENT:StartTouch(ent)
	SECRET.HL2.D1_CANALS_01_ENDMAP(ent)
	if ent && ent:IsValid() && ent:IsPlayer() && ent:Team() == TEAM_ALIVE then
		ent.endmap = true
		self.PlayersAlive = team.NumPlayers(TEAM_ALIVE) + team.NumPlayers(TEAM_DEAD) + team.NumPlayers(TEAM_COMPLETED_MAP)

		if game.GetMap() == "ep2_outland_11a" then
			for _, pl in pairs(player.GetAll()) do
				Hl2c.EP2_MISSILESILO2_ACH(pl)
			end
		end
		
		if game.GetMap() == "d3_c17_03" then
			for _, pl in pairs(player.GetAll()) do
				Hl2c.HL2_FOLLOWFREEMAN_ACH(pl)
			end
		end		
		// On Touch Put to Completed map.
		
		--for _, pl in pairs(player.GetAll()) do
		local plInfo = {}
		local plWeapons = ent:GetWeapons()
		
		plInfo.predicted_map = NEXT_MAP
		plInfo.health = ent:Health()
		plInfo.armor = ent:Armor()
		plInfo.score = ent:Frags()
		--plInfo.deaths = ent:Deaths()
		plInfo.model = ent.modelName
		
		if plWeapons && #plWeapons > 0 then
			plInfo.loadout = {}
			
			for _, wep in pairs(plWeapons) do
				plInfo.loadout[wep:GetClass()] = {ent:GetAmmoCount(wep:GetPrimaryAmmoType()), ent:GetAmmoCount(wep:GetSecondaryAmmoType())}
			end
		end
		
		file.Write("hl2c_userid_info/hl2c_userid_info_"..ent:UniqueID()..".txt", util.TableToKeyValues(plInfo))
		--end
		
		ent:SetTeam(TEAM_COMPLETED_MAP)
		ent:KillSilent()
		ent:Flashlight(false)
		--ent:Spawn()
		
		
		self.TOUCHED = true
		// Force the player to exit the vehicle!
		ent:ExitVehicle()
		if IsValid(ent.vehicle) then
			ent:RemoveVehicle()
		end
		
		if ent.hadloot != true then
			ent:lootBoxDrop()
			ent.hadloot = true
		end
		
		// Freeze them and make sure they don't push people away
		--ent:Lock()
		--ent:SetMoveType(0)
		--ent:SetAvoidPlayers(false)
		--ent:Spectate(OBS_MODE_CHASE)
		// New level change system
		if GetConVarNumber("hl2c_classic") == 0 then
			--GAMEMODE:NextMap()
		end
		
		/*
		if ent:Deaths() == 0 then
		ent:AddXP(10)
		// Let everyone know that someone entered the loading section
		PrintMessage(HUD_PRINTTALK, Format("%s completed the map (%s) [%i of %i]. +10 Points NoDeath", ent:Nick(), string.ToMinutesSeconds(CurTime() - ent.startTime), team.NumPlayers(TEAM_COMPLETED_MAP), self.playersAlive))
		else
		ent:AddXP(5)
		// Let everyone know that someone entered the loading section
		PrintMessage(HUD_PRINTTALK, Format("%s completed the map (%s) [%i of %i]. +5 Points", ent:Nick(), string.ToMinutesSeconds(CurTime() - ent.startTime), team.NumPlayers(TEAM_COMPLETED_MAP), self.playersAlive))
		end
		*/
		--local pl_nums = player.GetCount()
		if isnumber(self.xp_num) then
			self.xp_num = (team.NumPlayers(TEAM_ALIVE) + team.NumPlayers(TEAM_DEAD) + 3)
		else
			self.xp_num = (team.NumPlayers(TEAM_ALIVE) + team.NumPlayers(TEAM_DEAD) + 3)
		end

	
		if ent:Deaths() == 0 then
			dxp_num = self.xp_num + 3
			ent:AddXP(dxp_num)
			--print("[hl2c] "..dxp_num.."")
			// Let everyone know that someone entered the loading section
			-- PrintMessage(HUD_PRINTTALK, Format("%s completed the map (%s) [%i of %i]. %i Points + NoDeath", ent:Nick(), string.ToMinutesSeconds(CurTime() - ent.startTime), team.NumPlayers(TEAM_COMPLETED_MAP), self.PlayersAlive, dxp_num ))
			-- PrintMessage(HUD_PRINTTALK, Format("%s completed the map (%s) [%i of %i]. %i Points + NoDeath", ent:Nick(), string.ToMinutesSeconds(CurTime() - ent.startTime), team.NumPlayers(TEAM_COMPLETED_MAP), self.PlayersAlive, dxp_num ))
			Hl2c.ChatSend_MapEndTouch(ent:Nick(),string.ToMinutesSeconds(CurTime() - ent.startTime),tostring(team.NumPlayers(TEAM_COMPLETED_MAP)),tostring(self.PlayersAlive),tostring(dxp_num),true)
			--PrintMessage(HUD_PRINTTALK, ent:Nick().." completed the map (".. string.ToMinutesSeconds(CurTime() - ent.startTime) ..") [".. team.NumPlayers(TEAM_COMPLETED_MAP) .." of %i]. %i Points + NoDeath", team.NumPlayers(TEAM_COMPLETED_MAP), self.playersAlive, dxp_num ))
		else
			ent:AddXP(1)
			// Let everyone know that someone entered the loading section
			-- PrintMessage(HUD_PRINTTALK, Format("%s completed the map (%s) [%i of %i]. %i Points", ent:Nick(), string.ToMinutesSeconds(CurTime() - ent.startTime), team.NumPlayers(TEAM_COMPLETED_MAP), self.PlayersAlive, self.xp_num))
			-- PrintMessage(HUD_PRINTTALK, Format("%s completed the map (%s) [%i of %i]. %i Points", ent:Nick(), string.ToMinutesSeconds(CurTime() - ent.startTime), team.NumPlayers(TEAM_COMPLETED_MAP), self.PlayersAlive, self.xp_num))
			Hl2c.ChatSend_MapEndTouch(ent:Nick(),string.ToMinutesSeconds(CurTime() - ent.startTime),tostring(team.NumPlayers(TEAM_COMPLETED_MAP)),tostring(self.PlayersAlive),tostring(1),false)
			--PrintMessage(HUD_PRINTTALK, Format("%s completed the map (%s) [%i of %i]. %i Points", ent:Nick(), string.ToMinutesSeconds(CurTime() - ent.startTime), team.NumPlayers(TEAM_COMPLETED_MAP), self.playersAlive, self.xp_num))
		end
		if self.xp_num == 1 then
			self.xp_num = 1
		else
			self.xp_num = self.xp_num - 1
			if self.xp_num < 1 then
				self.xp_num = 1
			end
		end
	end
	
end


// Checks to see if we should go to the next map
function ENT:Think()
	if self.TOUCHED == true then
		self.playersAlive = team.NumPlayers(TEAM_ALIVE) + team.NumPlayers(TEAM_COMPLETED_MAP)
		self.playersAll = team.NumPlayers(TEAM_ALIVE) + team.NumPlayers(TEAM_DEAD) + team.NumPlayers(TEAM_COMPLETED_MAP)
			
		if self.playersAll == 2 && team.NumPlayers(TEAM_COMPLETED_MAP) >= (self.playersAlive * (50 / 100)) then
			/*
			if GetConVarNumber("hl2c_classic") >= 1 then
				GAMEMODE:NextMap()
			elseif GetConVarNumber("hl2c_classic") == 0 then
				GAMEMODE:GrabAndSwitch()
			end
			*/
			if self.change == false then
				GAMEMODE:NextMap()
				self.change = true
			end
			
			if self.change == true then
				if self.playersAlive > 0 && team.NumPlayers(TEAM_COMPLETED_MAP) >= (self.playersAlive) then
					if GetConVarNumber("hl2c_classic") >= 1 then
						GAMEMODE:NextMap()
					elseif GetConVarNumber("hl2c_classic") == 0 then
						GAMEMODE:GrabAndSwitch()
					end
				end
			end
		elseif self.playersAlive > 0 && team.NumPlayers(TEAM_COMPLETED_MAP) >= (self.playersAlive * (NEXT_MAP_PERCENT / 100)) then
			/*
			if GetConVarNumber("hl2c_classic") >= 1 then
				GAMEMODE:NextMap()
			elseif GetConVarNumber("hl2c_classic") == 0 then
				GAMEMODE:GrabAndSwitch()
			end
			*/
			if self.change == false then
				GAMEMODE:NextMap()
				self.change = true
			end
			
			if self.change == true then
				if self.playersAlive > 0 && team.NumPlayers(TEAM_COMPLETED_MAP) >= (self.playersAlive) then
					if GetConVarNumber("hl2c_classic") >= 1 then
						GAMEMODE:NextMap()
					elseif GetConVarNumber("hl2c_classic") == 0 then
						GAMEMODE:GrabAndSwitch()
					end
				end
			end
			
		end
	end
end