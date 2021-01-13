local DbgPrint = GetLogging("EntityTakeDamage")

local banned_npcs = {}
banned_npcs["npc_strider"] = true
banned_npcs["npc_helicopter"] = true
banned_npcs["npc_combinegunship"] = true
banned_npcs["npc_combine_s"] = true
banned_npcs["npc_citizen"] = true
banned_npcs["npc_metropolice"] = true

// Difficulty Scale for Players by Levels
function Hl2c.PlayerDmgScale(ply)
	// HARD
	if difficulty > 10 then
		if ply:GetCLevel() < 6 then
			return 3
		elseif ply:GetCLevel() < 11 then
			return 4
		elseif ply:GetCLevel() < 21 then
			return 5.5
		elseif ply:GetCLevel() < 29 then
			return 8
		else
			return 10
		end
	// NORMAL	
	elseif difficulty > 3 then
		if ply:GetCLevel() < 6 then
			return 1
		elseif ply:GetCLevel() < 11 then
			return 1.5
		elseif ply:GetCLevel() < 21 then
			return 2
		elseif ply:GetCLevel() < 29 then
			return 2.5
		else
			return 3
		end
	//EASY	
	else
		if ply:GetCLevel() < 6 then
			return 0.5
		elseif ply:GetCLevel() < 11 then
			return 0.6
		elseif ply:GetCLevel() < 21 then
			return 0.8
		elseif ply:GetCLevel() < 29 then
			return 1
		else
			return 1
		end
	end
	return 1
end

/*
1 - 5 Hard 300% Normal 100% Easy 50%
6 - 10 Hard 400% N 200% Easy 75%
11 - 20 Hard 700% N 250% Easy 100%
21 - 29 Hard 1000% N 300% Easy 100%
30 Hard 1200% N 300% Easy 100%
no more difficulty
*/

function PlayerDamageTaken_Diff(ent,attacker,dmg)
	if true and ent:IsPlayer() and attacker and attacker:IsNPC() and 
	(attacker and attacker:GetClass() and banned_npcs[attacker:GetClass()] != true ) and 
	(attacker:GetClass() != "npc_headcrab_black" or attacker:GetClass() != "npc_headcrab_poison") and 
	attacker:GetClass() != "npc_hunter"
	then
			
		local scale = 1 
		
		if scale < 0.1 then
		scale = 0.1
		end
		local dmgtaken = Hl2c.PlayerDmgScale(ent) *scale
		dmg:ScaleDamage( dmgtaken )
		dmg:SetDamageForce( dmg:GetDamageForce()/10 )
	elseif ent:IsPlayer() and attacker and !attacker:IsNPC() then
		local scale = 1
		
		if scale < 0.1 then
		scale = 0.1
		end
		local dmgtaken = Hl2c.PlayerDmgScale(ply) * scale
		dmg:ScaleDamage( dmgtaken )
		dmg:SetDamageForce( dmg:GetDamageForce()/10 )
	
	end
	
	
end



function NPCDamageTaken_Diff(ent,attacker,dmg)
	local inflictor = dmg:GetInflictor()
	if ent:IsNPC() and attacker and attacker:IsPlayer() and
	(ent and ent:GetClass() and 
	!banned_npcs[ent:GetClass()])
	then

		local sub = 0
		if attacker and attacker:IsPlayer() then
			sub = attacker:GetNWInt("ISTAT_DMG")
		end
		local dmgtaken = Hl2c.PlayerDmgScale(attacker)
		if dmgtaken < 0.85 then
		dmgtaken = 0.85
		elseif dmgtaken > 60 then
			dmgtaken = 60
		end
		if IsValid(inflictor) and isstring(inflictor:GetClass()) and inflictor:GetClass() == "prop_physics" then
			dmg:ScaleDamage( 1 )
		
		else
			if ent:GetClass() != "npc_sniper" then
			dmg:ScaleDamage( 1/dmgtaken )
			end
		end
		if ent:GetClass() == "npc_sniper" then dmg:ScaleDamage(1) end
	end
	
end

