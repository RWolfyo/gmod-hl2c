//////////////////////////////////////////////////////////////////
//	___   ___	       ___  ___  __	     __	   __	__  __      //
//	|  \ /	 \ | |\  |  |	 |  |  \ |  /  \  /  \ |   |  \		//
//	|__/ |   | | | \ |  |	 |  |\_/ | |  __ |  __ |-  |\_/		//
//	|    \___/ | |  \|  | __ |  | \  |  \__/  \__/ |__ | \		//
//                                                              //
//////////////////////////////////////////////////////////////////

--ENT.Type = "point"		-- Must be Point (this entity is working like a trigger so hard to make it work).
ENT.Type = "brush"		-- I'm not sure about brush

function ENT:Initialize()
	--self:SetTrigger(true)
	--self.search
	self.classname = "point_trigger"
	timer.Simple(1,function()
		if self.triggerradius then
		
		
		if SERVER then
		self:SetTrigger(true);
		end
		--self:SetModel(Model("models/cod4/weapons/claymore/cod4_claymore_planted.mdl"));
		self:PhysicsInitSphere( tonumber(self.triggerradius) )
		self:PhysicsInit(SOLID_OBB);
		self:SetMoveType(MOVETYPE_NONE);
		self:SetSolid(SOLID_OBB);
		
		self:SetNotSolid(true)
		self:SetTrigger(true)
		d = ( self.triggerradius * 2 )
		self:SetCollisionBounds(Vector(-d / 2, -d / 2, -d / 2),Vector(d / 2, d / 2, d / 2)); -- set up the collision bounds
		self:UseTriggerBounds(true)
		--self:SetCollisionGroup(COLLISION_GROUP_DEBRIS);
		
		local phys = self:GetPhysicsObject();
		if (phys:IsValid()) then
			phys:Wake();
		end
		
		--self:SetSolid(0)
		
		if POINT_TRIGGER_DEBUG then
			--DPT_print("[hl2c Initialized]",self.classname)
			if self["targetname"] != nil then
				DPT_print("[hl2c Initialized]",self["targetname"],self.classname)
			else
				DPT_print("[hl2c Initialized]",self.classname)
			end
		end
		
		end
	end)
	--print("[hl2c Initialized]",self.classname)
	print("[hl2c Initialized]",self.classname)
