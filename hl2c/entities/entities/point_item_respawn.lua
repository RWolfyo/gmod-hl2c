
ENT.Type = "point"

-- Most functions are server-based
if ( SERVER ) then

ENT.RespawningEntity = true
ENT.RespawnClass = "weapon_crowbar"
ENT.RespawnVector = Vector( 0, 0, 0 )
ENT.RespawnAngles = Angle( 0, 0, 0 )
ENT.RespawnDistance = 50
ENT.RespawnLastEntity = nil

function ENT:Initialize()

	self:RespawnEntity( self.RespawnClass, self.RespawnVector, self.RespawnAngles )

end


function ENT:Think()

	if ( self.RespawningEntity ) then return end

	if ( !self.RespawnLastEntity:IsValid() ) || ( self.RespawnLastEntity:IsValid() && ( self.RespawnLastEntity:GetPos():Distance( self.Entity:GetPos() ) > self.RespawnDistance ) ) then
	
		self.RespawningEntity = true
		timer.Simple( GetConVarNumber("hl2c_items_respawn_time"), function() self:CheckRespawn() end )
	
	end

end


function ENT:CheckRespawn()

	if ( self.Entity && self.Entity:IsValid() ) then
	
		self:RespawnEntity( self.RespawnClass, self.RespawnVector, self.RespawnAngles )
	
	end

end


function ENT:RespawnEntity( ent, pos, ang )

	if ( ent && pos && ang ) then
		local phys = nil
		local phys_motion = true
		if ( self.RespawnLastEntity && self.RespawnLastEntity:IsValid() && !self.RespawnLastEntity:GetOwner():IsValid() ) then
			phys = self.RespawnLastEntity:GetPhysicsObject()
			if phys:IsMotionEnabled() then phys_motion = true else phys_motion = false end
			self.RespawnLastEntity:Remove()
		
		end
	
		local entity = ents.Create( ent )
		entity:SetPos( pos )
		entity:SetAngles( ang )
		entity:Spawn()
		entity:Activate()
		entity:EmitSound( "AlyxEMP.Charge" )
		if phys_motion == false then
			local getphys = entity:GetPhysicsObject()
			getphys:EnableMotion(false)
		end
		
		self.RespawnLastEntity = entity
		self.RespawningEntity = false
	
	end

end


end