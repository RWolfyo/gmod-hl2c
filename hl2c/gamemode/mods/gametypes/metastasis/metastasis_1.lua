INFO_PLAYER_SPAWN = { Vector(-1117.244629, 1833.009766, 110.061646), 0}
--INFO_PLAYER_SPAWN = {Vector( 5024, -5952, -53 ), 0}

NEXT_MAP = "metastasis_2"

TRIGGER_CHECKPOINT = {

	{Vector(775.489319, 1945.253540, 271.620850), 
	Vector(1004.679688, 1557.942505, 372.663086),false,function() end,
	Vector(924.503601, 1883.161865, 288.974243)},
	

	{Vector(368.031250, 1769.503296, -343.968750), Vector(505.482239, 1929.918213, -254.261093)
	,true,function() end,
	Vector(482.467712, 1859.880371, -271.704926)},

	
	{Vector( -427, 134, -351 ), Vector( -387, -7, -253 )},
	{Vector( 127, 152, -643 ), Vector( 17, -19, -549 )}
	
}
/*
setpos 1901.4, 94.6, 238.8
] getpos 
setpos 1774.8, 141, 330.6
*/
TRIGGER_DELAYMAPLOAD = {Vector( 53, -282, -646 ), Vector( -45, -335, -546 )}

METASTASIS_MAP = true

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
}

VORTEX_POS = Vector(1009.376770, 2091.968750, 523.031250)

function MAPSCRIPT:InitPost()
	
	for k, v in pairs(ents.FindByClass("item_suit")) do
		v:Remove()
	end
	
	for k, v in pairs(ents.FindByName("intro-heli-npc")) do
		v:Remove()
	end
	for k, v in pairs(ents.FindByName("intro-heli-maker")) do
		v:Remove()
	end
	
	for k, v in pairs(ents.FindByClass("npc_helicopter")) do
		v:Remove()
	end
	
	
	local auto = ents.Create("logic_auto") 
	auto:SetKeyValue("spawnflags", "1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies-spawn,Kill,,0.2,-1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies,Kill,,0.3,-1")
	auto:Spawn()
	auto:Activate()
end

function MAPSCRIPT:PostPlayerSpawn(pl)

	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
		if IsValid(pl) then
			pl:SetAmmo(150, "Pistol")
		end
	pl:Give("weapon_crowbar")

end

return MAPSCRIPT