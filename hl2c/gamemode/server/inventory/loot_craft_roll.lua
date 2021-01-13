local oldPrint = print

local function print(...)

end

function lootRollScrap(loot)
	local amount = 1
	local explode = string.Explode("x",loot)
	amount = explode[2]
	local box = {}
	local name = string.Explode(" ",loot)
	if math.random(1,5) >= 4 then
		local name = string.Explode(" ",loot)
		box ["name"] = "Scrap"
		box["scrap"] = true
		box["amount"] = tonumber(amount)
		
		box["rarity"] = string.lower(name[2])
		box["model"] = lootScrapModels(string.lower(name[2]))
	else
		// Drop Food Material Plz
		box["name"] = "Food"
		box["food"] = true
		box["amount"] = tonumber(amount)
		box["rarity"] = string.lower(name[2])
		box["model"] = lootFoodModels(string.lower(name[2]))
	end
	return box
end

function lootFoodModels(rarity)
	if rarity == "common" then
		return "models/props_outland/pumpkin01_explosive.mdl"
	elseif rarity == "rare" then
		return "models/gibs/antlion_gib_small_2.mdl"
	elseif rarity == "epic" then
		return "models/props_junk/garbage_metalcan001a.mdl"
	elseif rarity == "legendary" then
		return "models/props_junk/garbage_milkcarton002a.mdl"
	end
end

function lootScrapModels(rarity)
	if rarity == "common" then
		return "models/props_debris/wood_chunk04c.mdl"
	elseif rarity == "rare" then
		return "models/gibs/scanner_gib04.mdl"
	elseif rarity == "epic" then
		return "models/props_junk/ibeam01a_cluster01.mdl"
	elseif rarity == "legendary" then
		return "models/props_combine/tprotato2.mdl"
	end
end