NEXT_MAP = "d2_prison_07"	//Add Next Map

--Checkpoints
TRIGGER_CHECKPOINT = {
	{Vector(1415, 595, -192), Vector(1456, 757, -31)},
	{Vector(465, 182, 21), Vector(590, 28, 112),false,function() 
	ents.GetMapCreatedEntity(2286):Fire("Enable")
	timer.Simple(85,function()
	ents.GetMapCreatedEntity(1753):Fire("Unlock")
	ents.GetMapCreatedEntity(1753):Fire("Open","",1.0)
	ents.GetMapCreatedEntity(2285):Fire("SetAnimation","open",2.0)
	ents.GetMapCreatedEntity(2286):Fire("Disable","",3.0)
	ents.GetMapCreatedEntity(2286):Fire("Kill","",4.0)
	end)
	end},
	{Vector(271, -211, 0), Vector(352, -171, 121)},
	{Vector(476, -996, 0), Vector(516, -875, 121),false,function()
	ents.GetMapCreatedEntity(1420):Fire("Close")
	end}
}

--Old
--TRIGGER_DELAYMAPLOAD = {Vector(399, 412, 19), Vector(225, 274, 139)}

/*
Just going to PM you 2 positions on d2_prison_06
Ｂｏｔｔｌｅ４: they could be decent for vortices:
Ｂｏｔｔｌｅ４: setpos 1125.804321 493.030853 56.128815;        setpos 477.394501 295.996307 261.707642;
*/
-- VORTEX_POS = Vector(1125.804321, 493.030853, 56.128815)
VORTEX_POS = Vector(1131.477417, 101.978035, 295.031250)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
/*
	if GetConVarNumber("hl2c_additions") >= 1 then
		local music = ents.FindByName("antlion_fight_music")
		music[1]:Fire("addoutput", "message music/hl2_song29_02.mp3")
	end
*/
	for k, v in pairs(ents.FindByName("music_hl1_stinger_7")) do
		v:SetKeyValue("message", "music/stingers/hl1_stinger_song7.mp3")
	end
	
	-- ents.GetMapCreatedEntity(1866):Fire("addoutput","OnTrigger door_controlroom_1,Unlock,,43.0,-1")
	-- ents.GetMapCreatedEntity(1866):Fire("addoutput","OnTrigger door_controlroom_1,Open,,46.0,-1")
	-- ents.GetMapCreatedEntity(1866):Fire("addoutput","OnTrigger introom_door_1,SetAnimation,open,40.0,-1")
	-- ents.GetMapCreatedEntity(1866):Fire("addoutput","OnTrigger pClip_introom_door_1,Disable,,40.0,-1")
	-- ents.GetMapCreatedEntity(1866):Fire("addoutput","OnTrigger pClip_introom_door_1,Kill,,42.0,-1")
	-- ents.GetMapCreatedEntity(1866):Fire("addoutput","OnTrigger sprite_comblock_3,HideSprite,,42.0,-1")
		--aft = ents.Create("ai_goal_follow")
	--aft:SetPos(Vector(1065, 353, -631))
	--aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	--aft:SetKeyValue("actor", "alyx")
	--aft:SetKeyValue("goal", "!player")
	--aft:Spawn()
	
	--local timer = ents.Create( "logic_timer" )
	--timer:SetPos(Vector(1066, 353, -631))
	--timer:SetKeyValue( "RefireTime", "5" )
	--timer:SetKeyValue( "targetname", "hl2c_timer_follow" )
	--timer:SetKeyValue( "StartDisabled", "1" )
	--timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	--timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	--timer:Spawn()

	--local meetup = ents.FindByName("lcs_np_meetup02")
	--meetup[1]:Fire("addoutput", "OnCompletion hl2c_timer_follow,Enable,,0,1", "3.0")
	--meetup[1]:Fire("addoutput", "OnCompletion alyx,StopScripting,,5.0,1", "15.0")
	
	--local ele_drs = ents.FindByName("introom_elevator_doors_1")
	--for _, dr in pairs(ele_drs) do
	--	dr:Fire("addoutput", "OnClose hl2c_timer_follow,Disable,,0,-1")
	--	dr:Fire("addoutput", "OnClose hl2c_alyx_temp_follow,Disable,,0.5,-1")
	--end
	
	--local emp = ents.FindByName("logic_alyx_EMP_1")
	--emp[1]:Fire("addoutput", "OnTrigger hl2c_timer_follow,Enable,,3,-1")
	
	--local trig = ents.FindByName("Trigger_start_eli_scene_1")
	--trig[1]:Fire("addoutput", "OnTrigger hl2c_timer_follow,Disable,,0,-1")
	--trig[1]:Fire("addoutput", "OnTrigger hl2c_alyx_temp_follow,Disable,,0.5,-1")
	
	--local reunion = ents.FindByName("logic_start_reunion")
	--reunion[1]:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,1,-1")
	
	local tg_01 = ents.FindByName("elevator_path_3")
	tg_01[1]:Fire("addoutput", "OnPass force_alyx,Teleport,,3,-1")
	
	-------------------------------------
	-- 1464, 680, -136 
	-- FOR ALYX TELEPORT ----------------
	local tp_force_alyx = ents.Create("point_alyx_teleport")		//Here we create tp
	tp_force_alyx:SetKeyValue("targetname", "force_alyx")
	tp_force_alyx:SetPos(Vector( 1553.53, 676.43, -164,47 ))
	tp_force_alyx:Spawn()
	
	-------------------------------------
	-- 523, 229, 37
	-- FOR ALYX TELEPORT ----------------
	--local tp_last_alyx = ents.Create("point_alyx_teleport")		//Here we create tp
	--tp_last_alyx:SetKeyValue("targetname", "last_alyx")
	--tp_last_alyx:SetPos(Vector( 523, 229, -35 ))
	--tp_last_alyx:Spawn()
	--local trig02 = ents.FindByName("int_door_close_inside_1")
	--trig02[1]:Fire("addoutput", "OnTrigger last_alyx,Teleport,,1,-1")
	
	
	--local change = ents.Create("point_changelevel")
	--change:SetPos(Vector(-183, 855, -2446))
	--change:SetKeyValue("targetname", "hl2c_changelevel")
	--change:Spawn()
	--change:Activate()
	
end

HL2C_PET_LIKE_ANTLION = true

function MAPSCRIPT:PostPlayerSpawn(pl)

	--Give items
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