// Called when an entity has received damage	  
hook.Remove("EntityTakeDamage", "hl2cEntityTakeDamage")
hook.Add("EntityTakeDamage", "hl2cEntityTakeDamage", function(ent, dmg)
-- function GM:EntityTakeDamage( ent, dmg )
-- function GM:EntityTakeDamage(ent,dmg) --inflictor, attacker, amount, dmgInfo)
	local ent = ent
	local dmg = dmg
	local dmgtype = dmg:GetDamageType()
	local attacker = dmg:GetAttacker()
	local inflictor = dmg:GetInflictor()
	local atk_mdl = nil
	if IsValid(attacker) then
	atk_mdl = attacker:GetModel()
	end
	local inf_mdl = nil
	if IsValid(inflictor) then
	inf_mdl = inflictor:GetModel()
	end
	
	
	
	-- if SUPER
	if ent and ent:IsPlayer() then ent:SetNWInt("COMBAT.REG",120) end
	if ent and ent:IsPlayer() and attacker and attacker:IsPlayer() and ent:Team() != attacker:Team() then
		-- dmg:SetDamageForce( dmg:GetDamageForce()/1000000 )
		-- print("called?")
	end
	if ent and ent:IsPlayer() and attacker and attacker:IsPlayer() and ent:Team() == attacker:Team() and ent != attacker then
		
		
		return true
	end
	
	if ent and ent:IsPlayer() and inflictor and inflictor:GetClass() and inflictor:GetClass() == "prop_physics" then
		dmg:ScaleDamage(difficulty)
		
		return
	end
	if ent and ent:IsPlayer() and attacker and attacker == ent then
		dmg:ScaleDamage(difficulty)
		return
	end
	if ent and ( ent:IsPlayer() or ent:IsNPC() ) and attacker and attacker:IsNPC() and (attacker:GetClass() == "npc_headcrab_poison" or attacker:GetClass() == "npc_headcrab_black" or (attacker:GetClass() == "npc_antlionguard" and attacker:GetSkin() == 1 ) )then
		dmg:SetDamageType(DMG_POISON)
		-- print("Called?",attacker:GetSkin())
		return false
	end
	if ent and ent:IsPlayer() and attacker and attacker:IsNPC() then
		PlayerDamageTaken_Diff(ent,attacker,dmg)
		
		return
	end
	-- if ent and ent:IsPlayer() and attacker and attacker:GetClass() and attacker:GetClass() == "prop_physics" then
		-- dmg:ScaleDamage(1)
		-- print("CALLED?")
		-- return
	-- end
	NPCDamageTaken_Diff(ent,attacker,dmg)
	
	if ent and ent:IsPlayer() and attacker and attacker:IsPlayer() and 
	( (ent:Team() == TEAM_ALIVE and attacker:Team() == TEAM_DEAD) or 
	(ent:Team() == TEAM_ALIVE and attacker:Team() == TEAM_COMPLETED_MAP) or
	(ent:Team() == TEAM_COMBINE and attacker:Team() == TEAM_COMPLETED_MAP) or
	(ent:Team() == TEAM_COMBINE and attacker:Team() == TEAM_COMBINE_DEAD) ) then
		return true
	end
	
	if ent and ent:IsPlayer() and attacker and attacker:IsVehicle() then
		return true
	end
	
	if SUPER_GRAVITY_GUN == true and ( ent:IsPlayer() or ent:IsNPC() ) then
		dmg:SetDamageType(DMG_DISSOLVE)
		-- DbgPrint("Called DMG_DISSOLVE with SUPER_GRAVITY_GUN FALSE")
	end
	
	
	-- if ent and ( ent:IsPlayer() or ent:IsNPC() ) and attacker and attacker:IsNPC() and (attacker:GetClass() == "npc_antlionguard" and (attacker:GetKeyValues()["cavernbreed"] == "1" or attacker:GetKeyValues()["incavern"] == "1") ) then
		-- dmg:SetDamageType(DMG_POISON)
		-- ent:SetHealth(1)
		-- return false
	-- end
	-- print(ent,attacker,inflictor,dmgtype,atk_mdl,inf_mdl)
	if ent and ent:IsPlayer() and attacker and attacker:IsPlayer() and ent:Team() == attacker:Team() then return true end
	if attacker && attacker:IsValid() && attacker:IsPlayer() then
		if IsValid(attacker) && attacker:InVehicle() && IsValid(attacker:GetVehicle()) && attacker:GetVehicle():GetClass() == "prop_vehicle_airboat" then
			dmg:SetDamage(1)
		elseif IsValid(attacker) && SUPER_GRAVITY_GUN && IsValid(attacker:GetActiveWeapon()) && attacker:GetActiveWeapon():GetClass() == "weapon_physcannon" and !ent:IsPet() then
			dmg:SetDamageType(DMG_DISSOLVE)
			dmg:SetDamage(100)
			
		elseif IsValid(attacker) && 
		!SUPER_GRAVITY_GUN && 
		IsValid(attacker:GetActiveWeapon()) && 
		!ent:IsPet() and 
		ent:IsNPC() and
		attacker:GetActiveWeapon():GetClass() == "weapon_physcannon" and 
		( Hl2c.GravGun_Dmg_List[ent:GetClass()] != true ) 
		then
			dmg:ScaleDamage( 1.1 ) // Damage is now half of what you would normally take.
			
		--elseif IsValid(attacker) && 
		--!SUPER_GRAVITY_GUN && 
		--IsValid(attacker:GetActiveWeapon()) && 
		--isnumber(dmgtype) &&
		--dmgtype == 8388609
		--then
			--dmg:SetDamage(0)
		end
	end
	
	--PrintMessage(HUD_PRINTCONSOLE,"Check DMG on NPC: ".. tostring(dmgtype) .."") 
	if HL2MP_IS_COOP_MAP then
	elseif CD_MAP then
	else
		if ent and IsValid(ent) and 
		ent:GetClass() and isstring(ent:GetClass()) and 
		attacker and IsValid(attacker) and 
		attacker:IsValid() and attacker:GetClass() and 
		isstring( attacker:GetClass() ) and 
		table.HasValue( GODLIKE_NPCS, ent:GetClass()) or 
		( IsValid(attacker) and attacker:GetClass() == "gmod_sent_vehicle_fphysics_base" and 
		table.HasValue( FRIENDLY_NPCS, ent:GetClass() ) ) 
		then
			--dmgInfo:SetDamage(0)
			return true
		end
	end
	if ent:IsPlayer() and attacker:GetClass() == "gmod_sent_vehicle_fphysics_base" then
		return true
	end
	
	if ent:IsPlayer() and inflictor:GetClass() == "gmod_sent_vehicle_fphysics_base" then
		return true
	end
	if ent:IsPet() and attacker:GetClass() == "gmod_sent_vehicle_fphysics_base" then
		return true
	end
	
	if ent:IsPet() and inflictor:GetClass() == "gmod_sent_vehicle_fphysics_base" then
		return true
	end
	--PrintMessage( HUD_PRINTCONSOLE, "--------------------------" )
	--PrintMessage( HUD_PRINTCONSOLE, tostring( attacker ) )
	--PrintMessage( HUD_PRINTCONSOLE, tostring( inflictor ) )
	--PrintMessage( HUD_PRINTCONSOLE, tostring( dmgtype ) )
	--PrintMessage( HUD_PRINTCONSOLE, "--------------------------" )
	/*
	if attacker:GetClass() == "gmod_sent_vehicle_fphysics_base" then
		dmg:SetAttacker(attacker.creator)
		PrintMessage( HUD_PRINTCONSOLE, tostring( dmg:GetAttacker() ) )
		PrintMessage( HUD_PRINTCONSOLE, tostring( dmg:GetInflictor() ) )
	end
	*/
	--print(inflictor)
	
	
	
	if ent && ent:IsValid() && !ent:IsPlayer() && dmg:GetAttacker() && dmg:GetAttacker():IsValid() && dmg:GetAttacker():IsPlayer() && dmg:GetAttacker():Alive() then
		if dmg:GetAttacker():GetActiveWeapon() && dmg:GetAttacker():GetActiveWeapon():IsValid() && dmg:GetAttacker():GetActiveWeapon():GetClass() == "weapon_crowbar" and !ent:IsPet() then
			--dmg:ScaleDamage(0.4)
		elseif dmg:GetAttacker():InVehicle() && dmg:GetAttacker():GetVehicle() && dmg:GetAttacker():GetVehicle():GetClass() == "prop_vehicle_airboat" then
			--dmg:SetDamage(1)
		end
	end
	/*
	if ent:IsNPC() and ent:IsValid() and dmgInfo:GetAttacker():IsPlayer() then
		print("Victim: "..ent:GetClass().." took dmg: "..dmgInfo:GetDamage().." attacker: "..dmgInfo:GetAttacker().."")
	end
	*/
	
	
