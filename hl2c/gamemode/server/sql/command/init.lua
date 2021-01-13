
function Hl2c.SetPetShop_SQL(steamid,petid)
	steamid = tostring(steamid)
	petid = tostring(petid)
	
	if isstring(steamid) or
	isstring(petid)
	then
	else
		print("!ERROR: arguement exception!")
		return
	end
	
	query = "UPDATE ".. DB.Pet.Shop .." SET ".. petid .." = ".. 1 .." WHERE STEAMID = '".. steamid .."'"
	sql.Begin();
	sql.Query(query)
	sql.Commit();
	
	print(sql.LastError())
	print(query);
	print("Data was confirmed.")
end

function Hl2c.RemovePetShop_SQL(steamid,petid)
	steamid = tostring(steamid)
	petid = tostring(petid)
	
	if isstring(steamid) or
	isstring(petid)
	then
	else
		print("!ERROR: arguement exception!")
		return
	end
	
	query = "UPDATE ".. DB.Pet.Shop .." SET ".. petid .." = ".. 0 .." WHERE STEAMID = '".. steamid .."'"
	sql.Begin();
	sql.Query(query)
	sql.Commit();
	
	print(sql.LastError())
	print(query);
	print("Data was confirmed.")
end

function Hl2c.AddPet_SQL(steamid,petid,petlevel,petxp,pethp)
	steamid = tostring(steamid)
	petid = tostring(petid)
	petlevel = tonumber(petlevel)
	petxp = tonumber(petxp)
	pethp = tonumber(pethp)
	
	Hl2c.SetPetShop_SQL(steamid,petid)
	
	--print(steamid,petid,petlevel,petxp,pethp)
	if isstring(steamid) or
	isstring(petid) or
	isnumber(petlevel) or
	isnumber(petxp) or
	isnumber(pethp)
	then
		query = "INSERT INTO ".. DB.Pet.List .." (STEAMID, PET_ID, PET_LEVEL, PET_XP, PET_HP) VALUES ('".. steamid .."', '".. petid .."', ".. petlevel ..", ".. petxp ..", ".. pethp .." )"
		sql.Begin();
		sql.Query(query)
		sql.Commit();
		
		print(sql.LastError())
		print(query);
		print("Data was confirmed.")
	else
		print("!ERROR: arguement exception!")
	end
end

function Hl2c.QueryPetList_ID(steamid,petid)
	steamid = tostring(steamid)
	petid = tostring(petid)
	
	if isstring(steamid) and
	isstring(petid) and
	petid != "999"
	then
		query = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '".. steamid .."' AND PET_ID = '".. petid .."'")
		if istable(query) then
			return query
		else
			return error
		end
	else
	return error
	end
	
end

function Hl2c.AddPetList_SQL(steamid,petid,petlevel,petxp,pethp)
	steamid = tostring(steamid)
	petid = tostring(petid)
	petname = tostring(petname)
	petlevel = tonumber(petlevel)
	petxp = tonumber(petxp)
	pethp = tonumber(pethp)
	
	//Hl2c.SetPetShop_SQL(steamid,petid)
	
	--print(steamid,petid,petname,petlevel,petxp,pethp,petname)
	if isstring(steamid) or
	isstring(petid) or
	isnumber(petlevel) or
	isnumber(petxp) or
	isnumber(petname) or
	isnumber(pethp)
	then
		query = "INSERT INTO ".. DB.Pet.List .." (STEAMID, PET_ID, PET_NAME, PET_LEVEL, PET_XP, PET_HP) VALUES ('".. steamid .."', '".. petid .."', '".. petname .."',  ".. petlevel ..", ".. petxp ..", ".. pethp .." )"
		sql.Begin();
		sql.Query(query)
		sql.Commit();
		
		print(sql.LastError())
		print(query);
		print("Data was confirmed.")
	else
		print("!ERROR: arguement exception!")
	end
end

