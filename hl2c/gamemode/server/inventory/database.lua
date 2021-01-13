local PLAYER = FindMetaTable("Player")
local version = "1005"
local modify = 1
util.AddNetworkString( "inventory.database" )

local oldPrint = print
local function print(...)
	-- oldPrint("database.lua: ".. tostring(...))
	
end

function PLAYER:ShortSteamID()
	local id = self:SteamID()
	id = tostring(id)
	id = string.Replace(id, "STEAM_0:0:","")
	id = string.Replace(id,"STEAM_0:1:","")
	-- print(id)
	return id
end

function ShortSteamID(steamid)
	local id = steamid
	id = tostring(id)
	id = string.Replace(id, "STEAM_0:0:","")
	id = string.Replace(id,"STEAM_0:1:","")
	-- print(id)
	return id
end



function PLAYER:databaseDefault(name)
	if name == "inventory" then
		local k = {}
		local slot = 50
		-- print("Created Inventory")
		
			-- k["slot"] = { [i] = { ["amount"] = math.random(1,9) }, }
			-- if i > 10 then
				-- k["slot"] = { [i] = nil, }
			-- end
		-- everybody starts with 50 slot
		k["version"] = version
		k["inventory-size"] = slot
		k["slot"] = {} 
		for i=1,slot do
			k["slot"][i] = { ["item"] = "false" } 
		end
		k["equip"] = {}
		for i=1,5 do
			k["equip"][i] = { ["item"] = "false" } 
		end
		k["mats"] = {}
		k["mats"][1] = 0 -- common scrap
		k["mats"][2] = 0 -- rare scrap
		k["mats"][3] = 0 -- epic scrap
		k["mats"][4] = 0 -- legendary scrap
		
		k["mats"][5] = 0 -- common food
		k["mats"][6] = 0 -- rare food
		k["mats"][7] = 0 -- epic food
		k["mats"][8] = 0 -- legendary food
		
		-- k["equip"][1] = {["item"] = false} -- head
		-- k["equip"][2] = {["id"] = "none"} -- suit
		-- k["equip"][3] = {["id"] = "none"} -- backpack
		-- k["equip"][4] = {["id"] = "none"} -- weapon
		-- k["equip"][5] = {["id"] = "none"} -- unkonwn
		
		
		
		-- PrintTable(k)
		self:databaseSet( "inventory",	k )
	end
	
	if name == "custom" then
		local k = {}
		
		k = { ["counter"]={}, ["setup"]={},["plan"]={} }
		
		for i=1,100 do
			k["counter"][i] = 0
			k["setup"][i] = 0
			k["plan"][i] = 0
			
		end
		-- PrintTable(k)
		self:databaseSet( "custom",	k )
	end
	
	if name == "stat" then
		-- Add Power Level and New XP and Level Save System
		local k = {}
		-- Version 1.0
		
		k = {
			["normal-level"] = {
				["level"] = 1,
				["xp"] = 1,},
			["power-level"] = {
				["level"] = 1,
				["xp"] = 0,
			},
		}
		k["perma"] = 0
		k["deaths"] = 0
		k["gold"] = 0
		k["maprush"] = 0
		k["antlion-kills"] = 0
		k["combine-kills"] = 0
		k["headcrab-kills"] = 0
		k["rebel-kills"] = 0
		k["vortigaunt-kills"] = 0
		k["zombie-kills"] = 0
		k["name"] = "UNNAMED" or self:Nick()
		
		k["squad"]=0
		
		k["version"] = version
		-- k["model"] = "none"
		-- k["suit"] = "none"
		k["hat"]= "none"
		k["p-shop"]={["version"]="1000"}
		k["t-shop"]={["version"]="1000"}
		self:databaseSet( "stat", k )
		
	end
	
	if name == "ach" then
		local k = {["hl2"]={},["ep1"]={},["ep2"]={},["gen"]={} }
		for i=1,#Hl2c.EP2_ACH_LIST do
			k["ep2"][i] = 0
		end
		
		for i=1,#Hl2c.EP1_ACH_LIST do
			k["ep1"][i] = 0
		end
		
		for i=1,#Hl2c.HL2_ACH_LIST do
			k["hl2"][i] = 0
		end
		
		for i=1,#Hl2c.GEN_ACH_LIST do
			k["gen"][i] = 0
		end
		self:databaseSet( "ach", k )
	end
	
	if name == "lambda_hl2" then
		-- local k = {}
		-- for i=1,#Hl2c.HL2_LAMBDA_LIST do
			-- k[i] = 0
		-- end
		-- self:databaseSet( "lambda_hl2", k )
	end
	
	if name == "vortex" then
		local k = {["hl2"]={},["ep1"]={},["ep2"]={},["cd"]={},["ep3"]={},["lostcoast"]={},["metastasis"]={},["s-hl2"]={} }
		for i=1,#Hl2c.VORTEX_EP1_LIST do
			k["ep1"][i] = 0
		end
		for i=1,#Hl2c.VORTEX_EP2_LIST do
			k["ep2"][i] = 0
		end
		for i=1,#Hl2c.VORTEX_HL2_LIST do
			k["hl2"][i] = 0
		end
		for i=1,#Hl2c.VORTEX_CD_LIST do
			k["cd"][i] = 0
		end
		for i=1,#Hl2c.VORTEX_EP3_LIST do
			k["ep3"][i] = 0
		end
		for i=1,#Hl2c.VORTEX_LT_LIST do
			k["lostcoast"][i] = 0
		end
		for i=1,#Hl2c.VORTEX_META_LIST do
			k["metastasis"][i] = 0
		end
		// Super Vortex
		for i=1,#Hl2c.VORTEX_HL2_LIST do
			k["s-hl2"][i] = 0
		end
		
		self:databaseSet( "vortex", k )
		
	end
	
	if name == "lambda" then
		local k = {["hl2"]={},["ep2_radar"]={},["ep2_web"] = {} }
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			k["hl2"][i] = 0
		end
		for i=1,#Hl2c.EP2_RADARCACHE_LIST do
			k["ep2_radar"][i] = 0
		end
		for i=1,#Hl2c.EP2_WEBCACHE_LIST do
			k["ep2_web"][i] = 0
		end
		self:databaseSet( "lambda", k )
	end
	
	if name == "powerstat" then
		local k = {}
		for i=1,#Hl2c.STATLIST do
			k[i] = 0
		end
		self:databaseSet( "powerstat", k )
	end
	-- k["pets"] = {}
	
	-- k["pets"]["active"] = {["id"] = "999", ["name"] = "name"}
	-- k["pets"]["active"] = {}
	-- k["pets"]["all"] = {}
	
	-- k["ach"] = {}
	-- k["ach"]["hl2"] = {}
	-- k["ach"]["ep1"] = {}
	-- k["ach"]["ep2"] = {}
	-- k["ach"]["ep3"] = {}
	-- k["ach"]["cd"] = {}
	-- k["ach"]["metastasis"] = {}
	-- k["ach"]["metastasis"] = {}
	-- k["ach"]["general"] = {}
