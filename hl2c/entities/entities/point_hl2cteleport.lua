if SERVER then AddCSLuaFile() end

ENT.Type = "point"

function ENT:AcceptInput(name, activator, caller, data)
	if (name == "Kill" || name == "kill") then
		self:Remove()
	end
	if (name == "teleport" || name == "Teleport") then
		for _, pl in pairs(player.GetAll()) do
			pl:Teleport(self:GetPos())
		end
	end
	if (name == "cteleport" || name == "CTeleport") then
		for _, pl in pairs(player.GetAll()) do
			pl:ConCommand( "+duck" )
			pl:Teleport(self:GetPos())
			pl:ConCommand( "-duck" )
		end
	end
end