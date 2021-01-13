util.AddNetworkString("select_mp7")
util.AddNetworkString("select_oicw")
util.AddNetworkString("select_annabelle")
util.AddNetworkString("select_sniper")

util.AddNetworkString("select_combinemelee")
util.AddNetworkString("select_plasmapistol")
util.AddNetworkString("select_pulsesmg")
util.AddNetworkString("select_combineshotgun")
util.AddNetworkString("select_ion")

--util.AddNetworkString("buy_pet_hunter")
util.AddNetworkString("buy_pet_combine_s")
util.AddNetworkString("buy_pet_antlion")
util.AddNetworkString("buy_pet_headcrab")
util.AddNetworkString("buy_pet_rollermine")
util.AddNetworkString("buy_pet_fassassin")
util.AddNetworkString("buy_pet_headcrab_fast")
util.AddNetworkString("buy_pet_headcrab_black")

--[[ net.Receive("buy_pet_hunter", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if PET_BUG_FIXED == true then else return end
	if pl.setup_achi == true then
	else
		return
	end
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_000") ) and
	pl:GetNWInt("PET_000") == 0 --and 
	--!pl:GetNWBool("HasPetBought")
	then
		
		if pl:GetNWInt("ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN") == 1 then
		
		
		
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_000", 1, 0, 240)
		pl:databasePetShop("PET_000",240)
		if pl:GetNWBool("HasPetBought") then
		
		else
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_000",1,0,240)
			pl:SetNWInt("PET_000", 1)
			
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_000")
		end
		pl:SetNWBool("HasPetBought", true)
		Hl2c.PersonDefaultChatPrint("Received Pet Hunter.",pl)
		
		elseif isnumber(pl:GetPerma()) and pl:ShopWithPerma(100000) then
		
		pl:TakePerma(100000) 
	
		
		
		
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_000", 1, 0, 240)
		pl:databasePetShop("PET_000",240)
		if pl:GetNWBool("HasPetBought") then
		
		else
			pl:SetNWInt("PET_000", 1)
			
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_000")
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_000",1,0,240)
			
		end
		pl:SetNWBool("HasPetBought", true)
	
		Hl2c.PersonDefaultChatPrint("Received Pet Hunter.",pl)
		
		else
			Hl2c.PersonDefaultChatPrint("Not Enough PERMA.",pl)
		end
	elseif isnumber( pl:GetNWInt("PET_000") ) and
	pl:GetNWInt("PET_000") == 1 --and
	--pl:GetNWBool("HasPetBought") == true
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end
	--end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end) ]]

net.Receive("buy_pet_combine_s", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_001") ) and
	pl:GetNWInt("PET_001") == 0 --and
	--!pl:GetNWBool("HasPetBought")
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(400) then
		
		pl:SetNWInt("PET_001", 1)
		pl:TakePerma(400)
		
		
		
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_001", 1, 0, 140)
		if pl:GetNWBool("HasPetBought") then
			pl:databasePetShop("PET_001",140)
		else
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_001")
			pl:databasePetShop("PET_001",140)
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_001",1,0,140)
		end
		pl:SetNWBool("HasPetBought", true)
		
		Hl2c.PersonDefaultChatPrint("Received Pet Combine Soldier.",pl)
		else
		Hl2c.PersonDefaultChatPrint("Not Enough Perma.",pl)
		end
	elseif isnumber( pl:GetNWInt("PET_001") ) and
	pl:GetNWInt("PET_001") == 1 --and
	--pl:GetNWBool("HasPetBought") == true
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
		
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end


end)

net.Receive("buy_pet_antlion", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_002") ) and
	pl:GetNWInt("PET_002") == 0
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(400) then
		
		pl:SetNWInt("PET_002", 1)
		pl:TakePerma(400)
		
		
		pl:databasePetShop("PET_002",130)
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_002", 1, 0, 130)
		if pl:GetNWBool("HasPetBought") then
		
		else
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_002")
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_002",1,0,130)
		end
		pl:SetNWBool("HasPetBought", true)
		
		Hl2c.PersonDefaultChatPrint("Received Pet Antlion.",pl)
		else
		Hl2c.PersonDefaultChatPrint("Not Enough Perma.",pl)
		end
		
	elseif isnumber( pl:GetNWInt("PET_002") ) and
	pl:GetNWInt("PET_002") == 1
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
		
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end
	
end)

