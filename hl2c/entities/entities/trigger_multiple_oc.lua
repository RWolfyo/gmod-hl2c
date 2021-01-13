ENT.Type = "brush"

function ENT:Initialize()
	self["Init"] = true
	self:SetTrigger(true)
	
	if isstring( self["filtername"] ) then else self["filtering"] = false end
	if not isstring( self["StartDisabled"] ) then self["StartDisabled"] = "0" self["Activated"] = true end
end

function ENT:KeyValue( key, value )
	
	--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
	if key == "filtername" then
		self[key] = tostring(value)
		self["filtering"] = true
		--[[
		
		We need to force the entity to make the enable.
		It will run a Think function that will find the right filter entity,
		which has the targetname what we get from the keyvalue.
		When found the entity it will get value which entity need to be filtered.
		After that the Outputs will only trigger on the right filtered  targetnamed entity.
		
		]]--
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
		
	elseif key == "OnStartTouch" then
		self.touch = self.touch or {}
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
		local tbl = string.Explode(',', value)
		table.insert(self.touch, tbl)
	
	elseif key == "OnTrigger" then
	
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
		self.trigger = self.trigger or {}
		local tbl = string.Explode(',', value)
		table.insert(self.trigger, tbl)
	
	elseif key == "OnEndTouch" then
	
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
		self.endtouch = self.endtouch or {}
		local tbl = string.Explode(',', value)
		table.insert(self.endtouch, tbl)
		

	elseif key == "spawnflags" then
		self[key] = tostring(value)
		self.spawnflags = value
		--print("\n[hl2c] ["..self:GetClass().."] "..key.." "..value.."\n")
		
	elseif key == "StartDisabled" then
		self[key] = tostring(value)
		self.disabled = value
		if  tostring(value) == "1" then
		self["Activated"] = false
		else
			self["Activated"] = true
		end
	else
	
		--print(self:GetClass(), key, value)
		
	end
end

function ENT:StartTouch(ent)
--[[
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
			--print(self:GetClass().." StartTouch Filtered")
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
			end
		end
	elseif self.filtering == "bad" then
		--print(self:GetClass().." StartTouch NoFilter")
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
		end
	end
--end
	end
	]]
	
	
	
	if not self["Init"] then return end
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
	
	if not self["Activated"] then
	else
		if self["filtering"] then
			--print(self:GetName()..self.filter.." EndTouch "..ent:GetClass())
		
			if self["filter_targetname"] != nil then 
				if string.find(ent:GetName(),self["filter_targetname"]) then
					--print(self:GetClass().." StartTouch Filtered")
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
					end
				end
				
			elseif self["filter_classname"] != nil then 
				if string.find(ent:GetClass(),self["filter_classname"]) then
				--print(self:GetClass().." EndTouch Filtered")
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
					end
				end
			end
	
		else
		--print(self:GetClass().." OnTrigger NoFilter")
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
						--print(v[1] ,v[2], v[3], v[4])
						
					end
				end
			end
		
		end

	end
end


function ENT:EndTouch(ent)
--[[
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
	--print(self:GetName()..self.filter.." EndTouch "..ent:GetClass())
	if self.filtername == nil then return end
	if string.find(ent:GetName(),self.filtername) then
	--print(self:GetClass().." EndTouch Filtered")
	self.endtouch = self.endtouch or {}
	for k, v in pairs(self.endtouch) do
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
	
	elseif self.filtering == "bad" then
	--print(self:GetClass().." EndTouch NoFilter")
	self.endtouch = self.endtouch or {}
	for k, v in pairs(self.endtouch) do
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
--end

	end
	]]
	
	
	
	if not self["Init"] then return end
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
	
	if not self["Activated"] then
	else
		if self["filtering"] then
			--print(self:GetName()..self.filter.." EndTouch "..ent:GetClass())
		
			if self["filter_targetname"] != nil then 
				if string.find(ent:GetName(),self["filter_targetname"]) then
				--print(self:GetClass().." EndTouch Filtered")
					self.endtouch = self.endtouch or {}
					for k, v in pairs(self.endtouch) do
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
				
			elseif self["filter_classname"] != nil then 
				if string.find(ent:GetClass(),self["filter_classname"]) then
				--print(self:GetClass().." EndTouch Filtered")
					self.endtouch = self.endtouch or {}
					for k, v in pairs(self.endtouch) do
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
			end
	
		else
		--print(self:GetClass().." OnTrigger NoFilter")
			self.endtouch = self.endtouch or {}
			for k, v in pairs(self.endtouch) do
				if v[1] == "!self" then
					self:Fire(v[2], v[3], v[4])
				elseif v[1] == "!activator" then
					ent:Fire(v[2], v[3], v[4])
				else
					local enttbl = ents.FindByName(v[1])
					for _, target in pairs(enttbl) do
						target:Fire(v[2], v[3], v[4])
						--print(v[1] ,v[2], v[3], v[4])
						
					end
				end
			end
		
		end

	end
