ENT.Type = "brush"

ENT.flagtable = {
	[1] = "Clients",
	[2] = "NPCs",
	[4] = "Pushables",
	[8] = "Physics Objects",
	[16] = "Only player ally NPCs",
	[32] = "Only clients in vehicles",
	[64] = "Everything (not including physics debris)",
	[512] = "Only clients *not* in vehicles",
	[1024] = "Physics debris",
	[2048] = "Only NPCs in vehicles (respects player ally flag)"
}


function ENT:Initialize()
	--self.flagtable = {}
	self:SetTrigger(true)
end

function ENT:KeyValue( key, value )

	if key == "filtername" then
		self[key] = tostring(value)
		self.filter = value
		if self.filter != nil then
		self.isfilter = true	
		self.found = false
		else
			self.isfilter = "bad"
		end
	
	elseif key == "OnStartTouch" then
	
		self.touch = self.touch or {}
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
		local tbl = string.Explode(',', value)
		table.insert(self.touch, tbl)
		
	
	elseif key == "OnTrigger" then
	
		self.trigger = self.trigger or {}
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
		local tbl = string.Explode(',', value)
		table.insert(self.trigger, tbl)
	
	elseif key == "spawnflags" then
		self[key] = tostring(value)
		self.spawnflags = value
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
	elseif key == "origin" then
		self[key] = tostring(value)
		self.origin = value
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
	elseif key == "StartDisabled" then
		self[key] = tostring(value)
		self.disabled = value
	
	else
		--print(self:GetClass(), key, value)
	end
end

function ENT:StartTouch(ent)
	
	if self["spawnflags"] == "1" then
		
		if ent:IsPlayer() then
		elseif !ent:IsPlayer() then 
			return 
		end
		
	elseif self["spawnflags"] == "2" then
		if ent:IsNPC() then
		elseif !ent:IsNPC() then 
			return 
		end
	elseif self["spawnflags"] == "3" then
		if ent:IsNPC() or ent:IsPlayer() then
		elseif !ent:IsNPC() or !ent:IsPlayer() then 
			return 
		end
		
	end
	
	if self.disabled == "1" then
	else
--if ent:IsValid() then
	if self["filtername"] != nil then
	--print(self:GetName()..self.filter.." StartTouch "..ent:GetClass())
		if self.filtername == nil then return end
		if string.find(ent:GetName(), self.filtername) then
			--print(self:GetClass().." OnStartTouch Filtered")
			self.touch = self.touch or {}
			for k, v in pairs(self.touch) do
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
				--print(self:GetClass(),v[1], v[2], v[3] , v[4])
			end
		self:Remove()
		end
		--self:Remove()
	elseif self.filtering == "bad" then
		--print(self:GetClass().." OnStartTouch NoFilter")
		self.touch = self.touch or {}
		for k, v in pairs(self.touch) do
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
			--print(self:GetClass(),v[1], v[2], v[3] , v[4])
		end
		self:Remove()
	end
--end

	end
end

function ENT:Touch(ent)

	if self["spawnflags"] == "1" then
		
		if ent:IsPlayer() then
		elseif !ent:IsPlayer() then 
			return 
		end
		
	elseif self["spawnflags"] == "2" then
		if ent:IsNPC() then
		elseif !ent:IsNPC() then 
			return 
		end
	elseif self["spawnflags"] == "3" then
		if ent:IsNPC() or ent:IsPlayer() then
		elseif !ent:IsNPC() or !ent:IsPlayer() then 
			return 
		end
		
	end

	if self.disabled == "1" then
	else
--if ent:IsValid() then
	if self["filtername"] != nil then
	--print(self:GetName()..self.filter.." StartTouch "..ent:GetClass())
		if self.filtername == nil then return end
		if string.find(ent:GetName(), self.filtername) then
			--print(self:GetClass().." OnTrigger Filtered")
			self.trigger = self.trigger or {}
			for k, v in pairs(self.trigger) do
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
				--print(self:GetClass(),v[1], v[2], v[3] , v[4])
			end
		--print(self:GetClass().." OnTrigger Filtered")
		self:Remove()
		end
		--print(self:GetClass().." StartTouch Filtered")
		--self:Remove()
	elseif self.filtering == "bad" then
		--print(self:GetClass().." OnTrigger NoFilter")
		self.trigger = self.trigger or {}
		for k, v in pairs(self.trigger) do
			if v[1] == "!self" then
				self:Fire(v[2], v[3], v[4])
			--	print(self:GetClass(),v[1], v[2], v[3] , v[4])
			elseif v[1] == "!activator" then
				ent:Fire(v[2], v[3], v[4])
				--print(self:GetClass(),v[1], v[2], v[3] , v[4])
			else
				local enttbl = ents.FindByName(v[1])
				for _, target in pairs(enttbl) do
				target:Fire(v[2], v[3], v[4])
				--print(self:GetClass(),v[1], v[2], v[3] , v[4])
				end
			end
			--print(self:GetClass(),v[1], v[2], v[3] , v[4])
		end
		--timer.Simple(1,function()
		self:Remove()
		--end)
	end
--end

	end
end

/*
function ENT:Touch()
	--print(self:GetClass().." Touched")
	self.touch = self.touch or {}
	for k, v in pairs(self.touch) do
		if v[1] == "!self" then
			self:Fire(v[2], v[3], v[4])
		else
			local enttbl = ents.FindByName(v[1])
			for _, target in pairs(enttbl) do
				target:Fire(v[2], v[3], v[4])
			end
		end
	end

	self:Remove()
end
*/
function ENT:Think()
	
	if self.isfilter then
		if !self.found then
			self.entfil = ents.FindByName(self.filter)
			for k, v in ipairs(self.entfil) do
	
				--PrintTable(v:GetKeyValues())
				self.filtername = (v:GetKeyValues()["filtername"])
				--print(self.filtername)
			end
			self.found = true
			self.filtering = true
		end
	else
		self.filtering = "bad"
	end
	
end

function ENT:OnRemove()
	--print("[hl2c] "..self:GetClass().." Removed")
end

function ENT:AcceptInput( inputName, activator, called, data )
	if ( inputName == "Enable" or inputName == "enable" ) then

		self.disabled = "0"
		--print(self:GetClass(),inputName,data)
		self:SetKeyValue("StartDisabled", "0")
	elseif ( inputName == "Disable" or inputName == "disable" ) then

		self.disabled = "1"
		--print(self:GetClass(),inputName,data)
		self:SetKeyValue("StartDisabled", "1")
	elseif ( inputName == "Kill" or inputName == "kill" ) then
		--print(self:GetClass(),inputName,data)
		self:Remove()
	end
end

function ENT:UpdateTransmitState()

	return TRANSMIT_NEVER

end