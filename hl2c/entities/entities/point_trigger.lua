//////////////////////////////////////////////////////////////////
//	___   ___	       ___  ___  __	     __	   __	__  __      //
//	|  \ /	 \ | |\  |  |	 |  |  \ |  /  \  /  \ |   |  \		//
//	|__/ |   | | | \ |  |	 |  |\_/ | |  __ |  __ |-  |\_/		//
//	|    \___/ | |  \|  | __ |  | \  |  \__/  \__/ |__ | \		//
//                                                              //
//////////////////////////////////////////////////////////////////

local DbgPrint = GetLogging("PointTrigger")

--ENT.Type = "point"		-- Must be Point (this entity is working like a trigger so hard to make it work).
ENT.Type = "brush"		-- I'm not sure about brush

function ENT:Initialize()
	--self:SetTrigger(true)
	--self.search
	self.classname = "point_trigger"
	timer.Simple(1,function()
		if self.triggerradius then
		
		self:PhysicsInitSphere( tonumber(self.triggerradius) )
		--self:SetSolid(0)
		self:SetTrigger(true)
		local d = ( self.triggerradius * 2 )
		self:SetCollisionBounds(Vector(-d / 2, -d / 2, -d / 2),Vector(d / 2, d / 2, d / 2)); -- set up the collision bounds
		self:UseTriggerBounds(true)
		self:SetNotSolid(true)
		if POINT_TRIGGER_DEBUG then
			--DbgPrint("[hl2c Initialized]",self.classname)
			if self["targetname"] != nil then
				DbgPrint("[hl2c Initialized] ".. tostring(self["targetname"]).." "..tostring(self.classname))
			else
				DbgPrint("[hl2c Initialized] "..tostring(self.classname))
			end
		end
		
		end
	end)
	--print("[hl2c Initialized]",self.classname)
	DbgPrint("[hl2c Initialized] "..tostring(self.classname))
end
-- <output>:<targetname>:<inputname>:<parameter>:<delay>:<max times to fire (-1 == infinite)>. 
-- Very dangerous, use with care.  
function ENT:KeyValue( key, value )
	if POINT_TRIGGER_DEBUG then
		DbgPrint(tostring(ent).." ".. tostring(key).. " " ..tostring(value))
	end
	if key == "filtername" then
		self[key] = tostring(value)
		self["filtername"] = value
		self.filter = value
		if self.filter != nil then
			self.isfilter = true	
			self.found = false
		else
			self.isfilter = "bad"
		end

	
	elseif key == "OnStartTouch" then
		if POINT_TRIGGER_DEBUG then
		-- DbgPrint(self:GetClass().." ".. key.. " " ..value)
		end
		self.starttouch = self.starttouch or {}

		local tbl = string.Explode(',', value)
		table.insert(self.starttouch, tbl)
	
	elseif key == "OnEndTouch" then
		if POINT_TRIGGER_DEBUG then
		-- DbgPrint(self:GetClass().." ".. key.. " " ..value)
		end
		self.endtouch = self.endtouch or {}

		local tbl = string.Explode(',', value)
		table.insert(self.endtouch, tbl)
/*	
	elseif key == "OnEndTouchAll" then
		print(self:GetClass(), key, value)
		self.endtouchall = self.endtouchall or {}

		local tbl = string.Explode(',', value)
		table.insert(self.endtouchall, tbl)
*/
	elseif key == "TriggerRadius" then
		self[key] = tostring(value)
		self.triggerradius = value
		
		if POINT_TRIGGER_DEBUG then
		-- DbgPrint(self:GetClass(),key,value)
		end
	elseif key == "targetname" then
		self[key] = tostring(value)
		self.targetname = value
		if POINT_TRIGGER_DEBUG then
		-- DbgPrint(self:GetClass(),key,value)
		end
	
	elseif key == "classname" then
		self[key] = tostring(value)
		self.classname = value
		if POINT_TRIGGER_DEBUG then
		print(self:GetClass(),key,value)
		end
	
	elseif key == "angles" then
		self[key] = tostring(value)
		self.angles = value
		--DbgPrint(self:GetClass(),key,self.angles)
	
	elseif key == "TriggerOnce" then
		self[key] = tostring(value)
		self.triggeronce = value
		if POINT_TRIGGER_DEBUG then
		-- DbgPrint(self:GetClass(),key,value)
		end
	elseif key == "StartDisabled" then
		self[key] = tostring(value)
		self.disabled = tostring(value)
		if POINT_TRIGGER_DEBUG then
		DbgPrint(self:GetClass(),key,value)
		end
	--elseif key == "filtername" then
	--	self[key] = tostring(value)
	--	self.filtername = value
		--DbgPrint(self:GetClass(),key,self.filtername)
	elseif key == "spawnflags" then
		self[key] = tostring(value)
		self.spawnflags = value
		if POINT_TRIGGER_DEBUG then
		-- DbgPrint(self:GetClass(),key,value)
		end
		if self.spawnflags == "1" then
		
		end
		--print(self:GetClass(),key,self.spawnflags)
		--print(self:GetClass(),key,self:GetSpawnFlags())
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
	if POINT_TRIGGER_DEBUG then
	DbgPrint(tostring(self.targetname).." entity filtername "..tostring(self["filtername"]))
	DbgPrint(tostring(self.targetname).." filtername "..tostring(self.filtername))
	DbgPrint(tostring(self.targetname).." filterclass "..tostring(self.filterclass))
	DbgPrint(tostring(self.targetname).." filteing "..tostring(self.filtering))
	--message = 'self.targetname,"filteing",self.filtering'
	--DbgPrint(self.targetname,"filteing",self.filtering)
	end
	if self["filtername"] != nil then
	--DbgPrint(self:GetName()..self.filter.." StartTouch "..ent:GetClass())
		if ( self.filtername == nil or self.filterclass == nil ) then 
			return 
		end
		if string.find(ent:GetName(), self.filtername) and (self.filtername != nil) then
			DbgPrint(tostring(self.targetname).." OnStartTouch filtername")
			self.starttouch = self.starttouch or {}
			for k, v in pairs(self.starttouch) do
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
				if POINT_TRIGGER_DEBUG then
				DbgPrint("Triggered "..tostring(self).." " ..tostring(v[1]).. " ".. tostring(v[2]).." ".. tostring(v[3]) .. " " .. tostring(v[4]))
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		
		if string.find(ent:GetClass(), self.filterclass) and (self.filterclass != nil) then
			DbgPrint(self.targetname.." OnStartTouch filterclass")
			self.starttouch = self.starttouch or {}
			for k, v in pairs(self.starttouch) do
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
				if POINT_TRIGGER_DEBUG then
					DbgPrint("Triggered "..tostring(self).." " ..tostring(v[1]).. " ".. tostring(v[2]).." ".. tostring(v[3]) .. " " .. tostring(v[4]))
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		--self:Remove()
	elseif self.filtering == "bad" then
		DbgPrint(self.targetname.. " OnStartTouch nofilters")
		self.starttouch = self.starttouch or {}
		for k, v in pairs(self.starttouch) do
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
			if POINT_TRIGGER_DEBUG then
				DbgPrint("Triggered "..tostring(self).." " ..tostring(v[1]).. " ".. tostring(v[2]).." ".. tostring(v[3]) .. " " .. tostring(v[4]))
			end
		end
		if self["TriggerOnce"] == "1" then
		self:Remove()
		end
	end