net.Receive("buy_pet_headcrab", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_003") ) and
	pl:GetNWInt("PET_003") == 0
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(400) then
		
		pl:SetNWInt("PET_003", 1)
		pl:TakePerma(400)
		
		
		pl:databasePetShop("PET_003",110)
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_003", 1, 0, 110)
		if pl:GetNWBool("HasPetBought") then
		
		else
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_003")
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_003",1,0,110)
		end
		pl:SetNWBool("HasPetBought", true)
		
		Hl2c.PersonDefaultChatPrint("Received Pet Headcrab.",pl)
		else
		Hl2c.PersonDefaultChatPrint("Not Enough Perma.",pl)
		end
		
	elseif isnumber( pl:GetNWInt("PET_003") ) and
	pl:GetNWInt("PET_003") == 1
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
		
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end
	
end)

net.Receive("buy_pet_rollermine", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_004") ) and
	pl:GetNWInt("PET_004") == 0
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(400) then
		
		pl:SetNWInt("PET_004", 1)
		pl:TakePerma(400)
		
		
		pl:databasePetShop("PET_004",140)
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_004", 1, 0, 140)
		if pl:GetNWBool("HasPetBought") then
		
		else
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_004",1,0,140)
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_004")
		end
		pl:SetNWBool("HasPetBought", true)
		
		Hl2c.PersonDefaultChatPrint("Received Pet Rollermine.",pl)
		else
		Hl2c.PersonDefaultChatPrint("Not Enough Perma.",pl)
		end
		
	elseif isnumber( pl:GetNWInt("PET_004") ) and
	pl:GetNWInt("PET_004") == 1
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
		
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end
	
end)

net.Receive("buy_pet_fassassin", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_005") ) and
	pl:GetNWInt("PET_005") == 0
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(500) then
		
		pl:SetNWInt("PET_005", 1)
		pl:TakePerma(500)
		
		
		pl:databasePetShop("PET_005",200)
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_005", 1, 0, 200)
		if pl:GetNWBool("HasPetBought") then
		
		else
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_005")
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_005",1,0,200)
		end
		pl:SetNWBool("HasPetBought", true)
		
		Hl2c.PersonDefaultChatPrint("Received Pet Female Assassin.",pl)
		else
		Hl2c.PersonDefaultChatPrint("Not Enough Perma.",pl)
		end
		
	elseif isnumber( pl:GetNWInt("PET_005") ) and
	pl:GetNWInt("PET_005") == 1
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
		
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end
	
end)
net.Receive("buy_pet_headcrab_fast", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_006") ) and
	pl:GetNWInt("PET_006") == 0
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(400) then
		
		pl:SetNWInt("PET_006", 1)
		pl:TakePerma(400)
		
		
		pl:databasePetShop("PET_006",110)
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_006", 1, 0, 110)
		if pl:GetNWBool("HasPetBought") then
		
		else
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_006")
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_006",1,0,110)
		end
		pl:SetNWBool("HasPetBought", true)
		
		Hl2c.PersonDefaultChatPrint("Received Pet Headcrab Fast.",pl)
		else
		Hl2c.PersonDefaultChatPrint("Not Enough Perma.",pl)
		end
		
	elseif isnumber( pl:GetNWInt("PET_006") ) and
	pl:GetNWInt("PET_006") == 1
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
		
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end
	
end)
net.Receive("buy_pet_headcrab_black", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_007") ) and
	pl:GetNWInt("PET_007") == 0
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(400) then
		
		pl:SetNWInt("PET_007", 1)
		pl:TakePerma(400)
		
		
		pl:databasePetShop("PET_007",110)
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_007", 1, 0, 110)
		if pl:GetNWBool("HasPetBought") then
		
		else
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_007")
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_007",1,0,110)
		end
		pl:SetNWBool("HasPetBought", true)
		
		Hl2c.PersonDefaultChatPrint("Received Pet Headcrab Black.",pl)
		else
		Hl2c.PersonDefaultChatPrint("Not Enough Perma.",pl)
		end
		
	elseif isnumber( pl:GetNWInt("PET_007") ) and
	pl:GetNWInt("PET_007") == 1
	then
		Hl2c.PersonDefaultChatPrint("You already bought this pet",pl)
		
	else
		Hl2c.PersonDefaultChatPrint("You arent Level 10 or Higher",pl)
	end
	
end)