end

function PLAYER:databaseStatSetUp()

end

function PLAYER:databaseNetworkedData()
	-- local 
end

function PLAYER:databaseFolders()
	return "hl2c_player_db/".. self:ShortSteamID() .."/"
end

function PLAYER:databasePath(name)
	return self:databaseFolders() .. tostring(name) .. ".txt"
end

function PLAYER:databaseSetLFG()
	self:SetNWInt("LFG-Basic",4)
	self:LFG_PSTAT()
	local szam = math.Round((self:GetCLevel() / 10))
	
	self:SetNWInt("LFG-NLevels", szam)
	-- local lfg = self:GetNWInt("LFG-Basic") + self:GetNWInt("ISTAT_LFG") + self:GetNWInt("LFG-NLevels") + self:GetNWInt("LFG_PSTAT") + (self:GetNWInt("SHOP_UPGRADE_003") * 25)
	local lfg = self:GetNWInt("LFG-Basic") + self:GetNWInt("LFG-NLevels")
	self:SetNWInt("LifeRegen", lfg)
	-- oldPrint(lfg)
end

function PLAYER:LFG_PSTAT()
	local number = self:GetNWInt("PSTAT_1") * 1
	self:SetNWInt("LFG_PSTAT",number)
end

function PLAYER:databaseSetInventory(name,db)
	for i=1,4 do
		self:SetNWInt("ITEM_SCRAP_"..tostring(i), self:databaseGet(name)["mats"][i] )
	end
	for i=1,4 do
		self:SetNWInt("ITEM_FOOD_"..tostring(i), self:databaseGet(name)["mats"][i+4] )
	end
	self:inventoryItemStatReset()
end

function PLAYER:inventoryTakeScrap(i,amount)
	local get = self:GetNWInt( "ITEM_SCRAP_"..tostring(i) )
	local take = get - amount
	if take <= 0 then
		return
	end
	self:inventorySetScrap(i,take)
end
function PLAYER:inventoryAddScrap(i,amount)
	local get = self:GetNWInt( "ITEM_SCRAP_"..tostring(i) )
	local set = get + amount
	self:inventorySetScrap(i,set)
	
end
function PLAYER:inventorySetScrap(i,amount)
	self:SetNWInt("ITEM_SCRAP_"..tostring(i), amount )
	self:databaseGet("inventory")["mats"][i] = amount
end

function PLAYER:inventoryTakeFood(i,amount)
	local get = self:GetNWInt( "ITEM_FOOD_"..tostring(i-4) )
	local take = get - amount
	if take <= 0 then
		return
	end
	self:inventorySetFood(i,take)
end
function PLAYER:inventoryAddFood(i,amount)
	local get = self:GetNWInt( "ITEM_FOOD_"..tostring(i-4) )
	local set = get + amount
	self:inventorySetFood(i,set)
	
