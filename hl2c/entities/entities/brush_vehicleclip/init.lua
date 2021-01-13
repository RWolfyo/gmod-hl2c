// Entity information: Bursh to stop vehicles reach another area.
ENT.Base = "base_anim"
ENT.Type = "anim"

--ENT.Base = "base_entity"
--ENT.Type = "brush"


// Called when the entity first spawns
function ENT:Initialize()
	local w = self.max.x - self.min.x
	local l = self.max.y - self.min.y
	local h = self.max.z - self.min.z
	
	local min = Vector(0 - (w / 2), 0 - (l / 2), 0 - (h / 2))
	local max = Vector(w / 2, l / 2, h / 2) 
	
	self:DrawShadow(false)
	self:SetCollisionBounds(min, max)
	self:SetSolid(SOLID_BBOX)
	self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	self:SetMoveType(0)
	self:SetTrigger(false)
end