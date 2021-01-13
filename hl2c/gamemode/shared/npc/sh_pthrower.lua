--sh_init.lua
--m_hOriginalThrower
--Entity:GetSaveTable
--Entity:GetInternalVariable
if SERVER then AddCSLuaFile() end

local META_NPC = FindMetaTable( "Entity" )

function META_NPC:SetOriginalGrenadeThrower()
	if SERVER then else return end
	-- if IsValid(self) and isstring( self:GetClass() ) and self:GetClass() == "npc_grenade_frag" --and 
	--IsValid( self:GetSaveTable().m_hOriginalThrower )
	-- then
		--print( self:GetSaveTable().m_hOriginalThrower )
		--self:SetNWEntity("throwed_me_original",self:GetSaveTable().m_hOriginalThrower)
		--self:GetNWEntity("throwed_me_original"):SetGrenadeThrown(self)
		if !IsValid(self:GetNWEntity("m_hOriginalThrower")) then
			self:SetNWEntity("m_hOriginalThrower", self:GetSaveTable().m_hThrower)
			
			if IsValid(self:GetNWEntity("m_hOriginalThrower")) and self:GetNWEntity("m_hOriginalThrower"):GetClass() == "npc_zombine" then
				self:SetNWBool("OriginThrowG_Zombine",true)
				-- print(self:GetNWEntity("m_hOriginalThrower"))
			end
			--return self:GetSaveTable().m_hThrower
		else
			--return self:GetNWEntity("m_hOriginalThrower")
		end
	-- else
		--return NULL
	-- end
	
end

function META_NPC:GetOriginalGrenadeThrower()
	if IsValid(self) and isstring( self:GetClass() ) and self:GetClass() == "npc_grenade_frag" --and 
	--IsValid( self:GetSaveTable().m_hOriginalThrower )
	then
		return self:GetNWEntity("m_hOriginalThrower")
	end
	return NULL
	
end

function META_NPC:IsOriginalGrenadeThrower(class)
	if not IsValid(self) then return false end
	if not isstring(class) then return false end
	if not IsValid(self:GetNWEntity("m_hOriginalThrower")) then return false end
	if class == self:GetNWEntity("m_hOriginalThrower"):GetClass() then
	
		return true
	else
		return false
	end
	
end

function META_NPC:IsZombineGrenadeThrower(class)
	if not IsValid(self) then return end
	if not isstring(class) then return end
	if not IsValid(self:GetNWEntity("m_hOriginalThrower")) then return end
	if class == "npc_zombine" then
	if self:GetNWBool("OriginThrowG_Zombine") then
		return true
	else
		return false
	end
	end
	
end

/*
LightingOrigin  =
LightingOriginHack      =
ResponseContext =
SetBodyGroup    =       0
TeamNum =       0
avelocity       =       0.000000 0.000000 0.000000
basevelocity    =       0.000000 0.000000 0.000000
body    =       0
classname       =       npc_grenade_frag
cycle   =       0
damagefilter    =
effects =       0
fademaxdist     =       0
fademindist     =       0
fadescale       =       0
friction        =       1
globalname      =
gravity =       0
hammerid        =       0
health  =       1
hitboxset       =       0
ltime   =       0
m_CollisionGroup        =       11
m_DmgRadius     =       250
m_GMOD_EHANDLE  =       [NULL Entity]
m_GMOD_QAngle   =       0.000000 0.000000 0.000000
m_GMOD_Vector   =       0.000000 0.000000 0.000000
m_GMOD_bool     =       false
m_GMOD_float    =       0
m_GMOD_int      =       0
m_MoveCollide   =       0
m_MoveType      =       6
m_OverrideViewTarget    =       0.000000 0.000000 0.000000
m_angAbsRotation        =       -1.798481 152.496811 103.821213
m_angRotation   =       -1.798481 152.496811 103.821213
m_bAlternateSorting     =       false
m_bAnimatedEveryTick    =       false
m_bClientSideAnimation  =       false
m_bClientSideFrameReset =       false
m_bHasWarnedAI  =       true
m_bIsLive       =       false
m_bSequenceFinished     =       false
m_bSequenceLoops        =       false
m_bSimulatedEveryTick   =       true
m_combineSpawned        =       true
m_debugOverlays =       0
m_fBoneCacheFlags       =       0
m_fFlags        =       0
m_flAnimTime    =       -0.93939208984375
m_flDamage      =       200
m_flDesiredShadowCastDistance   =       0
m_flDetonateTime        =       1.5
m_flDissolveStartTime   =       -658.69696044922
m_flElasticity  =       1
m_flEncodedController   =       0
m_flGroundChangeTime    =       -658.69696044922
m_flGroundSpeed =       0
m_flLastEventCheck      =       -658.69696044922
m_flModelScale  =       1
m_flMoveDoneTime        =       0
m_flNavIgnoreUntilTime  =       -658.69696044922
m_flNextBlipTime        =       0.29998779296875
m_flPoseParameter       =       0
m_flPrevAnimTime        =       -0.93939208984375
m_flSimulationTime      =       0
m_flVPhysicsUpdateLocalTime     =       0
m_flWarnAITime  =       0.75
m_hDamageFilter =       [NULL Entity]
m_hEffectEntity =       [NULL Entity]
m_hGroundEntity =       [NULL Entity]
m_hLightingOrigin       =       [NULL Entity]
m_hLightingOriginRelative       =       [NULL Entity]
m_hMoveChild    =       Entity [233][env_spritetrail]
m_hMoveParent   =       [NULL Entity]
m_hMovePeer     =       [NULL Entity]
m_hOwnerEntity  =       Player [1][NUL]
m_hThrower      =       Player [1][NUL]
m_iEFlags       =       42205184
m_iIKCounter    =       0
m_iName =
m_iParentAttachment     =       8
m_iTeamNum      =       0
m_inSolid       =       false
m_iszBounceSound        =
m_iszOverrideSubMaterials       =
m_lifeState     =       0
m_nLastThinkTick        =       -1
m_nMuzzleFlashParity    =       0
m_nNewSequenceParity    =       0
m_nResetEventsParity    =       0
m_nSimulationTick       =       -1
m_nTransmitStateOwnedCounter    =       0
m_nWaterType    =       0
m_pBlocker      =       [NULL Entity]
m_pBoneManipulator      =       [NULL Entity]
m_pFlexManipulator      =       [NULL Entity]
m_pGlowTrail    =       Entity [233][env_spritetrail]
m_pMainGlow     =       Entity [91][env_sprite]
m_pParent       =       [NULL Entity]
m_punted        =       false
m_rgflCoordinateFrame   =       -0.8865482211113
m_strOverrideMaterial   =       0
m_strRealClassName      =       110
m_takedamage    =       1
m_vecAbsOrigin  =       3064.111328 3300.880371 481.408752
m_vecAbsVelocity        =       0.000000 0.000000 0.000000
m_vecOrigin     =       3064.111328 3300.880371 481.408752
max_health      =       0
model   =       models/Weapons/w_npcnade.mdl
modelindex      =       183
modelscale      =       1
nextthink       =       2
parentname      =
playbackrate    =       0
rendercolor     =       255 255 255 255
renderfx        =       0
rendermode      =       0
sequence        =       0
shadowcastdist  =       0
skin    =       0
spawnflags      =       0
speed   =       0
target  =
texframeindex   =       0
touchStamp      =       0
velocity        =       0.000000 0.000000 0.000000
view_ofs        =       0.000000 0.000000 0.000000
waterlevel      =       0
*/