end
function PLAYER:inventorySetFood(i,amount)
	self:SetNWInt("ITEM_FOOD_"..tostring(i-4), amount )
	self:databaseGet("inventory")["mats"][i] = amount
end



function PLAYER:databaseGet(name)
	return self.database[name]
end

local databaselist = {
	"stat",
	"inventory",
	"pet",
	"vortex",
	"lambda",
	"ach",
	"pet",
	"custom",
	"powerstat"
}

function PLAYER:databaseCheck()
	self.database = {}
	self.database["inventory"] = {}
	self.database["stat"] = {}
	self.database["lambda_hl2"] = {}
	self.database["lambda"] = {}
	self.database["pet"] = {}
	self.database["vortex"] = {}
	-- self.database["ach_gen"] = {}
	-- self.database["ach_hl2"] = {}
	-- self.database["ach_ep1"] = {}
	-- self.database["ach_ep2"] = {}
	self.database["ach"] = {}
	self.database["custom"] = {}
	self.database["powerstat"] = {}
	
	self:databaseLoad()
	-- self:databaseSend("stat")
	
	self:databaseNetworkedData()
end

function PLAYER:databaseLoad()
	local f = self:databaseExists("custom")
	if f then
		print("File exist: ".."custom"..".txt")
		self:databaseRead("custom")
	else
		print("File Create: ".."custom"..".txt")
		self:databaseCreate("custom")
	end
	
	local f = self:databaseExists("stat")
	if f then
		print("File exist: ".."stat"..".txt")
		self:databaseRead("stat")
	else
		print("File Create: ".."stat"..".txt")
		self:databaseCreate("stat")
	end
	-- self:databaseSend("stat")
	
	

	local f = self:databaseExists("inventory")
	if f then
		print("File exist: ".."inventory"..".txt")
		self:databaseRead("inventory")
	else
		print("File Create: ".."inventory"..".txt")
		self:databaseCreate("inventory")
	end
	-- self:databaseSend("inventory")
	
	
	local f = self:databaseExists("lambda_hl2")
	if f then
		print("File exist: ".."lambda_hl2"..".txt")
		self:databaseRead("lambda_hl2")
	else
		-- print("File Create: ".."lambda_hl2"..".txt")
		-- self:databaseCreate("lambda_hl2")
	end
	-- self:databaseSend("lambda_hl2")
	
	local f = self:databaseExists("vortex")
	if f then
		print("File exist: ".."vortex"..".txt")
		self:databaseRead("vortex")
	else
		print("File Create: ".."vortex"..".txt")
		self:databaseCreate("vortex")
	end
	-- self:databaseSend("vortex")
	
	local f = self:databaseExists("ach")
	if f then
		print("File exist: ".."ach"..".txt")
		self:databaseRead("ach")
	else
		print("File Create: ".."ach"..".txt")
		self:databaseCreate("ach")
	end
	
	local f = self:databaseExists("pet")
	if f then
		print("File exist: ".."pet"..".txt")
		self:databaseRead("pet")
		if self:databaseHasPets() then
		else
			file.Delete(self:databasePath("pet"))
		end
		-- oldPrint(self:databaseHasPets())
	else
		-- print("File Create: ".."ach_ep2"..".txt")
		-- self:databaseCreate("ach_ep2")
	end
	
	local f = self:databaseExists("lambda")
	if f then
		print("File exist: ".."lambda"..".txt")
		self:databaseRead("lambda")
	else
		print("File Create: ".."lambda"..".txt")
		self:databaseCreate("lambda")
	end
	
	
	
	local f = self:databaseExists("powerstat")
	if f then
		print("File exist: ".."powerstat"..".txt")
		self:databaseRead("powerstat")
	else
		print("File Create: ".."powerstat"..".txt")
		self:databaseCreate("powerstat")
	end
	
	-- self:databaseSend("ach_ep2")
	
	-- for k ,v in pairs(databaselist) do
		-- local f = self:databaseExists(v)
		-- if f then
			-- print("File exist: "..v..".txt")
			-- self:databaseRead(v)
		-- else
			-- print("File Create: "..v..".txt")
			-- self:databaseCreate(v)
		-- end
		-- self:databaseSend(v)
	-- end
	-- PrintTable(self:databaseGet("inventory"))
	-- oldPrint(self:databaseHasPets())
	self.setup_achi=true
end

function PLAYER:databasePetShop(id,hp)
	if self.database and self:databaseHasPets() then
		local num = #self.database["pet"]["list"]
		self.database["pet"]["list"][num+1] = {
		["pet_id"] = id,
		["pet_xp"] = 0,
		["pet_level"] = 1,
		["pet_name"] = "pet",
		["pet_hp"] = hp,
		}
	elseif self.database then
		self.database["pet"] = {}
		local pet_table = { ["list"] = {},["main"] = {} } 
		pet_table["list"][1] = {
		["pet_id"] = id,
		["pet_xp"] = 0,
		["pet_level"] = 1,
		["pet_name"] = "pet",
		["pet_hp"] = hp,
		}
		pet_table["main"]["pet_id"] = id
		
		self.database["pet"] = pet_table
		PrintTable(self.database["pet"])
		self:databaseSave("pet")
		
	end
