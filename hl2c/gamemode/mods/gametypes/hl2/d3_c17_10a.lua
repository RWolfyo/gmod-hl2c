INFO_PLAYER_SPAWN = {Vector(-3931, 6784, 5), 0}

NEXT_MAP = "d3_c17_10b"

-- VORTEX_POS = Vector(500.807434, 8214.206055, 341.277985)
VORTEX_POS = Vector(1457.145142, 3930.233154, 1258.354614)
local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["bldg1_door1_close_timer"] = true,
	["bldg1_door2_close_timer"] = true,
	["bldg2_door2_close_timer"] = true,
}

function MAPSCRIPT:InitPost()
	-- local barney_npc = ents.Create("npc_barney")
	-- barney_npc:SetPos(Vector(-4083, 6789, 48))
	-- barney_npc:SetKeyValue("additionalequipment", "weapon_ar2")
	-- barney_npc:SetKeyValue("targetname", "barney")
	-- barney_npc:SetKeyValue("spawnflags", "4")
	-- barney_npc:Spawn()
	-- barney_npc:Activate()
	
	if !game.SinglePlayer() then
	
		local nexusahead = ents.FindByName("barney_nexusahead_lcs_relay")
		nexusahead[1]:Fire("addoutput", "OnTrigger !self,Disable,,0,1")
		nexusahead[1]:Fire("addoutput", "OnTrigger barney_vista01_seq,BeginSequence,,0,1")
		
		local follow = ents.FindByName("barney_follow_goal")
		follow[1]:Fire("addoutput", "goal !player")
		
		local detected = ents.FindByName("detected_relay")
		detected[1]:Fire("addoutput", "OnTrigger hl2c_timer_follow,Enable,,0,-1")
		
		local time = ents.Create("logic_timer")
		time:SetPos(Vector(1066, 353, -631))
		time:SetKeyValue("RefireTime", "5")
		time:SetKeyValue("targetname", "hl2c_timer_follow")
		time:SetKeyValue("StartDisabled", "1")
		time:Fire("addoutput", "OnTimer barney_follow_goal,Deactivate,,0.0,-1", "1")
		time:Fire("addoutput", "OnTimer barney_follow_goal,Activate,,0.1,-1", "1")
		time:Spawn()
		
		local door_timer = ents.FindByName("bldg1_door1_close_timer")
		door_timer[1]:Remove()
		
		local door_timer = ents.FindByName("bldg1_door2_close_timer")
		door_timer[1]:Remove()
		
		local door_timer = ents.FindByName("bldg2_door2_close_timer")
		door_timer[1]:Remove()
	
	end
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