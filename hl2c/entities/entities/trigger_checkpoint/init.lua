if SERVER then AddCSLuaFile() end
// Entity information
-- ENT.Base = "base_anim"
-- ENT.Type = "anim"
ENT.Type = "brush"
ENT.Base = "base_brush"


// Called when the entity first spawns
function ENT:Initialize()
	self.ipsLocation = Vector(self.pos.x, self.pos.y, self.min.z + 8)
	
	local w = self.max.x - self.min.x
	local l = self.max.y - self.min.y
	local h = self.max.z - self.min.z
	
	local min = Vector(0 - (w / 2), 0 - (l / 2), 0 - (h / 2))
	local max = Vector(w / 2, l / 2, h / 2) 
	
	self:DrawShadow(false)
	self:SetMoveType(MOVETYPE_NONE);
	self:SetSolid(SOLID_OBB);
	self:SetNotSolid(true)
	self:SetTrigger(true)
	self:SetCollisionBounds(min, max)
	self:UseTriggerBounds(true)
end


// Called when an entity touches it
function ENT:StartTouch(ent)
	if ent && ent:IsValid() && ent:IsPlayer() && ent:Team() == TEAM_ALIVE && !self.triggered then
		self.triggered = true
		
		--RETURN_CP = true
		if self.OnTouchRun then
			self:OnTouchRun()
		end
		
		local ang = ent:GetAngles()
		
		if self.skipSpawnpoint != true then
			if self.CustomSpawn != nil and isvector(self.CustomSpawn) then
				GAMEMODE:CreateSpawnPoint(self.CustomSpawn, ang.y)
			else
				GAMEMODE:CreateSpawnPoint(self.ipsLocation, ang.y)
			end
			Hl2c.DefaultChatPrint("[hl2c] Checkpoint Saved.")
			--PrintMessage(HUD_PRINTTALK, "[hl2c] Checkpoint Saved.")
		end
		
		for _, pl in pairs(player.GetAll()) do
			if pl && IsValid(pl) && pl != ent && pl:Team() == TEAM_ALIVE then
				--PrintMessage(HUD_PRINTTALK, "[hl2c] Checkpoint Saved.")
				if pl:GetVehicle() && pl:GetVehicle():IsValid() then
					// This just causes mayhem.
					-- pl:GetVehicle():SetPos(self.ipsLocation)
					-- pl:GetVehicle():SetAngles(ang)
					pl:ExitVehicle() -- Make the player exit the vehicle and then teleport.
					--pl:SetVelocity(Ve)
					if self.CustomSpawn != nil and isvector(self.CustomSpawn) then
					pl:Teleport(self.CustomSpawn)
					pl:Teleport(self.CustomSpawn)
					else
					pl:Teleport(self.ipsLocation)
					pl:Teleport(self.ipsLocation)
					end
					
					pl:SetAngles(ang)
				else
					if self.CustomSpawn != nil and isvector(self.CustomSpawn) then
					pl:Teleport(self.CustomSpawn)
					pl:Teleport(self.CustomSpawn)
					else
					pl:Teleport(self.ipsLocation)
					pl:Teleport(self.ipsLocation)
					end
					pl:SetAngles(ang)
				end
			end
		end
		
		// We're going to allow checkpoint respawning now. It gets out of hand when players are dead forever.
		if GetConVarNumber("hl2c_classic") == 0 then
			-- GAMEMODE:HL2CForceRespawn()
			GAMEMODE:Hl2c_ForceSpawn()
		end
		
		table.remove(checkpointPositions, 1)
		
		if checkpointPositions[1] then
			if GetConVarNumber("hl2c_use_old_umsg") >= 1 then
				umsg.Start("SetCheckpointPosition", RecipientFilter():AddAllPlayers())
				umsg.Vector(checkpointPositions[1])
				umsg.End()
			elseif GetConVarNumber("hl2c_use_old_umsg") == 0 then
				for _, pl in pairs(player.GetAll()) do
				if IsValid(pl) then
					Hl2c.Send_CheckpointData(pl)
				end
				end
			end
		end
		
		self:Remove()
	end
end