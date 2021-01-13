include( "shared.lua" )

function ENT:Draw()
	self:DrawModel();
	
	render.SetMaterial(Material("materials/vgui/ttt/icon_ak47"));
	render.DrawWireframeBox(self:GetPos(), self:GetAngles(), self:OBBMins(), self:OBBMaxs(), Color(255, 255, 255, 255))
end