end

function PLAYER:databasePetMenu()
	if self.database and self.database["pet"] then
	local pet = self.database["pet"]
		-- Msg("Working pet menu")
		-- PrintTable(self.database["pet"]["list"])
		net.Start("OpenPetWindow")
			net.WriteTable(pet)
		net.Send(self)
	end
end
net.Receive("ReceiveMainPetSwitch",function(len,pl) pl:databasePetSwitch(len) end)
function PLAYER:databasePetSwitch(len)
	local pet = net.ReadString()
	if self.database and self.database["pet"] then
		self.database["pet"]["main"]["pet_id"] = pet
		if self.petalive and IsValid(self.pet) then
			Hl2c.PetRemove(self.pet)
			
		end
		local select_ = self:databaseGetPet(pet)
		self:SetNWInt("pet_xp", select_["pet_xp"])
		self:SetNWInt("pet_level", select_["pet_level"])
		self:SetNWString("pet_name", select_["pet_name"])
		self:SetNWString("pet_id", select_["pet_id"])
	end
end

function PLAYER:databaseGetPetList()
	if self.database and self:databaseExists("pet") then
		return self:databaseGet("pet")["list"]
	else
		return nil
	end
end


function PLAYER:databaseHasPets()
	local lists = false
	local main = false
	if self.database then
		for k, v in pairs(self.database) do
			if k == "pet" then
				for m, n in pairs(v) do
					
					if m == "list" and n and istable(n) and #n >= 1 then 
						lists = true 
					end
					if m == "main" and n and istable(n) then 
						
						for j, l in pairs(n) do
							if j == "pet_id" then
								
								main = true 
							end
						end
					
					end
				end
			end
		end
	end
	if main and lists then 
		return true 
	
	else
		return false
	end
	
end

function PLAYER:databaseHasCustom()
	local counter = false
	local setup = false
	if self.database then
		for k, v in pairs(self.database) do
			if k == "custom" then
				for m, n in pairs(v) do
					
					if m == "counter" and n and istable(n) and #n >= 1 then 
						counter = true 
					end
					if m == "setup" and n and istable(n) and #n >= 1 then 
						setup = true 					
					end
				end
			end
		end
	end
	if setup and counter then 
		return true 
	
	else
		return false
	end
	
end

function PLAYER:databaseGetPet(id)
	if self.database and self:databaseExists("pet") then
		local result = nil
		for k, v in pairs(self:databaseGetPetList()) do
			if v["pet_id"] == id then
				result = {}
				result = v
			end
		end
		return result 
	else
		return nil
	end
end

function PLAYER:databaseHasPet(id)
	if self.database and self:databaseExists("pet") then
		local result = false
		
		for k, v in ipairs(self:databaseGet("pet")["list"]) do
			-- print(v["pet_id"])
			if v["pet_id"] and v["pet_id"] == id then
				print(true)
				result = true
			end
			-- PrintTable(v)
		end
		return result
	else
	
		return false
	end
end
function PLAYER:databaseGetPetMain()
	if self.database and self:databaseExists("pet") then
		return self:databaseGet("pet")["main"]["pet_id"]
	else
		return nil
	end
end

function PLAYER:databaseSetPetXP(amount)
	if self.database and self:databaseExists("pet") then
		-- local pet = self:databaseGetPet(self:GetNWString("pet_id"))
		local id = 1
		for k, v in pairs(self:databaseGet("pet")["list"]) do
			if v["pet_id"] == self:GetNWString("pet_id") then
				-- Msg("pet xp: ".. v["pet_xp"] .."\n")
				id = k
				-- Msg("pet xp: ".. v["pet_xp"] .."\n")
			end
		end
		self.database["pet"]["list"][id]["pet_xp"] = amount
	end
end

function PLAYER:databaseSetPetLevel(amount)
	if self.database and self:databaseExists("pet") then
		-- local pet = self:databaseGetPet(self:GetNWString("pet_id"))
		local id = 1
		for k, v in pairs(self:databaseGet("pet")["list"]) do
			if v["pet_id"] == self:GetNWString("pet_id") then
				-- Msg("pet level: ".. v["pet_level"] .."\n")
				-- v["pet_level"] = amount
				id = k
				-- Msg("pet level: ".. v["pet_level"] .."\n")
			end
		end
		self.database["pet"]["list"][id]["pet_level"] = amount
		
	end
end

