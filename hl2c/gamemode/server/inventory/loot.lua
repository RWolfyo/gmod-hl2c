PLAN_LOOT_MODE = true

local PLAYER = FindMetaTable("Player")

local oldPrint = print

local function print(...)

end


include("loot_gear.lua")
include("loot_gear_roll.lua")
include("loot_craft.lua")
include("loot_craft_roll.lua")
include("loot_xp.lua")
include("loot_xp_roll.lua")
include("loot_progress.lua")
include("loot_plan.lua")
include("loot_plan_roll.lua")

function PLAYER:lootLoot(num)
	local luck = math.Round( (self:GetNWInt("PSTAT_LUCK")/10 + self:GetNWInt("ISTAT_LUCK") ) )
	
	local lootchance = difficulty
	if lootchance < 1 then lootchance = 1 end
	local roll_luck = luck
	local lootrate = math.Round( lootchance )
	
	-- if lootchance >= 30 then 
		-- lootchance = lootchance + (luck*math.Round(lootchance/10))
	-- elseif lootchance >= 20 then 
	-- lootchance = lootchance + (math.Round(luck*1.1))
	-- elseif lootchance >= 10 then
		-- lootchance = lootchance + (math.Round(luck*1.1))
	
	-- elseif lootchance >= 7 then
		-- lootchance = lootchance + 2 + luck
	-- elseif lootchance >= 4 then
		-- lootchance = lootchance + 1
	-- end
	
	local roll = math.random(1,11)
	
	
	local loot = "NONE"
	-- local roll_min = 10 - math.Round(roll_luck) - math.Round(lootchance/10)
	-- local roll_max = (14 - math.Round(roll_luck) - math.Round(lootchance/10) ) -- + self:GetNWInt("LOOT_GEAR")
	-- if roll_min < 6 then
		-- roll_min = 6
	-- end
	-- if roll_max < 12 then
		-- roll_max = 12
	-- end
	
	--
	--	Can Roll Gear.
	--
	-- if (roll >= math.random(roll_min,roll_max) and num > 2 and self:GetNWBool("LOOT_GEAR_DONE") != true) and self:inventoryHasSpace() then
	if ( roll % 2 == 0 and num > 2 and self:GetNWBool("LOOT_GEAR_DONE") != true) and self:inventoryHasSpace() and false then
		
		if num < 3 then lootchance = 1
		else
			-- lootchance = lootchance + math.Round( (difficulty *(num/100)),1 ) + luck
		end
		
		
		-- self:SetNWInt("LOOT_GEAR",1 + self:GetNWInt("LOOT_GEAR"))
		-- loot = self:lootLootChanceGear(lootchance,luck,num)
		-- self:SetNWBool("LOOT_GEAR_DONE",true)
	
	--
	-- Can Roll Plan
	--
	-- elseif (math.random(1,100) % 88-luck == 0 and num >= 3) and self:lootPlanChance() != false then
	
		-- loot = self:lootPlanChance()
		-- oldPrint(loot)
	--
	-- Can Roll Material
	--
	elseif (math.random(2,4) % 3 == 0 and num != 2) or num == 1 then
		
		
		loot = self:lootScrapChance(lootchance,luck,num,self:GetNWBool("LOOT_FORCECOMMON_MAT"))
		-- self:SetNWInt("LOOT_GEAR",0)
		-- self:SetNWBool("LOOT_GEAR_DONE",false)
	--
	-- Last Roll Xp.
	--
	else
	
		loot = self:lootPermaChance()
		-- self:SetNWInt("LOOT_GEAR",0)
		-- self:SetNWBool("LOOT_GEAR_DONE",false)
		
		-- oldPrint(loot)
	end
	self:AddCounter(6,1)
	self:AddCounter(5,1)
	if difficulty >= 90 then self:AddCounter(10,1) 
		if self:GetCounter(10) >= 100 and self:GetAchi("ACHIEVEMENT_EVENT_GEN_LOOT_100S3") != 1 then 
			self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_100S3")
		end 
	end
	
	-- loot = self:lootPlanChance()
	
	local box = {}
	box = self:lootRollCheck(loot,luck)
	self:AddCounter(11,1)
	
	/*
	"ACHIEVEMENT_EVENT_GEN_LOOT_LOOT10",
	[36]="ACHIEVEMENT_EVENT_GEN_LOOT_LOOT100",
	[37]="ACHIEVEMENT_EVENT_GEN_LOOT_LOOT1000",
	[38]="ACHIEVEMENT_EVENT_GEN_LOOT_LOOT100000",
	[39]="ACHIEVEMENT_EVENT_GEN_LOOT_LOOT1000000",
	[40]="ACHIEVEMENT_EVENT_GEN_LOOT_LOOT10000000",*/
	
	if self:GetCounter(11) >= 10 then
		self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_LOOT10")end
	if self:GetCounter(11) >= 100 then
		-- oldPrint("hello?")
		self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_LOOT100")end
	if self:GetCounter(11) >= 1000 then
		self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_LOOT1000")end
	if self:GetCounter(11) >= 10000 then
		self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_LOOT10000") end
	if self:GetCounter(11) >= 100000 then
		self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_LOOT100000") end
	if self:GetCounter(11) >= 1000000 then
		self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_LOOT1000000")
	end
	return box
	
end

