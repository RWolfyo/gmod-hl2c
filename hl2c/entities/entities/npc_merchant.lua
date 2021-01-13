
ENT.Type = "anim"

function ENT:Initialize()
end

function ENT:KeyValue( key, value )
	if key == "classname" then
		self[key] = tostring(value)
		--print(key,value)
	else
		self[key] = tostring(value)
		--print(key,value)
	end
 end

function ENT:Think()
	--	Do nothing
end

function ENT:OnRemove()
	--	Do nothing
end

function ENT:AcceptInput( inputName, activator, called, data )
	if inputName == "Kill" then
		self:Remove()
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_NEVER
end