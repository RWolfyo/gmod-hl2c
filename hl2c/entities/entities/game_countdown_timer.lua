ENT.Type = "point"

function ENT:Initialize()
	--print("[hl2c]","game_countdown_timer","Initialized")
end

function ENT:KeyValue( key, value )
	if key == "classname" then
	self[key] = tostring(value)
	 self.classname = value
	end
end

function ENT:Think()
end

function ENT:OnRemove()
end

function ENT:AcceptInput( inputName, activator, called, data )
	if inputName == "SetTimerLabel" then
		self.name = data
		--print("[hl2c]",self.classname,inputName,self.name)
	elseif inputName == "StartTimer" then
		--print("[hl2c]",self.classname,inputName,data)
		timer.Simple(1,function()
		if self.name then
		PushTimer( self, data, self.name )
		end
		end)
	end
end