net.Receive("buy_pet_custom", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if PET_BUG_FIXED == true then else return end
	--if !PLAYER_IS_CITIZEN then
	if isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 0 and
	pl:GetCLevel() > 9 and
	isnumber( pl:GetNWInt("PET_003") ) and
	pl:GetNWInt("PET_003") == 0
	then
		if isnumber(pl:GetPerma()) and pl:ShopWithPerma(400) then
		
		pl:SetNWInt("PET_003", 1)
		pl:TakePerma(400)
		
		
		pl:databasePetShop("PET_003",90)
		-- Hl2c.AddPet_SQL(pl:SteamID(), "PET_003", 1, 0, 90)
		if pl:GetNWBool("HasPetBought") then
		
		else
			pl:SetNWInt("pet_xp", 0)
			pl:SetNWInt("pet_level", 1)
			pl:SetNWString("pet_name", "pet")
			pl:SetNWString("pet_id", "PET_003")
			-- Hl2c.SetMainPet_SQL(pl:SteamID(),"PET_003",1,0,90)
		end
		pl:SetNWBool("HasPetBought", true)
		
		pl:PrintMessage(HUD_PRINTTALK, "Received Pet Antlion.")
		else
		pl:PrintMessage(HUD_PRINTTALK, "Not Enough Perma.")
		end
		
	elseif isnumber( pl:GetNWInt("PET_003") ) and
	pl:GetNWInt("PET_003") == 1
	then
		pl:PrintMessage(HUD_PRINTTALK, "You already bought this pet")
		
	else
		pl:PrintMessage(HUD_PRINTTALK, "You arent Level 10 or Higher")
	end
	
end)

net.Receive("select_mp7", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
	if pl:GetCLevel() != nil then
		if pl:GetCLevel() > 9  then
			pl:Give("weapon_bfg_mp7")
			pl:PrintMessage(HUD_PRINTTALK, "Received.")
		else
			pl:PrintMessage(HUD_PRINTTALK, "You arent Level 10 or Higher")
		end
	end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)

net.Receive("select_oicw", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
	if pl:GetCLevel() != nil then
		if pl:GetCLevel() > 19  then
			pl:Give("weapon_bfg_oicw")
			pl:PrintMessage(HUD_PRINTTALK, "Received.")
		else
			pl:PrintMessage(HUD_PRINTTALK, "You arent Level 20 or Higher")
		end
	end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)

net.Receive("select_annabelle", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
	if pl:GetCLevel() != nil then
		if pl:GetCLevel() > 39  then
			pl:Give("weapon_bfg_hl2_annabelle")
			pl:PrintMessage(HUD_PRINTTALK, "Received.")
		else
			pl:PrintMessage(HUD_PRINTTALK, "You arent Level 40 or Higher")
		end
	end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)

net.Receive("select_sniper", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
	if pl:GetCLevel() != nil then
		if pl:GetAchi("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR") ==1  then
			pl:Give("weapon_ep2sniper")
			pl:PrintMessage(HUD_PRINTTALK, "Received.")
		else
			pl:PrintMessage(HUD_PRINTTALK, "You don't have EP2 True Freeman")
		end
	end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)

