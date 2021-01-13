NEXT_MAP = "d3_c17_07"

INFO_PLAYER_SPAWN = {Vector(1453.607910, 1558.671875, -191.968750),90}


TRIGGER_CHECKPOINT = {
	
{Vector(3152.031250, 1455.968750, 0.031250), Vector(3368.216064, 1169.342773, 90.940353),false,function()
 
ents.GetMapCreatedEntity(1689):Fire("Trigger","",30.0)
end},
{Vector(3537, 1539, 256), Vector(3616, 1581, 349)},
{Vector(3999.968750, 1168.031250, 384.031250), Vector(3803.460205, 1274.883423, 459.788849),false,function()

end}

}

TRIGGER_DELAYMAPLOAD = {Vector(5040, 1575, 75), Vector(5105, 1497, 174)}

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	-- for _, fdr in pairs(ents.FindByClass("func_door_rotating")) do
		-- if fdr:GetName() == "long_plank_1_rotator" then
			-- fdr:SetMoveType(0)
			-- fdr:SetAngles(fdr:GetAngles() + Vector(0, -45, 0))
		-- end
	-- end
	-- SetMaxLiveChildren 
	-- citizen_reinforcement_mkr
	-- citizen_reinforcement_mkr_medic
	ents.GetMapCreatedEntity(2001):Fire("SetMaxLiveChildren","1",1.0)
	ents.GetMapCreatedEntity(2935):Fire("SetMaxLiveChildren","1",1.0)
	

end

-- VORTEX_POS = Vector(4154.304199, 1750.763672, 544.031250)
VORTEX_POS = Vector(3964.835205, 896.637817, 802.540344)
function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_bugbait")
end

return MAPSCRIPT