function PLAYER:databaseSetPetName(name)
	if self.database and self:databaseExists("pet") then
		-- local pet = self:databaseGetPet(self:GetNWString("pet_id"))
		local id = 1
		for k, v in pairs(self:databaseGet("pet")["list"]) do
			if v["pet_id"] == self:GetNWString("pet_id") then
				-- Msg("pet name id: ".. k .."\n")
				-- Msg("pet name: ".. v["pet_name"] .."\n")
				v["pet_name"] = name
				self:SetNWString("pet_name", name)
				self.pet:SetNWString("pet_name", name)
				id = k
				-- Msg("pet level: ".. v["pet_name"] .."\n")
			end
			
		end
		self:databaseGet("pet")["list"][id]["pet_name"] = name
		-- Msg("pet level: ".. self.database["pet"]["list"][id]["pet_name"] .."\n")
	end
end

function PLAYER:databaseSend(name)
	net.Start( "inventory.database" )
		net.WriteString(name)
		net.WriteTable( self:databaseGet(name) )
		
	net.Send( self )
end

function PLAYER:databaseExists(name)
	local f = file.Exists(self:databasePath(name), "DATA" )
	return f
end

function PLAYER:databaseRead(name)
	local str = file.Read(self:databasePath(name),"DATA")
	
	self:databaseSet( name,util.KeyValuesToTable(str) )
	
	-- if name == "inventory" then
	-- PrintTable(util.KeyValuesToTable(str))
	-- end
end

function PLAYER:databaseAllSave()
	for k, v in pairs(databaselist) do
		if self:databaseExists(v) then
			if v == "pet" and self:databaseHasPets() then
			self:databaseSave(v)
			else
			self:databaseSave(v)
			end
		end
	
	end
end

function PLAYER:databaseSave(name)
	-- if self and IsValid(self) then else return end
	-- PrintTable(self.database[name])
	-- self:databaseVersionCheck(name,self:databaseGetValue(name))
	
	-- if #self.database[name] < 1 then
		-- self:databaseDefault(name)
		-- if name == "inventory" then
		-- print(name)
		-- end
		-- self:databaseSave(name)
	-- else
	local str = util.TableToKeyValues(self.database[name])
	local f = file.Write(self:databasePath(name),str)
	self:databaseSend(name)
	-- end
end

function PLAYER:databaseCreate(name)
	self:databaseDefault(name)
	local b = file.CreateDir( self:databaseFolders() )
	-- print("Create Folder")
	self:databaseSave(name)

end

function PLAYER:databaseDisconnect()
	if self and IsValid(self) then else return end
	self:databaseSave("inventory")
	self:databaseSave("stat")
	
	if self:databaseHasPets() then
	self:databaseSave("pet")
	end
	self:databaseSave("ach")
	self:databaseSave("vortex")
	self:databaseSave("lambda")
	self:databaseSave("custom")
	self:databaseSave("powerstat")
end

function PLAYER:databaseSetValue(name, v)
	if not v then return end
	-- local slotnum =
	
	self:databaseVersionCheck(name, v)
	
	-- if name == "inventory" then
		-- PrintTable(self:databaseGet(name))
	-- end
	self:databaseSave(name)
	-- PrintTable(self:databaseGet("inventory"))
end

function PLAYER:databaseGetValue( name,key )
	local d = self:databaseGet(name)
	return d[key]
	
end
--> GetStat Values
function PLAYER:databaseGetStatNormalLevel(name)
	local d = self:databaseGet("stat")
	local num = 0
	for k, v in pairs(d)do
		if k == "normal-level" then
			num = v[name]
		end
	end
	return num
end
function PLAYER:databaseGetStatPowerLevel(name)
	local d = self:databaseGet("stat")
	local num = 0
	for k, v in pairs(d)do
		if k == "power-level" then
			num = v[name]
		end
	end
	return num
end
function PLAYER:databaseGetStatValue(name)
	local d = self:databaseGet("stat")
	local num = 0
	for k, v in pairs(d)do
		if k == name then
			num = v
		end
	end
	-- print(num)
	return num
end

function PLAYER:databaseSetStatValue(key,value)
	local d = self:databaseGet("stat")
	
	-- for k, v in pairs(d["stat"]["stat"])do
		-- if k == name then
			
			-- if type(v) == type(data) then
			-- v = data
			-- print(k.." "..v.." "..data)
			-- end
		-- end
	-- end
	if d and type(d) then
	d[key] = value
	end
	-- print(d["stat"]["stat"]["perma"])
	-- return num
end

--  /-------------------------------------------------------
-- <--------------------------------------------------------
--  \-------------------------------------------------------

function CurrentFPS()
	return 1/FrameTime()
end



