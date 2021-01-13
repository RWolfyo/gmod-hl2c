local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(444, -7274, 3482),0}

resource.AddWorkshop( "743294633" )

EP3_MAP = true
GAME_IS_EP3 = true

NEXT_MAP = "ep3_borealis_01"

TRIGGER_CHECKPOINT = {
-- 2481, -1531, -1818	1907, -1565, -1912
	{Vector(883, 383, 2735), Vector(1306, -62, 2907)}
}
TRIGGER_DELAYMAPLOAD = {Vector(1128, 472, 2737), Vector(1207, 428, 2823)}

--hook.Add("InitPostEntity", "hl2cInitPostEntity", function()
-- 2050, -1093, -1854 
--end)

VORTEX_POS = Vector(23.031897, 553.244812, 2407.826904)

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
	hl2c_auto:Fire("addoutput", "OnMapSpawn rot_but2,Kill,,0.3,-1")
	hl2c_auto:Fire("addoutput", "OnMapSpawn rot_but2,Kill,,0.3,-1")
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