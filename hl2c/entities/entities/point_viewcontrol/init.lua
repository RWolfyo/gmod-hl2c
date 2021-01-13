--[[---------------------------------------------------------
   Name: point.viewcontrol
   Desc: A point entity which controls the player view.
-----------------------------------------------------------]]
ENT.Base = "base_entity"
ENT.Type = "point"

--[[---------------------------------------------------------
   Name: Initialize
   Desc: First function called. Use to set up your entity
-----------------------------------------------------------]]
function ENT:Initialize()
	--print("[hl2c] Succesfully Initialized point_viewcontrol")
end
VIEWCONTROL_TOGGLE = 0

--[[---------------------------------------------------------
   Name: KeyValue
   Desc: Called when a keyvalue is added to us
-----------------------------------------------------------]]
function ENT:KeyValue( key, value )
	
	--print(tostring(self) .. " with -- Key : " .. key .. "     Value : " .. value)
	
	if ( key == "origin" ) then 
		self.origin = value
/*	elseif ( key == "targetattachment" ) then 
		self.targetattachment = value
	elseif ( key == "target" ) then 
		self.target = value
*/
	elseif ( key == "targetname" ) then 
		self.targetname = value
	elseif ( key == "spawnflags" ) then
		self[key] = tostring(value)
		--print(self:GetClass(),key,value)
		self.spawnflags = value
	elseif ( key == "deceleration" ) then
		self.deceleration = value
	elseif ( key == "acceleration" ) then
		self.acceleration = value
	elseif ( key == "speed" ) then
		self.speed = value
	elseif ( key == "interpolatepositiontoplayer" ) then
		self.interpolatepositiontoplayer = value
	elseif ( key == "angles" ) then 
		self.angles = value
	elseif ( key == "wait" ) then
		self.wait = value
	elseif ( key == "classname" ) then
		self.classname = value
	end

end

--[[---------------------------------------------------------
   Name: AcceptInput
   Desc: Called when received an input.
-----------------------------------------------------------]]

function ENT:AcceptInput( name, activator, caller )
if OC_MAP then
	local ent
	ent = player.GetAll()
	if ( name == "Enable" || name == "enable" ) then
		for _, pl in pairs(ent) do
			--print( "[hl2c] Allowed ViewControl: "..pl:Nick().."" )
			if pl && pl:IsValid() then
			if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
				pl:SetViewEntity( self )
				-- print("Working")
				pl:Lock()
				--pl:SetMoveType(0)
				pl:GodEnable()
			end
			end
		end
	end
	--end
	if ( name == "Disable" || name == "disable" ) then
	
		for _, pl in pairs(ent) do
			if pl && pl:IsValid() then
			if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
				--print( "[hl2c] Disabled ViewControl: "..pl:Nick().."" )
				pl:SetViewEntity(pl)
				pl:UnLock()
				pl:UnLock()
				--pl:SetMoveType(2)
				--pl:SetMoveType(2)
				pl:GodDisable()
			end
			end
		end
	end
	
	if ( name == "Kill" || name == "kill" ) then
		for _, pl in pairs(ent) do
			if pl && pl:IsValid() then
				if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
					--print( "[hl2c] Killed ViewControl: "..pl:Nick().."" )
					pl:SetViewEntity(pl)
					pl:UnLock()
					pl:UnLock()
					pl:SetMoveType(2)
					pl:SetMoveType(2)
					pl:GodDisable()
				end
			end
		end
		self:Remove()
	end
elseif HL2MP_IS_COOP_MAP then
	
	if ( name == "Enable" || name == "enable" ) then
	print("\n\n[hl2c] HL2DM Coop Map point_viewcontrol Enable")
	--print("\n\n[hl2c] HL2DM Coop Map No Control on ViewControl")
	--print(self:GetName())
	if activator:IsValid() and activator:Alive() then
		if VIEWCONTROL_TOGGLE == 1 then
		activator:SetViewEntity( activator )
		VIEWCONTROL_TOGGLE = 0
		else
		activator:SetViewEntity( self )
		self.activator = activator
		VIEWCONTROL_TOGGLE = 1
		end
	end
	end
	
	if ( name == "Disable" || name == "disable" ) then
		VIEWCONTROL_TOGGLE = 0
		for _, pl in pairs(player.GetAll()) do
			if pl && pl:IsValid() then
			--if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
				print( "[hl2c] Disabled ViewControl: "..pl:Nick().."" )
				pl:SetViewEntity(pl)
			--end
			end
		end
	end
	
	if ( name == "Kill" || name == "kill" ) then
	VIEWCONTROL_TOGGLE = 0
	for _, pl in pairs(player.GetAll()) do
			if pl && pl:IsValid() then
			--if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
				--print( "[hl2c] Disabled ViewControl: "..pl:Nick().."" )
				pl:SetViewEntity(pl)
			--end
			end
		end
	end