--function Hl2c.SetMainPet_SQL(steamid,petid,petlevel,petxp,pethp)
function Hl2c.SetMainPet_SQL(steamid,petid)
	steamid = tostring(steamid)
	petid = tostring(petid)
	--petlevel = tonumber(petlevel)
	--petxp = tonumber(petxp)
	--pethp = tonumber(pethp)
	
	print(steamid,petid,petlevel,petxp,pethp)
	if isstring(steamid) or
	isstring(petid) --or
	--isnumber(petlevel) or
	--isnumber(petxp) or
	--isnumber(pethp)
	then
	else
		print("!ERROR: arguement exception!")
		return
	end
	
	
	sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_ID = '".. petid .."'  WHERE STEAMID = '".. steamid .."'")
	sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_ID = '".. petid .."'  WHERE STEAMID = '".. steamid .."'")
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_LEVEL = ".. petlevel .." WHERE STEAMID = '".. steamid .."'")
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_XP = ".. petxp .." WHERE STEAMID = '".. steamid .."'")
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_HP = ".. pethp .." WHERE STEAMID = '".. steamid .."'")
	
	/*
	ply:SetNWString("pet_id",tostring(getquery[1]["PET_ID"]))
	ply:SetNWString("pet_name",tostring(getquery[1]["PET_NAME"]))
	ply:SetNWInt("pet_level",tonumber(getquery[1]["PET_LEVEL"]))
	ply:SetNWInt("pet_xp",tonumber(getquery[1]["PET_XP"]))
	ply:SetNWInt("pet_hp",tonumber(getquery[1]["PET_HP"]))
	*/
	
end
--function Hl2c.SwitchMainPet_SQL(pl,steamid,petid,petname,petlevel,petxp,pethp)
--function Hl2c.SwitchMainPet_SQL(pl,steamid,petid)
function Hl2c.SwitchMainPet_SQL(pl,steamid,petid)
	
	steamid = tostring(steamid)
	petid = tostring(petid)
	--petname = tostring(petname)
	--petlevel = tonumber(petlevel)
	--petxp = tonumber(petxp)
	--pethp = tonumber(pethp)
	
	--print(steamid,petid,petname,petlevel,petxp,pethp)
	if IsValid(pl) or
	isstring(steamid) or
	isstring(petid) --or
	--isstring(petname) or
	--isnumber(petlevel) or
	--isnumber(petxp) or
	--isnumber(pethp)
	then
	
	sql.Begin();
	
	sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_ID = '".. petid .."'  WHERE STEAMID = '".. steamid .."'")
	sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_ID = '".. petid .."'  WHERE STEAMID = '".. steamid .."'")
	
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. petname .."' WHERE STEAMID = '".. steamid .."'")
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_LEVEL = ".. petlevel .." WHERE STEAMID = '".. steamid .."'")
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_XP = ".. petxp .." WHERE STEAMID = '".. steamid .."'")
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_HP = ".. pethp .." WHERE STEAMID = '".. steamid .."'")
	sql.Commit();
	print(sql.LastError())
	print("Data was confirmed.")
	
	myquery = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '".. pl:SteamID() .."' AND PET_ID = '".. petid .."'")
	print(myquery[1]["PET_ID"])
	print(myquery[1]["PET_XP"])
	print(myquery[1]["PET_LEVEL"])
	print(myquery[1]["PET_NAME"])
	pl:SetNWString("pet_id", petid)
	pl:SetNWString("pet_name",tostring(myquery[1]["PET_NAME"]))
	pl:SetNWInt("pet_level",tonumber(myquery[1]["PET_LEVEL"]))
	pl:SetNWInt("pet_xp",tonumber(myquery[1]["PET_XP"]))
	pl:SetNWInt("pet_hp",tonumber(myquery[1]["PET_HP"]))
	
	
	
	
	else
		print("!ERROR: arguement exception!")
		return
	end
	
	
	
end

function Hl2c.SetPetName_SQL(steamid,petid,petname)
	steamid = tostring(steamid)
	petid = tostring(petid)
	petname = tostring(petname)
	
	--print(steamid,petid,petname)
	if isstring(steamid) or
	isstring(petid) or
	isstring(petname)
	then
	else
		print("!ERROR: arguement exception!")
		return
	end
	
	sql.Query("UPDATE ".. DB.Pet.List .." SET PET_NAME = '".. petname .."'  WHERE STEAMID = '".. steamid .."' AND PET_ID = '".. petid .."'")
	--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. petname .."'  WHERE STEAMID = '".. steamid .."'")
	
end

