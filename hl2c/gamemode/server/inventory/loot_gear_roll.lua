local PLAYER = FindMetaTable("Player")

local oldPrint = print

local function print(...)

end

function PLAYER:lootRollGear(loot,luck,plan,plan_id)
	local random = math.random(1,5)
	local model = ""
	
	local star = ""
	
	if plan then
		loot = "Gear Legendary"
		luck = 1
		if plan_id == 1 then random = 3 end
		if plan_id == 2 then random = 1 end
		if plan_id == 3 then random = 2 end
		if plan_id == 4 then random = 5 end
	else
		if loot == "Gear Legendary" then
			self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_LEGENDARY")
		end
	end
	
	-- Special Chance to get Ranked 1 Legendaries 10%
	local chance_rank3 = 0
	local chance_rank2 = 0
	local chance_rank = 0
	if difficulty >= 110 then 
		chance_rank3 = chance_rank3 + 1
		chance_rank2 = chance_rank2 + 1
	end
	if difficulty >= 100 then 
		chance_rank3 = chance_rank3 + 1
		chance_rank2 = chance_rank2 + 1
	end
	if difficulty >= 90 then 
		chance_rank3 = chance_rank3 + 1
		chance_rank2 = chance_rank2 + 1
		chance_rank = chance_rank + 1
	end
	if difficulty >= 80 then 
		chance_rank2 = chance_rank2 + 1
		chance_rank = chance_rank + 1
	end
	if difficulty >= 70 then 
		chance_rank2 = chance_rank2 + 1
		chance_rank = chance_rank + 1
	end
	if difficulty >= 60 then 
		chance_rank2 = chance_rank2 + 1
		chance_rank = chance_rank + 1
	end
	if difficulty >= 50 then 
		chance_rank = chance_rank + 1
	end
	if difficulty >= 40 then 
		chance_rank = chance_rank + 1
	end
	if difficulty >= 30 then 
		chance_rank = chance_rank + 1
	end
	
	local ranked_1 = math.random(1,10-chance_rank) 
	--
	local rank = 0
	
	local dmg = 1
	-- ranked_1 = 1
	if loot == "Gear Legendary" then
		self:AddCounter(7,1)
		
		-- if DEV_MODE then oldPrint("RANK 1 FINDING:".. self:GetNWInt("customcounter_7") ) end
	end
	
	if (ranked_1 == 2 or self:GetNWInt("customcounter_7") >= 5) and loot == "Gear Legendary" then
		rank = 1
		
		self:AddCounter(8,1)
		
		
		
		
		-- oldPrint("RANK 2 FINDING:".. self:GetNWInt("customcounter_8") )
		if (math.random(2,10-chance_rank2) == 2) or self:GetNWInt("customcounter_8") >= 7 then
			self:SetCounter(8,0)
			self:AddCounter(9,1)
			rank = 2
		end
		if ((math.random(1,12-chance_rank3) == 2) or self:GetNWInt("customcounter_9") >= 10) and self:GetNWInt("customcounter_10") >= 100 then
			self:SetCounter(9,0)
			rank = 3
		end
		if rank == 1 then 
		-- if DEV_MODE then oldPrint("RANK 1 COUNTER SET 0") end
		self:SetCounter(7,0) end
		
	else
		--
	end
	
	-- random = 5
	-- rank = 2
	-- loot = "Gear Legendary"
	
	if random == 5 then
	
		local u = math.random(1,8)
		local name_tbl = {}
		name_tbl[1] = "Crowbar"
		name_tbl[2] = "Pistol"
		name_tbl[3] = "357"
		name_tbl[4] = "SMG1"
		name_tbl[5] = "AR2"
		name_tbl[6] = "Shotgun"
		name_tbl[7] = "Crossbow"
		name_tbl[8] = "RPG"
		local mdl_tbl = {}
		mdl_tbl[1] = "w_crowbar"
		mdl_tbl[2] = "w_pistol"
		mdl_tbl[3] = "w_357"
		mdl_tbl[4] = "w_smg1"
		mdl_tbl[5] = "w_irifle"
		mdl_tbl[6] = "w_shotgun"
		mdl_tbl[7] = "w_crossbow"
		mdl_tbl[8] = "w_rocket_launcher"
		
		name = name_tbl[u]
		model = "models/weapons/".. tostring(mdl_tbl[u]) ..".mdl"
		typo = "weapon"
		
		if loot == "Gear Common" then
			dmg = math.random(1,3)
		elseif loot == "Gear Rare" then
			dmg = math.random(3,6)
		elseif loot == "Gear Epic" then
			dmg = math.random(6,10)
		elseif loot == "Gear Legendary" then
			local bonus_dmg1 = 0
			local bonus_dmg2 = 0
			local szam = 4 - luck
			
			if szam < 2 then szam = 2 end
			
			if math.random(1,szam) <= 1 then
				bonus_dmg1 = math.random(1,13)
			end
				bonus_dmg2 = bonus_dmg1 + 1
			
			if rank == 1 then
				dmg = math.random(19,21 + bonus_dmg1 + bonus_dmg2)
			elseif(rank == 2) then
				dmg = math.random(49,51 + bonus_dmg1 + bonus_dmg2)
			elseif(rank == 3) then
				dmg = math.random(79,81 + bonus_dmg1 + bonus_dmg2)
			elseif(rank == 4) then
				dmg = math.random(109,111 + bonus_dmg1 + bonus_dmg2)
			elseif(rank == 5) then
				
				dmg = math.random(139,141 + bonus_dmg1 + bonus_dmg2)
			else
				dmg = math.random(11,18)
			end
		end
	
	elseif random == 1 then
		name = "Cop Mask"
		model = "models/BarneyHelmet_faceplate.mdl"
		typo = "helm"
	
	elseif random == 2 then
		name = "Shoes"
		model = "models/props_junk/shoe001a.mdl"
		typo = "boots"
	
	else
		model = "models/items/hevsuit.mdl"
		name = "Hev Suit"
		typo = "suit"
	end
	
	if rank >= 1 and loot == "Gear Legendary" then
		local szamol = 0
		for i=1,rank do
			name = name .. "★"
			star = star .. "★"
			szamol = szamol+1
		end
	end
	local gear = {}
	
		if loot == "Gear Common" then
			
			local afx = 1
			gear = {
			["name"] = name,
			["rarity"] = "common",
			[typo] = "true",
			["model"] = model,
			["amount"] = 1,
			["gear"] = "true",
			["afx"] = afx,
			["stat"] = self:lootGearRoll(loot)
			}
			-- return gear
		elseif loot == "Gear Rare" then
			local afx = 2
			gear = {
			["name"] = name,
			["rarity"] = "rare",
			["gear"] = "true",
			[typo] = "true",
			["amount"] = 1,
			["afx"] = afx,
			["model"] = model,
			["stat"] = self:lootGearRoll(loot)
			}
			-- return gear
		elseif loot == "Gear Epic" then
			local afx = 3
			gear = {
			["gear"] = "true",
			[typo] = "true",
			["name"] = name,
			["rarity"] = "epic",
			["amount"] = 1,
			["afx"] = afx,
			["model"] = model,
			["stat"] = self:lootGearRoll(loot)
			}
			-- return gear
		elseif loot == "Gear Legendary" then
			if plan != true then
				if rank >= 1 then
					if DISCORD_LootLegendaryGear then  
					DISCORD_LootLegendaryGear(self,rank) 
					
					end
					Hl2c.DefaultChatPrint(tostring(self:Nick())..": got a Legendary Gear ".. tostring(star).."",self)
					
				elseif rank == 0 then
					if DISCORD_LootLegendaryGear then  DISCORD_LootLegendaryGear(self,0) end
					Hl2c.DefaultChatPrint(tostring(self:Nick())..": got a Legendary Gear",self)
				end
			end
			
			local afx = math.random(3,5)
			gear = {
			["gear"] = "true",
			[typo] = "true",
			["name"] = name,
			["rarity"] = "legendary",
			["afx"] = afx,
			["model"] = model,
			["amount"] = 1,
			["stat"] = self:lootGearRoll(loot,rank)
			}
			-- return gear
		end
		
	if typo == "weapon" then
		gear["stat"]["absorb"] = nil
		gear["stat"]["dmg"] = dmg
	end
	
	return gear
