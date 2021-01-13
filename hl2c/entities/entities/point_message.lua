
ENT.Type = "point"

function ENT:Initialize()
end

function ENT:KeyValue( key, value )
	--print(self:GetClass(), key, value)
end

function ENT:Think()
end

function ENT:OnRemove()
end

function ENT:AcceptInput( inputName, activator, called, data )
	if inputName == "DisplayText" then
		PrintMessage(HUD_PRINTCENTER,tostring(data))
		Hl2c.DefaultChatPrint("[MESSAGE]: "..tostring(data))
		-- for k, v in pairs(player.GetAll()) do
			-- v:ChatPrint(data)
		-- end
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_NEVER
end