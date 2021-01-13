include("command/init.lua")
local oldPrint = print

local function print(...)
	-- oldPrint(...)
end
XP_STARTAMOUNT = 1 --Can be changed to your starting amount

function SetUpXP(ply)
	
	-- if sql.TableExists( DB.Player.Table ) == true then
		-- timer.Simple(0.001, function()
			-- sql.Query( "INSERT INTO hl2c_playerdata (`UniqueID`, `SteamID`, `Name`)VALUES ('"..ply:UniqueID().."', '"..ply:SteamID().."', '"..ply:Nick().."')" )
		-- end)
	-- end
	-- if ply.database and ply:databaseGetStatNormalLevel("xp") > 0 then
	
		if ply.database and ply.database["stat"] and ply:databaseGet("stat")["normal-level"] then
			-- print(ply:databaseGetStatPowerLevel("xp"))
			ply.xpsetup = true
			ply:SetXP( tonumber(ply:databaseGetStatNormalLevel("xp")) ) --Set it to the networked ints that can be called from the client too
			ply:SetLevelStat()
			
			ply:SetPXP( tonumber(ply:databaseGetStatPowerLevel("xp")) ) --Set it to the networked ints that can be called from the client too
			
			-- ply:SetPLevelStat()
			-- print(ply:databaseGetStatPowerLevel("xp"))
			if ply.database["stat"]["perma"] >= 999999 then
				ply:SetNWInt("Perma_Number",999999)
				Player_PermaPoint_Save(ply)
			else
				ply:SetNWInt("Perma_Number",ply.database["stat"]["perma"])
			end
		else
			-- ply.database = ply.database or {}
			-- ply.database["stat"] 
			-- timer.Simple(0.1,function()
			-- SetUpXP(ply)
			-- end)
		end
		
		-- print("working new stat")
	-- else
		-- timer.Simple(0.002,function ()
				-- body
			-- local xp = ply:GetPData("XP") --Get the saved XP amount
			--print(xp)
			-- if tonumber(xp) == nil or tonumber(xp) < 1 then --If it doesn't exist supply the player with the starting XP amount
				-- ply:SetPData("XP", XP_STARTAMOUNT) --Save it
				-- ply:SetXP( XP_STARTAMOUNT ) --Set it to the networked ints that can be called from the client too
				-- ply:SetLevelStat()
				-- ply.database
				-- ply.xpsetup = true
			-- else
				-- ply:SetXP( xp ) --If not, set the networked ints to what we last saved
				--ply:SetLevelStat( xp )
				--print("Player First Spawned XP saved to SQLLite")
				-- ply:SaveXP()
				
				-- timer.Simple(0.01,function()
				-- ply:SetLevelStat() -- Try to force the get level on spawn.
				-- ply.xpsetup = true
				-- end)
				--ply:SaveXPTXT()
				-- if sql.TableExists( DB.Player.Table ) == true && IsValid(ply) then
					-- timer.Simple(0.01, function()
						-- if IsValid(ply) && isstring(ply:Nick()) then
							-- sql.Query("UPDATE hl2c_playerdata SET Name = "..ply:Nick().." WHERE UniqueID = '"..ply:UniqueID().."'")
							-- sql.Query("UPDATE hl2c_playerdata SET Experience = "..ply:GetXP().." WHERE UniqueID = '"..ply:UniqueID().."'")
							-- sql.Query("UPDATE hl2c_playerdata SET Level = "..ply:GetCLevel().." WHERE UniqueID = '"..ply:UniqueID().."'")
						-- end
					-- end)
				-- end
			-- end
		-- end)
	-- end
end