end
-- <output>:<targetname>:<inputname>:<parameter>:<delay>:<max times to fire (-1 == infinite)>. 
-- Very dangerous, use with care.  
function ENT:KeyValue( key, value )
	
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
		if POINT_TRIGGER_DEBUG then
			DPT_print(self:GetClass(),key,value)
		end
	
	elseif key == "OnStartTouch" then
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),key,value)
		end
		self.starttouch = self.starttouch or {}

		local tbl = string.Explode(',', value)
		table.insert(self.starttouch, tbl)
	
	elseif key == "OnEndTouch" then
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),key,value)
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
		DPT_print(self:GetClass(),key,value)
		end
	elseif key == "targetname" then
		self[key] = tostring(value)
		self.targetname = value
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),key,value)
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
		--DPT_print(self:GetClass(),key,self.angles)
	
	elseif key == "TriggerOnce" then
		self[key] = tostring(value)
		self.triggeronce = value
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),key,value)
		end
	elseif key == "StartDisabled" then
		self[key] = tostring(value)
		self.disabled = tostring(value)
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),key,value)
		end
	--elseif key == "filtername" then
	--	self[key] = tostring(value)
	--	self.filtername = value
		--DPT_print(self:GetClass(),key,self.filtername)
	elseif key == "spawnflags" then
		self[key] = tostring(value)
		self.spawnflags = value
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),key,value)
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
	DPT_print("Touch starts")
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
	DPT_print(self.targetname,"entity filtername",self["filtername"])
	DPT_print(self.targetname,"filtername",self.filtername)
	DPT_print(self.targetname,"filterclass",self.filterclass)
	DPT_print(self.targetname,"filteing",self.filtering)
	--message = 'self.targetname,"filteing",self.filtering'
	--DPT_print(self.targetname,"filteing",self.filtering)
	end
	if self["filtername"] != nil then
	--DPT_print(self:GetName()..self.filter.." StartTouch "..ent:GetClass())
		if ( self.filtername == nil or self.filterclass == nil ) then 
			return 
		end
		if string.find(ent:GetName(), self.filtername) and (self.filtername != nil) then
			DPT_print(self.targetname,"OnStartTouch filtername")
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
				DPT_print("Triggered",self:GetClass(),v[1], v[2], v[3] , v[4])
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		
		if string.find(ent:GetClass(), self.filterclass) and (self.filterclass != nil) then
			DPT_print(self.targetname,"OnStartTouch filterclass")
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
					DPT_print("Triggered",self:GetClass(),v[1], v[2], v[3] , v[4])
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		--self:Remove()
	elseif self.filtering == "bad" then
		DPT_print(self.targetname,"OnStartTouch nofilters")
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
			DPT_print("Triggered",self:GetClass(),v[1], v[2], v[3] , v[4])
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
	DPT_print("Touch ends")
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
	--DPT_print(self:GetName()..self.filter.." StartTouch "..ent:GetClass())
		if ( self.filtername == nil or self.filterclass == nil ) then 
			return 
		end
		if string.find(ent:GetName(), self.filtername) and (self.filtername != nil) then
			DPT_print(self.targetname,"OnEndTouch filtername")
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
				DPT_print("Triggered",self:GetClass(),v[1], v[2], v[3] , v[4])
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		
		if string.find(ent:GetClass(), self.filterclass) and (self.filterclass != nil) then
			DPT_print(self.targetname,"OnEndTouch filterclass")
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
				DPT_print("Triggered",self:GetClass(),v[1], v[2], v[3] , v[4])
				end
			end
			if self["TriggerOnce"] == "1" then
				self:Remove()
			end
		end
		--self:Remove()
	elseif self.filtering == "bad" then
		DPT_print(self.targetname,"OnEndTouch nofilters")
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
			DPT_print("Triggered",self:GetClass(),v[1], v[2], v[3] , v[4])
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
					--DPT_print(self:GetClass(),self.filtername)
					--DPT_print(self:GetClass(),self.filterclass)
				end
				self.found = true
				self.filtering = true
				DPT_print(self:GetClass(),self.filtername)
				DPT_print(self:GetClass(),self.filterclass)
				self["filtername"] = self.filter
			end)
		end
	else
		self.filtering = "bad"
	end
	if self["filtername"] == nil and !self.foundbad and self.filtering != true then
		self.filtering = "bad"
		DPT_print(self:GetClass(),self.filtering)
		self.foundbad = true
		--print(self["filtername"])
	end
	if self["filtername"] == nil and !self.needtofilter then
		DPT_print(self["filtername"])
		self.needtofilter = true
	elseif self["filtername"] != nil and !self.stoptofilter then
		DPT_print(self["filtername"])
		self.stoptofilter = true
		
	end
end

function ENT:OnRemove()
	if POINT_TRIGGER_DEBUG then
	DPT_print("[hl2c Removed]",self:GetClass())
	end
end

function ENT:AcceptInput( inputName, activator, called, data )

	if ( inputName == "Enable" or inputName == "enable" ) then

		self.disabled = "0"
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),inputName,data)
		end
		self:SetKeyValue("StartDisabled", "0")
	elseif ( inputName == "Disable" or inputName == "disable" ) then

		self.disabled = "1"
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),inputName,data)
		end
		self:SetKeyValue("StartDisabled", "1")
	elseif ( inputName == "Kill" or inputName == "kill" ) then
		if POINT_TRIGGER_DEBUG then
		DPT_print(self:GetClass(),self["targetname"],inputName,data)
		end
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

function DPT_print(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10)
	--
	-- Just a new print message system to the console
	-- for allow debug messages if turned on.
	--
	if POINT_TRIGGER_DEBUG then
		/*if m1 != nil then
		return print(m1)
		elseif m2 != nil then
		return print(m1,m2)
		elseif m3 != nil then
		return print(m1,m2,m3)
		elseif m4 != nil then
		return print(m1,m2,m3,m4)
		elseif m5 != nil then
		return print(m1,m2,m3,m4,m5)
		elseif m6 != nil then
		return print(m1,m2,m3,m4,m5,m6)
		elseif m7 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7)
		elseif m8 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8)
		elseif m9 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8,m9)*/
		if m10 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10)
		
		elseif m9 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8,m9)
		
		elseif m8 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8)
		
		elseif m7 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7)
		
		elseif m6 != nil then
		return print(m1,m2,m3,m4,m5,m6)
		
		elseif m5 != nil then
		return print(m1,m2,m3,m4,m5)
		
		elseif m4 != nil then
		return print(m1,m2,m3,m4)
		
		elseif m3 != nil then
		return print(m1,m2,m3)
		
		elseif m2 != nil then
		return print(m1,m2)
		
		elseif m1 != nil then
		return print(m1)
		
		end
		
	end
	
end