-- end	
	-- print(dmg:GetDamageForce())
end)



function hl2c_EntDmg( victim, dmg )
	local attacker = dmg:GetAttacker()
	if !IsValid(victim) then return end
	if !IsValid(attacker) then return end
	if IsValid(victim) and
	IsValid(attacker) and
	victim:IsNPC() and
	!victim:IsPet() and
	attacker:IsPlayer() and
	TARGETBAR_NPC_LIST[victim:GetClass()]
	then
		-- print(1 + ( attacker:GetOwner():Pet_GetLevel() / 10 ))
		attacker["TargetBar"] = attacker["TargetBar"] or {}
		victim["PlayerAttackMe"] = victim["PlayerAttackMe"] or {}
		victim["PlayerAttackMe"][attacker] = true
		attacker["TargetBar"][victim:EntIndex()] = true
		net.Start("Hl2c.TargetBar.OnHit")
			net.WriteInt( victim:EntIndex(),10 )
			net.WriteInt( victim:Health(),15 )
			net.WriteInt( victim:GetMaxHealth(),15 )
			net.WriteString( victim:GetClass() )
			net.WriteDouble(CurTime())
		net.Send(attacker)
		-- umsg.Start("Hl2c.OnHit.NPC.Open",attacker)
			-- umsg.Short( victim:EntIndex() )
			-- umsg.Short( victim:Health() )
			-- umsg.Short( victim:GetMaxHealth() )
			-- umsg.String( victim:GetClass() )
			-- umsg.Long( CurTime() )
		-- umsg.End()
	end

	if attacker and attacker:IsPlayer() and attacker:Team() == TEAM_COMBINE and victim and table.HasValue(GODLIKE_CD,victim:GetClass()) then
		return true
	end

	if HL2MP_IS_COOP_MAP then
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODDLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():IsPlayer() then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODDLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "worldspawn" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODDLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_jeep" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODDLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_airboat" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODDLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_jeep_old" then
			dmg:SetDamage(0)
		end
	--end
	elseif CD_MAP then
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_CD,victim:GetClass()) ) and dmg:GetAttacker():IsPlayer() then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_CD,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "worldspawn" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_CD,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_jeep" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_CD,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_airboat" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_CD,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_jeep_old" then
			dmg:SetDamage(0)
		end
	else
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():IsPlayer() then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "worldspawn" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_jeep" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_airboat" then
			dmg:SetDamage(0)
		end
		
		if victim:IsNPC() and victim:IsValid() and ( table.HasValue(GODLIKE_NPCS,victim:GetClass()) or table.HasValue(FRIENDLY_NPCS,victim:GetClass()) ) and dmg:GetAttacker():GetClass() == "prop_vehicle_jeep_old" then
			dmg:SetDamage(0)
		end
		-- return false
	end

	/*
	if ( victim:IsNPC() ) and victim:IsValid() then --and victim:GetClass() == "npc_alyx" then
		--print("Alyx dmg took: "..dmg:GetDamage().."")
		print("[hl2c] Damage Scanner\n\tVictim: "..victim:GetClass().." \n\tDmg Took: "..dmg:GetDamage().."  \n\tDmg Type: "..dmg:GetDamageType().." \n\tAttacker: "..dmg:GetAttacker():GetClass().."")
		
	elseif ( victim:IsPlayer() and victim:Alive() ) and victim:IsValid() then --and victim:GetClass() == "npc_alyx" then
		
		--print("[hl2c] Damage Scanner\n\tVictim: "..victim:GetClass().." \n\tDmg Took: "..dmg:GetDamage().."  \n\tDmg Type: "..dmg:GetDamageType().." \n\tAttacker: "..dmg:GetAttacker():GetClass().."")
		print("[hl2c] HitGroupScanner\n\tVictim: "..victim:LastHitGroup().." \n")
		
	end
	*/