function FirstSpawn( ply )
	
	
	
	
	
	-- if sql.TableExists( DB.LambdaHlTwo.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_hl2_lambdacache (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_LambdaHlTwo_Set(ply)
			-- end
		-- end)
	-- end
	
	--
	-- Half - Life 2
	--
	
	-- if sql.TableExists( DB.AchHlTwo.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_hl2_ach (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_AchHlTwo_Set(ply)
			-- end
		-- end)
	-- end
	
	--
	-- Episode One
	--
	
	-- if sql.TableExists( DB.AchEpOne.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_ep1_ach (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_AchEpOne_Set(ply)
			-- end
		-- end)
	-- end
	
	--
	-- Episode Two
	--
	
	-- if sql.TableExists( DB.AchEpTwo.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_ep2_ach (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_AchEpTwo_Set(ply)
			-- end
		-- end)
	-- end
	
	--
	-- General Achievements
	--
	
	-- if sql.TableExists( DB.AchGenP1.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_genp1_ach (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_AchGenP1_Set(ply)
			-- end
		-- end)
	-- end
	
	-- if sql.TableExists( DB.AchGenP2.Table ) == true then
		-- timer.Simple(1.02, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_genp2_ach (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.52, function()
			-- if IsValid(ply) and 
			-- isstring(ply:Nick()) 
			-- then
				-- Player_AchGenP2_Set(ply)
			-- end
		-- end)
	-- end
	
	--
	-- Count Kills
	--
	-- local tbl = sql.Query("SELECT * FROM hl2c_p1_kills WHERE UniqueID = '"..ply:UniqueID().."'")
	-- if tbl != nil and tbl[1] and 
	-- ( ply:databaseGetStatValue("combine-kills") < 1 or
	-- ply:databaseGetStatValue("antlion-kills") < 1 or	
	-- ply:databaseGetStatValue("zombie-kills") < 1 or	
	-- ply:databaseGetStatValue("vortigaunt-kills") < 1 or	
	-- ply:databaseGetStatValue("headcrab-kills") < 1 or	
	-- ply:databaseGetStatValue("rebel-kills") < 1
	-- )
	-- then
		-- if tbl != nil and tbl[1] then
			-- for k, v in pairs(tbl[1]) do
				-- if k != "UniqueID" then
				-- ply:SetNWInt(k, v )
				-- end
			-- end
		-- else
			-- for k, v in pairs(COUNT_KILLS_P1) do
				-- ply:SetNWInt(v, 0 )
			
			-- end
		-- end
		
		
	-- else
		
		-- if ply.database and ( ply:databaseGetStatValue("combine-kills") > 0 or
		-- ply:databaseGetStatValue("antlion-kills") > 0 or	
		-- ply:databaseGetStatValue("zombie-kills") > 0 or	
		-- ply:databaseGetStatValue("vortigaunt-kills") > 0 or	
		-- ply:databaseGetStatValue("headcrab-kills") > 0 or	
		-- ply:databaseGetStatValue("rebel-kills") > 0
		-- )
		-- then
			-- print("Happened")
			-- for k, v in pairs(COUNT_KILLS_P1) do
				-- ply:SetNWInt(v, ply:databaseGetStatValue(COUNT_KILLS_P1_SYNC_DB[v]) )
			-- end
		-- else
			-- for k, v in pairs(COUNT_KILLS_P1) do
				-- ply:SetNWInt(v, 0 )
			-- end
		-- end
		
		-- if sql.TableExists( DB.KillsP1.Table ) == true then
			-- timer.Simple(1, function()
				-- if IsValid(ply) then
					-- sql.Query( "INSERT INTO hl2c_p1_kills (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
				-- end
			-- end)
			
			-- timer.Simple(1.5, function()
				-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
					-- Player_P1Kills_Set(ply)
				-- end
			-- end)
		-- end
	-- end
	-- sql.Query("DELETE FROM hl2c_p1_kills WHERE UniqueID = '"..ply:UniqueID().."'")
	
	--
	-- Setup Vortex Data
	--
	
	-- if sql.TableExists( DB.VortexHl2.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_vortex_hl2 (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_VortexHl2_Set(ply)
			-- end
		-- end)
	-- end
	
	-- if sql.TableExists( DB.VortexEP1.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_vortex_ep1 (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_VortexEP1_Set(ply)
			-- end
		-- end)
	-- end
	
	-- if sql.TableExists( DB.VortexEP2.Table ) == true then
		-- timer.Simple(1, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO hl2c_vortex_ep2 (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.5, function()
			-- if IsValid(ply) && ply:Nick() != NULL or ply:Nick() != nil then
				-- Player_VortexEP2_Set(ply)
			-- end
		-- end)
	-- end
	
	-- Set up PermaPoints
	
	if sql.TableExists( DB.PermaPoint.Table ) == true and
	sql.TableExists( DB.CustomSetUp.P1 ) == true then

		-- timer.Simple(2.5, function()
			if IsValid(ply) then
				--ply.xp_point = ply:GetXP()
				-- sql.Query( "INSERT INTO ".. DB.PermaPoint.Table .." (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
				sql.Query( "INSERT INTO ".. DB.CustomSetUp.P1 .." (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			end
		-- end)
		
		-- timer.Simple(2.85, function()
			if (IsValid(ply) && (
			ply:Nick() != NULL or 
			ply:Nick() != nil) &&
			isnumber(ply:GetXP())
			) then
				Player_CSetUp_Init(ply)
			end
		-- end)
	end
	
	-- Half Life Two Achievement Part 2
	
	-- if sql.TableExists( DB.AchHlTwo.P2.Table ) == true then
		-- timer.Simple(1.35, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO ".. DB.AchHlTwo.P2.Table .." (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.85, function()
			-- if IsValid(ply) && 
			-- ply:Nick() != NULL or 
			-- ply:Nick() != nil then
				-- Player_AchHlTwo_P2_Set(ply)
			-- end
		-- end)
	-- end
	
	-- Episode One Achievement Part 2
	
	-- if sql.TableExists( DB.AchEpOne.P2.Table ) == true then
		-- timer.Simple(1.351, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO ".. DB.AchEpOne.P2.Table .." (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.851, function()
			-- if IsValid(ply) && 
			-- isstring(ply:Nick()) then
				-- Player_AchEpOne_P2_Set(ply)
			-- end
		-- end)
	-- end
	
	-- Episode Two Achievement Part 2
	
	-- if sql.TableExists( DB.AchEpTwo.P2.Table ) == true then
		-- timer.Simple(1.352, function()
			-- if IsValid(ply) then
				-- sql.Query( "INSERT INTO ".. DB.AchEpTwo.P2.Table .." (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			-- end
		-- end)
		
		-- timer.Simple(1.852, function()
			-- if IsValid(ply) and 
			-- ply:IsPlayer() and
			-- isstring(ply:Nick()) 
			-- then
				-- Player_AchEpTwo_P2_Set(ply)
			-- end
		-- end)
	-- end
	
	
	if sql.TableExists( DB.CustomCounters.P1 ) == true then
		-- timer.Simple(1.4, function()
			if IsValid(ply) and 
			ply:IsPlayer() and
			isstring(ply:Nick()) 
			then
				sql.Query( "INSERT INTO ".. DB.CustomCounters.P1 .." (`UniqueID`)VALUES ('"..ply:UniqueID().."')" )
			end
		-- end)
		
		-- timer.Simple(1.6, function()
			if IsValid(ply) and 
			ply:IsPlayer() and
			isstring(ply:Nick()) 
			then
				Player_CustomCounters_P1_Set(ply)
			end
		-- end)
	end
	
	-- if (sql.TableExists( DB.Pet.Main ) == true) and
	-- (sql.TableExists( DB.Pet.Shop ) == true)
	-- then
		-- timer.Simple(1.35, function()
			-- if IsValid(ply) and 
			-- ply:IsPlayer() and
			-- isstring(ply:Nick()) and
			-- isstring(ply:SteamID())
			-- then
				-- sql.Query( "INSERT INTO ".. DB.Pet.Shop .." (`STEAMID`)VALUES ('".. ply:SteamID() .."')" )
				-- sql.Query( "INSERT INTO ".. DB.Pet.Main .." (`STEAMID`)VALUES ('".. ply:SteamID() .."')" )
				-- Player_Check_Pet(ply)
				
			-- end
			
		-- end)
		
	-- end
	if (sql.TableExists( DB.PermaPoint.Items.Upgrades.P1 ) == true)
	then
		timer.Simple(0.1, function()
			if IsValid(ply) and 
			ply:IsPlayer() and
			isstring(ply:Nick()) and
			isstring(ply:SteamID())
			then
				sql.Query( "INSERT INTO ".. DB.PermaPoint.Items.Upgrades.P1 .." (`STEAMID`)VALUES ('".. ply:SteamID() .."')" )
				-- sql.Query( "INSERT INTO ".. DB.Pet.Main .." (`STEAMID`)VALUES ('".. ply:SteamID() .."')" )
				-- Player_Check_Pet(ply)
				-- print("Result of Shit")
				
			end
			
			timer.Simple(0.2,function()
				for k, v in pairs(Hl2C_SHOP_UPGRADE_P1) do
					if IsValid(ply) and 
					ply:IsPlayer() and
					isstring(ply:Nick()) and
					isstring(ply:SteamID())
					then
						local value = tonumber(sql.QueryValue( "SELECT ".. v .." FROM ".. DB.PermaPoint.Items.Upgrades.P1 .." WHERE STEAMID = '".. ply:SteamID() .."'" ))
						ply:SetNWInt(v, value )
						-- sql.Query( "INSERT INTO ".. DB.Pet.Main .." (`STEAMID`)VALUES ('".. ply:SteamID() .."')" )
						-- Player_Check_Pet(ply)
						-- print(v,value)
						
					end
				end
			end)
			
		end)
		
	end
	
	
	timer.Simple(4, function()
		if IsValid(ply) and 
		ply:IsPlayer() and
		isstring(ply:Nick()) 
		then
			-- ply.setup_achi = true
			ply.theid = ply:UniqueID()
		end
	end)
	
	
end
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )

function Hl2c.Shop_Save_Upgrade_P1(ply,name,code)
	if isnumber(code) then else
	code = tonumber(code)
	end
	sql.Query( "UPDATE ".. DB.PermaPoint.Items.Upgrades.P1 .." SET ".. name .." = " .. code .. " WHERE SteamID = '" .. ply:SteamID() .. "'" )	
	-- ply:SetNWInt(name,1)
	-- print("Success")
	-- local tbl = sql.Query( "SELECT * FROM ".. DB.PermaPoint.Items.Upgrades.P1 .." WHERE STEAMID = '".. ply:SteamID() .."'" )
	-- PrintTable(tbl)
end

/*-----------------------------
Desc: Set up Player's main pet.
-------------------------------*/
function Player_Check_Pet(ply)
	timer.Simple(0.7, function()
		if IsValid(ply) and 
		ply:IsPlayer() and
		isstring(ply:Nick()) and
		isstring(ply:SteamID())
		then
			local value = 0
			/*-----------
			Has Pet?
			-------------*/
			for k, v in pairs(HL2C_PET_SHOP) do
				
				value = tonumber(sql.QueryValue("SELECT ".. k .." FROM ".. DB.Pet.Shop .." WHERE STEAMID = '"..ply:SteamID().."'"))
				--tonumber(value)
				--print("Pet Shop:"..k,value)
				if value == 1 then
					ply:SetNWBool("HasPetBought", true)
					ply:SetNWInt(k, value)
					--print("Pet Bought!!!!!!!!!!!!!!!")
				end
			end
			
			/*-----------
			Set Up Pet
			
			STEAMID text UNIQUE NOT NULL,
			PET_ID INTEGER NOT NULL DEFAULT 0,
			PET_NAME text NOT NULL DEFAULT 'pet',
			PET_LEVEL INTEGER NOT NULL DEFAULT 1,
			PET_XP INTEGER NOT NULL DEFAULT 0,
			PET_TALENT INTEGER NOT NULL DEFAULT 0,
			PET_HP INTEGER NOT NULL DEFAULT 250,
			PET_SCALE INTEGER NOT NULL DEFAULT 0,
			PET_CUSTOM_01_INT INTEGER NOT NULL DEFAULT 0,
			PET_CUSTOM_02_INT INTEGER NOT NULL DEFAULT 0,
			PET_CUSTOM_03_INT INTEGER NOT NULL DEFAULT 0,
			PET_CUSTOM_01_TEXT INTEGER NOT NULL DEFAULT 'NULL',
			PET_CUSTOM_02_TEXT INTEGER NOT NULL DEFAULT 'NULL',
			PET_CUSTOM_03_TEXT INTEGER NOT NULL DEFAULT 'NULL'
			-------------*/
			timer.Simple(0.5,function()
			if ply:GetNWBool("HasPetBought") == true then
				Player_Set_Main_Pet(ply)
				
			end
			end)
		end
	end)
	
end
function Player_Set_Main_Pet(ply)
	if IsValid(ply) and 
	ply:IsPlayer() and
	isstring(ply:Nick()) and
	isstring(ply:SteamID())
	then
		--sql.Query("ALTER TABLE ".. DB.Pet.List .." DROP INDEX 'PET_ID'")
		--sql.Query("ALTER TABLE ".. DB.Pet.List .." DROP CONSTRAINT 'PET_ID'")
		--sql.Query("ALTER TABLE ".. DB.Pet.List .." DROP UNIQUE 'PET_ID'")
		
		--print(ply:GetNWString("pet_id"))
		
		--ply:SetNWString("pet_id", tostring(sql.QueryValue("SELECT PET_ID FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")))
		--ply:SetNWString("pet_name", tostring(sql.QueryValue("SELECT PET_NAME FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")))
		--ply:SetNWInt("pet_level", tonumber(sql.QueryValue("SELECT PET_LEVEL FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")))
		--ply:SetNWInt("pet_xp", tonumber(sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")))
		
		
		--PrintTable(query_listpet)
		--if query != nil then
			--print("ALREADY ADDED",query)
		--else
			--Hl2c.AddPetList_SQL(ply:SteamID(),ply:GetNWString("pet_id"),ply:GetNWInt("pet_level"),ply:GetNWInt("pet_xp"),ply:GetNWInt("pet_hp"))
		--end
		--print("PET_ID ???",ply:GetNWString("pet_id"))
		--print("PET_ID 000",ply:GetNWInt("PET_000"))
		--print("PET_ID 001",ply:GetNWInt("PET_001"))
		
		-- Player_Fix_PetIssue(ply)
	end
end

function Player_Fix_PetIssue(ply)
	if IsValid(ply) and 
	ply:IsPlayer() and
	isstring(ply:Nick()) and
	isstring(ply:SteamID())
	then
		
		fix_hunters = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_000" .."'")
		--PrintTable(fix_hunters[1])
		if fix_hunters == nil then
		elseif istable(fix_hunters[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_000" .."'")
		end
		fix_combines = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_001" .."'")
		if fix_combines == nil then
		elseif istable(fix_combines[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_001" .."'")
		end
		fix_antlion = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_002" .."'")
		if fix_antlion == nil then
		elseif istable(fix_antlion[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_002" .."'")
		end
		fix_headcrab = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_003" .."'")
		if fix_headcrab == nil then
		elseif istable(fix_headcrab[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_003" .."'")
		end
		
		fix_roller = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_004" .."'")
		if fix_roller == nil then
		elseif istable(fix_roller[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_004" .."'")
		end
		
		fix_fass = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_005" .."'")
		if fix_fass == nil then
		elseif istable(fix_fass[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_005" .."'")
		end
		
		fix_fast = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_006" .."'")
		if fix_fast == nil then
		elseif istable(fix_fast[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_006" .."'")
		end
		
		fix_black = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_007" .."'")
		if fix_black == nil then
		elseif istable(fix_black[2]) then
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_007" .."'")
		end
		
		
		
		new_query = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."'")
		if new_query != nil then
			--PrintTable(new_query)
			--DELETE FROM table_name
			--WHERE some_column=some_value;
			sql.Query("DELETE FROM ".. DB.Pet.List .." WHERE SteamID = '"..ply:SteamID().."' AND PET_ID = 999")
		end
		
		new_query = nil
		query = nil
		foundid = "PET_999"
		query = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."'")
		getquery = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
		--print("------------------------------------------")
		--print("-- Setting Up Main Pet")
		--print("------------------------------------------")
		--PrintTable(getquery)
		--print("------------------------------------------")
		if getquery[1]["PET_ID"] == "999" then
			--shop_query = sql.QueryValue("SELECT * FROM ".. DB.Pet.Shop .." WHERE STEAMID = '"..ply:SteamID().."'")
			print("------------------------------------------")
			print("-- Fixing Issues with pets")
			print("------------------------------------------")
			for k, v in pairs(HL2C_PET_SHOP) do
				if ply:GetNWInt(k) == 1 then
					foundid = k
					break
					--print("Pet Bought!!!!!!!!!!!!!!!")
				end
			end
			if foundid == "PET_000" then
				print("------------------------------------------")
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_000",1,0,240,ply)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("------------------------------------------")
			elseif foundid == "PET_001" then
				
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_001",1,0,140,ply)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("why?")
				print("------------------------------------------")
			elseif foundid == "PET_002" then
				
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_002",1,0,130,ply)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("------------------------------------------")
			elseif foundid == "PET_003" then
				
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_003",1,0,110,ply)
				--timer.Simple(0.5, fun)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("------------------------------------------")
			elseif foundid == "PET_004" then
				
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_004",1,0,140,ply)
				--timer.Simple(0.5, fun)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("------------------------------------------")
			elseif foundid == "PET_005" then
				
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_005",1,0,200,ply)
				--timer.Simple(0.5, fun)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("------------------------------------------")
			elseif foundid == "PET_006" then
				
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_006",1,0,110,ply)
				--timer.Simple(0.5, fun)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("------------------------------------------")
			elseif foundid == "PET_007" then
				
				Hl2c.SetMainPet_SQL(ply:SteamID(),"PET_007",1,0,110,ply)
				--timer.Simple(0.5, fun)
				new_query = sql.Query("SELECT * FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
				PrintTable(new_query)
				print("------------------------------------------")
			else
				print("------------------------------------------")
				print("Something went wrong or no Bugged pet found!!!")
				print("------------------------------------------")
			end
			
		else
			--[[
			if istable(query) then
			print("Called Table Querys")
			for k, v in ipairs(query) do
				if ply:GetNWInt("PET_000") == 1 and v["PET_ID"] == "PET_000" then
					--print("WORKING")
				elseif ply:GetNWInt("PET_000") == 1 and
				/*
				(v["PET_ID"] == "999" or 
				v["PET_ID"] == nil or 
				v["PET_ID"] == false or 
				v["PET_ID"] == "false") 
				*/
				/*
				(v["PET_ID"] != "PET_000" and 
				v["PET_ID"] == "PET_001" or
				v["PET_ID"] == "PET_002" or
				v["PET_ID"] == "PET_003") 
				*/
				(v["PET_ID"] == "999" or 
				v["PET_ID"] == nil or 
				v["PET_ID"] == false or 
				v["PET_ID"] == "false") 
				then
					print("Working?")
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_000",1,0,230)
				end
				
				if ply:GetNWInt("PET_001") == 1 and v["PET_ID"] == "PET_001" then
				elseif ply:GetNWInt("PET_001") == 1 and 
				(v["PET_ID"] == "999" or 
				v["PET_ID"] == nil or 
				v["PET_ID"] == false or 
				v["PET_ID"] == "false") 
				then
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_001",1,0,140)
				end
				
				if ply:GetNWInt("PET_002") == 1 and v["PET_ID"] == "PET_002" then
				elseif ply:GetNWInt("PET_002") == 1 and 
				(v["PET_ID"] == "999" or 
				v["PET_ID"] == nil or 
				v["PET_ID"] == false or 
				v["PET_ID"] == "false")  
				then
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_002",1,0,130)
				end
				
				if ply:GetNWInt("PET_003") == 1 and v["PET_ID"] == "PET_003" then
				elseif ply:GetNWInt("PET_003") == 1 and 
				(v["PET_ID"] == "999" or 
				v["PET_ID"] == nil or 
				v["PET_ID"] == false or 
				v["PET_ID"] == "false")  
				then
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_003",1,0,110)
				end
				--print(v["PET_ID"])
				--print(v["PET_NAME"])
				--print(v["PET_LEVEL"])
				--print(v["PET_XP"])
				--print(v["PET_HP"])
				
			end // for end
			
			else
				if ply:GetNWInt("PET_000") == 1 then
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_000",1,0,230)
				end
				if ply:GetNWInt("PET_001") == 1 then
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_001",1,0,140)
				end
				if ply:GetNWInt("PET_002") == 1 then
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_002",1,0,130)
				end
				if ply:GetNWInt("PET_003") == 1 then
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_003",1,0,110)
				end
				
			end
			
			/*
			ply:SetNWString("pet_id",tostring(getquery[1]["PET_ID"]))
			ply:SetNWString("pet_name",tostring(getquery[1]["PET_NAME"]))
			ply:SetNWInt("pet_level",tonumber(getquery[1]["PET_LEVEL"]))
			ply:SetNWInt("pet_xp",tonumber(getquery[1]["PET_XP"]))
			ply:SetNWInt("pet_hp",tonumber(getquery[1]["PET_HP"]))
			*/
			]]--
		end
		
		
		
		
		
		/*
		if new_query != nil and new_query[1]["PET_ID"] != "PET_999" then
			print("FIXED MAIN PET PROBLEM")
			ply:SetNWString("pet_id",tostring(new_query[1]["PET_ID"]))
			ply:SetNWString("pet_name",tostring(new_query[1]["PET_NAME"]))
			ply:SetNWInt("pet_level",tonumber(new_query[1]["PET_LEVEL"]))
			ply:SetNWInt("pet_xp",tonumber(new_query[1]["PET_XP"]))
			ply:SetNWInt("pet_hp",tonumber(new_query[1]["PET_HP"]))
		end
		*/
		
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_000" .."'")
		
		if ply:GetNWInt("PET_000") == 1 and new_query == nil then
			--print(new_query,"PET_000")
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_000",1,0,230)
		end
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_001" .."'")
		
		if ply:GetNWInt("PET_001") == 1 and new_query == nil then
		--print(new_query,"PET_001")
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_001",1,0,140)
		end
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_002" .."'")
		
		
		if ply:GetNWInt("PET_002") == 1 and new_query == nil then
		--print(new_query,"PET_002")
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_002",1,0,130)
		end
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_003" .."'")
		
		if ply:GetNWInt("PET_003") == 1 and new_query == nil then
		--print(new_query,"PET_003")
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_003",1,0,110)
		end
		--print(ply:Nick(),"PET_004 = ",ply:GetNWInt("PET_004"))
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_004" .."'")
		
		if ply:GetNWInt("PET_004") == 1 and new_query == nil then
			--print(new_query,"PET_004") 
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_004",1,0,140)
		end
		
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_005" .."'")
		
		if ply:GetNWInt("PET_005") == 1 and new_query == nil then
			--print(new_query,"PET_005") 
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_005",1,0,200)
		end
		
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_006" .."'")
		
		if ply:GetNWInt("PET_006") == 1 and new_query == nil then
			--print(new_query,"PET_005") 
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_006",1,0,110)
		end
		
		new_query = sql.QueryValue("SELECT PET_XP FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. "PET_007" .."'")
		
		if ply:GetNWInt("PET_007") == 1 and new_query == nil then
			--print(new_query,"PET_005") 
			Hl2c.AddPetList_SQL(ply:SteamID(),"PET_007",1,0,110)
		end
		
		query = sql.QueryValue("SELECT PET_ID FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..ply:SteamID().."'")
		--print(ply:Nick(),query)
		new_query = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. query .."'")
		if !istable(new_query) then return end// SHOULD WORK
		if new_query[1]["PET_ID"] != tostring(query) then return end // if 2 value not exact FUK
		
		ply:SetNWString("pet_id",tostring(new_query[1]["PET_ID"]))
		ply:SetNWString("pet_name",tostring(new_query[1]["PET_NAME"]))
		ply:SetNWInt("pet_level",tonumber(new_query[1]["PET_LEVEL"]))
		ply:SetNWInt("pet_xp",tonumber(new_query[1]["PET_XP"]))
		ply:SetNWInt("pet_hp",tonumber(new_query[1]["PET_HP"]))
		
		--print(ply:Nick(), ply:GetNWString("pet_name"))
		
		--query = sql.QueryValue("SELECT PET_ID FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. ply:GetNWString("pet_id") .."'")
		/*
		query_listpet = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".. ply:GetNWString("pet_id") .."'")
		if query_listpet == nil then
			print("Tried Add Pet List")
			Hl2c.AddPetList_SQL(ply:SteamID(),ply:GetNWString("pet_id"),ply:GetNWInt("pet_level"),ply:GetNWInt("pet_xp"),ply:GetNWInt("pet_hp"))
		end
		
		for k, v in pairs(HL2C_PET_SHOP) do
			if ply:GetNWInt(k) == 1 and k == "PET_000" then
				query_listpet = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".."PET_000".."'")
				print(query_listpet)
				if query_listpet == nil then
					print("Tried Add Pet List PET_000")
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_000",1,0,230)
				end
			end
			if ply:GetNWInt(k) == 1 and k == "PET_001" then
				query_listpet = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".."PET_001".."'")
				print(query_listpet)
				if query_listpet == nil then
					print("Tried Add Pet List PET_001")
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_001",1,0,140)
				end
			end
			if ply:GetNWInt(k) == 1 and k == "PET_002" then
				query_listpet = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".."PET_002".."'")
				print(query_listpet)
				if query_listpet == nil then
					print("Tried Add Pet List PET_002")
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_002",1,0,130)
				end
			end
			if ply:GetNWInt(k) == 1 and k == "PET_003" then
				query_listpet = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '"..ply:SteamID().."' AND PET_ID = '".."PET_003".."'")
				print(query_listpet)
				if query_listpet == nil then
					print("Tried Add Pet List PET_003")
					Hl2c.AddPetList_SQL(ply:SteamID(),"PET_003",1,0,110)
				end
			end
		end
		*/
	end
end

// Custom Counters
function Player_CustomCounters_P1_Set(ply)
	-- timer.Simple(0.7,function()
		-- body
		if IsValid(ply) then
			local value = 0
			for k, v in pairs(HL2C_CCOUNTERS_P1) do
				value = sql.QueryValue("SELECT ".. v .." FROM ".. DB.CustomCounters.P1 .." WHERE UniqueID = '"..ply:UniqueID().."'")
				--print(v,value)
				ply:SetNWInt(v, tonumber(value))
				
			end
		end
	
	-- end)
end

-- Init CSetUp for Player
function Player_CSetUp_Init(ply)
	-- body
	-- timer.Simple(0.8,function()
		-- body
		if IsValid(ply) then
			local value = 0
			for k, v in pairs(HL2C_CSETUP_P1) do
				value = sql.QueryValue("SELECT ".. v .." FROM ".. DB.CustomSetUp.P1 .." WHERE UniqueID = '"..ply:UniqueID().."'")
				ply:SetNWInt(v, tonumber(value))
				--print(v,value)
			end
		end
	
	-- end)
	-- timer.Simple(1.5,function()
		-- if IsValid(ply) then
			-- if ply:GetNWInt("CustomSetUpP1_01") == 1 then

				-- Player_PermaPoint_Load(ply)
			-- else

				-- Player_PermaPoint_Convert(ply)

			-- end	
		-- end
	-- end)


end

-- Convert XP to Perma
function Player_PermaPoint_Convert(ply)
	-- body
	local value = ply:GetXP()
	-- ply:SetNWInt("CustomSetUpP1_01", 1)
	-- print("CONVERTED PERMA")
	-- sql.Query( "UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_01 = " .. 1 .. " WHERE UniqueID = '" .. ply:UniqueID() .. "'" )
	Player_PermaPoint_Set(ply, value)
	Player_PermaPoint_Save(ply)

end

-- Load Perma from Table
function Player_PermaPoint_Load(ply)
	--> body
	local value
	if ply.database and ply:databaseGetStatValue("perma") > 0 then
		value = ply:databaseGetStatValue("perma")
		-- print(ply:databaseGetStatValue("perma"))
		
	else
		value = sql.QueryValue("SELECT Perma_Number FROM ".. DB.PermaPoint.Table .." WHERE UniqueID = '"..ply:UniqueID().."'")
		if value == nil or value == 0 then
			value = ply:GetXP()
		end
	end
	Player_PermaPoint_Set(ply, value)
	Player_PermaPoint_Save(ply)
	sql.Query("DELETE FROM ".. DB.PermaPoint.Table .." WHERE UniqueID = '".. ply:UniqueID() .."'")
end


-- Set Perma Value
function Player_PermaPoint_Set(ply, value)
	ply:SetNWInt("Perma_Number", tonumber(value))
end

-- Save Perma to Table
function Player_PermaPoint_Save(ply)
	--local number = 0
	--number = ply:GetNWInt("Perma_Number")
	if ply.database and ply:databaseGetStatValue("perma") then
		ply.database["stat"]["perma"] = ply:GetNWInt("Perma_Number")
		-- print(ply:databaseGetStatValue("perma"))
	-- else
	-- sql.Query( "UPDATE ".. DB.PermaPoint.Table .." SET Perma_Number = " .. ply:GetNWInt("Perma_Number") .. " WHERE UniqueID = '" .. ply:UniqueID() .. "'" )
	--print("Perma Saved")
	end
end

function SaveKillsStat(pl)
	-- if sql.TableExists( DB.KillsP1.Table ) == true and IsValid(pl) then
		local number = 0
		--print("[hl2c]: Kills Stored",pl:Nick() )
		for k, v in pairs(COUNT_KILLS_P1) do
			
			if IsValid(pl) and pl:GetNWInt(v) != nil then
			
				number = pl:GetNWInt(v)
				if pl.database and COUNT_KILLS_P1_SYNC_DB[v] then
				
					pl.database["stat"][COUNT_KILLS_P1_SYNC_DB[v]] = number
				else
					-- sql.Query( "UPDATE hl2c_p1_kills SET "..v.." = " .. number .. " WHERE UniqueID = '" .. pl:UniqueID() .. "'" )				
				end
				
			end
			
		end
	-- end
end
function SaveStatSpawn(pl)
	-- timer.Simple(1.7,function()
		-- if sql.TableExists( DB.KillsP1.Table ) == true and IsValid(pl) then
			-- local number = 0
			--print("[hl2c]: Kills Stored",pl:Nick() )
			-- for k, v in pairs(COUNT_KILLS_P1) do
				
				-- if pl:GetNWInt(v) != nil and IsValid(pl) then
					
					-- number = pl:GetNWInt(v)
					-- if pl.database and COUNT_KILLS_P1_SYNC_DB[v] then
						-- pl:databaseSetStatValue( pl:databaseGetStatValue(COUNT_KILLS_P1_SYNC_DB[v]), number  )
					-- end
					-- sql.Query( "UPDATE hl2c_p1_kills SET "..v.." = " .. number .. " WHERE UniqueID = '" .. pl:UniqueID() .. "'" )
				-- end
				
			-- end
		-- end
	-- end)
end

hook.Add("PlayerSpawn", "SaveStatSpawnPlayer", SaveStatSpawn)

function Player_AchHlTwo_P2_Set(ply)
	--/*
	for k, v in pairs(HL2_P2_ACH_LIST) do
		
		value = sql.QueryValue("SELECT "..v.." FROM ".. DB.AchHlTwo.P2.Table .." WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
	--*/
end

function Player_AchEpOne_P2_Set(ply)
	--/*
	for k, v in pairs(EP1_P2_ACH_LIST) do
		
		value = sql.QueryValue("SELECT "..v.." FROM ".. DB.AchEpOne.P2.Table .." WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
	--*/
end

function Player_AchEpTwo_P2_Set(ply)
	--/*
	for k, v in pairs(EP2_P2_ACH_LIST) do
		
		value = sql.QueryValue("SELECT "..v.." FROM ".. DB.AchEpTwo.P2.Table .." WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
	--*/
end

function Player_VortexHl2_Set(ply)
	for k, v in pairs(VORTEX_LIST_HL2_NAME) do
		
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_vortex_hl2 WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
end

function Player_VortexEP1_Set(ply)
	for k, v in pairs(VORTEX_LIST_EP1_NAME) do
		
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_vortex_ep1 WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
end

function Player_VortexEP2_Set(ply)
	for k, v in pairs(VORTEX_LIST_EP2_NAME) do
		
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_vortex_ep2 WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
end


function Player_AchHlTwo_Set(ply)
	for k, v in pairs(HL2_ACH_LIST) do
		
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_hl2_ach WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
end

function Player_AchEpOne_Set(ply)
	for k, v in pairs(EP1_ACH_LIST) do
		
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_ep1_ach WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
end

function Player_AchEpTwo_Set(ply)
	for k, v in pairs(EP2_ACH_LIST) do
		
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_ep2_ach WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
end

function Player_AchGenP1_Set(ply)
	for k, v in pairs(GEN_ACH_LIST) do
		
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_genp1_ach WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		
	end
end

function Player_AchGenP2_Set(ply)
	for k, v in pairs(GEN_P2_ACH_LIST) do
		if IsValid(ply)
		then
			value = sql.QueryValue("SELECT "..v.." FROM hl2c_genp2_ach WHERE UniqueID = '"..ply:UniqueID().."'")
			ply:SetNWInt(v, tonumber(value))
		end
		
	end
end

function Player_P1Kills_Set(ply)
	-- PrintTable(sql.Query("SELECT * FROM hl2c_p1_kills WHERE UniqueID = '"..ply:UniqueID().."'"))
	-- local tbl = sql.Query("SELECT * FROM hl2c_p1_kills WHERE UniqueID = '"..ply:UniqueID().."'")
	-- for k, v in pairs(COUNT_KILLS_P1) do
		
		-- print(t[v])
		-- value = tonumber(sql.QueryValue("SELECT "..v.." FROM hl2c_p1_kills WHERE UniqueID = '"..ply:UniqueID().."'"))
		-- ply:SetNWInt(v, tonumber(value))
		-- print("*",value)
		-- ply:SetNWInt(v, 30)
		-- ply:databaseSetStatValue(COUNT_KILLS_P1_SYNC_DB[v],value)
		
	-- end
	
	
end

function AddCountKill(name,value,ply)
	local szamol = 0
	if table.HasValue(COUNT_KILLS_P1,name) then
		countkills = tonumber(ply:GetNWInt(name))
		szamol =  tonumber(value) + tonumber(countkills)
		for k, v in pairs(COUNT_KILLS_P1) do
		
			if v == "COUNT_KILLS_ANTLIONS" and name == v then

				if ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100ANTLIONS") == 0 and szamol >= 100 then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100ANTLIONS",1)
					ply:AddXP(50)
					Hl2c.PersonDefaultChatPrint("Earned: 100 Antlion Kills \nReward 1500 XP",ply)
					
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_1000ANTLIONS") == 0 and szamol >= 1000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_1000ANTLIONS",1)
					ply:AddXP(200)
					
					Hl2c.PersonDefaultChatPrint("Earned: 100 Antlion Kills \nReward 5000 XP",ply)
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_10000ANTLIONS") == 0 and szamol >= 10000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_10000ANTLIONS",1)
					ply:AddXP(400)
					
					Hl2c.PersonDefaultChatPrint("Earned: 100 Antlion Kills \nReward 10000 XP",ply)
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100000ANTLIONS") == 0 and szamol >= 100000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100000ANTLIONS",1)
					ply:AddXP(650)
					
					Hl2c.PersonDefaultChatPrint("Earned: 100 Antlion Kills \nReward 25000 XP",ply)
				else
				
				end
				
			end
			
			if v == "COUNT_KILLS_ZOMBIES" and name == v then
				
				--print("KILL",ply:Nick(),szamol,name)
				/*
				if value > 99 and value < 1000 then
				
				elseif value > 999 and value < 10000 then
				
				elseif value > 9999 and value < 100000 then
				
				elseif value > 99999 then
				
				else
				
				end
				*/
				
				if ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100ZOMBIES") == 0 and szamol >= 100 then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100ZOMBIES",1)
					
					ply:AddXP(50)
					ply:ChatPrint("Earned: 100 Zombie Kills \nReward 1500 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_1000ZOMBIES") == 0 and szamol >= 1000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_1000ZOMBIES",1)
					
					ply:AddXP(200)
					ply:ChatPrint("Earned: 1000 Zombie Kills \nReward 5000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_10000ZOMBIES") == 0 and szamol >= 10000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_10000ZOMBIES",1)
					
					ply:AddXP(400)
					ply:ChatPrint("Earned: 10000 Zombie Kills \nReward 10000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100000ZOMBIES") == 0 and szamol >= 100000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100000ZOMBIES",1)
					
					ply:AddXP(650)
					ply:ChatPrint("Earned: 100000 Zombie Kills \nReward 25000 XP")
				else
				
				end
			end
			
			if v == "COUNT_KILLS_COMBINES" and name == v then
				
				--print("KILL",ply:Nick(),szamol,name)
				/*
				if value > 99 and value < 1000 then
				
				elseif value > 999 and value < 10000 then
				
				elseif value > 9999 and value < 100000 then
				
				elseif value > 99999 then
				
				else
				
				end
				*/
				
				if ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100COMBINES") == 0 and szamol >= 100 then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100COMBINES",1)
					
					ply:AddXP(50)
					ply:ChatPrint("Earned: 100 Combine Kills \nReward 1500 XP")
					
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_1000COMBINES") == 0 and szamol >= 1000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_1000COMBINES",1)
					ply:AddXP(200)
					ply:ChatPrint("Earned: 1000 Combine Kills \nReward 5000 XP")
					
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_10000COMBINES") == 0 and szamol >= 10000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_10000COMBINES",1)
					ply:AddXP(400)
					ply:ChatPrint("Earned: 10000 Combine Kills \nReward 10000 XP")
					
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100000COMBINES") == 0 and szamol >= 100000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100000COMBINES",1)
					ply:AddXP(650)
					ply:ChatPrint("Earned: 100000 Combine Kills \nReward 25000 XP")
					
					
				else
				
				end
			end
			
			if v == "COUNT_KILLS_REBELS" and name == v then
				
				--print("KILL",ply:Nick(),szamol,name)
				/*
				if value > 99 and value < 1000 then
				
				elseif value > 999 and value < 10000 then
				
				elseif value > 9999 and value < 100000 then
				
				elseif value > 99999 then
				
				else
				
				end
				*/
				
				if ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100REBELS") == 0 and szamol >= 100 then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100REBELS",1)
					ply:AddXP(50)
					ply:ChatPrint("Earned: 100 Rebel Kills \nReward 1500 XP")
					
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_1000REBELS") == 0 and szamol >= 1000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_1000REBELS",1)
					
					ply:AddXP(200)
					ply:ChatPrint("Earned: 1000 Rebel Kills \nReward 5000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_10000REBELS") == 0 and szamol >= 10000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_10000REBELS",1)
					
					ply:AddXP(400)
					ply:ChatPrint("Earned: 10000 Rebel Kills \nReward 10000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100000REBELS") == 0 and szamol >= 100000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100000REBELS",1)
					
					ply:AddXP(650)
					ply:ChatPrint("Earned: 100000 Rebel Kills \nReward 25000 XP")
				else
				
				end
			end
			
			if v == "COUNT_KILLS_VORTIGAUNTS" and name == v then
				
				--print("KILL",ply:Nick(),szamol,name)
				/*
				if value > 99 and value < 1000 then
				
				elseif value > 999 and value < 10000 then
				
				elseif value > 9999 and value < 100000 then
				
				elseif value > 99999 then
				
				else
				
				end
				*/
				
				if ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100VORTIGAUNTS") == 0 and szamol >= 100 then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100VORTIGAUNTS",1)
					
					ply:AddXP(50)
					ply:ChatPrint("Earned: 100 Vortiganut Kills \nReward 1500 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_1000VORTIGAUNTS") == 0 and szamol >= 1000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_1000VORTIGAUNTS",1)
					
					ply:AddXP(200)
					ply:ChatPrint("Earned: 1000 Vortiganut Kills \nReward 5000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_10000VORTIGAUNTS") == 0 and szamol >= 10000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_10000VORTIGAUNTS",1)
					
					ply:AddXP(400)
					ply:ChatPrint("Earned: 10000 Vortiganut Kills \nReward 10000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100000VORTIGAUNTS") == 0 and szamol >= 100000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100000VORTIGAUNTS",1)
					
					ply:AddXP(650)
					ply:ChatPrint("Earned: 100000 Vortiganut Kills \nReward 25000 XP")
				else
				
				end
			end
			
			if v == "COUNT_KILLS_HEADCRABS" and name == v then
				
				--print("KILL",ply:Nick(),szamol,name)
				/*
				if value > 99 and value < 1000 then
				
				elseif value > 999 and value < 10000 then
				
				elseif value > 9999 and value < 100000 then
				
				elseif value > 99999 then
				
				else
				
				end
				*/
				
				if ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100HEADCRABS") == 0 and szamol >= 100 then
					
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100HEADCRABS",1)
					
					ply:AddXP(50)
					ply:ChatPrint("Earned: 100 Headcrab Kills \nReward 1500 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_1000HEADCRABS") == 0 and szamol >= 1000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_1000HEADCRABS",1)
					
					ply:AddXP(200)
					ply:ChatPrint("Earned: 1000 Headcrab Kills \nReward 5000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_10000HEADCRABS") == 0 and szamol >= 10000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_10000HEADCRABS",1)
					
					ply:AddXP(400)
					ply:ChatPrint("Earned: 10000 Headcrab Kills \nReward 10000 XP")
				elseif ply:GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_100000HEADCRABS") == 0 and szamol >= 100000  then
					ply:AddAchi("ACHIEVEMENT_EVENT_GEN_KILL_100000HEADCRABS",1)
					
					ply:AddXP(650)
					ply:ChatPrint("Earned: 100000 Headcrab Kills \nReward 25000 XP")
					
				else
				
				end
				
			end
		end
		
		--print("KILL",ply:Nick(),szamol)
		
		ply:SetNWInt(name,tonumber(szamol))
		SaveKillsStat(ply)
	end
end

function Player_LambdaHlTwo_Set(ply)
	--local szamol = 0
	for k, v in pairs(HL2_LAMDACACHE) do
	
		--print(v)
		--szamol = szamol + 1
		value = sql.QueryValue("SELECT "..v.." FROM hl2c_hl2_lambdacache WHERE UniqueID = '"..ply:UniqueID().."'")
		ply:SetNWInt(v, tonumber(value))
		--print("SET "..v.." : "..ply:GetNWInt(v))
		--print(szamol)		47	db	lamdacache.
		--print("ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB: "..ply:GetNWInt("ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB"))
	
	end
	/*
	value = sql.QueryValue("SELECT ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB FROM hl2c_hl2_lambdacache WHERE UniqueID = '"..ply:UniqueID().."'")
	ply:SetNWInt("ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB", value)
	
	value = sql.QueryValue("SELECT ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB FROM hl2c_hl2_lambdacache WHERE UniqueID = '"..ply:UniqueID().."'")
	ply:SetNWInt("ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB", value)
	
	value = sql.QueryValue("SELECT ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB FROM hl2c_hl2_lambdacache WHERE UniqueID = '"..ply:UniqueID().."'")
	ply:SetNWInt("ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB", value)
	
	print("ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB: "..ply:GetNWInt("ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB"))
	*/
end

/*
DB.AchEpOne = {};
DB.AchEpOne.Table = "hl2c_ep1_ach"

DB.RadarEpTwo = {};
DB.RadarEpTwo.Table = "hl2c_ep2_radar"
DB.WebCacheEpTwo = {};
DB.WebCacheEpTwo.Table = "hl2c_ep2_webcache"
DB.AchEpTwo = {};
DB.AchEpTwo.Table = "hl2c_ep2_ach"
*/

/*
"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALSSTATION",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_VENTCRAWL",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALSTUNNEL",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SEWERGRATE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STEAMPIPE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CURVEDROOM",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SHANTYTOWN",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_TUNNELLADDER",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_REDBARN",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FLOATINGRAMP",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_ZOMBIEAMBUSH",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BELOWAPCS",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COUNTERWEIGHT",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAILWAYBRIDGE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_TUNNELPLATFORMS",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BANKEDCANAL",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALWALL",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CHANNELSPLIT",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BMEDOCK",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GENERATORS",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CARCRUSHERARENA",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAVENHOLMATTIC",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_MINETUNNELEXIT",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COASTSHACK",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONSHACK",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GUNSHIPVAN",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SUICIDECITIZEN",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAILROADSHACK",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COASTABOVEBATTERY",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SANDSHACK",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GMANCACHE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CELLCACHE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONLAUNDRY",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SODAMACHINE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARDOGWALL",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARSHACK",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARFENCE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FREEWAYTUNNEL",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_DRAWBRIDGE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_PLAZAFENCE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SEWERSCATWALKS",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONZOMBIEALCOVE",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_PIPEHOPTUNNEL",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_EXITCATWALK",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_ENDOFC1712B",
	"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_WHITEVAN"
	
	*/