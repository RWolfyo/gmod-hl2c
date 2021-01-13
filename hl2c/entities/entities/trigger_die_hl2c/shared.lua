
ENT.Type = "brush"
ENT.Base = "base_brush"
 
ENT.PrintName		= "trigger_die_hl2c"
ENT.Author			= ""
ENT.Contact			= "N/A"
ENT.Purpose			= "Extra Die Function"
ENT.Instructions	= "Just on touch die."
ENT.Spawnable = false

local DbgPrint = GetLogging("TDHl2c")

function ENT:Initialize()
	
	if SERVER then
		self:SetTrigger(true);
	end
	-- self:SetModel(Model("models/cod4/weapons/claymore/cod4_claymore_planted.mdl"));
	-- self:PhysicsInit(SOLID_OBB);
	self:SetMoveType(MOVETYPE_NONE);
	self:SetSolid(SOLID_OBB);
	
	self:SetNotSolid(true)
	self:SetTrigger(true)
	self:SetCollisionBounds(self.min, self.max)
	self:UseTriggerBounds(true)
	self.init = true
	--self:SetCollisionGroup(COLLISION_GROUP_DEBRIS);
	
	-- local phys = self:GetPhysicsObject();
	-- if (phys:IsValid()) then
		-- phys:Wake();
	-- end
	-- util.RunNextFrame(function()
	DbgPrint("Initialized: "..tostring(ent))
	
	-- end)
end

function ENT:SetupDataTables()

	
	self:NetworkVar( "String", 	0, "TeleportName", 	{ KeyName = "teleportname", 	Edit = { type = "String", 	order = 4 } } ) -- teleportname
	self:NetworkVar( "String", 	0, "TeleportClass", 	{ KeyName = "teleportclass", 	Edit = { type = "String", 	order = 4 } } ) -- teleportclass

end

function ENT:Think()
	if self.init == true then else return end
end