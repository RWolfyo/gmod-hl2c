local PLAYER = FindMetaTable("Player")

local oldPrint = print

local function print(...)

end

function PLAYER:lootScrapChance(lootchance,luck,num,bool)
	local random = math.random(1,1000- luck)
	local legendary = 1070 - lootchance
	local epic = math.random(550,800) - lootchance
	local rare = 200 - lootchance
	
	if legendary < 20 then
		 legendary = 20
	end
	if epic < 15 then
		 epic = 15
	end
	if rare < 10 then
		 rare = 10
	end
	more_luck = self:GetCounter(6)
	
	local maximum = 1250 - luck - more_luck - lootchance
	if maximum < 2 then
		maximum = 2
	end
	local best_chance = math.random(1,maximum)
	if (legendary <= random and difficulty >= 2 and num > 2) or best_chance <= 1 and bool != true then
		Hl2c.DefaultChatPrint(tostring(self:Nick())..": got a Legendary Material",self)
		if DISCORD_LootLegendaryMaterial then DISCORD_LootLegendaryMaterial(self) end
		self:SetCounter(6,0)
		return "Scrap Legendary x1"
	elseif epic <= random and bool != true and num >=2 then
		return "Scrap Epic x"..tostring(math.random( 1,3 ) )
	elseif rare <= random and bool != true and num >=2 then
		return "Scrap Rare x"..tostring(math.random( 2,3+luck ) )
	else
		return "Scrap Common x"..tostring(math.random( 3,8+luck ) )
	end
	
end