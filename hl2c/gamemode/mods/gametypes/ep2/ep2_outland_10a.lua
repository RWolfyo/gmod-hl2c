local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(5086.307129, -5940.163574, -1475.854492),0}

ALLOWED_VEHICLE = "Van"

NEXT_MAP = "ep2_outland_11"

TRIGGER_CHECKPOINT = {
-- 2481, -1531, -1818	1907, -1565, -1912
	{Vector(2481, -1531, -1818), Vector(1907, -1565, -1912)}
}
--TRIGGER_DELAYMAPLOAD = {Vector(2247, -413, -1899), Vector(2644, -493, -1852)}

--hook.Add("InitPostEntity", "hl2cInitPostEntity", function()
-- 2050, -1093, -1854 
--end)

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")

end
-- 5025.91 -5700.95 -1533.26

function MAPSCRIPT:KeyValue(ent, key, value)
	if IsValid(ent) and
	key == "origin" and
	value == "5025.91 -5700.95 -1533.26"
	then
	--print("\nFOUND ALYX CHECK FAIL RELAY\n")
		--timer.Simple(3, function()
			if IsValid(ent) then
				-- print("\nFOUND ALYX CHECK FAIL RELAY\n")
				ent:Remove()
			end
		--end)
	end
end

return MAPSCRIPT