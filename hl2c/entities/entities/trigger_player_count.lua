ENT.Type = "brush"
--ENT["OnAllPlayersEntered"] = {}
function ENT:Initialize()
	self.Inputs = self.Inputs or {
	["seteceiver"] = true,
	["nullreceiver"] = true,
	["countplayers"] = true,
	["countplayerstoactivator"] = true,
	["kill"] = true,
	["enable"] = true,
	["disable"] = true
	}
	self.Entered = 0
	self.get_player = #team.GetPlayers( TEAM_ALIVE )
	--if type(self["OnAllPlayersEntered"]) == 'table' then print("TABLE EXIST") else print("TABLE NOT EXIST") end
end

function ENT:KeyValue( key, value )

	print(self,key,value)
	
	if key == "OnStartTouch" then
		self.starttouch = self.starttouch or {}

		local tbl = string.Explode(',', value)
		table.insert(self.starttouch, tbl)
		
	elseif key == "OnEndTouch" then
	
		self.endtouch = self.endtouch or {}

		local tbl = string.Explode(',', value)
		table.insert(self.endtouch, tbl)
		
	elseif key == "OnAllPlayersEntered" then
		self.allenter = self.allenter or {}
		
		local tbl = string.Explode(',', value)
		table.insert(self.allenter, tbl)
	elseif key == "OnPlayerEntered" then
		self.enter = self.enter or {}
		
		local tbl = string.Explode(',', value)
		table.insert(self.enter, tbl)
		
	elseif key == "OnPlayerLeave" then
		self.leave = self.leave or {}

		local tbl = string.Explode(',', value)
		table.insert(self.leave, tbl)
		
	elseif key == "OnRedPlayerEntered" then
		self.redenter = self.redenter or {}

		local tbl = string.Explode(',', value)
		table.insert(self.redenter, tbl)
		
	elseif key == "OnBluePlayerEntered" then
		self.blueenter = self.blueenter or {}

		local tbl = string.Explode(',', value)
		table.insert(self.blueenter, tbl)
		
	elseif key == "OnRedPlayerLeave" then
		self.redleave = self.redleave or {}

		local tbl = string.Explode(',', value)
		table.insert(self.redleave, tbl)
		
	elseif key == "OnBluePlayerLeave" then
		self.blueleave = self.blueleave or {}

		local tbl = string.Explode(',', value)
		table.insert(self.blueleave, tbl)
		
	elseif key == "OnAllRedPlayersEntered" then
		self.allredenter = self.allredenter or {}

		local tbl = string.Explode(',', value)
		table.insert(self.allredenter, tbl)
		
	elseif key == "OnAllBluePlayersEntered" then
		self.allblueenter = self.allblueenter or {}

		local tbl = string.Explode(',', value)
		table.insert(self.allblueenter, tbl)
		
	elseif key == "ConstantAnnounce" then
		self[key] = value
	elseif key == "VolumeName" then
		self[key] = value
	elseif key == "targetname" then
		self[key] = value
	elseif key == "spawnflags" then
		self[key] = value
	elseif key == "StartDisabled" then
		if value == "1" then
			self["Active"] = false
		else
			self["Active"] = true
		end
	elseif key == "origin" then
		self[key] = value
	end
end

function ENT:Touch(ent)
	if self["Active"] != true then return end
	if !IsValid(ent) then return end
	if !ent:IsPlayer() then return end
	if ent:Team() != TEAM_ALIVE then return end
	-- Do nothing
	self.get_player = #team.GetPlayers( TEAM_ALIVE )
	
end



function ENT:StartTouch(ent)
	if self["Active"] != true then return end
	if !IsValid(ent) then return end
	if !ent:IsPlayer() then return end
	if ent:Team() != TEAM_ALIVE then return end
	
	self.get_player = #team.GetPlayers( TEAM_ALIVE )
	
	if self.starttouch then
		for k, v in pairs(self.starttouch) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end
	
	self.Entered = self.Entered + 1
	
	self:OnPlayerEntered(ent)
	
	if self.Entered >= self.get_player then
		self:OnAllPlayersEntered()
	end
	
end

function ENT:EndTouch(ent)
	if self["Active"] != true then return end
	if !IsValid(ent) then return end
	if !ent:IsPlayer() then return end
	self.get_player = #team.GetPlayers( TEAM_ALIVE )
	
	if self.endtouch then
		for k, v in pairs( self.endtouch ) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			elseif v[1] == "!activator" then
				ent:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end
	
	self:OnPlayerLeave(ent)
	
	if self.Entered > 0 then
		self.Entered = self.Entered - 1
	else
		self.Entered = 0
	end
	
end