function PLAYER:databaseSet( name, db )
	self.database = self.database or {}
	self.database[name] = db
	self:databaseVersionCheck(name,self.database[name])
	
	
	if name == "custom" then
		if self:databaseExists("custom") and self:databaseHasCustom() then
			for i=1,#self.database["custom"]["counter"] do
				self:SetNWInt("customcounter_"..tostring(i),self:databaseGet("custom")["counter"][i])
			end
			
			for i=1,#self.database["custom"]["setup"] do
				self:SetNWInt("customsetup_"..tostring(i),self:databaseGet("custom")["setup"][i])
			end
			for i=1,100 do
				self:SetNWInt("customplan_"..tostring(i),self:databaseGet("custom")["plan"][i])
			end
		else
			file.Delete(self:databasePath(name))
			-- self:databaseCreate("custom")
			for i=1,#self.database["custom"]["counter"] do
				self:SetNWInt("customcounter_"..tostring(i),self:databaseGet("custom")["counter"][i])
			end
			
			for i=1,#self.database["custom"]["setup"] do
				self:SetNWInt("customsetup_"..tostring(i),self:databaseGet("custom")["setup"][i])
			end
			
			for i=1,100 do
				self:SetNWInt("customplan_"..tostring(i),self:databaseGet("custom")["plan"][i])
			end
		end
	end
	
	if name == "stat" then
		-- print(self:databaseGet("stat")["antlion-kills"])
		self:SetNWInt("COUNT_KILLS_ANTLIONS",self:databaseGet("stat")["antlion-kills"] )
		self:SetNWInt("COUNT_KILLS_COMBINES",self:databaseGet("stat")["combine-kills"] )
		self:SetNWInt("COUNT_KILLS_HEADCRABS",self:databaseGet("stat")["headcrab-kills"] )
		self:SetNWInt("COUNT_KILLS_REBELS",self:databaseGet("stat")["rebel-kills"] )
		self:SetNWInt("COUNT_KILLS_VORTIGAUNTS",self:databaseGet("stat")["vortigaunt-kills"] )
		self:SetNWInt("COUNT_KILLS_ZOMBIES",self:databaseGet("stat")["zombie-kills"] )
		if self:GetSetup(100) == modify then
			SetUpXP(self)
		else
			self:SetNWInt("customsetup_"..tostring(100),modify)
			self:databaseGet("custom")["setup"][100] = modify
			self.xpsetup = true
			self:SetXP( 1 ) --Set it to the networked ints that can be called from the client too
			self:SetLevelStat()
			self.database["stat"]["perma"] = 0
			self:SetNWInt("Perma_Number",0)
			-- oldPrint("Called XP CHANGE?")
		end
		self:SetNWInt("LFG-Basic",4)
		local lfg = self:GetNWInt("LFG-Basic")-- + self:GetNWInt("LFG-Gear")
		self:SetNWInt("LifeRegen", lfg)
		self:databaseGet("stat")["t-shop"] = {["version"]="1000"}
		local id=self.database["stat"]["squad"]
		if id!=nil and isnumber(id) and id>0 then
			SQUAD:SetUp(self,id)
		end
		Hl2c.Add_Hat(self,"",{self:databaseGet("stat")["hat"],"jelszo"})
	end
	if name == "inventory" then
		self:databaseSetInventory(name,db)
	end
	if name == "ach" then
		for i=1,#Hl2c.HL2_ACH_LIST do
			self:SetNWInt(Hl2c.HL2_ACH_LIST[i],self:databaseGet("ach")["hl2"][i] )
		end
		for i=1,#Hl2c.EP1_ACH_LIST do
			self:SetNWInt(Hl2c.EP1_ACH_LIST[i],self:databaseGet("ach")["ep1"][i] )
		end
		for i=1,#Hl2c.EP2_ACH_LIST do
			self:SetNWInt(Hl2c.EP2_ACH_LIST[i],self:databaseGet("ach")["ep2"][i] )
		end
		for i=1,#Hl2c.GEN_ACH_LIST do
			self:SetNWInt(Hl2c.GEN_ACH_LIST[i],self:databaseGet("ach")["gen"][i] )
		end
		self:SetUpAchi()
	end
	
	if name == "lambda_hl2" then
		-- for i=1,#Hl2c.HL2_LAMBDA_LIST do
			-- self:SetNWInt(Hl2c.HL2_LAMBDA_LIST[i],self:databaseGet("lambda_hl2")[i] )
		-- end
		local mytbl = {["hl2"]={},["ep2_web"]={},["ep2_radar"]={} }
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			mytbl["hl2"][i] = 0
		end
		
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			mytbl["hl2"][i] = self:databaseGet("lambda_hl2")[i]
		end
		
		for i=1,#Hl2c.EP2_RADARCACHE_LIST do
			mytbl["ep2_radar"][i] = 0
		end
		for i=1,#Hl2c.EP2_WEBCACHE_LIST do
			mytbl["ep2_web"][i] = 0
		end
		self.database["lambda"] = mytbl
		file.Delete( self:databasePath(name) )
		-- self:databaseSave("lambda")
	end
	if name == "vortex" then
		// hl2
		for i=1,#Hl2c.VORTEX_HL2_LIST do
			
			if self:GetSetup(99) != modify then
				
				self:databaseGet("vortex")["hl2"][i] = 0
			end
			self:SetNWInt(Hl2c.VORTEX_HL2_LIST[i],self:databaseGet("vortex")["hl2"][i] )
			
			
			
		end
		
		// ep1
		for i=1,#Hl2c.VORTEX_EP1_LIST do
			self:SetNWInt(Hl2c.VORTEX_EP1_LIST[i],self:databaseGet("vortex")["ep1"][i] )
		end
		// ep2
		for i=1,#Hl2c.VORTEX_EP2_LIST do
			self:SetNWInt(Hl2c.VORTEX_EP2_LIST[i],self:databaseGet("vortex")["ep2"][i] )
		end
		// cd
		for i=1,#Hl2c.VORTEX_CD_LIST do
			self:SetNWInt(Hl2c.VORTEX_CD_LIST[i],self:databaseGet("vortex")["cd"][i] )
		end
		// ep3
		for i=1,#Hl2c.VORTEX_EP3_LIST do
			self:SetNWInt(Hl2c.VORTEX_EP3_LIST[i],self:databaseGet("vortex")["ep3"][i] )
		end
		// lostcoast
		for i=1,1 do
			self:SetNWInt(Hl2c.VORTEX_LT_LIST[i],self:databaseGet("vortex")["lostcoast"][i] )
		end
		// metastasis
		for i=1,#Hl2c.VORTEX_META_LIST do
			self:SetNWInt(Hl2c.VORTEX_META_LIST[i],self:databaseGet("vortex")["metastasis"][i] )
		end
		// For Super Vortex
		// hl2
		-- for i=1,#Hl2c.VORTEX_HL2_LIST do
			-- self:SetNWInt(Hl2c.VORTEX_HL2_LIST[i],self:databaseGet("vortex")["s-hl2"][i] )
		-- end
		self:SetUpAchi()
		self:SetNWInt("customsetup_"..tostring(99),modify)
		self:databaseGet("custom")["setup"][99] = modify
	end
	
	if name == "pet" and self:databaseHasPets() then
		for k, v in ipairs(self.database["pet"]["list"]) do
			self:SetNWInt(v["pet_id"],1)
			self:SetNWBool("HasPetBought",true)
		end
		if self:databaseHasPets() then
			local pet = self:databaseGetPet(self:databaseGetPetMain())
			self:SetNWInt("pet_xp", pet["pet_xp"])
			self:SetNWInt("pet_level", pet["pet_level"])
			self:SetNWString("pet_name", pet["pet_name"])
			self:SetNWString("pet_id", pet["pet_id"])
		end
	end
	
	if name == "lambda" then
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			self:SetNWInt(Hl2c.HL2_LAMBDA_LIST[i],self:databaseGet("lambda")["hl2"][i])
		end
		
		for i=1,#Hl2c.EP2_RADARCACHE_LIST do
			self:SetNWInt(Hl2c.EP2_RADARCACHE_LIST[i],self:databaseGet("lambda")["ep2_radar"][i])
		end
		for i=1,#Hl2c.EP2_WEBCACHE_LIST do
			self:SetNWInt(Hl2c.EP2_WEBCACHE_LIST[i],self:databaseGet("lambda")["ep2_web"][i])
		end
	end
	
	
	if name == "powerstat" then
		if self:databaseExists("custom") and self.database["powerstat"] != nil then
			for i=1,#self.database["powerstat"] do
				self:SetNWInt("PSTAT_"..tostring(i),self:databaseGet("powerstat")[i])
			end
			if self:GetNWInt("PSTAT_1") > 100 then
				self:SetNWInt("PSTAT_1",100)
				self.database["powerstat"][1] = 100
			end
			if self:GetNWInt("PSTAT_3") > 100 then
				self:SetNWInt("PSTAT_3",100)
				self.database["powerstat"][3] = 100
			end
		else
			file.Delete(self:databasePath(name))
			
			local k = {}
			for i=1,#Hl2c.STATLIST do
				k[i] = 0
			end
			self.database["powerstat"] = k
			
			for i=1,#self.database["powerstat"][i] do
				self:SetNWInt("PSTAT_"..tostring(i),self:databaseGet("powerstat")[i])
			end
			
		end
		self:databaseSetLFG()
	end
	
	self:databaseSend(name)
