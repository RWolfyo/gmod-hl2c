
include('shared.lua')

ENT.RenderGroup = RENDERGROUP_OPAQUE

function ENT:Initialize()
	/*timer.Simple(1,function()
		
		if self:GetPos() != nil or self:GetPos() != NULL then
			self:CreateVortex()
		end
		
		
		
	end)*/
	if CLIENT then
	print("Vortex: Spawned on Client Side")
	end
end

function ENT:Think()
	if IsValid(self.vortex) then
	else
		self.vortex = ClientsideModel( "models/effects/intro_vortshield.mdl" or "error.mdl", RENDERGROUP_OPAQUE )
		self.vortex:SetModel( "models/effects/intro_vortshield.mdl" or "error.mdl" )
		--self.vortex:SetNoDraw( true )
		self.vortex:SetPos( self:GetPos() )
		self.vortex:SetAngles( Angle( 0, 0, 0 ) )
		self.vortex:DrawModel()
		print("HL2 Vortex Spawned on Client")
	end
end


function ENT:Draw()
	self:DrawModel()
	--self:CreateVortex()
	/*
	-- Create a local value to make the vortex and avoid other values.
	vortex_client = ents.CreateClientProp()
	-- Set the position of Vortex
	vortex_client:SetPos( self:GetPos() )
	-- Vortex Model O_O
	vortex_client:SetModel( "models/effects/intro_vortshield.mdl" )
	-- Spawn the Vortex
	vortex_client:Spawn()
	vortex_client:Activate()
	*/
	self.vortex = ClientsideModel( "models/effects/intro_vortshield.mdl" or "error.mdl", RENDERGROUP_OPAQUE )
	self.vortex:SetModel( "models/effects/intro_vortshield.mdl" or "error.mdl" )
	--self.vortex:SetNoDraw( true )
	self.vortex:SetPos( self:GetPos() )
	self.vortex:SetAngles( Angle( 0, 0, 0 ) )
	self.vortex:DrawModel()
	print("HL2 Vortex Spawned on Client")
end

function ENT:DrawTranslucent()

	-- This is here just to make it backwards compatible.
	-- You shouldn't really be drawing your model here unless it's translucent

	self:Draw()
	print("HL2 Vortex Spawned on Client")
end

--hook.Add("PostDrawOpaqueRenderables", CreateVortex )


function ENT:CreateVortex()
/*	-- Create a local value to make the vortex and avoid other values.
	vortex_client = ents.CreateClientProp()
	-- Set the position of Vortex
	vortex_client:SetPos( self:GetPos() )
	-- Vortex Model O_O
	vortex_client:SetModel( "models/effects/intro_vortshield.mdl" )
	-- Spawn the Vortex
	vortex_client:Spawn()
	vortex_client:Activate()*/
end
/*
function ENT:PlayerTouched()
	-- Remove the Vortex on Client Side
	vortex_client:Remove()
	
	CSEnt:Remove()
	
end
*/
net.Receive("Vortex_Touched", function()
	
	--vortex_client:Remove()
	
end)