function ENT:OnPlayerEntered(ent)
	self:TriggerOutPuts(self.enter,ent)
	--[[
	if self["OnPlayerEntered"] then
		for k, v in pairs(self["OnPlayerEntered"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			elseif v[1] == "!activator" then
				ent:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end]]
end

function ENT:OnRedPlayerEntered(ent)
	self:TriggerOutPuts(self.redenter,ent)
	--[[
	if self["OnRedPlayerEntered"] then
		for k, v in pairs(self["OnRedPlayerEntered"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end]]
end

function ENT:OnBluePlayerEntered(ent)
	self:TriggerOutPuts(self.blueenter,ent)
	--[[
	if self["OnBluePlayerEntered"] then
		for k, v in pairs(self["OnBluePlayerEntered"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end]]
end

function ENT:OnPlayerLeave(ent)
	self:TriggerOutPuts(self.leave,ent)
	--[[
	if self["OnPlayerLeave"] then
		for k, v in pairs(self["OnPlayerLeave"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end]]
end

function ENT:OnRedPlayerLeave(ent)
	self:TriggerOutPuts(self.redleave,ent)
	--[[
	if self["OnRedPlayerLeave"] then
		for k, v in pairs(self["OnRedPlayerLeave"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end]]
end

function ENT:OnBluePlayerLeave(ent)
	self:TriggerOutPuts(self.blueleave,ent)
	--[[
	if self["OnBluePlayerLeave"] then
		for k, v in pairs(self["OnBluePlayerLeave"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end]]
end

function ENT:OnAllPlayersEntered()
	self:TriggerOutPuts(self.allenter)
	--[[
	if self["OnAllPlayersEntered"] then
		for k, v in pairs(self["OnAllPlayersEntered"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end]]
end

function ENT:OnAllRedPlayersEntered()
	self:TriggerOutPuts(self.allredenter)
	--[[
	if self["OnAllRedPlayersEntered"] then
		for k, v in pairs(self["OnAllRedPlayersEntered"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end
	]]
end

function ENT:OnAllBluePlayersEntered()
	self:TriggerOutPuts(self.allblueenter)
	/*
	if self["OnAllBluePlayersEntered"] then
		for k, v in pairs(self["OnAllBluePlayersEntered"]) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			elseif v[1] == "!activator" then
				ent:Fire(v[2], v[3], v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
					target:Fire(v[2], v[3], v[4])
				end
			end
		end
	end
	*/
end

function ENT:TriggerOutPuts(tbl,ent)
	
	if !istable(tbl) then return end
	if IsValid(ent) then
		if tbl then
			for k, v in pairs(tbl) do
				if v[1] == "!self" then
					self:Fire(v[2], v[3], v[4])
				elseif v[1] == "!activator" then
					ent:Fire(v[2], v[3], v[4])
				else
					local enttbl = ents.FindByName(v[1])
					for _, target in pairs(enttbl) do
						target:Fire(v[2], v[3], v[4])
					end
				end
			end
		end
	else
		if tbl then
			for k, v in pairs(tbl) do
				if v[1] == "!self" then
					self:Fire(v[2], v[3], v[4])
				elseif v[1] == "!activator" then
					--ent:Fire(v[2], v[3], v[4])
				else
					local enttbl = ents.FindByName(v[1])
					for _, target in pairs(enttbl) do
						target:Fire(v[2], v[3], v[4])
					end
				end
			end
		end
	end
	
end


function ENT:Think()
	if self["Active"] != true then return end
	--[[
	local pos, min, max	= self:GetPos(), self:OBBMins(), self:OBBMaxs()
	self.players = self.players or {}
	for k, v in ipairs(player.GetAll()) do
		local ppos = v:GetPos() + v:OBBCenter()
		if ppos:WithinAABox(pos + min, pos + max) then
			if !table.HasValue(self.players, v) then
				if v:Alive() and !v:Team() == TEAM_DEAD then
					self:OnPlayerEntered(v)

					table.insert(self.players, v)
				end
			else
				if !v:Alive() or v:Team() == TEAM_DEAD then
					self:OnPlayerExited(v) 

					table.remove(self.players, k)
				end
			end
		else
			if table.HasValue(self.players, v) then
				self:OnPlayerExited(v)

				table.remove(self.players, k)
			end
		end
	end

	--PrintTable(self.players)

	if (player.GetCount() > 0 and player.GetCount() == #self.players) then
		self:OnAllPlayersEntered()
	end

	self:NextThink(CurTime()+.1)
	return true
	]]
end

function ENT:OnRemove()
end

function ENT:AcceptInput( inputName, activator, called, data )
	if string.lower(inputName) == "countplayers" then
	elseif string.lower(inputName) == "countplayerstoactivator" then
	elseif string.lower(inputName) == "setreceiver" then
	elseif string.lower(inputName) == "nullreceiver" then
	elseif string.lower(inputName) == "enable" then
		self["Active"] = true
	elseif string.lower(inputName) == "disable" then
		self["Active"] = false
	elseif string.lower(inputName) == "kill" then
		self:Remove()
	end
end

function ENT:UpdateTransmitState()

	return TRANSMIT_NEVER

end