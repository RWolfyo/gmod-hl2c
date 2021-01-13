local PLAYER = FindMetaTable("Player")

function PLAYER:lootPlanChance()
	local random = math.random(5,8)
	local plan = nil
	if self:GetPlan(random) != 1 then
		plan = Hl2c.PlanRole[random].name
		self:AddAchi("ACHIEVEMENT_EVENT_GEN_LOOT_PLAN")
	end
	
	for i=1, #Hl2c.PlanRole do
		if plan == nil and self:GetPlan(i) != 1  then
			plan = Hl2c.PlanRole[i].name
			break
		end
	end
	-- return Hl2c.PlanRole[random].name
	if plan == nil then plan = false end
	return plan
end