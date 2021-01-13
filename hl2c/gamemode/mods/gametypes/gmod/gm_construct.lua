local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

--INFO_PLAYER_SPAWN = {Vector(901.798889, -726.365601, -79.968750), 0}
--INFO_PLAYER_SPAWN = {Vector(826.836487, -460.932312, -79.968750), 0}
INFO_PLAYER_SPAWN = {Vector(828.424194, 31.645962, -79.968750), 0}
--INFO_PLAYER_SPAWN = {Vector(826.057556, 300.568604, -79.968750), 0}
--INFO_PLAYER_SPAWN = {Vector(822.749756, 676.464050, -79.968750), 0}

ALLOWED_VEHICLE = "Van"

/*
setpos 901.798889, -726.365601, -79.968750
 
setpos 826.836487, -460.932312, -79.968750

setpos 828.424194, 31.645962, -79.968750

setpos 826.057556, 300.568604, -79.968750

setpos 822.749756, 676.464050, -79.968750

*/

RESET_PL_INFO = true

NEXT_MAP = "gm_construct"

--HL2MP_IS_COOP_MAP = true

TRIGGER_CHECKPOINT = {
	-- {Vector(-7999, 5480, 32), Vector(-7837, 5520, 153)},
	-- {Vector(-6729, 5492, -100), Vector(-6645, 5844, 66)}
	--{Vector(4558, 4183, -6343), Vector(4713, 3992, -6239)}
}

TRIGGER_DELAYMAPLOAD = {Vector(29.855606, 200.385712, -1912600.927734), 
						Vector(29.855606, 210.385712, -1913600.927734)}

DISABLE_CUSTOM_WEAPON = false
HL2C_COMBINE_CLASS = "Soldier"

MAPSCRIPT.EntityFilterByName = {
	
}
MAPSCRIPT.EntityFilterByClass = {
	
}

MAPSCRIPT.InputFilters = {
	
}

function MAPSCRIPT:EntityRemoved(ent)

end

function MAPSCRIPT:KeyValue(ent, key, value)

end

function MAPSCRIPT:InitPost()
	local ent = ents.Create("info_player_combine")
	ent:SetPos(Vector(1378.294800, -1310.706787, 1339.039185))
	ent:Spawn()
	ent:Activate()
	
	local ent = ents.Create( "hl2c_follow_system" )
	ent:SetPos(Vector(0,0,0))
	ent:SetKeyValue("targetname", "follow_ent")
	ent:SetKeyValue("FollowerClass", "npc_citizen")
	ent:Spawn()
	ent:Activate()
	
	DbgPrint("-- MapScript Loaded --")
	
	-- local trigger = ents.Create("trigger_teleport_hl2c")
	-- trigger.max = Vector(705.597351, -1152.800415, -44.845592)
	-- trigger.min = Vector(836.739868, -1023.783691, -213.653275)
	-- trigger:SetTargetPos(Vector(0,0,0))
	-- trigger:SetTeleportClass("npc_alyx")
	-- trigger:SetKeyValue("spawnflags","2")
	-- trigger:Spawn()
	
	local trigger = ents.Create("trigger_die_hl2c")
	trigger.max = Vector(705.597351, -1152.800415, -44.845592)
	trigger.min = Vector(836.739868, -1023.783691, -213.653275)
	-- trigger:SetTargetPos(Vector(0,0,0))
	-- trigger:SetTeleportClass("npc_alyx")
	trigger:SetKeyValue("spawnflags","1")
	trigger:Spawn()
	
	/*
	local point = ents.Create("point_trigger_hl2c")
	point:SetPos(Vector(699.858276, -323.227875, -143.968750))
	point:SetKeyValue("TriggerRadius", 60)
	point:SetKeyValue("targetname", "test_ent")
	point:Spawn()
	*/
	
	-- local cage_playerclip = ents.Create("func_brush")
	-- cage_playerclip:SetPos(Vector(754.406616, -1093.301270, -113.665710))
	-- cage_playerclip:SetModel("*106")
	-- cage_playerclip:SetKeyValue("spawnflags", "2")
	-- cage_playerclip:Spawn()
	-- cage_playerclip:Activate()
	-- cage_playerclip:Fire("Enable")
	-- cage_playerclip:SetNoDraw(false)
end
//-- hook.Add("InitPostEntity", "hl2cInitPostEntity", function() end )


function MAPSCRIPT:PostPlayerSpawn(pl)
	if IsValid(pl) then else return end
	HL2C_COMBINE_EVENT = true
	if pl:Team() == TEAM_ALIVE then
	//-- pl:PrintMessage(HUD_PRINTTALK, "[Combine] Be loyal! ( !combine )")
	Hl2c.PersonDefaultChatPrint("[Combine] Be loyal! ( !combine )",pl)
	end
	if pl:Team() == TEAM_ALIVE then
		pl:Give("weapon_physgun")
		pl:Give("weapon_physcannon")
		pl:Give("weapon_crowbar")
		pl:Give("weapon_pistol")
		pl:Give("weapon_smg1")
		pl:Give("weapon_medkit_hl2c")
		pl:Give("weapon_frag")
		pl:Give("weapon_357")
		pl:Give("weapon_shotgun")
		pl:Give("weapon_ar2")
		pl:Give("weapon_rpg")
		pl:Give("weapon_crossbow")
	end
	
	

end

return MAPSCRIPT