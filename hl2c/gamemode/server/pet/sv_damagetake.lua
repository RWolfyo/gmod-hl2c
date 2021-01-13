hook.Add("EntityTakeDamage", "Hl2c_Pet_EntTakeDmg", function( ent, dmg )
	dmgtype = dmg:GetDamageType()
	attacker = dmg:GetAttacker()
	inflictor = dmg:GetInflictor()
	
	

	
	if IsValid(ent) and
	IsValid(attacker) and
	ent:IsNPC() and
	!ent:IsPet() and
	attacker:IsPet() and
	IsValid(attacker:GetOwner())
	then
		-- print(1 + ( attacker:GetOwner():Pet_GetLevel() / 10 ))
		if attacker:GetOwner():Pet_GetLevel() != nil then 
			dmg:ScaleDamage( 1 + ( attacker:GetOwner():Pet_GetLevel() / 10 ) )
		else
			dmg:ScaleDamage( 1 )
		end
	end
	if IsValid(ent) and
	IsValid(attacker) and
	isstring(attacker:GetClass()) and
	attacker:GetClass() == "npc_antlion" and
	ent:IsPet() and
	!attacker:IsPet()
	then
		--print("SET DAMAGE TO 10")
		dmg:SetDamage(7)
	end
	
	if IsValid(ent) and
	IsValid(attacker) and
	isstring(attacker:GetClass()) and
	attacker:GetClass() == "npc_hunter" and
	ent:IsPet() and
	!attacker:IsPet()
	then
		--print("Called")
		--print("SET DAMAGE TO 10")
		--return false
	end
	
	if IsValid(ent) and
	IsValid(attacker) and
	isstring(attacker:GetClass()) and
	attacker:GetClass() == "npc_antlionguard" and
	ent:IsPet()
	then
		--print("SET DAMAGE TO 80")
		dmg:SetDamage(30)
	end
	
	if IsValid(ent) and
	IsValid(attacker) and
	ent == attacker and
	ent:IsPet() --and
	--!attacker:IsPet()
	then
		--print("SET DAMAGE TO 80")
		return true
	end
	
	if IsValid(ent) and
	IsValid(attacker) and
	ent:IsPet() and
	attacker:IsPet()
	then
		--print("SET DAMAGE TO 80")
		return true
	end
	
	if IsValid(ent) and
	IsValid(attacker) and
	attacker:IsPlayer() and
	attacker:Team() != TEAM_COMBINE and
	ent:IsPet()
	then
		--print("NO DAMAGE TAKE TO PET BY PLAYER")
		--print("SET DAMAGE TO 10")
		return true
	end
	if HL2MP_IS_COOP_MAP then
	elseif CD_MAP then 
		if IsValid(ent) and 
		table.HasValue( GODLIKE_CD, ent:GetClass() ) and
		IsValid(attacker) and
		attacker:IsPet()
		then
			return true
		end
	else
		if IsValid(ent) and 
		table.HasValue( FRIENDLY_NPCS, ent:GetClass() ) and
		IsValid(attacker) and
		attacker:IsPet()
		then
			return true
		end
		
		if IsValid(ent) and 
		table.HasValue( GODLIKE_NPCS, ent:GetClass() ) and
		IsValid(attacker) and
		attacker:IsPet()
		then
			return true
		end
	
	end
end)