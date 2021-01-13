INFO_PLAYER_SPAWN = {Vector(4435, 1211, 291), 0}

NEXT_MAP = "d3_c17_08"

TRIGGER_CHECKPOINT = {
/*
setpos 5319, 1292, 9
] getpos 
setpos 5437, 1452, 108

*/
	{Vector(5319, 1292, 9), Vector(5437, 1452, 108)},
	{Vector(7408, 1320, 20), Vector(7804, 1721, 156),false,function()
	
	Hl2c.CombineLoyalOver()
	end}
}
HL2_LUA_RUN_ONE = [[
Hl2c.CombineLoyal()
]]
HL2C_COMBINE_CLASS = "Soldier"

-- VORTEX_POS = Vector(7307.999023, 1740.763794, 213.494263)
VORTEX_POS = Vector(9020.439453, 1543.033691, 616.031250)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
----------------------------------------------------------------------------
------ Need to Teleport Alyx after door close Because Alyx can be nub ------
----------------------------------------------------------------------------
	local tp_force_alyx = ents.Create("point_alyx_teleport")		//Here we create tp
	tp_force_alyx:SetKeyValue("targetname", "force_alyx")
	tp_force_alyx:SetPos(Vector( 7715, 1743, 36 ))
	tp_force_alyx:Spawn()
	
	local tp_activator = ents.FindByName("success_relay")
	tp_activator[1]:Fire("addoutput", "OnTrigger force_alyx,Teleport,,5,-1")	//We need to add input on event
	
	local tp_last_alyx = ents.Create("point_alyx_teleport")		//Here we create tp
	tp_last_alyx:SetKeyValue("targetname", "last_force_alyx")
	tp_last_alyx:SetPos(Vector( 7825, 1820, 636 ))
	tp_last_alyx:Spawn()
	
	local tp_las_act = ents.FindByName("ss_alyx_climb")
	tp_las_act[1]:Fire("addoutput", "OnBeginSequence last_force_alyx,Teleport,,3,-1")
	tp_las_act[1]:Fire("addoutput", "OnBeginSequence lcs_rooftop,Start,,3.5,-1")	//We need to add input on event
	
	
	
	for k, v in pairs(ents.FindByName("lcs_pregate02a_song")) do
		v:SetKeyValue("message", "music/hl2_song31.mp3")
	end
	
	ents.GetMapCreatedEntity(1591):Fire("addoutput", "OnBeginSequence lr_comevevent_on,RunCode,,45.0,-1") // 1591 Combine Assault Start
	Hl2c.AddCombineLoyalSpawn( Vector(5576.178711, 1477.933472, 384.031250) )
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_comevevent_on")
	lua:SetKeyValue("Code", HL2_LUA_RUN_ONE)
	lua:Spawn()

end

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