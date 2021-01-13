// Down here is where you can use score points to get abilities
--[[
function BuyInvisibility(pl)
	if pl:IsAdmin()&&!pl.abilityInUse then
		pl.abilityInUse = true
		pl.abilityInvis = true
		net.Start("AbilityBought")
			net.WriteString("Invisibility")
		net.Send(pl)
		pl:EmitSound("items/suitchargeok1.wav", 75, 100, 1, CHAN_STATIC)
		GAMEMODE:SetPlayerSpeed(pl, 140, 140)
		pl:SetMaterial("models/spawn_effect")
		pl:SetNoTarget(true)
	elseif !pl.abilityInUse then
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 15 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		elseif pl.abilityEnergy < 100 then
			pl:PrintMessage(HUD_PRINTTALK, "Please wait until your Ability Energy is charged.")
			return
		end
		
		pl:SetFrags(pl:Frags() - 15)
		
		pl.abilityInUse = true
		pl.abilityInvis = true
		net.Start("AbilityBought")
			net.WriteString("Invisibility")
		net.Send(pl)
		pl:EmitSound("items/suitchargeok1.wav", 75, 100, 1, CHAN_STATIC)
		GAMEMODE:SetPlayerSpeed(pl, 140, 140)
		pl:SetMaterial("models/spawn_effect")
		pl:SetNoTarget(true)
	elseif pl.abilityInUse then
		pl:PrintMessage(HUD_PRINTTALK, "Ability still in use, please wait.")
	end
end

function StopInvisibility(pl)
	if pl.abilityInUse then
		pl.abilityInUse = false
		pl.abilityInvis = false
		pl:PrintMessage(HUD_PRINTTALK, "Ability wore off.")
		pl:EmitSound("items/suitchargeno1.wav", 75, 100, 1, CHAN_STATIC)
		GAMEMODE:SetPlayerSpeed(pl, 190, 320)
		pl:SetMaterial("")
		pl:SetNoTarget(false)
	end
end
concommand.Add("hl2c_buy_invisibility", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyInvisibility(pl) end end)

--if !DISABLE_CUSTOM_WEAPON then

function BuyAirboatgun(pl)
	if pl:IsAdmin() then
		if !DISABLE_ABG_WEAPON then
		net.Start("AbilityBought")
			net.WriteString("Airboatgun")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_airboatgun_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
		
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 250 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		if !DISABLE_ABG_WEAPON then
		pl:SetFrags(pl:Frags() - 250)
		
		
		net.Start("AbilityBought")
			net.WriteString("Airboatgun")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_airboatgun_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	end
end
concommand.Add("hl2c_buy_airboatgun", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyAirboatgun(pl) end end)

function BuyIoncannon(pl)
	if pl:IsAdmin() then
		if !DISABLE_IONCANNON_WEAPON then
		net.Start("AbilityBought")
			net.WriteString("Ioncannon")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_ioncannon_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 150 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		if !DISABLE_IONCANNON_WEAPON then
		pl:SetFrags(pl:Frags() - 150)
		
		
		net.Start("AbilityBought")
			net.WriteString("Ioncannon")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_ioncannon_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	end
end
concommand.Add("hl2c_buy_ioncannon", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyIoncannon(pl) end end)

function BuyCsniper(pl)
	if pl:IsAdmin() then
		if !DISABLE_CSNIPER_WEAPON then
		net.Start("AbilityBought")
			net.WriteString("Csniper")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_csniper_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 100 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		if !DISABLE_CSNIPER_WEAPON then
		pl:SetFrags(pl:Frags() - 100)
		
		
		net.Start("AbilityBought")
			net.WriteString("Csniper")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_csniper_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	end
end
concommand.Add("hl2c_buy_csniper", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyCsniper(pl) end end)


function BuyGr9(pl)
	if pl:IsAdmin() then
		if !DISABLE_GR9_WEAPON then
		net.Start("AbilityBought")
			net.WriteString("Gr9")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_gr9_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 150 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		if !DISABLE_GR9_WEAPON then
		pl:SetFrags(pl:Frags() - 150)
		
		
		net.Start("AbilityBought")
			net.WriteString("Gr9")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_gr9_hl2c" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
		
	end
end
concommand.Add("hl2c_buy_gr9", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyGr9(pl) end end)

function BuyAlyxGun(pl)
	if pl:IsAdmin() then
		if !PLAYER_IS_CITIZEN then
		net.Start("AbilityBought")
			net.WriteString("AlyxGun")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_bp_alyxgun" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 15 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		if !DISABLE_GR9_WEAPON then
		pl:SetFrags(pl:Frags() - 15)
		
		
		net.Start("AbilityBought")
			net.WriteString("AlyxGun")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_bp_alyxgun" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
		
	end
end
concommand.Add("hl2c_buy_alyxgun", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyAlyxGun(pl) end end)

function BuyMp5k(pl)
	if pl:IsAdmin() then
		if !PLAYER_IS_CITIZEN then
		net.Start("AbilityBought")
			net.WriteString("Mp5k")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_bfg_smg2" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 30 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		if !DISABLE_GR9_WEAPON then
		pl:SetFrags(pl:Frags() - 30)
		
		
		net.Start("AbilityBought")
			net.WriteString("Mp5k")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:Give( "weapon_bfg_smg2" )
		else
		pl:PrintMessage(HUD_PRINTTALK, "Weapon is Disabled")
		end
		
	end
end
concommand.Add("hl2c_buy_mp5k", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyMp5k(pl) end end)
--end

function BuyInvincibility(pl)
	if pl:IsAdmin()&&!pl.abilityInUse then
		pl.abilityInUse = true
		pl.abilityInvinc = true
		net.Start("AbilityBought")
			net.WriteString("Invincibility")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GodEnable()
		
	elseif !pl.abilityInUse then
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 30 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		elseif pl.abilityEnergy < 100 then
			pl:PrintMessage(HUD_PRINTTALK, "Please wait until your Ability Energy is charged.")
			return
		end
		
		pl:SetFrags(pl:Frags() - 30)
		
		pl.abilityInUse = true
		pl.abilityInvinc = true
		net.Start("AbilityBought")
			net.WriteString("Invincibility")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GodEnable()
	elseif pl.abilityInUse then
		pl:PrintMessage(HUD_PRINTTALK, "Ability still in use, please wait.")
	end
end

function StopInvincibility(pl)
	if pl.abilityInUse then
		pl.abilityInUse = false
		pl.abilityInvinc = false
		pl:PrintMessage(HUD_PRINTTALK, "Ability wore off.")
		pl:EmitSound("player/invuln_off_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GodDisable()
	end
end
concommand.Add("hl2c_buy_invincibility", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyInvincibility(pl) end end)


function BuyRespawn(pl)
	if GetConVarNumber("hl2c_classic") >= 1 then
		pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
		return
	elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
	elseif game.SinglePlayer() then
		pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
		return
	elseif GetConVarNumber("hl2c_additions") == 0 then
		pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
		return
	elseif PLAYER_IS_CITIZEN == true then
		pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
		return
	elseif pl:Frags() < 25 then
		pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
		return
	end

	pl:SetFrags(pl:Frags() - 25)

	net.Start("AbilityBought")
		net.WriteString("Respawn")
	net.Send(pl)
	table.RemoveByValue(deadPlayers, pl:UniqueID())
	pl:EmitSound("garrysmod/save_load"..math.random(1, 4)..".wav", 75, 100, 1, CHAN_STATIC)
	
	pl:SetTeam(TEAM_ALIVE)
	pl:UnSpectate()
	pl:Spawn()
	pl:SetNoTarget(false)
	pl:SetPos(pl.deathPosBeta)
end
concommand.Add("hl2c_buy_respawn", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_DEAD) then BuyRespawn(pl) end end)


function BuyScaler(pl)
	if pl:IsAdmin()&&!pl.abilityInUse then
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 99999999999999999999 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		elseif pl.abilityEnergy < 100 then
			pl:PrintMessage(HUD_PRINTTALK, "Please wait until your Ability Energy is charged.")
			return
		end
		
		pl:SetFrags(pl:Frags() - 25)
		
		pl.abilityInUse = true
		pl.abilityScaler = true
		if pl:InVehicle() then
			pl:ExitVehicle()
		end
		net.Start("AbilityBought")
			net.WriteString("Smaller Self")
		net.Send(pl)
		pl:EmitSound("vehicles/tank_readyfire1.wav", 75, 100, 1, CHAN_STATIC)
		if (math.random(1, 10) <= 5) then
			pl:SetModelScale(0.3, 1)
			pl.voicePitch = 150
		else
			pl:SetModelScale(1.6, 1)
			pl:PrintMessage(HUD_PRINTTALK, "Whoops, It malfunctioned!")
			pl.voicePitch = 75
		end
	elseif pl.abilityInUse then
		pl:PrintMessage(HUD_PRINTTALK, "Ability still in use, please wait.")
	end
end

function StopScaler(pl)
	if pl.abilityInUse then
		pl.abilityInUse = false
		pl.abilityScaler = false
		pl.voicePitch = 100
		pl:PrintMessage(HUD_PRINTTALK, "Ability wore off.")
		pl:EmitSound("vehicles/tank_turret_stop1.wav", 75, 100, 1, CHAN_STATIC)
		pl:SetModelScale(1, 1)
	end
end
concommand.Add("hl2c_buy_smallform", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyScaler(pl) end end)

// SUIT Recharge
function BuySuitRecharge(pl)
	if pl:IsAdmin()&&!pl.abilityInUse then
		pl.abilityInUse = true
		pl.abilitySuitCharge = true
		net.Start("AbilityBought")
			net.WriteString("Suit Recharger")
		net.Send(pl)
		pl:EmitSound("items/battery_pickup.wav", 75, 100, 1, CHAN_STATIC)
	elseif !pl.abilityInUse then
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 30 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		elseif pl.abilityEnergy < 100 then
			pl:PrintMessage(HUD_PRINTTALK, "Please wait until your Ability Energy is charged.")
			return
		end
		
		pl:SetFrags(pl:Frags() - 30)
		
		pl.abilityInUse = true
		pl.abilitySuitCharge = true
		net.Start("AbilityBought")
			net.WriteString("Suit Recharger")
		net.Send(pl)
		pl:EmitSound("items/battery_pickup.wav", 75, 100, 1, CHAN_STATIC)
	elseif pl.abilityInUse then
		pl:PrintMessage(HUD_PRINTTALK, "Ability still in use, please wait.")
	end
end

function StopSuitRecharge(pl)
	if pl.abilityInUse then
		pl.abilityInUse = false
		pl.abilitySuitCharge = false
		pl:PrintMessage(HUD_PRINTTALK, "Ability wore off.")
	end
end
concommand.Add("hl2c_buy_suitrecharger", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuySuitRecharge(pl) end end)

//HP RECHARGE
function BuyHPRecharge(pl)
	if pl:IsAdmin()&&!pl.abilityInUse then
		pl.abilityInUse = true
		pl.abilityHPCharge = true
		net.Start("AbilityBought")
			net.WriteString("HP Recharger")
		net.Send(pl)
		pl:EmitSound("items/battery_pickup.wav", 75, 100, 1, CHAN_STATIC)
	elseif !pl.abilityInUse then
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 30 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		elseif pl.abilityEnergy < 100 then
			pl:PrintMessage(HUD_PRINTTALK, "Please wait until your Ability Energy is charged.")
			return
		end
		
		pl:SetFrags(pl:Frags() - 30)
		
		pl.abilityInUse = true
		pl.abilityHPCharge = true
		net.Start("AbilityBought")
			net.WriteString("HP Recharger")
		net.Send(pl)
		pl:EmitSound("items/battery_pickup.wav", 75, 100, 1, CHAN_STATIC)
	elseif pl.abilityInUse then
		pl:PrintMessage(HUD_PRINTTALK, "Ability still in use, please wait.")
	end
end

function StopHPRecharge(pl)
	if pl.abilityInUse then
		pl.abilityInUse = false
		pl.abilityHPCharge = false
		pl:PrintMessage(HUD_PRINTTALK, "Ability wore off.")
	end
end
concommand.Add("hl2c_buy_hprecharger", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyHPRecharge(pl) end end)

-- AMMO SHOP --
function BuyPistolAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("PistolAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 150, "Pistol" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("PistolAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 150, "Pistol" )
		
	end
end
concommand.Add("hl2c_buy_ammo_pistol", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyPistolAmmo(pl) end end)

function Buy357Ammo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("357Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 12, "357" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("357Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 12, "357" )
		
	end
end
concommand.Add("hl2c_buy_ammo_357", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then Buy357Ammo(pl) end end)

function BuySMG1Ammo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("SMG1Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 225, "SMG1" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("SMG1Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 225, "SMG1" )
		
	end
end
concommand.Add("hl2c_buy_ammo_smg", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuySMG1Ammo(pl) end end)

function BuyAR2Ammo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("AR2Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 60, "AR2" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("AR2Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 60, "AR2" )
		
	end
end
concommand.Add("hl2c_buy_ammo_ar2", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyAR2Ammo(pl) end end)

function BuyBuckshotAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("BuckshotAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 30, "Buckshot" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("BuckshotAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 30, "Buckshot" )
		
	end
end
concommand.Add("hl2c_buy_ammo_buckshot", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyBuckshotAmmo(pl) end end)

function BuyXBowBoltAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("XBowBoltAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 10, "XBowBolt" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("XBowBoltAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 10, "XBowBolt" )
		
	end
end
concommand.Add("hl2c_buy_ammo_xbowbolt", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then BuyXBowBoltAmmo(pl) end end)

function Gr9Ammo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("Gr9Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 400, "7x107_AIT-44M" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("Gr9Ammo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 400, "7x107_AIT-44M" )
		
	end
end
concommand.Add("hl2c_buy_ammo_gr9", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then Gr9Ammo(pl) end end)

function CsniperAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("CsniperAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 30, "csniper_ammo" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("CsniperAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 30, "csniper_ammo" )
		
	end
end
concommand.Add("hl2c_buy_ammo_csniper", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then CsniperAmmo(pl) end end)

function pulse_shotgunAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("pulse_shotgunAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 60, "pulse_shotgun" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("pulse_shotgunAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 60, "pulse_shotgun" )
		
	end
end
concommand.Add("hl2c_buy_ammo_pshotgun", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then pulse_shotgunAmmo(pl) end end)
--pulse_shotgun


function bp_smallAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("bp_smallAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 100, "bp_small" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("bp_smallAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 100, "bp_small" )
		
	end
end
concommand.Add("hl2c_buy_ammo_bp_small", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then bp_smallAmmo(pl) end end)
--bp_small

function bp_mediumAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("bp_mediumAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 180, "bp_medium" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("bp_mediumAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 180, "bp_medium" )
		
	end
end
concommand.Add("hl2c_buy_ammo_bp_medium", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then bp_mediumAmmo(pl) end end)

function bp_sniperAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("bp_sniperAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 30, "bp_sniper" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("bp_sniperAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 30, "bp_sniper" )
		
	end
end
concommand.Add("hl2c_buy_ammo_bp_sniper", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then bp_sniperAmmo(pl) end end)

function bfg_shotgunAmmo(pl)
	if pl:IsAdmin() then
		net.Start("AbilityBought")
			net.WriteString("bfg_shotgunAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 12, "bfg_shotgun" )
	else
		if GetConVarNumber("hl2c_classic") >= 1 then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
			return
		elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
			return
		elseif game.SinglePlayer() then
			pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
			return
		elseif GetConVarNumber("hl2c_additions") == 0 then
			pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
			return
		elseif PLAYER_IS_CITIZEN == true then
			pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
			return
		elseif pl:Frags() < 10 then
			pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
			return
		end
		
		pl:SetFrags(pl:Frags() - 10)
		
		
		net.Start("AbilityBought")
			net.WriteString("bfg_shotgunAmmo")
		net.Send(pl)
		pl:EmitSound("player/invuln_on_vaccinator.wav", 75, 100, 1, CHAN_STATIC)
		pl:GiveAmmo( 12, "bfg_shotgun" )
		
	end
end
concommand.Add("hl2c_buy_ammo_bfg_shotgun", function(pl) if (pl && pl:IsValid() && pl:Team() == TEAM_ALIVE) then bfg_shotgunAmmo(pl) end end)


function Buy_Pipe(pl)
	if Hl2c_Shop_Exc(pl) then return end
	
	if !pl:IsAdmin() and pl:Frags() < 30 then
		pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
		return
	end
	if pl:IsAdmin() then else
		pl:SetFrags(pl:Frags() - 30)
	end
	
	net.Start("AbilityBought")
		net.WriteString("Buy_Pipe")
	net.Send(pl)
	pl:Give( "weapon_pipe" )
	
end
concommand.Add("hl2c_buy_pipe", function(pl) if (Hl2c_Shop_Valid_Pl(pl)) then Buy_Pipe(pl) end end)

function Buy_Deagle(pl)
	if Hl2c_Shop_Exc(pl) then return end
	
	if !pl:IsAdmin() and pl:Frags() < 30 then
		pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
		return
	end
	if pl:IsAdmin() then else
		pl:SetFrags(pl:Frags() - 30)
	end
	
	net.Start("AbilityBought")
		net.WriteString("Buy_Deagle")
	net.Send(pl)
	pl:Give( "weapon_deagle" )
	
end
concommand.Add("hl2c_buy_deagle", function(pl) if (Hl2c_Shop_Valid_Pl(pl)) then Buy_Deagle(pl) end end)

function Buy_Flaregun(pl)
	if Hl2c_Shop_Exc(pl) then return end
	
	if !pl:IsAdmin() and pl:Frags() < 30 then
		pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
		return
	end
	if pl:IsAdmin() then else
		pl:SetFrags(pl:Frags() - 30)
	end
	
	net.Start("AbilityBought")
		net.WriteString("Buy_Flaregun")
	net.Send(pl)
	pl:Give( "weapon_flaregun" )
	
end
concommand.Add("hl2c_buy_flaregun", function(pl) if (Hl2c_Shop_Valid_Pl(pl)) then Buy_Flaregun(pl) end end)

function Buy_Mp5k(pl)
	if Hl2c_Shop_Exc(pl) then return end
	
	if !pl:IsAdmin() and pl:Frags() < 30 then
		pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
		return
	end
	if pl:IsAdmin() then else
		pl:SetFrags(pl:Frags() - 30)
	end
	
	net.Start("AbilityBought")
		net.WriteString("Buy_Mp5k")
	net.Send(pl)
	pl:Give( "weapon_mp5k" )
	
end
concommand.Add("hl2c_buy_mp5k", function(pl) if (Hl2c_Shop_Valid_Pl(pl)) then Buy_Mp5k(pl) end end)

function Buy_Mg1(pl)
	if Hl2c_Shop_Exc(pl) then return end
	
	if !pl:IsAdmin() and pl:Frags() < 30 then
		pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
		return
	end
	if pl:IsAdmin() then else
		pl:SetFrags(pl:Frags() - 30)
	end
	
	net.Start("AbilityBought")
		net.WriteString("Buy_Mg1")
	net.Send(pl)
	pl:Give( "weapon_mg1" )
	
end
concommand.Add("hl2c_buy_mg1", function(pl) if (Hl2c_Shop_Valid_Pl(pl)) then Buy_Mg1(pl) end end)

function Buy_Sl8(pl)
	if Hl2c_Shop_Exc(pl) then return end
	
	if !pl:IsAdmin() and pl:Frags() < 30 then
		pl:PrintMessage(HUD_PRINTTALK, "Not enough Score Points!")
		return
	end
	if pl:IsAdmin() then else
		pl:SetFrags(pl:Frags() - 30)
	end
	
	net.Start("AbilityBought")
		net.WriteString("Buy_Sl8")
	net.Send(pl)
	pl:Give( "weapon_sl8" )
	
end
concommand.Add("hl2c_buy_sl8", function(pl) if (Hl2c_Valid_Pl(pl)) then Buy_Sl8(pl) end end)
]]

function Hl2c.Buy_Upgrade(pl,item)
	if Hl2c_Valid_Pl(pl) then else return end
	if item and isstring(item) then else return end
	
	if item == "models/player/gordon_hev.mdl" and 
	( pl:GetNWInt("SHOP_UPGRADE_001") != 1 and 
	(pl:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR") == 1 or 
	pl:GetNWInt("ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR") == 1 or 
	pl:GetNWInt("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR") == 1) and 
	pl:ShopWithPerma(2000) )
	then
		-- if pl:IsAdmin() then else
		pl:TakePerma(2000)
		-- end
		pl:SetNWInt("SHOP_UPGRADE_001",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_001",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Shop: HEV Suit!",pl)
		return
	elseif item == "models/player/gordon_hev.mdl" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "models/player/group03/male_01.mdl" and ( pl:GetNWInt("SHOP_UPGRADE_004") < 1 and pl:ShopWithPerma(500) ) then
		pl:TakePerma(500)
		pl:SetNWInt("SHOP_UPGRADE_004",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_004",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "models/player/group03/male_01.mdl" and pl:GetNWInt("SHOP_UPGRADE_004") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "models/player/group03/male_01.mdl" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "models/player/police.mdl" and ( pl:GetNWInt("SHOP_UPGRADE_005") < 1 and pl:ShopWithPerma(600) ) then
		pl:TakePerma(600)
		pl:SetNWInt("SHOP_UPGRADE_005",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_005",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "models/player/police.mdl" and pl:GetNWInt("SHOP_UPGRADE_005") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "models/player/police.mdl" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "models/player/combine_soldier.mdl" and ( pl:GetNWInt("SHOP_UPGRADE_006") < 1 and pl:ShopWithPerma(700) ) then
		pl:TakePerma(700)
		pl:SetNWInt("SHOP_UPGRADE_006",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_006",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "models/player/combine_soldier.mdl" and pl:GetNWInt("SHOP_UPGRADE_006") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "models/player/combine_soldier.mdl" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "models/shotgun_soldier.mdl" and ( pl:GetNWInt("SHOP_UPGRADE_007") < 1 and pl:ShopWithPerma(800) ) then
		pl:TakePerma(800)
		pl:SetNWInt("SHOP_UPGRADE_007",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_007",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "models/shotgun_soldier.mdl" and pl:GetNWInt("SHOP_UPGRADE_007") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "models/shotgun_soldier.mdl" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "models/player/combine_soldier_prisonguard.mdl" and ( pl:GetNWInt("SHOP_UPGRADE_008") < 1 and pl:ShopWithPerma(900) ) then
		pl:TakePerma(900)
		pl:SetNWInt("SHOP_UPGRADE_008",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_008",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "models/player/combine_soldier_prisonguard.mdl" and pl:GetNWInt("SHOP_UPGRADE_008") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "models/player/combine_soldier_prisonguard.mdl" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "models/player/combine_super_soldier.mdl" and ( pl:GetNWInt("SHOP_UPGRADE_009") < 1 and pl:ShopWithPerma(1000) ) then
		pl:TakePerma(1000)
		pl:SetNWInt("SHOP_UPGRADE_009",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_009",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "models/player/combine_super_soldier.mdl" and pl:GetNWInt("SHOP_UPGRADE_009") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "models/player/combine_super_soldier.mdl" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "hat_monitor" and ( pl:GetNWInt("SHOP_UPGRADE_010") < 1 and pl:ShopWithPerma(400) ) then
		pl:TakePerma(400)
		pl:SetNWInt("SHOP_UPGRADE_010",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_010",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "hat_monitor" and pl:GetNWInt("SHOP_UPGRADE_010") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "hat_monitor" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end
	
	if item == "hat_melon" and ( pl:GetNWInt("SHOP_UPGRADE_011") < 1 and pl:ShopWithPerma(400) ) then
		pl:TakePerma(400)
		pl:SetNWInt("SHOP_UPGRADE_011",1)
		Hl2c.Shop_Save_Upgrade_P1(pl,"SHOP_UPGRADE_011",1)
		Hl2c.PersonDefaultChatPrint("[hl2c shop] Succes Payment!",pl)
		return
	elseif item == "hat_melon" and pl:GetNWInt("SHOP_UPGRADE_011") == 1 then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You already own this product!",pl)
		return
	elseif item == "hat_melon" then
		Hl2c.PersonDefaultChatPrint("[hl2c shop] You not completed the requirement!",pl)
		return
	end

	
	
	Hl2c.PersonDefaultChatPrint("[hl2c shop] You have tried to buy an Unknown item!",pl)
	
end

function Hl2c_Buy_Item(pl,item)
	
	if !IsValid(pl) then return end
	if HL2C_DISABLE_WEAPONS == true then 
		-- pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") 
		Hl2c.PersonDefaultChatPrint("[hl2c] Shop is Disabled!",pl) 
		return 
	end
	if item == nil then return end
	if item[1] == nil then return end
	if Hl2c_Shop_Exc(pl) then return end
	if Hl2c.IsItemBlock(pl,item[1]) then return end
	
	if Hl2c.Shop_CheckAmmo(item[1]) then 
		if not Hl2c.EnoughFrag(pl,item[1]) then return end
		pl:GiveAmmo(Hl2c.Shop_GetAmountAmmo(item[1]),item[1])
	end
	if Hl2c.Item_CheckWeapon(item[1]) then 
		if pl:HasWeapon(item[1]) then return end
		if not Hl2c.EnoughFrag(pl,item[1]) then return end
		pl:Give(item[1])
	end
	--print("Buy Has Ended",Hl2c.Shop_GetCost(item[1]))
	
	
	
end


function Hl2c.IsItemBlock(pl,item)
	if Hl2c.BlockedItems[item] then
		-- pl:PrintMessage(HUD_PRINTTALK, "[hl2c shop]: Item is Blocked!")
		Hl2c.PersonDefaultChatPrint("[hl2c shop]: Item is Blocked!",pl)
		return true
	end
	return false
end

function Hl2c.EnoughFrag(pl,item)
	if pl:Frags() < Hl2c.Shop_GetCost(item) then
		-- pl:PrintMessage(HUD_PRINTTALK, "[hl2c shop]: Not enough Score Points!")
		Hl2c.PersonDefaultChatPrint("[hl2c shop]: Not enough Score Points!",pl)
		return false
	end
	
	-- if pl:IsAdmin() then 
		--pl:SetFrags(pl:Frags() - Hl2c.Shop_GetCost(item))
		-- return true 
	
	-- else
		pl:SetFrags(pl:Frags() - Hl2c.Shop_GetCost(item))
		--pl:AddFrags(Hl2c.Shop_GetCost(item))
		return true
	-- end
end

function Hl2c.Shop_GetCost(item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if isnumber(v["Cost"]) then return v["Cost"] else return 100000000 end
		end
	end
end
function Hl2c.Shop_GetAmountAmmo(item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if isnumber(v["Amount"]) then return v["Amount"] else return 10 end
		end
	end
end
function Hl2c.Item_CheckWeapon(item)
	--print("Checking...",item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if v["Type"] == 0 then return true end
		end
	end
	return false 
end

function Hl2c.Shop_CheckAmmo(item)
	--print("Checking...",item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if v["Type"] == 1 then return true end
		end
	end
	return false 
end
function Hl2c.Shop_CheckPowerUp(item)
	--print("Checking...",item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if v["Type"] == 2 then return true end
		end
	end
	return false 
end
function Hl2c.Shop_CheckSuit(item)
	--print("Checking...",item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if v["Type"] == 3 then return true end
		end
	end
	return false 
end
function Hl2c.Shop_CheckPet(item)
	--print("Checking...",item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if v["Type"] == 4 then return true end
		end
	end
	return false 
end
function Hl2c.Shop_CheckAmmobox(item)
	--print("Checking...",item)
	for k, v in ipairs(Hl2c.Items) do
		if v["Name"] == item then
			if v["Type"] == 5 then return true end
		end
	end
	return false 
end

function Hl2c_Valid_Pl(pl)
	if IsValid(pl) && ( pl:Team() == TEAM_ALIVE || pl:Team() == TEAM_COMBINE ) then return true end
end

function Hl2c_Shop_Exc(pl)
	if GetConVarNumber("hl2c_classic") >= 1 then
		-- pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in Classic Mode.")
		Hl2c.PersonDefaultChatPrint("Abilities are disabled in Classic Mode.",pl)
		return true
	elseif GetConVarNumber("hl2c_shop_allowed") == 0 then
		-- pl:PrintMessage(HUD_PRINTTALK, "Shop is disabled.")
		Hl2c.PersonDefaultChatPrint("Shop is disabled.",pl)
		return true
	elseif game.SinglePlayer() then
		-- pl:PrintMessage(HUD_PRINTTALK, "Abilities are disabled in SinglePlayer")
		Hl2c.PersonDefaultChatPrint("Abilities are disabled in SinglePlayer",pl)
		return true
	elseif GetConVarNumber("hl2c_additions") == 0 then
		-- pl:PrintMessage(HUD_PRINTTALK, "Additions is disabled!")
		Hl2c.PersonDefaultChatPrint("Additions is disabled!",pl)
		return true
	elseif PLAYER_IS_CITIZEN == true then
		-- pl:PrintMessage(HUD_PRINTTALK, "Not allowed!")
		Hl2c.PersonDefaultChatPrint("Not allowed!",pl)
		return true
	end
end


--[[
  _____________________
//					   \\
||	End of Buy System   ||
\\_____________________//
]]--