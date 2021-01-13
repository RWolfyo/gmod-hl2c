local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(7489, 7360, 3936),0}

resource.AddWorkshop( "743294633" )

EP3_MAP = true
GAME_IS_EP3 = true

NEXT_MAP = "ep3_antarctic_03"

TRIGGER_CHECKPOINT = {
-- 2481, -1531, -1818	1907, -1565, -1912
	{Vector(6788, 9430, 3844), Vector(6676, 9343, 3950)}
}
TRIGGER_DELAYMAPLOAD = {Vector(1656, 12006, 3465), Vector(1796, 12038, 3568)}

--hook.Add("InitPostEntity", "hl2cInitPostEntity", function()
-- 2050, -1093, -1854 
--end)

--stuff

VORTEX_POS = Vector(1745.178833, 11107.492188, 3243.928955)

function MAPSCRIPT:InitPost()
	timer.Simple(0.5, function()
		for k, v in pairs(ents.FindByName("stuff")) do
			v:Remove()
		end
	end)
	local hl2c_auto = ents.Create("logic_auto")
	hl2c_auto:SetPos(Vector(776, 2592, 333.524))
	hl2c_auto:SetKeyValue( "spawnflags", "1" )
	hl2c_auto:Fire("addoutput", "OnMapSpawn stuff,Kill,,0.3,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn stuff,Kill,,0.5,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn point_template,Kill,,0.5,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn stuff,Kill,,0.6,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn prop_door_silo_3,Kill,,0.3,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn door_silo_3,Kill,,0.3,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn clip,Kill,,0.3,-1")
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