end

function PLAYER:lootGearRoll(loot,rank)
	local rank = rank
	if rank and rank != nil and isnumber(rank) then
	
	end
	if rank == nil then rank = 0 end
	
	-- COMMON
	local atr = Hl2c.GearRole[1]

	-- RARE ROLES
	local atr_r = Hl2c.GearRole[2]

	-- EPIC ROLES
	local atr_e = Hl2c.GearRole[3]

	-- LEGENDARY ROLES
	local atr_l = Hl2c.GearRole[4+rank]

	
	local stat = {}
	local random1 = 0
	local random2 = 0
	local random3 = 0
	if loot == "Gear Common" then
		local random = math.random(1,3)
		
		stat[atr[random][1]] = math.random(atr[random][2],atr[random][3])
		return stat
	end
	if loot == "Gear Rare" then
		
		repeat
		random1 = math.random(1,3)
		random2 = math.random(1,3)
		until(random1 != random2)
		stat[atr_r[random1][1]] = math.random(atr_r[random1][2],atr_r[random1][3])
		stat[atr_r[random2][1]] = math.random(atr_r[random2][2],atr_r[random2][3])
		-- print(random1,random2)
		return stat
	end
	
	if loot == "Gear Epic" then
		
		repeat
		random1 = math.random(1,3)
		random2 = math.random(1,3)
		random3 = math.random(1,3)
		until(random1 != random2 and random1 != random3 and random3 != random2)
		stat[atr_e[random1][1]] = math.random(atr_e[random1][2],atr_e[random1][3])
		stat[atr_e[random2][1]] = math.random(atr_e[random2][2],atr_e[random2][3])
		stat[atr_e[random3][1]] = math.random(atr_e[random3][2],atr_e[random3][3])
		return stat
	end
	if loot == "Gear Legendary" then
		stat[atr_l[1][1]] = math.random(atr_l[1][2],atr_l[1][3])
		stat[atr_l[2][1]] = math.random(atr_l[2][2],atr_l[2][3])
		stat[atr_l[3][1]] = math.random(atr_l[3][2],atr_l[3][3])
		stat[atr_l[4][1]] = math.random(atr_l[4][2],atr_l[4][3])
		return stat
	end
end



function math.shuffle(tbl,max)
	-- local tbl = {}
	-- for i=1,20 do
		-- tbl[i] = "table_"..tostring(i)
	-- end
	local max = tonumber(max) or 20
	if max < 2 then
		max = 2
	end
	-- oldPrint(max)
	if tbl and tbl != nil and type(tbl) == "table" then
		
		
		for i=1,50 do
			-- math.randomseed(146.4546)
			math.random(1,max)
			local i1=math.random(1,max)
			math.random(1,max)
			-- math.randomseed(94124951415415491)
			local i2=math.random(1,max)
			
			local temp=tbl[i1]
			tbl[i1]=tbl[i2]
			tbl[i2]=temp
		end
		-- PrintTable(tbl)
		return tbl[2]
		
	end
	return nil
end

--
-- Name: math.randomnext( int )
--
-- Desc: You must put as arguement 1 an integer which is the size of an array.
--
function math.randomnext(count)
	if count and count != nil and type(count) == "number" then
		local min = 1
		local max = 1
		
		max = count
		if min == max then
			return math.random(min)
		end
		
		if min == max then
			return math.random(min)
		end
		if min > max then
			return math.random(min)
		end
		return math.random(min,max)
	else 
		return nil
	end
end	