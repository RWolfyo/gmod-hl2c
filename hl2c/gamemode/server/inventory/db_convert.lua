function databaseConvertSqlToDB()
	local hl2c_playerdata = sql.Query("SELECT * FROM hl2c_playerdata")
	local playerpdata = sql.Query("SELECT * FROM playerpdata")
	local hl2c_permapoint = sql.Query("SELECT * FROM hl2c_permapoint")
	
	-- PrintTable(playerpdata[1])
	
	for index, data in ipairs(hl2c_playerdata) do
		local UniqueID = data["UniqueID"]
		local SteamID = data["SteamID"]
		local Name = data["Name"]
		local ShortID = ShortSteamID(SteamID)
		local vortex = {["hl2"]={},["ep1"]={},["ep2"]={} }
		local ach = {}
		local lambdacache = {}
		local hl2_ach = {}
		local ep1_ach = {}
		local ep2_ach = {}
		local gen_ach = {}
		local pet = {}
		local ach = {}
		ach["hl2"] = {[1]={},[2]={} }
		ach["ep1"] = {[1]={},[2]={}}
		ach["ep2"] = {[1]={},[2]={}}
		ach["gen"] = {[1]={},[2]={}}
		pet[1] = {}
		pet[2] = {}
		-- local ccounter = {}
		-- local csetup = {}
		local kills = {}
		
		-- custom counters
		local query = sql.Query("SELECT * FROM hl2c_ccounters_p1 WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			--
		else
		
		end
		
		-- custom setup
		local query = sql.Query("SELECT * FROM hl2c_csetup_p1 WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			--
		else
		
		end
		
		-- kills
		local query = sql.Query("SELECT * FROM hl2c_p1_kills WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			for k, v in pairs(query[1]) do
				if k != "UniqueID" then
					kills[k] = query[1][k]
				
				end
			end
		else
		
		end
		
		-- Vortex
		local query = sql.Query("SELECT * FROM hl2c_vortex_hl2 WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			vortex["hl2"] = query[1]
			vortex["hl2"]["UniqueID"] = nil
		else
			vortex["hl2"] = {}
			for i=1,#Hl2c.VORTEX_HL2_LIST do
				-- vortex["hl2"][i] = Hl2c.VORTEX_HL2_LIST[i]
			end
		end
		
		local query = sql.Query("SELECT * FROM hl2c_vortex_ep1 WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			vortex["ep1"] = query[1]
			vortex["ep1"]["UniqueID"] = nil
		else
			vortex["ep1"] = {}
			for i=1,#Hl2c.VORTEX_EP1_LIST do
				-- vortex["ep1"][i] = Hl2c.VORTEX_EP1_LIST[i]
			end
		end
		
		local query = sql.Query("SELECT * FROM hl2c_vortex_ep2 WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			vortex["ep2"] = query[1]
			vortex["ep2"]["UniqueID"] = nil
		else
			vortex["ep2"] = {}
			for i=1,#Hl2c.VORTEX_EP2_LIST do
				-- vortex["ep2"][i] = Hl2c.VORTEX_EP2_LIST[i]
			end
		end
		
		-- Ach
		local query = sql.Query("SELECT * FROM hl2c_hl2_lambdacache WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			lambdacache = query[1]
			lambdacache["UniqueID"] = nil
		else
		
		end
		local query = sql.Query("SELECT * FROM hl2c_hl2_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			-- hl2_ach[1] = query[1]
			-- hl2_ach[1]["UniqueID"] = nil
			ach["hl2"][1] = query[1]
			ach["hl2"][1]["UniqueID"] = nil
		else
		
		end
		local query = sql.Query("SELECT * FROM hl2c_hl2_p2_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			ach["hl2"][2] = query[1]
			ach["hl2"][2]["UniqueID"] = nil
		else
		
		end
		
		local query = sql.Query("SELECT * FROM hl2c_ep1_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			ach["ep1"][1] = query[1]
			ach["ep1"][1]["UniqueID"] = nil
		else
		
		end
		
		local query = sql.Query("SELECT * FROM hl2c_ep1_p2_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			ach["ep1"][2] = query[1]
			ach["ep1"][2]["UniqueID"] = nil
		else
		
		end
		
		local query = sql.Query("SELECT * FROM hl2c_ep2_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			ach["ep2"][1] = query[1]
			ach["ep2"][1]["UniqueID"] = nil
		else
		
		end
		local query = sql.Query("SELECT * FROM hl2c_ep2_p2_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			ach["ep2"][2] = query[1]
			ach["ep2"][2]["UniqueID"] = nil
		else
		
		end
		
		local query = sql.Query("SELECT * FROM hl2c_genp1_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			ach["gen"][1] = query[1]
			ach["gen"][1]["UniqueID"] = nil
		else
		
		end
		local query = sql.Query("SELECT * FROM hl2c_genp2_ach WHERE UniqueID = '".. UniqueID .."'")
		if query and query[1] then
			ach["gen"][2] = query[1]
			ach["gen"][2]["UniqueID"] = nil
		else
		
		end
		
		-- Pets
		local query = sql.Query("SELECT * FROM hl2c_pet_list WHERE SteamID = '".. SteamID .."'")
		if query and query[1] then
			
			pet[1] = query
			
			-- PrintTable(pet[1])
		else
		
		end
		
		local query = sql.Query("SELECT * FROM hl2c_pet_main WHERE SteamID = '".. SteamID .."'")
		if query and query[1] then
			
			pet[2] = query[1]
			pet[2]["STEAMID"] = nil
			pet[2]["PET_CUSTOM_01_INT"] = nil
			pet[2]["PET_CUSTOM_01_TEXT"] = nil
			pet[2]["PET_CUSTOM_02_INT"] = nil
			pet[2]["PET_CUSTOM_02_TEXT"] = nil
			pet[2]["PET_CUSTOM_03_INT"] = nil
			pet[2]["PET_CUSTOM_03_TEXT"] = nil
			pet[2]["PET_HP"] = nil
			pet[2]["PET_LEVEL"] = nil
			pet[2]["PET_NAME"] = nil
			pet[2]["PET_SCALE"] = nil
			pet[2]["PET_TALENT"] = nil
			pet[2]["PET_XP"] = nil
			-- PrintTable(pet[2])
		else
		
		end
		local xp = 1
		local level = 1
		local perma = 0
		-- print(UniqueID)
		-- print(SteamID)
		for k, v in ipairs(playerpdata) do
			local pdata_id = v["infoid"]
			local value = v["value"]
			local text = string.Explode("[",pdata_id)
			-- print(text[1])
			if UniqueID == text[1] then
				xp = tonumber(value)
			end
		end
		-- 
		
		
		
		xp, level = databaseSyncLevel(xp,level)
		
		perma = databaseSyncPERMA(UniqueID,hl2c_permapoint,perma,xp)
		-- print(perma)
		-- print(level)
		-- print(xp)
		-- print(xp.." : "..level.." : "..perma)
		-- PrintTable(query)
		local stat = {}
		stat = {}
		stat["name"] = Name
		stat["perma"] = perma
		stat["normal-level"] = {["xp"] = xp, ["level"] = level}
		for k, v in pairs(kills) do
			stat[COUNT_KILLS_P1_SYNC_DB[k]] = kills[k]
		end
		stat["deaths"] = 0
		stat["gold"] = 0
		stat["maprush"] = 0
		stat["power-level"] = {["xp"] = 0, ["level"] = 1}
		
		vortex["hl2"]["UniqueID"] = nil
		vortex["ep1"]["UniqueID"] = nil
		vortex["ep2"]["UniqueID"] = nil
		-- PrintTable(hl2_ach[1])
		-- oldPrint(UniqueID)
		-- PrintTable(stat)
		databaseRemake("stat",ShortID,stat)
		databaseRemake("ach",ShortID,ach,UniqueID)
		
		-- databaseRemake("ach_hl2",ShortID,hl2_ach)
		-- databaseRemake("ach_ep1",ShortID,ep1_ach)
		-- databaseRemake("ach_ep2",ShortID,ep2_ach)
		-- databaseRemake("ach_gen",ShortID,gen_ach)
		
		databaseRemake("lambda",ShortID,lambdacache)
		databaseRemake("vortex",ShortID,vortex)
		if pet and pet[1] and #pet[1] > 0 then
		databaseRemake("pet",ShortID,pet)
		end
	end
	oldPrint("Done!")
	
	
end

function databaseSyncPERMA(UniqueID,hl2c_permapoint,perma,xp)
	for k, v in ipairs(hl2c_permapoint) do
		local perma_id = v["UniqueID"]
		local value = v["Perma_Number"]
		-- print(text[1])
		if UniqueID == perma_id and value then
			perma = tonumber(value)
		end
	end
	
	if perma < 1 then
		-- perma = tonumber(xp)
	end
	return perma
end

function databaseSyncLevel(xp,level)
	for i=1, 100 do
	-- if player xp is equal or lower than current i value and
	-- player xp is higher than the previous i value
	-- xp <= levelxp and xp > levelxp -1
	-- oldPrint(LevelCurve[i])
		if i == 1 and
		xp > LevelCurve[i] 
		then
			level = i
		elseif xp >= LevelCurve[i] and 
		xp > LevelCurve[i - 1] 
		then
			if i == 100 then
				level = 100
				xp = LevelCurve[i]
			else
				level = i
			end
		end
	end
	return xp, level
end

function databaseRemake(name,id,data,UniqueID)
	if name == "ach" then
		local tabla = data["ep1"][1]
		local szam = 0
		
		 
		for k, v in pairs(data["ep1"][2]) do
			tabla[k] = v
			szam = szam + 1
		end
		local new = {}
		
		for i=1,#Hl2c.EP1_ACH_LIST do
			new[i] = tabla[Hl2c.EP1_ACH_LIST[i]]
		end
		for i=1,#Hl2c.EP1_ACH_LIST do
			if new[i] then
			else
			new[i] = 0
			end
		end
		-- PrintTable(new)
		-- print(szam)
		data["ep1"] = new
		
		local tabla = data["ep2"][1]
		local szam = 0
		
		for k, v in pairs(data["ep2"][2]) do
			tabla[k] = v
			szam = szam + 1
		end
		local new = {}
		
		for i=1,#Hl2c.EP2_ACH_LIST do
			new[i] = tabla[Hl2c.EP2_ACH_LIST[i]]
		end
		for i=1,#Hl2c.EP2_ACH_LIST do
			if new[i] then
			else
			new[i] = 0
			end
		end
		-- PrintTable(new)
		-- print(szam)
		data["ep2"] = new
		
		
		local tabla = data["hl2"][1]
		local szam = 0
		-- table.Add(tabla,data[2])
		
		for k, v in pairs(data["hl2"][2]) do
			tabla[k] = v
			szam = szam + 1
		end
		local new = {}
		-- print(table.Count(tabla))
		for i=1,#Hl2c.HL2_ACH_LIST do
			new[i] = tabla[Hl2c.HL2_ACH_LIST[i]]
		end
		for i=1,#Hl2c.HL2_ACH_LIST do
			if new[i] then
			else
			new[i] = 0
			end
		end
		-- PrintTable(new)
		-- print(szam)
		data["hl2"] = new
		
		
		local tabla = data["gen"][1]
		local szam = 0
		-- table.Add(tabla,data[2])
		local query = sql.QueryValue("SELECT CustomSetUpP1_05 FROM ".. DB.CustomSetUp.P1 .." WHERE UniqueID = '"..UniqueID.."'")
		-- oldPrint(query)
		if query and query != nil and isnumber(query) and query == 1 then
		else
			query = 0
		end
		
		for k, v in pairs(data["gen"][2]) do
			tabla[k] = v
			szam = szam + 1
		end
		local new = {}
		-- print(table.Count(tabla))
		for i=1,#Hl2c.GEN_ACH_LIST do
			if Hl2c.GEN_ACH_LIST[i] == "ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN" and query == 1 then
			new[i] = 1
			else
			new[i] = tabla[Hl2c.GEN_ACH_LIST[i]]
			end
		end
		for i=1,#Hl2c.GEN_ACH_LIST do
			if new[i] then
			else
			new[i] = 0
			end
		end
		new["ACHIEVEMENT_EVENT_GEN_EVENT_LOVE_4EVER"] = nil
		new["ACHIEVEMENT_EVENT_GEN_EVENT_FIND_EGGS"] = nil
		new["ACHIEVEMENT_EVENT_GEN_EVENT_HALLOWEEN_2016"] = nil
		new["ACHIEVEMENT_EVENT_GEN_KILL_HEADLESS_BOSS"] = nil
		new["ACHIEVEMENT_EVENT_GEN_EVENT_CHRISTMAS_2016"] = nil
		new["ACHIEVEMENT_EVENT_GEN_SAVE_SANTA"] = nil
		new["ACHIEVEMENT_EVENT_GEN_EVENT_NEWYEAR_2017"] = nil
		new["ACHIEVEMENT_EVENT_GEN_EVENT_LOVE_2017"] = nil
		new["ACHIEVEMENT_EVENT_GEN_EVENT_EASTER_2017"] = nil
		-- PrintTable(new)
		-- print(szam)
		data["gen"] = new
		
	elseif name == "lambda" then
		local tabla = data
		
		local new = {["hl2"]={},["ep2_web"]={},["ep2_radar"]={} }
		-- print(table.Count(tabla))
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			new["hl2"][i] = tabla[Hl2c.HL2_LAMBDA_LIST[i]]
		end
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			if new["hl2"][i] then
			else
			new["hl2"][i] = 0
			end
		end
		for i=1,#Hl2c.EP2_RADARCACHE_LIST do
			new["ep2_radar"][i] = 0
		end
		for i=1,#Hl2c.EP2_WEBCACHE_LIST do
			new["ep2_web"][i] = 0
		end
		-- PrintTable(new)
		data = new
	elseif name == "pet" then
		local new = {["main"] ={},["list"]={} }
		-- PrintTable(data[1])
		local db = 1
		for k, v in pairs(data[1]) do
			-- print(v["PET_ID"])
			if v and v["STEAMID"] then
				v["STEAMID"] = nil
				-- PrintTable(v)
			end
			if v and v["PET_ID"] and v["PET_ID"] == "999" or v["PET_ID"] == "PET_999" then
				v = nil
				-- print("FOUND ERROR")
				db = db - 1
			end
			db = db + 1
			
		end
		new["main"] = data[2]
		new["list"] = data[1]
		data = nil
		data = {["main"]={},["list"]={} }
		data["main"] = new["main"]
		data["list"] = new["list"]
		-- print("darab: ".. db)
	elseif name == "vortex" then
		local new = { ["hl2"] = {}, ["ep1"] = {}, ["ep2"] = {} }
		for i=1,#Hl2c.VORTEX_HL2_LIST do
			new["hl2"][i] = data["hl2"][Hl2c.VORTEX_HL2_LIST[i]]
		end
		for i=1,#Hl2c.VORTEX_HL2_LIST do
			if new["hl2"][i] then
			else
			new["hl2"][i] = 0
			end
		end
		for i=1,#Hl2c.VORTEX_EP1_LIST do
			new["ep1"][i] = data["ep1"][Hl2c.VORTEX_EP1_LIST[i]]
		end
		for i=1,#Hl2c.VORTEX_EP1_LIST do
			if new["ep1"][i] then
			else
			new["ep1"][i] = 0
			end
		end
		for i=1,#Hl2c.VORTEX_EP2_LIST do
			new["ep2"][i] = data["ep2"][Hl2c.VORTEX_EP2_LIST[i]]
		end
		for i=1,#Hl2c.VORTEX_EP2_LIST do
			if new["ep2"][i] then
			else
			new["ep2"][i] = 0
			end
		end
		data = new
		-- PrintTable(new)
	elseif name == "stat" then
		data["version"] = "1003"
		
		-- print("Version : " .. data["version"] .." : ID : ".. id)
		-- oldPrint("")
		-- PrintTable(data)
		-- oldPrint("")
		if data["combine-kills"] then
		else
			data["combine-kills"] = 0
		end
		
		if data["rebel-kills"] then
		else
			data["rebel-kills"] = 0
		end
		if data["antlion-kills"] then
		else
			data["antlion-kills"] = 0
		end
		if data["zombie-kills"] then
		else
			data["zombie-kills"] = 0
		end
		if data["headcrab-kills"] then
		else
			data["headcrab-kills"] = 0
		end
		if data["vortigaunt-kills"] then
		else
			data["vortigaunt-kills"] = 0
		end
		
		
	end
	dabaseCreateTXT(name,id,data)
end

function dabaseCreateTXT(name,id,data)
	file.CreateDir( "hl2c_player_db/".. id .. "/" )
	
	local str = util.TableToKeyValues(data)
	local f = file.Write("hl2c_player_db/".. id .."/" .. tostring(name) .. ".txt" ,str)
end