end

function ENT:Touch(ent)
	if not self["Init"] then return end
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
	
	if not self["Activated"] then
	else
		if self["filtering"] then
			--print(self:GetName()..self.filter.." EndTouch "..ent:GetClass())
		
			if self["filter_targetname"] != nil then 
				if string.find(ent:GetName(),self["filter_targetname"]) then
				--print(self:GetClass().." EndTouch Filtered")
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
					end
				end
				
			elseif self["filter_classname"] != nil then 
				if string.find(ent:GetClass(),self["filter_classname"]) then
				--print(self:GetClass().." EndTouch Filtered")
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
					end
				end
			end
	
		else
		--print(self:GetClass().." OnTrigger NoFilter")
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
						--print(v[1] ,v[2], v[3], v[4])
						
					end
				end
			end
		
		end

	end
	/*
	self.trigger = self.trigger or {}
	for k, v in pairs(self.trigger) do
		if v[1] == "!self" then
			self:Fire(v[2], v[3], v[4])
		else
			local enttbl = ents.FindByName(v[1])
			for _, target in pairs(enttbl) do
				target:Fire(v[2], v[3], v[4])
			end
		end
	end
	*/
end

/*
function ENT:Touch(ent)
--print(self:GetClass().." Touched "..ent:GetName().." filter "..self.filtername)
--if ent:IsValid() then
	if self.filtername then
	--print(self.filtername)
	if ent:GetName() == self.filtername then

	print(self:GetClass().." Touched")
	self.trigger = self.trigger or {}
	for k, v in pairs(self.trigger) do
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
	
	else
	
	print(self:GetClass().." Touched NoFilter")
	self.trigger = self.trigger or {}
	for k, v in pairs(self.trigger) do
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
--end
end
*/
function ENT:Find_Filter_Think()
	if self["Init"] and self["filtering"] then 
		--print("Filtered")
		for k, v in pairs( ents.FindByName( self["filtername"] ) ) do
			self["filter_targetname"] = (v:GetKeyValues()["filtername"])
			self["filter_classname"] = (v:GetKeyValues()["filterclass"])
		end
	end
end

function ENT:Think()
	/*
	if self.isfilter then
		if !self.found then
			self.entfil = ents.FindByName(self.filter)
			for k, v in ipairs(self.entfil) do
	
				--PrintTable(v:GetKeyValues())
				self.filtername = (v:GetKeyValues()["filtername"])
				self.filterclass = (v:GetKeyValues()["filterclass"])
				--print(self.filtername)
			end
			self.filtering = true
			self.found = true
		end
	else
		self.filtering = "bad"
	end
	*/
	self:Find_Filter_Think()
end



function ENT:OnRemove()
	--print("[hl2c] "..self:GetClass().." Removed")
end

function ENT:AcceptInput( inputName, activator, called, data )
	if ( string.lower(inputName) == "enable" ) then

		self.disabled = "0"
		--print(self:GetClass(),inputName,data)
		self:SetKeyValue("StartDisabled", "0")
	elseif ( string.lower(inputName) == "disable" ) then

		self.disabled = "1"
		--print(self:GetClass(),inputName,data)
		self:SetKeyValue("StartDisabled", "1")
	elseif ( string.lower(inputName) == "kill" ) then
		--print(self:GetClass(),inputName,data)
		self:Remove()
	end
end

function ENT:UpdateTransmitState()

	--
	-- The default behaviour for point entities is to not be networked.
	-- If you're deriving an entity and want it to appear clientside, override this
	-- TRANSMIT_ALWAYS = always send, TRANSMIT_PVS = send if in PVS
	--
	return TRANSMIT_NEVER

end