end
hook.Remove("EntityTakeDamage", "hl2c_EntityTakeDamage")
hook.Add("EntityTakeDamage", "hl2c_EntityTakeDamage", hl2c_EntDmg)

hook.Remove("EntityTakeDamage", "Mod_EntityTakeDamage")
hook.Add("EntityTakeDamage", "Mod_EntityTakeDamage", function(ent, dmg)
	if IsValid(ent) and
		ent:IsNPC() and
		IsValid(dmg:GetAttacker()) and
		IsValid(dmg:GetInflictor()) and
		dmg:GetAttacker():IsPlayer() and
		ent.input_kill != 1
		then
			if ent:GetClass() == "npc_combinegunship" and ent:Health() > 0 then
				ent.LastAttacker = dmg:GetAttacker()
				ent.LastInflictor = dmg:GetInflictor()
				
			else
				ent.LastAttacker = dmg:GetAttacker()
				ent.LastInflictor = dmg:GetInflictor()
				ent.LastDamage = dmg
			end
			
			--ent.LastAttacker = dmg:GetAttacker()
			--ent.LastInflictor = dmg:GetInflictor()
			
			
			--print("---------------------------------------------------")
			--print("[hl2c] Damage Scanner: ")
		if ent:GetName() != nil then
			--print("","Class: "..ent:GetClass().." Name: "..ent:GetName())
		else
			--print("","Class: "..ent:GetClass())
		end
		--print("","Attacker: "..dmg:GetAttacker():Nick())
		--if IsValid(dmg:GetInflictor():GetClass()) then
		--print("","Damage Type: "..dmg:GetInflictor():GetClass())
		--else
		--end
		--print("---------------------------------------------------")
		
	end
	
	if IsValid(ent) and
	ent:IsPlayer() and
	IsValid(dmg:GetAttacker()) and
	isstring(dmg:GetAttacker():GetClass()) and
	dmg:GetAttacker():GetClass() == "npc_rollermine" and
	dmg:GetDamageType() == 1 
	then
		dmg:SetDamage(0)
	end
	
	if IsValid(ent) and
	ent:IsPlayer() and
	IsValid(dmg:GetAttacker()) and
	isstring(dmg:GetAttacker():GetClass()) and
	dmg:GetAttacker():GetClass() == "npc_manhack" and
	dmg:GetDamageType() == 1 
	then
		dmg:SetDamage(0)
	end
	
	if IsValid(ent) and
	ent:IsPlayer() and
	IsValid(dmg:GetAttacker()) and
	isstring(dmg:GetAttacker():GetClass()) and
	dmg:GetAttacker():GetClass() == "npc_cscanner" and
	dmg:GetDamageType() == 1 
	then
		dmg:SetDamage(0)
	end
	
	if IsValid(ent) and
	ent:IsPlayer() and
	IsValid(dmg:GetAttacker()) and
	isstring(dmg:GetAttacker():GetClass()) and
	dmg:GetAttacker():GetClass() == "npc_turret_ceiling" and
	dmg:GetDamageType() == 1 
	then
		dmg:SetDamage(0)
	end
	
	if IsValid(ent) and
	ent:IsPlayer() and
	IsValid(dmg:GetAttacker()) and
	isstring(dmg:GetAttacker():GetClass()) and
	dmg:GetAttacker():GetClass() == "npc_turret_floor" and
	dmg:GetDamageType() == 1 
	then
		dmg:SetDamage(0)
	end
	
	if IsValid(ent) and
	ent:IsPlayer() and
	IsValid(dmg:GetAttacker()) and
	isstring(dmg:GetAttacker():GetClass()) and
	dmg:GetAttacker():GetClass() == "npc_turret_ground" and
	dmg:GetDamageType() == 1 
	then
		dmg:SetDamage(0)
	end
	
	if IsValid(ent) and
	ent:IsPlayer() and
	IsValid(dmg:GetAttacker()) and
	isstring(dmg:GetAttacker():GetClass()) and
	dmg:GetAttacker().hasowner == true
	then
		dmg:SetDamage(0)
	end
	
	if IsValid(ent) and
	ent.hasowner == true and
	IsValid(dmg:GetAttacker()) and
	dmg:GetAttacker():IsPlayer()
	then
		dmg:SetDamage(0)
	end
	
	
end)