-- net.Receive("ReceiveMainPetSwitch", function(len,pl)
	-- msg = nil
	-- msg = net.ReadString()
	-- myquery = nil
	
	-- if IsValid(pl.pet) then
		-- Hl2c.PetRemove(pl.pet)
	-- end
	-- --print("MESSAGE: ",msg)
	-- if msg == "PET_000" then
		-- --myquery = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '".. pl:SteamID() .."' AND PET_ID = '".. "PET_000" .."'")
		-- --PrintTable(myquery)
		-- --Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_000",tostring(myquery[1]["PET_NAME"]),tonumber(myquery[1]["PET_LEVEL"]),tonumber(myquery[1]["PET_XP"]),tonumber(myquery[1]["PET_HP"]))
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_000")
	-- elseif msg == "PET_001" then
		-- --myquery = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '".. pl:SteamID() .."' AND PET_ID = '".. "PET_001" .."'")
		-- --PrintTable(myquery)
		-- --Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_001",tostring(myquery[1]["PET_NAME"]),tonumber(myquery[1]["PET_LEVEL"]),tonumber(myquery[1]["PET_XP"]),tonumber(myquery[1]["PET_HP"]))
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_001")
	-- elseif msg == "PET_002" then
		-- --myquery = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '".. pl:SteamID() .."' AND PET_ID = '".. "PET_002" .."'")
		-- --PrintTable(myquery)
		-- --Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_002",tostring(myquery[1]["PET_NAME"]),tonumber(myquery[1]["PET_LEVEL"]),tonumber(myquery[1]["PET_XP"]),tonumber(myquery[1]["PET_HP"]))
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_002")
	-- elseif msg == "PET_003" then
		
		-- --myquery = sql.Query("SELECT * FROM ".. DB.Pet.List .." WHERE STEAMID = '".. pl:SteamID() .."' AND PET_ID = '".. "PET_003" .."'")
		-- --PrintTable(myquery)
		-- --Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_003",tostring(myquery[1]["PET_NAME"]),tonumber(myquery[1]["PET_LEVEL"]),tonumber(myquery[1]["PET_XP"]),tonumber(myquery[1]["PET_HP"]))
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_003")
	-- elseif msg == "PET_004" then
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_004")
	-- elseif msg == "PET_005" then
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_005")
	-- elseif msg == "PET_006" then
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_006")
	-- elseif msg == "PET_007" then
		-- Hl2c.SwitchMainPet_SQL(pl,pl:SteamID(),"PET_007")
	-- else
	-- end
-- end)

// https://www.youtube.com/user/szandiik


/*
Jelentéskonvertáló:
[url]http://tribal-reports.net/hu[/url]

Tw stats (itt található még több segítség,pl.: támadás szervező,stb..)
[url]http://www.hu.twstats.com/[/url]


Aktivitás mérő:
[url]hu38.tribalwarsmap.com/hu/54a6e7b81227e[/url]

[b]Részletesebben[/b]

[table]
[**][b]Link[/b][||][b]Funkciók[/b][/**]
[*][url]http://hu.twstats.com/hu38/index.php[/url][|]TW Stats - a KH segédprogramok gyűjteménye[/*]
[*][url]http://www.mytwstats.com/tool-convert.php[/url][|]Jelentés konvertáló 1[/*]
[*][url]http://tribal-reports.net/hu[/url][|]Jelentés konvertáló 2[/*]
[*][url]https://help.klanhaboru.hu/wiki/Lovag_képességek[/url][|]Új lovag rendszer[/*]
[*][url]http://hu38.tribalwarsmap.com/hu/[/url][|]Aktivitást és sok részletet figyelő Világtérkép[/*]
[*][url]http://hu.twstats.com/hu38/index.php?page=attack_planner[/url][|]Támadás Szervező, Indítási időket számol[/*]
[*][url]http://www.fxutility.net/massap_eng.php[/url][|]Angol nyelvű, átláthatóbb Támadástervező[/*]
[*][url]http://hu.twstats.com/hu38/index.php?page=distance_calc[/url][|]Távolságmérő[/*]
[*][url]http://g-collect.blog.hu/2010/05/10/teachu[/url][|]TeachU teljes szöveg, jó kis olvasmány mindenkinek![/*]
[/table]
*/