include("auth.lua")
include("disconnect.lua")
include("dodeath.lua")
include("firstspawn.lua")
include("hat.lua")
include("inventory.lua")
include("loadout.lua")
include("meta.lua")
include("model.lua")
include("move.lua")
include("noclip.lua")
include("pickupitem.lua")
include("pickupweapon.lua")
include("playerdeath.lua")
include("scaleplayerdamage.lua")
include("selectspawn.lua")
include("spawn.lua")
include("spectate.lua")
include("suicide.lua")
include("switchflashlight.lua")
include("use.lua")
include("voice.lua")

function GePrimaryAmmoForWeapon( ply, weapon )
	if ( !IsValid( ply ) ) then return -1 end
	-- local wep = ply:GetActiveWeapon()
	if ( !IsValid( weapon ) ) then return -1 end
	if weapon:GetPrimaryAmmoType() < 1 then return -1 end
	return weapon:GetPrimaryAmmoType()
end
function GeSecondaryAmmoForWeapon( ply, weapon )
	if ( !IsValid( ply ) ) then return -1 end
	-- local wep = ply:GetActiveWeapon()
	if ( !IsValid( weapon ) ) then return -1 end
	if weapon:GetSecondaryAmmoType() < 1 then return -1 end
	return weapon:GetSecondaryAmmoType()
end


hook.Add( "KeyPress", "keypress_use_hi", function( ply, key )
	if DEV_MODE != true then return end
	if (true) then return end
	if ( key == IN_USE ) then
		local tr = util.GetPlayerTrace( ply )
		local trace = util.TraceLine( tr )
		local target = trace.Entity 
		--local hit = ply:GetEyeTrace().HitPos
		if IsValid(target) and 
		isstring(target:GetClass()) and
		ply:GetPos():Distance(target:GetPos()) < 60 and
		target:GetClass() == "npc_citizen"
		--NPC_USE_FOLLOW_SYSTEM == true
		then
			
			if !target:Hl2c_IsFollow() then
				Hl2c.Use_StartFollow(ply, target)
			elseif target:Hl2c_IsFollow() and
			target:Hl2c_GetFollowTarget() == ply
			then
				Hl2c.Use_StopFollow(ply, target)
			end
		end
	end
end )

function Hl2c.Use_StartFollow(ply, target)
	target:ClearSchedule()
	target:StopMoving()
	target:Hl2c_SetFollow(ply)
end

function Hl2c.Use_StopFollow(ply, target)
	target:Hl2c_StopFollow()
	target:ClearSchedule()
	target:StopMoving()
end

hook.Add("Think", "Use_Follow_Think", function()
	
	for _, npc in pairs(ents.FindByClass("npc_*")) do
		if npc:Hl2c_IsFollow() then
			if IsValid( npc ) and 
			npc:Hl2c_IsFollow() and 
			!IsValid( npc:Hl2c_GetFollowTarget() ) 
			then
				npc:Hl2c_StopFollow()
			end
			
			if IsValid( npc ) and 
			npc:Hl2c_IsFollow() and 
			IsValid( npc:Hl2c_GetFollowTarget() ) and
			npc:Hl2c_GetFollowTarget():Team() != 1 
			then
				npc:Hl2c_StopFollow()
			end
			
			if IsValid( npc ) and IsValid( npc:Hl2c_GetFollowTarget() ) and
			!npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN) and 
			npc:GetPos():Distance( npc:Hl2c_GetFollowTarget():GetPos() ) > 100 then
				
				npc:SetLastPosition( npc:Hl2c_GetFollowTarget():GetPos() )
				npc:SetSchedule(SCHED_FORCED_GO_RUN)
				
			end
			
			if IsValid( npc ) and IsValid( npc:Hl2c_GetFollowTarget() ) and
			npc:GetPos():Distance( npc:Hl2c_GetFollowTarget():GetPos() ) < 101
			then
				
				if npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
					npc:ClearSchedule()
					npc:StopMoving()
				end
				
			end
			
		end
	end
	
end)



/*
if IsValid(v) and IsValid(v.owner) and v.follow_on == true and
					v:GetPos():Distance(v.owner:GetPos()) > 50
					then
						if !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then v:SetSchedule(SCHED_FORCED_GO_RUN) end
						v:SetLastPosition( v.owner:GetPos() )
					end
					
					if IsValid(v) and IsValid(v.owner) and v.follow_on == true and
					v:GetPos():Distance(v.owner:GetPos()) < 51
					then
						if v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
						v:ClearSchedule()
						v:StopMoving()
						end
						v.stopfollow = true
						v.follow_on = false
						v.follow = false
						Hl2c.PetFollowOnwer( v, v.owner )
						
					end
*/