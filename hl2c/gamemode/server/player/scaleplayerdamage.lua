local banned_npcs = {}
banned_npcs["npc_strider"] = true
banned_npcs["npc_helicopter"] = true
banned_npcs["npc_combinegunship"] = true
banned_npcs["npc_combine_s"] = true
banned_npcs["npc_hunter"] = true
banned_npcs["npc_citizen"] = true
banned_npcs["npc_metropolice"] = true
banned_npcs["prop_physics"] = true

// Scale the damage based on being shot in a hitbox 
hook.Remove("ScalePlayerDamage", "hl2cScalePlayerDamage")
hook.Add("ScalePlayerDamage", "hl2cScalePlayerDamage", function(pl, hitGroup, dmgInfo)
--function GM:ScalePlayerDamage(pl, hitGroup, dmgInfo)

	local attacker = dmgInfo:GetAttacker()
	local inflictor = dmgInfo:GetInflictor()
	pl:SetNWInt("COMBAT.REG",120)

	if hitGroup == HITGROUP_HEAD then
		hitGroupScale = 2
	else
		hitGroupScale = 1
	end
	
	local attacker = dmgInfo:GetAttacker()
	if attacker:IsPlayer() and pl:Team() == TEAM_ALIVE and attacker:Team() == TEAM_COMBINE then
		if pl:GetMaxHealth()>25000 then
			dmgInfo:SetDamage(55*hitGroupScale * dmgInfo:GetDamage())
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
			pl:SetVelocity(Vector(0,0,0))
			return
		elseif pl:GetMaxHealth()>18000 then
			-- dmgInfo:ScaleDamage(45*hitGroupScale)
			dmgInfo:SetDamage(45*hitGroupScale * dmgInfo:GetDamage())
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
			pl:SetVelocity(Vector(0,-1,-1000))
			return
		elseif pl:GetMaxHealth()>12000 then
			-- dmgInfo:ScaleDamage(20*hitGroupScale)
			dmgInfo:SetDamage((20*hitGroupScale) * dmgInfo:GetDamage())
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
			pl:SetVelocity(Vector(0,0,0))
			return
		elseif pl:GetMaxHealth()>5000 then
			-- dmgInfo:ScaleDamage(5*hitGroupScale)
			dmgInfo:SetDamage((5*hitGroupScale) * dmgInfo:GetDamage())
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
			pl:SetVelocity(Vector(0,0,0))
			return
		elseif pl:GetMaxHealth()>1500 then
			-- dmgInfo:ScaleDamage(3*hitGroupScale)
			dmgInfo:SetDamage((3*hitGroupScale) * dmgInfo:GetDamage())
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
			pl:SetVelocity(Vector(0,0,0))
			return
		elseif pl:GetMaxHealth() > 700 then
			-- dmgInfo:ScaleDamage(2.5*hitGroupScale)
			dmgInfo:SetDamage((2.5*hitGroupScale) * dmgInfo:GetDamage())
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
			pl:SetVelocity(Vector(0,0,0))
			return
		else
			-- dmgInfo:ScaleDamage(1.2*hitGroupScale)
			dmgInfo:SetDamage((1.2*hitGroupScale) * dmgInfo:GetDamage())
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
			pl:SetVelocity(Vector(0,0,0))
			return
		end
			-- dmgInfo:SetDamageForce(Vector(0,0,-198) )
			
			-- print( dmgInfo:GetDamageForce() )
		
	end
	if attacker:IsPlayer() and pl:Team() == TEAM_COMBINE and attacker:Team() == TEAM_ALIVE then
		dmgInfo:ScaleDamage(0.5)
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/100 )
		return
	end
	
	-- if attacker:IsNPC() then else return end
	// Calculate the damage

	-- if pl:GetModel() == "models/player/gordon_hev.mdl" then
		
		-- dmgInfo:ScaleDamage( ( ( hitGroupScale * difficulty ) * 60 ) / 100)
		-- return
	-- elseif PLAYER_MODELS_COMBINE_SUIT[pl:GetModel()] then 
		-- if pl:GetModel() == "models/player/combine_soldier.mdl" then
			-- dmgInfo:ScaleDamage( ( ( hitGroupScale * difficulty ) * 20 ) / 100)
			-- return
		-- elseif pl:GetModel() == "models/player/combine_soldier_prisonguard.mdl" then
			-- dmgInfo:ScaleDamage( ( ( hitGroupScale * difficulty ) * 20 ) / 100)
			-- return
		-- elseif pl:GetModel() == "models/player/combine_super_soldier.mdl" then
			-- dmgInfo:ScaleDamage( ( ( hitGroupScale * difficulty ) * 30 ) / 100)
			-- return
		-- elseif pl:GetModel() == "models/shotgun_soldier.mdl" then
			-- dmgInfo:ScaleDamage( ( ( hitGroupScale * difficulty ) * 20 ) / 100)
			-- return
		-- else
			-- dmgInfo:ScaleDamage( ( ( hitGroupScale * difficulty ) * 10 ) / 100)
			-- return
		-- end
	-- else
	
	if ( attacker and banned_npcs[attacker:GetClass()] ) or ( inflictor and banned_npcs[inflictor:GetClass()] ) then
		
		local scale = 1
		scale = ( 1 - (pl:GetNWInt("ISTAT_ABSORB") / 100) ) 
		if scale < 0.1 then
		scale = 0.1
		end
		-- local dmgtaken = (difficulty * scale) * hitGroupScale
		local dmgtaken = (Hl2c.PlayerDmgScale(pl)* scale) * hitGroupScale
		-- print(dmgtaken,dmgInfo:GetDamage())
		
		if inflictor:GetClass() == "prop_physics" then
			-- dmgInfo:ScaleDamage( difficulty  )
			-- print("Called?",attacker,inflictor,dmgtaken)
		else
			dmgInfo:SetDamage( dmgtaken * dmgInfo:GetDamage() )
			dmgInfo:SetDamageForce( dmgInfo:GetDamageForce()/10 )
		end
		
		-- print(dmgtaken,dmgInfo:GetDamageForce())
		-- return
	-- end
	end
--end 
end)