local PLAYER = FindMetaTable("Player")

function PLAYER:lootPermaChance()
	local xp = "XP x1"
	local calc = 1

	if difficulty > 12 then
		calc = math.random(6,10)
		xp = "XP x".. util.TypeToString(calc) ..""
		-- return xp

	elseif difficulty > 4 then
		calc = math.random(3,5)
		xp = "XP x".. util.TypeToString(calc) ..""
		-- return xp
	elseif difficulty >= 1 then
		calc = math.random(1,3)
		xp = "XP x".. util.TypeToString(calc) ..""
		-- return xp
	
	else
		calc = 1
		xp = "XP x".. util.TypeToString(calc) ..""
		-- return xp
	end
	-- print( util.TypeToString(calc) )
	return xp
end