--end

	end
end

function ENT:EndTouch(ent)

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
	--DbgPrint(self:GetName()..self.filter.." StartTouch "..ent:GetClass())
		if ( self.filtername == nil or self.filterclass == nil ) then 
			return 
		end
		if string.find(ent:GetName(), self.filtername) and (self.filtername != nil) then
			DbgPrint(self.targetname.." OnEndTouch filtername")
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
				if POINT_TRIGGER_DEBUG then
					DbgPrint("Triggered "..tostring(self).." " ..tostring(v[1]).. " ".. tostring(v[2]).." ".. tostring(v[3]) .. " " .. tostring(v[4]))
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		
		if string.find(ent:GetClass(), self.filterclass) and (self.filterclass != nil) then
			DbgPrint(self.targetname.." OnEndTouch filterclass")
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
				if POINT_TRIGGER_DEBUG then
					DbgPrint("Triggered "..tostring(self).." " ..tostring(v[1]).. " ".. tostring(v[2]).." ".. tostring(v[3]) .. " " .. tostring(v[4]))
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		--self:Remove()
	elseif self.filtering == "bad" then
		DbgPrint(self.targetname.." OnEndTouch nofilters")
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
			if POINT_TRIGGER_DEBUG then
				DbgPrint("Triggered "..tostring(self).." " ..tostring(v[1]).. " ".. tostring(v[2]).." ".. tostring(v[3]) .. " " .. tostring(v[4]))
			end
		end
		if self["TriggerOnce"] == "1" then
			self:Remove()
		end
	end
--end

	end
end
/*
function ENT:OnEndTouchAll()

	self.endtouchall = self.trigger or {}
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
*/
function ENT:Think()
	/*
	self.search = ents.FindInSphere( self:GetPos() ,self.triggerradius)
	for k, v in pairs(self.search) do
		if v:IsPlayer() then
			
			self:StartTouch()
			
		end
	end
	*/
	
	if self.isfilter then
		if !self.found then
			timer.Simple(1,function()
				self.entfil = ents.FindByName(self.filter)
				for k, v in ipairs(self.entfil) do
					
					--PrintTable(v:GetKeyValues())
					self.filtername = (v:GetKeyValues()["filtername"])
					self.filterclass = (v:GetKeyValues()["filterclass"])
					--DbgPrint(self:GetClass(),self.filtername)
					--DbgPrint(self:GetClass(),self.filterclass)
				end
				self.found = true
				self.filtering = true
				DbgPrint(tostring(self).." "..tostring(self.filtername))
				DbgPrint(tostring(self).." "..tostring(self.filterclass))
				self["filtername"] = self.filter
			end)
		end
	else
		self.filtering = "bad"
	end
	if self["filtername"] == nil and !self.foundbad and self.filtering != true then
		self.filtering = "bad"
		DbgPrint(tostring(self).." "..tostring(self.filtering))
		self.foundbad = true
		--print(self["filtername"])
	end
	if self["filtername"] == nil and !self.needtofilter then
		DbgPrint(tostring(self["filtername"]))
		self.needtofilter = true
	elseif self["filtername"] != nil and !self.stoptofilter then
		DbgPrint(tostring(self["filtername"]))
		self.stoptofilter = true
		
	end
end

function ENT:OnRemove()
	DbgPrint("[hl2c Removed] "..tostring(self))
end

function ENT:AcceptInput( inputName, activator, called, data )

	if ( inputName == "Enable" or inputName == "enable" ) then

		self.disabled = "0"
		DbgPrint(tostring(self).." "..tostring(inputName).." "..tostring(data))
		self:SetKeyValue("StartDisabled", "0")
	elseif ( inputName == "Disable" or inputName == "disable" ) then

		self.disabled = "1"
		DbgPrint(tostring(self).." "..tostring(inputName).." "..tostring(data))
		self:SetKeyValue("StartDisabled", "1")
	elseif ( inputName == "Kill" or inputName == "kill" ) then
		DbgPrint(tostring(self).." "..tostring(self["targetname"]).." "..tostring(inputName).." "..tostring(data))
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