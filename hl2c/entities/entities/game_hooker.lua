ENT.Type = "point"

function ENT:Initialize()
end

function ENT:KeyValue( key, value )
end

function ENT:Think()
end

function ENT:OnRemove()
end

function ENT:AcceptInput( inputName, activator, called, data )
	hook.Call("OnEntityTriggered", GAMEMODE, inputName, activator, data)
end