net.Receive("select_plasmapistol", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
	if pl:GetCLevel() != nil then
		if pl:GetCLevel() >= 15  then
			pl:Give("weapon_plasmapistol_hl2c")
			pl:PrintMessage(HUD_PRINTTALK, "Received.")
		else
			pl:PrintMessage(HUD_PRINTTALK, "You arent Level 15 or Higher")
		end
	end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)

net.Receive("select_pulsesmg", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
	if pl:GetCLevel() != nil then
		if pl:GetCLevel() >= 30 then
			pl:Give("weapon_pulsesmg")
			pl:Give("weapon_pulsesmg")
			pl:PrintMessage(HUD_PRINTTALK, "Received.")
		else
			pl:PrintMessage(HUD_PRINTTALK, "You arent Level 30 or Higher")
		end
	end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)

net.Receive("select_combinemelee", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
	if pl:GetCLevel() != nil then
		if pl:GetCLevel() > 69 then
			pl:Give("weapon_combinemelee")
			pl:PrintMessage(HUD_PRINTTALK, "Received.")
		else
			pl:PrintMessage(HUD_PRINTTALK, "You arent Level 70 or Higher")
		end
	end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)


net.Receive("select_ion", function(len, pl)
	if HL2C_DISABLE_WEAPONS == true then pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") return end
	if !PLAYER_IS_CITIZEN then
		if isnumber(pl:GetCLevel())  then
			if pl:GetVortexNum() >= 30 then
				pl:Give("weapon_ion")
				pl:PrintMessage(HUD_PRINTTALK, "Received.")
			else
				pl:PrintMessage(HUD_PRINTTALK, "Not Enough Vortex (30)")
			end
			--print(pl:GetVortexNum())
		end
	end
	--print( "Message from " .. pl:Nick() .. " received. Its length is " .. len .. "." )


end)

function Weapon_Rewards(pl, weapon)

	if pl:GetCLevel() == nil then return end
	if pl:GetCLevel() != nil then
	
	
	
	if weapon:GetClass() == "weapon_bfg_mp7" then
	if pl:GetCLevel() < 10 then
	pl:StripWeapon("weapon_bfg_mp7")
	weapon:Remove()
	return false
	end
	end
	
	if weapon:GetClass() == "weapon_bfg_oicw" then
	if pl:GetCLevel() < 20 then
	pl:StripWeapon("weapon_bfg_oicw")
	weapon:Remove()
	return false
	end
	end
	
	--weapon_combinemelee
	if weapon:GetClass() == "weapon_bfg_hl2_sniper" then
	if pl:GetCLevel() < 30 then
	pl:StripWeapon("weapon_bfg_hl2_sniper")
	weapon:Remove()
	return false
	end
	end
	
	
	if weapon:GetClass() == "weapon_bfg_hl2_annabelle" then
	if pl:GetCLevel() < 40 then
	pl:StripWeapon("weapon_bfg_hl2_annabelle")
	weapon:Remove()
	return false
	end
	end
	
	
	
	
	if weapon:GetClass() == "weapon_plasmapistol_hl2c" then
	if pl:GetCLevel() < 15 then
	pl:StripWeapon("weapon_plasmapistol_hl2c")
	weapon:Remove()
	return false
	end
	end
	
	if weapon:GetClass() == "weapon_pulsesmg" then
	if pl:GetCLevel() < 30 then
	pl:StripWeapon("weapon_pulsesmg")
	weapon:Remove()
	return false
	end
	end
	
	--weapon_combinemelee
	if weapon:GetClass() == "weapon_combinemelee" then
	if pl:GetCLevel() < 70 then
	pl:StripWeapon("weapon_combinemelee")
	weapon:Remove()
	return false
	end
	end
	
	
	if weapon:GetClass() == "weapon_combineshotgun" then
	if pl:GetCLevel() < 80 then
	pl:StripWeapon("weapon_combineshotgun")
	weapon:Remove()
	return false
	end
	end
	
	
	end
end

-- hook.Add("PlayerCanPickupWeapon", "Weapon_Rewards", Weapon_Rewards)