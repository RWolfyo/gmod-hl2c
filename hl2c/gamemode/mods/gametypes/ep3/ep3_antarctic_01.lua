local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-6139.961426, -4542.305664, 1099.788696),0}

resource.AddWorkshop( "743294633" )

EP3_MAP = true
GAME_IS_EP3 = true

NEXT_MAP = "ep3_antarctic_02"

TRIGGER_CHECKPOINT = {
-- 2481, -1531, -1818	1907, -1565, -1912

	{Vector(7519.968750, 6688.485840, 3904.031250), Vector(7450.907715, 6901.618652, 3975.568848)}

}
TRIGGER_DELAYMAPLOAD = {Vector(7433, 7449, 3913), Vector(7535, 7655, 4029)}

VORTEX_POS = Vector(-3378.085205, 743.012451, 2292)

--hook.Add("InitPostEntity", "hl2cInitPostEntity", function()
-- 2050, -1093, -1854 
--end)

function MAPSCRIPT:InitPost()

	timer.Simple(0.5, function()
		for k, v in pairs(ents.FindByName("door_silo_2")) do
			v:Fire("addoutput", "OnFullyOpen Cp_01,Kill,,1,-1")
		end
	end)
	
end

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

return MAPSCRIPT