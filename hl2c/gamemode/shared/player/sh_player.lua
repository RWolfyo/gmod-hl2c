include("xp/sh_init.lua")
include("sh_appear.lua")
include("vortex/sh_init.lua")
include("achievement/sh_init.lua")
//////////////////////////////////////////////////////
// 		Finds the player meta table or terminates	//
//////////////////////////////////////////////////////
local meta = FindMetaTable("Player")
if !meta then return end



--[[
--------------------------------
Checkout last Checkpoint Vector
Desc:	It will give us back
		a value of vector
		which will return
		the current vector
		Also other function
		to set vector
--------------------------------
]]
function meta:GetLastCP()
	if isvector(self:GetNWVector("lastcp")) then
		return self:GetNWVector("lastcp")
	else
		return false
	end
end

function meta:GetHeadModel()
	if isstring(self:GetNWString( "Head_Model" )) and HL2C_ALL_PLAYER_MODELS[self:GetNWString( "Head_Model" )] == true then
		return self:GetNWString( "Head_Model" )
	else
		return false
	end
end
function meta:GetSuitModel()
	if isstring(self:GetNWString( "Suit_Model" )) and HL2C_ALL_PLAYER_MODELS[self:GetNWString( "Suit_Model" )] == true then
		return self:GetNWString( "Suit_Model" )
	else
		return false
	end
end



//////////////////////////////////////////////////////
// 			Player Control Setup & Counters			//
//////////////////////////////////////////////////////
function meta:GetCounter(id)
	return self:GetNWInt("customcounter_"..tostring(id))
end

function meta:GetSetup(id)
	return self:GetNWInt("customsetup_"..tostring(id))
end

function meta:GetPlan(id)
	return self:GetNWInt("customplan_"..tostring(id))
end


function meta:GetAllEP2Ach()
	local count = 0
	for i=1,#Hl2c.EP2_ACH_LIST do
		if self:GetNWInt(Hl2c.EP2_ACH_LIST[i]) == 1 then
			count = count + 1
		end
	end
	if count > 22 then
		count = count - 1
	end
	return count
end
function meta:GetAllEP1Ach()
	local count = 0
	for i=1,#Hl2c.EP1_ACH_LIST do
		if self:GetNWInt(Hl2c.EP1_ACH_LIST[i]) == 1 then
			count = count + 1
		end
	end
	if count >= 12 then
		count = count - 1
	end
	return count
end

function meta:GetAllHL2Ach()
	local count = 0
	for i=1,#Hl2c.HL2_ACH_LIST do
		if self:GetNWInt(Hl2c.HL2_ACH_LIST[i]) == 1 then
			count = count + 1
		end
	end
	if count >= #Hl2c.HL2_ACH_LIST then
		-- count = count - 1
	end
	return count
end

function meta:GetAllLambdaCache()
	local count = 0
	for i=1,#Hl2c.HL2_LAMBDA_LIST do
		if self:GetNWInt(Hl2c.HL2_LAMBDA_LIST[i]) == 1 then
			count = count + 1
		end
	end
	return count
end

function meta:GetAllRadarCache()
	local count = 0
	for i=1,#Hl2c.EP2_RADARCACHE_LIST do
		if self:GetNWInt(Hl2c.EP2_RADARCACHE_LIST[i]) == 1 then
			count = count + 1
		end
	end
	return count
end

function meta:GetAllWebCache()
	local count = 0
	for i=1,#Hl2c.EP2_WEBCACHE_LIST do
		if self:GetNWInt(Hl2c.EP2_WEBCACHE_LIST[i]) == 1 then
			count = count + 1
		end
	end
	return count
end


function meta:GetVortexNum()
	local count = 0
	for i=1,#Hl2c.VORTEX_EP1_LIST do
		if self:GetNWInt(Hl2c.VORTEX_EP1_LIST[i]) == 1 then
			count = count + 1
		end
	end
	for i=1,#Hl2c.VORTEX_EP2_LIST do
		if self:GetNWInt(Hl2c.VORTEX_EP2_LIST[i]) == 1 then
			count = count + 1
		end
	end
	for i=1,#Hl2c.VORTEX_HL2_LIST do
		if self:GetNWInt(Hl2c.VORTEX_HL2_LIST[i]) == 1 then
			count = count + 1
		end
	end
	for i=1,#Hl2c.VORTEX_CD_LIST do
		if self:GetNWInt(Hl2c.VORTEX_CD_LIST[i]) == 1 then
			count = count + 1
		end
	end
	for i=1,#Hl2c.VORTEX_EP3_LIST do
		if self:GetNWInt(Hl2c.VORTEX_EP3_LIST[i]) == 1 then
			count = count + 1
		end
	end
	for i=1,#Hl2c.VORTEX_LT_LIST do
		if self:GetNWInt(Hl2c.VORTEX_LT_LIST[i]) == 1 then
			count = count + 1
		end
	end
	--print("YOUR ALL VORTEX = "..count)
	if not isnumber(count) then return 0 end
	if count < 0 then return 0 end
	return tonumber(count)
