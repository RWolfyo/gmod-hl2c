if SERVER then AddCSLuaFile() end
// Entity information
ENT.Base = "base_anim"
ENT.Type = "anim"

--ENT.Base = "base_entity"
--ENT.Type = "brush"


// Called when the entity first spawns
function ENT:Initialize()
	local w = self.max.x - self.min.x
	local l = self.max.y - self.min.y
	local h = self.max.z - self.min.z
	
	self.min = Vector(0 - (w / 2), 0 - (l / 2), 0 - (h / 2))
	self.max = Vector(w / 2, l / 2, h / 2) 
	self:DrawShadow(false)
	self:SetCollisionBounds(self.min, self.max)
	self:SetSolid(SOLID_BBOX)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:SetMoveType(0)
	self:SetTrigger(false)
	self.disabled = true
	--self:InitCollision()
end

--[[
hook.Add("PlayerAuthed", "clip.clinit", function(ply)
	for k, v in ipairs(ents.FindByClass("brush_playerclip")) do
		-- re-init for shit.
		ply:SetCustomCollisionCheck(true)
		print("player init collision brush_playerclip")
		v:InitCollision()
		v.disabled = true
	end
end)

function ENT:InitCollision()
	self:DrawShadow(false)
	self:SetCollisionBounds(self.min, self.max)
	self:SetSolid(SOLID_BBOX)
	self:SetMoveType(0)
	self:SetCustomCollisionCheck(true)
	self:SetTrigger(true)
	self.disabled = true
	
end

/*
function ENT:Think()
	if self.disabled and self.disabled == true then
	
	end
end
*/
/*
function ENT:KeyValue()
	if 
end
*/

function ENT:AcceptInput(inputName,activator,called,data)
	if isstring(inputName) and inputName == "Enable" then
		self.disabled = false
	end
	if isstring(inputName) and inputName == "Disable" then
		self.disabled = true
	end
	--if
end

/*
hook.Add("ShouldCollide", "PlayerClip_ShouldCollide", function( a, b )
	if IsValid(a) and IsValid(b) and (
	((a:IsPlayer() and a:Team() == TEAM_ALIVE) and (!b:IsPlayer() and b:GetClass() == "brush_playerclip" and b.disabled == true)) or
	((b:IsPlayer() and b:Team() == TEAM_ALIVE) and (!a:IsPlayer() and a:GetClass() == "brush_playerclip" and a.disabled == true))
	) then
		print("Collide by Player to brush_playerclip ON")
		return true
	elseif IsValid(a) and IsValid(b) and (
	((a:IsPlayer() and a:Team() == TEAM_ALIVE) and (!b:IsPlayer() and b:GetClass() == "brush_playerclip" and b.disabled != true)) or
	((b:IsPlayer() and b:Team() == TEAM_ALIVE) and (!a:IsPlayer() and a:GetClass() == "brush_playerclip" and a.disabled != true))
	) then
		print("Collide by Player to brush_playerclip OFF")
		return false
	elseif IsValid(a) and IsValid(b) and 
	(a:GetClass() == "brush_playerclip" or b:GetClass() == "brush_playerclip")
	then
		print("Collide by Unknown to brush_playerclip OFF" )
		return false
	end 
end)
*/

hook.Add("ShouldCollide", "clip.colide", function(a, b)
	if a:GetClass() == "brush_playerclip" and a.disabled != true 
	then
		if b:IsPlayer() then
			print("Player Cannot Go Through")
			return true
		else
			print("Can Go through :D")
			return false
		end
	elseif a:GetClass() == "brush_playerclip" and a.disabled == true 
	then
		if b:IsPlayer() then
			print("Player Cannot Go Through")
			return false
		else
			print("Can Go through :D")
			return false
		end
	end
	
	if b:GetClass() == "brush_playerclip" and b.disabled != true 
	then
		if a:IsPlayer() then
			print("Player Cannot Go Through")
			return true
		else
			print("Can Go through :D")
			return false
		end
	elseif b:GetClass() == "brush_playerclip" and b.disabled == true 
	then
		if a:IsPlayer() then
			print("Player Cannot Go Through")
			return false
		else
			print("Can Go through :D")
			return false
		end
	end
end)
]]--