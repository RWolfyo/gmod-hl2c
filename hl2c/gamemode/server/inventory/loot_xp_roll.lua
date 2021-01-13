function lootRollXP(loot)
	local amount = 1
	local explode = string.Explode("x",loot)
	amount = explode[2]
	local name = string.Explode(" ",loot)
	local box = {
		["name"] = "XP",
		["xp"] = "true",
		["amount"] = amount,
		["model"] = "models/tysn/tysn_obsidiancoin_smallpile.mdl"
	}
	-- PrintTable(box)
	return box
end