function PLAYER:lootRollCheck(loot,luck)
	local box = {}
	-- print(loot)
	if string.Left(loot,4) == "Gear" then
		return self:lootRollGear(loot,luck)
	elseif string.Left(loot,4) == "PLAN" then
		-- print(loot)
		return lootRollPlan(loot)
	elseif string.Left(loot,2) == "XP" then
		return lootRollXP(loot)
	elseif string.Left(loot,5) == "Scrap" then
		-- print(loot)
		return lootRollScrap(loot)
		
	end
	-- print(loot)
	-- local amount = 1
	-- local explode = string.Explode("x",loot)
	-- amount = explode[2]
	-- local name = string.Explode(" ",loot)
	-- local box = {["name"] = loot,
				-- [string.lower(name[1])] = true,
				-- ["amount"] = amount
				-- }
	-- if box["scrap"] then
		-- box["rarity"] = string.lower(name[2])
		-- box["model"] = lootScrapModels(string.lower(name[2]))
	-- end
	return box
end









function PLAYER:databaseLoot()
	-- if lootLoot() then end
	self:lootBoxDrop()
end




-- databaseLoot


function PLAYER:databaseLootPrint(lootname)
	-- Hl2c.DefaultChatPrint("[LOOT - ".. self:Nick() .."]: "..tostring(lootname))
	-- print("[LOOT]: "..tostring(lootname))
	-- Hl2c.PersonDefaultChatPrint("[LOOT]: "..tostring(lootname),self)
end



function PLAYER:lootBoxDrop()
	local PROGRESS,prog = lootProgress(self)
	local points = 1000 + PROGRESS
	local drop = 0
	drop = points / 1000
	-- print(drop)
	if drop < 1 then return end
	if drop >= 1 then 
		drop = tostring(drop)
		
		local text = string.Explode(".",drop)
		drop = tonumber(text[1])
		-- print("Number of Points: "..drop)
	end
	if drop > 8 then
		drop = 8
	end
	lootCreateLoot(self,drop, prog or {} )

end

util.AddNetworkString("Hl2c.Loot.MapEnd.Reward")

function lootCreateLoot(pl,drop,prog)

	local loot = {}
	for i=1,drop do
		-- print("loot: "..lootLoot())
		loot[i] = pl:lootLoot(i)
		-- print(loot[i].amount)
		-- PrintTable(loot[i])
		local amount = loot[i].amount or 1
		
		if loot[i].gear == "true" then
			pl:inventoryAddItem(loot[i])
		end
		if loot[i].plan == "true" then
			pl:inventoryAddItem(loot[i])
		end
		
		if loot[i].scrap == "true" then
			
			if loot[i].rarity == "common" then
				pl:inventoryAddScrap(1,amount)
			end
			if loot[i].rarity == "rare" then
				pl:inventoryAddScrap(2,amount)
			end
			if loot[i].rarity == "epic" then
				pl:inventoryAddScrap(3,amount)
			end
			if loot[i].rarity == "legendary" then
				pl:inventoryAddScrap(4,amount)
			end
		end
		
		if loot[i].food == "true" then
			
			if loot[i].rarity == "common" then
				-- oldPrint("Working?")
				pl:inventoryAddFood(5,amount)
			end
			if loot[i].rarity == "rare" then
				-- oldPrint("Working?")
				pl:inventoryAddFood(6,amount)
			end
			if loot[i].rarity == "epic" then
				-- oldPrint("Working?")
				pl:inventoryAddFood(7,amount)
			end
			if loot[i].rarity == "legendary" then
				-- oldPrint("Working?")
				pl:inventoryAddFood(8,amount)
			end
		end
		
		if loot[i].xp == "true" then
			local xp = tonumber(loot[i].amount)
			if i <= 2 then
				xp = math.Round(xp / difficulty)
				
			end
			if xp < 1 then
				xp = 1
			end
			loot[i].amount = xp

			if xp then
				pl:AddXP(xp)
			end
		end
		
	end
	
	if DEV_MODE then
		-- oldPrint("Legendary Finding Gear:", pl:GetCounter(5))
		-- oldPrint("Legendary Finding Material:", pl:GetCounter(6))
	end
	net.Start("Hl2c.Loot.MapEnd.Reward")
		net.WriteTable(loot)
		net.WriteTable(prog)
	net.Send(pl)
end

function lootBoxDrop(ply)
	
	local points = 8000
	local drop = 0
	drop = points / 1000
	
	if drop < 1 then return end
	if drop >= 1 then 
		drop = tostring(drop)
		
		local text = string.Explode(".",drop)
		drop = tonumber(text[1])
		
	end
	if drop > 8 then
		drop = 8
	end
	if IsValid(ply) then
		if ply.setup_achi and (DEV_MODE or ply:SteamID() == "STEAM_0:1:4782422") then
			local PROGRESS,prog = lootProgress(ply)
			lootCreateLoot(ply,drop,prog)
		end
	elseif !IsValid(ply) then
		for _,pl in pairs(player.GetAll() ) do
			if pl.setup_achi and (DEV_MODE or pl:SteamID() == "STEAM_0:1:4782422") then
				local PROGRESS,prog = lootProgress(pl)
				lootCreateLoot(pl,drop,prog)
			end
		end	
	end
	
end


function lootAddInventory()
end







// INVENTORY