end

function meta:GetInventoryMaxSize()
	return self:GetNWInt("INV.MAXSIZE")
end
function meta:GetInventoryUsedSize()
	return self:GetNWInt("INV.USEDSIZE")
end




//////////////////////////////////////////////////////
// 				Setup ThirdPerson Mode				//
//////////////////////////////////////////////////////

/*
local function Hl2c_TPMODE( ply, pos, angles, fov )
	if (false) then return end
	local view = {}

	view.origin = pos-( angles:Forward()*100 )
	view.angles = angles
	view.fov = fov
	view.drawviewer = true

	return view
end

hook.Add( "CalcView", "Hl2c_TPMODE", Hl2c_TPMODE )
*/


--Thirdperson for ULX working 16 Aug 2014
if ( CLIENT ) then

local on = false 

local function toggle()

	on = !on

	if on == true then

		--print( 'enabled' )
		
		LocalPlayer():PrintMessage( HUD_PRINTTALK, "[hl2c] Third person mode enabled." )

	else

		--print( 'disabled')
		
		LocalPlayer():PrintMessage( HUD_PRINTTALK, "[hl2c] Third person mode disabled." )

	end

end


hook.Add( "ShouldDrawLocalPlayer", "ThirdPersonDrawPlayer", function()

	if on and LocalPlayer():Alive() and ( LocalPlayer():Team() == TEAM_ALIVE or LocalPlayer():Team() == TEAM_COMBINE ) then

		return true

	end

end )

hook.Add( "CalcView", "ThirdPersonView", function( ply, pos, angles, fov )

	if on and ply:Alive() and ( ply:Team() == TEAM_ALIVE or ply:Team() == TEAM_COMBINE ) and ply:Crouching() then

		local view = {}
		view.origin = pos - ( angles:Forward() * 50 ) + ( angles:Right() * -20 ) + ( angles:Up() * 20 )
		view.angles = ply:EyeAngles() + Angle( 1, -1, 0 )
		view.fov = fov

		return GAMEMODE:CalcView( ply, view.origin, view.angles, view.fov )

	elseif on and ply:Alive() and ( ply:Team() == TEAM_ALIVE or ply:Team() == TEAM_COMBINE ) then

		local view = {}
		view.origin = pos - ( angles:Forward() * 50 ) + ( angles:Right() * -20 ) + ( angles:Up() * 5 )
		view.angles = ply:EyeAngles() + Angle( 1, -1, 0 )
		view.fov = fov

		return GAMEMODE:CalcView( ply, view.origin, view.angles, view.fov )

	end

end )

concommand.Add( "thirdperson_toggle", toggle )

end

/*
if ( SERVER ) then

function ulx.thirdperson( calling_ply )

	calling_ply:SendLua([[RunConsoleCommand("thirdperson_toggle")]])	

end
local thirdperson = ulx.command( "Utility", "ulx thirdperson", ulx.thirdperson, {"!thirdperson", "!3p"}, true )
thirdperson:defaultAccess( ULib.ACCESS_ALL )
thirdperson:help( "Toggles third person mode" )

end



NPC npc_headcrab stuck in wall--level design error at (-63.29 -190.20 -12223.97)
NPC npc_headcrab stuck in wall--level design error at (-63.29 -190.20 -12223.97)
NPC npc_headcrab stuck in wall--level design error at (-63.29 -190.20 -12223.97)
NPC npc_headcrab stuck in wall--level design error at (-63.29 -190.20 -12223.97)
NPC npc_headcrab stuck in wall--level design error at (-63.29 -190.20 -12223.97)
NPC npc_headcrab stuck in wall--level design error at (-63.29 -190.20 -12223.97)
NPC npc_headcrab stuck in wall--level design error at (-63.29 -190.20 -12223.97)
CUtlRBTree overflow!
*/
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////
//////////////////////////////////////////////////////