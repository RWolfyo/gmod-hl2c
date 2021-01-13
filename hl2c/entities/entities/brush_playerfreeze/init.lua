// Entity information
ENT.Base = "base_anim"
ENT.Type = "anim"


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
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:SetMoveType(0)
	self:SetTrigger(true)
end


// Called when an entity touches it
function ENT:StartTouch(ent)
	if ent:IsValid() && ent:IsPlayer() && ent:Team() == TEAM_ALIVE then
		ent:Freeze(true)
		ent:SetRenderMode(RENDERMODE_NONE)
		ent:SetAvoidPlayers(false)
	end
end

// Called when an entity leaves it
function ENT:EndTouch(ent)
	if ent:IsValid() && ent:IsPlayer() && ent:Team() == TEAM_ALIVE then
		ent:Freeze(false)
		ent:SetRenderMode(RENDERMODE_NORMAL)
		ent:SetAvoidPlayers(false)
	end
end