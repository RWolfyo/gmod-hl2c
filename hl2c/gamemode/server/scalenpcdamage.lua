
// Called every time a player does damage to an npc
hook.Add("ScaleNPCDamage", "hl2cScaleNPCDamage", function(npc, hitGroup, dmgInfo)
--function GM:ScaleNPCDamage(npc, hitGroup, dmgInfo)
	local attacker = dmgInfo:GetAttacker()
	local inflictor = dmgInfo:GetInflictor()
	--local dmgtype = dmginfo:GetDamageType()
	
	OnHit_XP(npc,hitGroup,dmgInfo)
	
	
	
	// If a friendly/godlike npc do no damage
	if HL2MP_IS_COOP_MAP then
	elseif CD_MAP then
	else
		if table.HasValue(GODLIKE_NPCS, npc:GetClass()) || (attacker:IsPlayer() && table.HasValue(FRIENDLY_NPCS, npc:GetClass())) then
			dmgInfo:SetDamage(0)
			return true
		end
		
		if table.HasValue(GODLIKE_NPCS, npc:GetClass()) || ( inflictor:GetClass() == "gmod_sent_vehicle_fphysics_base" && table.HasValue(FRIENDLY_NPCS, npc:GetClass())) then
			dmgInfo:SetDamage(0)
			return true
		end
	end
	--if (true) then
	--PrintMessage(HUD_PRINTCONSOLE,"Check DMG on NPC: ".. tostring(dmginfo:GetDamageType()) .."") 
	--end
	// Fix airboat doing no damage/gravity gun punt should kill NPC's
	
	
	// Where are we hitting?
	if hitGroup == HITGROUP_HEAD then
		hitGroupScale = 2.4
	else
		hitGroupScale = 1
	end
	
	// Calculate the damage
	--if !HL2MP_IS_COOP_MAP then
	if npc and npc:GetClass() == "npc_helicopter" then
		dmgInfo:ScaleDamage(1.5)
	elseif npc and npc:GetClass() == "npc_combinegunship" then
		dmgInfo:ScaleDamage(1.5)
	elseif npc and npc:GetClass() == "npc_strider" then
		dmgInfo:ScaleDamage(hitGroupScale / 2)
	elseif npc and npc:GetClass() == "npc_sniper" then
		dmgInfo:ScaleDamage(1)
	elseif npc and npc:GetClass() and (npc:GetClass() == "npc_metropolice" or npc:GetClass() == "npc_combine_s" or npc:GetClass() == "npc_citizen") 
	then
		local sub = 0
		if attacker and attacker:IsPlayer() then
			sub = attacker:GetNWInt("ISTAT_DMG")
		end
		local dmgtaken = difficulty - sub
		if dmgtaken < 0.85 then
		dmgtaken = 0.85
		elseif dmgtaken > 20 then
			dmgtaken = 20
		end
		if inflictor and inflictor:GetClass() == "prop_physics" then
			dmgInfo:ScaleDamage( 1 )
		
		else
			dmgInfo:ScaleDamage( hitGroupScale / dmgtaken )
		end
		
		
	
	end
	--end
--end
end)