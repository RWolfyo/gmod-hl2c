local PLAYER = FindMetaTable("Player")

local oldPrint = print

local function print(...)

end

function PLAYER:lootLootChanceGear(lootchance,luck,num)
	local random = math.random(1,1000- luck)
	-- local legendary = 1300 - lootchance
	local epic = math.random(550,800) - lootchance
	local rare = 200 - lootchance
	-- if legendary < 20 then
		 -- legendary = 20
	-- end
	if epic < 150 then
		 epic = 150
	end
	if rare < 80 then
		 rare = 80
	end
	-- oldPrint("random: ".. random)
	-- oldPrint("legendary: ".. legendary)
	-- oldPrint("epic: ".. epic)
	-- oldPrint("rare: ".. rare)
	
	-- local legendary = math.Round(20000 / ( (lootchance) *luck))
	-- local epic = math.Round(250 / (lootchance*10))+1 +1 +1
	-- local rare = math.Round(10 / (lootchance*10))+1 + 1
	-- print(rare..epic..legendary)
	if luck <= 1 then luck = 1 end
	local group = player.GetCount()
	local more_luck = self:GetCounter(5) + math.Round(math.random(1+group,luck+group) )
	local maximum = 250
	local tbl = {}
	for i=1,1000 do
		tbl[i] = i
	end
	
	
	
	if difficulty >= 110 then
		maximum = 30 -  more_luck --- (lootchance/2.5) 
		tbl = {}
		for i=1,15 do
			tbl[i] = i
		end
	
	elseif difficulty >= 100 then
		maximum = 40 -  more_luck --- (lootchance/2.5) 
		tbl = {}
		for i=1,20 do
			tbl[i] = i
		end
	
	elseif difficulty >= 90 then
		maximum = 45 -  more_luck --- (lootchance/2.5) 
		tbl = {}
		for i=1,20 do
			tbl[i] = i
		end
	
	elseif difficulty >= 80 then
		maximum = 50 -  more_luck --- (lootchance/2.5) 
		tbl = {}
		for i=1,20 do
			tbl[i] = i
		end
	elseif difficulty >= 70 then
		maximum = 65 -  more_luck --- (lootchance/2.8) 
		tbl = {}
		for i=1,25 do
			tbl[i] = i
		end
	elseif difficulty >= 60 then
		maximum = 70 -  more_luck --- (lootchance/3) 
		tbl = {}
		for i=1,30 do
			tbl[i] = i
		end
	elseif difficulty >= 50 then
		maximum = 75 - more_luck --- (lootchance/4)
		tbl = {}
		for i=1,40 do
			tbl[i] = i
		end
	elseif difficulty >= 40 then
		maximum = 80 - more_luck --- (lootchance/5)
		tbl = {}
		for i=1,45 do
			tbl[i] = i
		end
	elseif difficulty >= 30 then
		maximum = 90 - more_luck --- (lootchance/6)
		tbl = {}
		for i=1,50 do
			tbl[i] = i
		end
	elseif difficulty >= 20 then
		maximum = 140 - more_luck
		tbl = {}
		for i=1,100 do
			tbl[i] = i
		end
	elseif difficulty >= 10 then
		maximum = 180 - more_luck
		tbl = {}
		for i=1,99 do
			tbl[i] = i
		end
	elseif difficulty >= 7 then
		maximum = 280 - more_luck
		tbl = {}
		for i=1,100 do
			tbl[i] = i
		end
	elseif difficulty >= 4.4 then
		maximum = 280 -  more_luck/2
		tbl = {}
		for i=1,99 do
			tbl[i] = i
		end
	elseif difficulty >= 2 then
		maximum = 300 -  more_luck/2
		tbl = {}
		for i=1,99 do
			tbl[i] = i
		end
	elseif difficulty >= 0.85 then
		maximum = 350 -  more_luck/2
		tbl = {}
		for i=1,100 do
			tbl[i] = i
		end
	end
	if maximum < 1 then
		maximum = 1
	end
	
	local last_chance = math.shuffle(tbl,#tbl)
	local last_max_roll = 1000 - luck - more_luck - lootchance
	-- local best_chance = math.random(1,maximum)
	-- oldPrint("LEGENDARY FINDING (".. maximum .."): ".. more_luck.." Luck: (".. luck ..") table[1] = (".. last_chance..")")
	if ( ( maximum <= math.random(1,10) ) or last_chance == 1) and self:GetNWBool("LEGENDARY_DROP") != true and ( num > 2 ) then
		-- databaseLootPrint("Gear Legendary")
		if DEV_MODE then 
			-- oldPrint("LEGENDARY FINDING (".. maximum .."): ".. more_luck.." Luck: (".. luck ..") table[1] = (".. last_chance..")")
		end
		
		self:SetNWBool("LEGENDARY_DROP",true)
		self:SetCounter(5,0)
		return "Gear Legendary"
	elseif epic <= random then
		self:SetNWBool("LEGENDARY_DROP",false)
		return "Gear Epic"
	elseif rare <= random then
	
		return "Gear Rare"
	else
		return "Gear Common"
	end
end