end

function PLAYER:databaseVersionCheck(name,v)
	if type(v) == "table" then
		
		if name == "inventory" then
			local found_mats = false
			local slot_tomb = {}
			for m, n in pairs( v ) do
				if m == "version" and v[m] != version then
					v[m] = version
				end
				if m == "slot" then
					for i=1,tonumber(v["inventory-size"]) do
						
						for k,w in pairs(v[m][i]) do
							
							if k == "id" then
								v[m][i] = {["item"] = "false"}
								-- slot_tomb[k] = true
							end
							if k == "item_data" then
								for e,r in pairs(v[m][i][k]) do
									if r == "Hev Suit" then
										v[m][i][k]["gear"] = "true"
										v[m][i][k]["suit"] = "true"
									end
								end
							end
						end
						if v[m][i] == nil then
							v[m][i] = {["item"] = "false"}
						end
						
					end
				end
				if m == "equip" then
					for i=1,5 do
						for k,w in pairs(v[m][i]) do
							if k == "id" then
								v[m][i] = {["item"] = "false"}
								-- slot_tomb[k] = true
							end
						end
					end
				end
				if m == "mats" then
					found_mats = true
					local count = 0
					for k,w in pairs(v["mats"]) do
						count = count + 1
						
					end
					if count < 5 then
						v["mats"][5] = 0
						v["mats"][6] = 0
						v["mats"][7] = 0
						v["mats"][8] = 0
						
					elseif count < 6 then
						v["mats"][6] = 0
						v["mats"][7] = 0
						v["mats"][8] = 0
						
					elseif count < 7 then
						v["mats"][7] = 0
						v["mats"][8] = 0
						
					elseif count < 8 then
						v["mats"][8] = 0
					end
					
				end
			end
			
			if found_mats != true then
				v["mats"] = {}
				for i=1,8 do
					v["mats"][i] = 0
				end
			end
		end
		
		if name == "stat" then
			-- local f1 = false
			-- local f2 = false
			local f3 = false
			local f4 = false
			local f5 = false
			for m, n in pairs( v ) do
				
				if m == "version" and v[m] != version then
					v[m] = version
				end
				if m == "name" and v[m] != self:Nick() then
					v[m] = self:Nick()
				end
				if m=="squad" then 
					f5=true
				end

				-- if m ==  "model" then f1 = true end
				-- if m ==  "suit" then f2 = true end
				if m ==  "hat" then f3 = true end
				if m == "p-shop" then f4 = true end
				-- if m == "t-shop" then f5 = true end
			end
			-- if !f1 then v["model"] = "none" end
			-- if !f2 then v["suit"] ="none" end
			if !f3 then v["hat"] = "none" end
			if !f4 then v["p-shop"] = {["version"]="1000"} end
			if !f5 then v["squad"] = 0 end
			-- if !f5 then v["t-shop"] = {} end
		end
		if name == "ach" then
			for m, n in pairs(v) do
				if m == "ep2" then
					local szamol = 0
					for l, q in pairs(n) do
						szamol = szamol + 1
					end
					if szamol < 21 then
						v["ep2"][22] = 0
					end
					if szamol < 22 then
						v["ep2"][23] = 0
					end
				elseif m == "gen" then
					local szamol = 0
					for l, q in pairs(n) do
						szamol = szamol + 1
					end
					for i=1, #Hl2c.GEN_ACH_LIST do
						if szamol < i then
							v["gen"][i]=0
						end
					end
					-- if szamol < 32 then
						-- v["gen"][32] = 0
					-- end
					-- if szamol < 33 then
						-- v["gen"][33] = 0
					-- end
					-- if szamol < 34 then
						-- v["gen"][34] = 0
					-- end
				
				end
			end
		end
		if name == "custom" then
			local plan = false
			for m, n in pairs(v) do
				if m == "plan" then
					plan = true
				end
			end
			if !plan then
				v["plan"] = {}
				for i=1,100 do
					v["plan"][i] = 0
				end
			end
		end
		
		if name == "vortex" then
			local has_cd = false
			for m, n in pairs( v ) do
				if m == "cd" and n and istable(n) and table.Count(n) > 0 then
					has_cd = true
					
				end
			
			end
			if has_cd then
			else
				v["cd"] = {}
				for i=1,#Hl2c.VORTEX_CD_LIST do
					v["cd"][i] = 0
				end
				
			end
			
			local has_ep3 = false
			for m, n in pairs( v ) do
				if m == "ep3" and n and istable(n) and table.Count(n) > 0 then
					has_ep3 = true
					
				end
			
			end
			if has_ep3 then
			else
				v["ep3"] = {}
				for i=1,#Hl2c.VORTEX_EP3_LIST do
					v["ep3"][i] = 0
				end
				
			end
			
			local has_lt = false
			for m, n in pairs( v ) do
				if m == "lostcoast" and n and istable(n) and table.Count(n) > 0 then
					has_lt = true
					
				end
			
			end
			if has_lt then
			else
				v["lostcoast"] = {}
				for i=1,#Hl2c.VORTEX_LT_LIST do
					v["lostcoast"][i] = 0
				end
				
			end
			
			local has_meta = false
			for m, n in pairs( v ) do
				if m == "metastasis" and n and istable(n) and table.Count(n) > 0 then
					has_meta = true
					
				end
			
			end
			if has_meta then
			else
				v["metastasis"] = {}
				for i=1,#Hl2c.VORTEX_META_LIST do
					v["metastasis"][i] = 0
				end
				
			end
			
			-- local has_shl2 = false
			-- for m, n in pairs( v ) do
				-- if m == "s-hl2" and n and istable(n) and table.Count(n) > 0 then
					-- has_meta = true
					
				-- end
			
			-- end
			-- if has_shl2 then
			-- else
				-- v["s-hl2"] = {}
				-- for i=1,#Hl2c.VORTEX_HL2_LIST do
					-- v["s-hl2"][i] = 0
				-- end
				
			-- end
		end
	end
end

include("loot.lua")
include("inventory.lua")
include("db_convert.lua")