else
		
	local ent
	ent = player.GetAll()
	if ( name == "Enable" || name == "enable" ) then
		for _, pl in pairs(ent) do
			-- print( "[hl2c] Allowed ViewControl: "..pl:Nick().."" )
			if pl && pl:IsValid() then
			if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
				pl:SetViewEntity( self )
				pl:Lock()
				pl:SetMoveType(0)
			end
			end
		end
	end
	--end
	if ( name == "Disable" || name == "disable" ) then
	
		for _, pl in pairs(ent) do
			if pl && pl:IsValid() then
			if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
				--print( "[hl2c] Disabled ViewControl: "..pl:Nick().."" )
				pl:SetViewEntity(pl)
				pl:UnLock()
				pl:UnLock()
				pl:SetMoveType(2)
				pl:SetMoveType(2)
				pl:GodDisable()
			end
			end
		end
	end
	
	if ( name == "Kill" || name == "kill" ) then
		for _, pl in pairs(ent) do
			if pl && pl:IsValid() then
				if (pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_DEATH) && ( pl:IsPlayer() && !pl:IsBot() ) then
					--print( "[hl2c] Killed ViewControl: "..pl:Nick().."" )
					pl:SetViewEntity(pl)
					pl:UnLock()
					pl:UnLock()
					pl:SetMoveType(2)
					pl:SetMoveType(2)
					pl:GodDisable()
				end
			end
		end
		self:Remove()
	end
end

end

--[[---------------------------------------------------------
   Name: Think
   Desc: Entity's think function. 
-----------------------------------------------------------]]
function ENT:Think()
	if IsValid(self.activator) then
	
		if !self.activator:Alive() then
		self.activator:SetViewEntity(self.activator)
		end
	
	end
/*
if ent:IsDeath() then
ent:SetViewEntity( ent )
end

if ent:Disconnect then 
ent:SetViewEntity( ent )
end
*/
end

--
--   Name: OnRemove
--   Desc: Called just before entity is deleted
--
function ENT:OnRemove()
	if self.classname != nil then
	--print("[hl2c] ViewControl Removed: "..self.classname.."")
	end
//
end


--
--   Important functions what point_viewcontrol use.
--
/*
LINK_ENTITY_TO_CLASS( point_viewcontrol, CTriggerCamera );

BEGIN_DATADESC( CTriggerCamera )

	DEFINE_FIELD( m_hPlayer, FIELD_EHANDLE ),
	DEFINE_FIELD( m_hTarget, FIELD_EHANDLE ),
	DEFINE_FIELD( m_pPath, FIELD_CLASSPTR ),
	DEFINE_FIELD( m_sPath, FIELD_STRING ),
	DEFINE_FIELD( m_flWait, FIELD_FLOAT ),
	DEFINE_FIELD( m_flReturnTime, FIELD_TIME ),
	DEFINE_FIELD( m_flStopTime, FIELD_TIME ),
	DEFINE_FIELD( m_moveDistance, FIELD_FLOAT ),
	DEFINE_FIELD( m_targetSpeed, FIELD_FLOAT ),
	DEFINE_FIELD( m_initialSpeed, FIELD_FLOAT ),
	DEFINE_FIELD( m_acceleration, FIELD_FLOAT ),
	DEFINE_FIELD( m_deceleration, FIELD_FLOAT ),
	DEFINE_FIELD( m_state, FIELD_INTEGER ),
	DEFINE_FIELD( m_vecMoveDir, FIELD_VECTOR ),
	DEFINE_KEYFIELD( m_iszTargetAttachment, FIELD_STRING, "targetattachment" ),
	DEFINE_FIELD( m_iAttachmentIndex, FIELD_INTEGER ),
	DEFINE_FIELD( m_bSnapToGoal, FIELD_BOOLEAN ),
#if HL2_EPISODIC
	DEFINE_KEYFIELD( m_bInterpolatePosition, FIELD_BOOLEAN, "interpolatepositiontoplayer" ),
	DEFINE_FIELD( m_vStartPos, FIELD_VECTOR ),
	DEFINE_FIELD( m_vEndPos, FIELD_VECTOR ),
	DEFINE_FIELD( m_flInterpStartTime, FIELD_TIME ),
#endif
	DEFINE_FIELD( m_nPlayerButtons, FIELD_INTEGER ),
	DEFINE_FIELD( m_nOldTakeDamage, FIELD_INTEGER ),

	// Inputs
	DEFINE_INPUTFUNC( FIELD_VOID, "Enable", InputEnable ),
	DEFINE_INPUTFUNC( FIELD_VOID, "Disable", InputDisable ),

	// Function Pointers
	DEFINE_FUNCTION( FollowTarget ),
	DEFINE_OUTPUT( m_OnEndFollow, "OnEndFollow" ),

END_DATADESC()


*/