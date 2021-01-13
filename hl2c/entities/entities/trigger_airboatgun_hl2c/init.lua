if SERVER then AddCSLuaFile() end
// Entity information
-- ENT.Base = "base_anim"
-- ENT.Type = "anim"
ENT.Type = "brush"
ENT.Base = "base_brush"


// Called when the entity first spawns
function ENT:Initialize()
	self.ipsLocation = Vector(self.pos.x, self.pos.y, self.min.z + 8)
	
	local w = self.max.x - self.min.x
	local l = self.max.y - self.min.y
	local h = self.max.z - self.min.z
	
	local min = Vector(0 - (w / 2), 0 - (l / 2), 0 - (h / 2))
	local max = Vector(w / 2, l / 2, h / 2) 
	
	self:DrawShadow(false)
	self:SetMoveType(MOVETYPE_NONE);
	self:SetSolid(SOLID_OBB);
	self:SetNotSolid(true)
	self:SetTrigger(true)
	self:SetCollisionBounds(min, max)
	self:UseTriggerBounds(true)
end


// Called when an entity touches me :D
function ENT:StartTouch(ent)
	if ent and 
	IsValid(ent) and 
	ent:IsPlayer() and 
	ent:Team() == TEAM_ALIVE  and
	ent:Alive()
	then

		
		//Give Them Weapons on Touch
		if !ent:HasWeapon("weapon_airboatgun_hl2c") then
			ent:Give("weapon_airboatgun_hl2c")

			PrintMessage(HUD_PRINTTALK,"[hl2c] "..ent:Nick().." received an airboatgun!")
		end
	end
end


// Checks to see if we should go to the next map
--function ENT:Think()
	
--end