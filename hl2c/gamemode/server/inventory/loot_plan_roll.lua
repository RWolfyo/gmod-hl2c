
local oldPrint = print

local function print(...)
end

function lootRollPlan(loot)
	local drop = {}
	for i=1,#Hl2c.PlanRole do
		
		if loot == Hl2c.PlanRole[i].name then
			drop["name"] = loot
			drop["amount"] = 1
			drop["plan"] = "true"
			drop["rarity"] = "legendary"
			drop["model"] = Hl2c.PlanRole[i].model
			
		end
	end
	return drop
end