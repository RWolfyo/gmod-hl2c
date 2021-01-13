INFO_PLAYER_SPAWN = {Vector(-2199.18, 768.49, 640.03), 90}

NEXT_MAP = "winter_lobby_2012"

RESET_WEAPONS = true

SUPER_GRAVITY_GUN = true

BRUSH_PLAYERFREEZE = {
	{Vector(14055, 14920, 15000), Vector(14055, 14900, 15000)},
}

TRIGGER_CHECKPOINT = {

	{Vector(-1890, -58, 1344), Vector(-1849, 63, 1465), false, function() end},

	{Vector(-761, -121, -242), Vector(-602, 166, -96), false, function() 
	ALLOW_GRAVGUN = true 
	end},
	
	{Vector(-500, -526, 1349), Vector(-790, -362, 1371)}
}

BRUSH_PLAYERCLIP = {

	{Vector(-2356, 588, 585), Vector(-2238, 212, 762)},
	{Vector(-2301, 372, 613), Vector(-2307, 366, 578)}
}

-- VORTEX_POS = Vector(-1950.813599, 912.149780, 807.346252)
VORTEX_POS = Vector(117.371178, 102.800240, 1347.031250)
local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["blackout_viewcontroller"] = true,
	["ss_playerarm_arrival"] = true,
	["fade_breen_wins"] = true,
	["trigger_gameover_toplevelfallmessage"] = true,
	-- ["logic_playerExitPod"] = true,
}

D3_BREEN_01_MAP_BEGIN_CAM = D3_BREEN_01_MAP_BEGIN_CAM or NULL
D3_BREEN_01_MAP_BEGIN = D3_BREEN_01_MAP_BEGIN or true


local function EndPod()
	D3_BREEN_01_MAP_BEGIN = false
end

D3_BREEN_01_LR = [[
EndPod()
]]

function MAPSCRIPT:InitPost()
	-- if !game.SinglePlayer() then
	local blackout_viewcontroller = ents.FindByName("blackout_viewcontroller")
	blackout_viewcontroller[1]:Remove()
	
	--local blackout_prop = ents.FindByName("blackout")
	--blackout_prop[1]:Remove()
	
	--local view_gman = ents.FindByName("view_gman_end_1")
	--view_gman[1]:Remove()
	
	--local view_lamarr = ents.FindByName("viewcontrol_lamarr")
	--view_lamarr[1]:Remove()
	
	local ss_player = ents.FindByName("ss_playerarm_arrival")
	ss_player[1]:Remove()
	
	local del_breen_wins = ents.FindByName("fade_breen_wins")
	del_breen_wins[1]:Remove()
	
	local trigger_gameover_del = ents.FindByName("trigger_gameover_toplevelfallmessage")
	trigger_gameover_del[1]:Remove()
	
	--local clipv_player = ents.FindByName("clipv_playergetup")
	--clipv_player[1]:Remove()
	--change:SetKeyValue("targetname", "hl2c_changelevel")
	
	--local destination_knock01 = ents.FindByName("teleport_breen_blast_1")
	--destination_knock01[1]:SetKeyValue("spawnflags", "0")
	
	--local logic_killclip = ents.FindByName("logic_fade_view")
	--logic_killclip[1]:Fire("addoutput", "OnTrigger")
	--destination_knock01[1]:Remove()
	
	ents.WaitForEntityByName("lcs_gman_out",function(ent)
		ent:Fire("addoutput", "OnTrigger8 hl2c_changelevel,Changelevel,,20,-1")
	end)
	--logic_playerExitPod
	ents.WaitForEntityByName("logic_playerExitPod",function(ent)
	-- local logic_playerExitPod = ents.FindByName("logic_playerExitPod")
	ent:Remove()
	end)
	
	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()
	
	--local keep_door_open = ents.FindByName("ss_soldier_Deliver_4")
	--keep_door_open[1]:Fire("addoutput", "OnEndSequence Breen_blast_door_1,Open,,0.3,-1")
	--keep_door_open[1]:Fire("addoutput", "OnEndSequence Breen_blast_door_1,Open,,0.31,-1")
	--keep_door_open[1]:Fire("addoutput", "OnEndSequence Breen_blast_door_1,Open,,0.32,-1")
	--keep_door_open[1]:Fire("addoutput", "OnEndSequence Breen_blast_door_1,Open,,0.33,-1")
	

	--timer.Simple(5, function()
	
	local _playerExitPod = ents.Create("logic_relay")
	_playerExitPod:SetPos(Vector(-2424, 632, 710))
	_playerExitPod:SetKeyValue("spawnflags", "0")
	_playerExitPod:SetKeyValue("StartDisabled", "0")
	_playerExitPod:SetKeyValue("targetname", "logic_playerExitPod")
	_playerExitPod:Fire("addoutput", "OnTrigger pod,Unlock,,0.65,-1")
	_playerExitPod:Fire("addoutput", "OnTrigger pod,Unlock,,0.65,-1")
	_playerExitPod:Fire("addoutput", "OnTrigger timer_camera_enable,Kill,,0,-1")
	_playerExitPod:Fire("addoutput", "OnTrigger playerpod_camera,Disable,,0,-1")
	_playerExitPod:Spawn()
	_playerExitPod:Activate()
	

	-- D3_BREEN_01_MAP_BEGIN_CAM = ents.Create("point_viewcontrol")
	-- D3_BREEN_01_MAP_BEGIN_CAM:SetPos(Vector(-2438, -1386, 156))
	-- D3_BREEN_01_MAP_BEGIN_CAM:SetKeyValue("angles", "0 0 0")
	-- D3_BREEN_01_MAP_BEGIN_CAM:SetKeyValue("wait", "10")
	-- D3_BREEN_01_MAP_BEGIN_CAM:SetKeyValue("spawnflags", "44")
	-- D3_BREEN_01_MAP_BEGIN_CAM:SetKeyValue("acceleration", "500")
	-- D3_BREEN_01_MAP_BEGIN_CAM:SetKeyValue("deceleration", "500")
	-- D3_BREEN_01_MAP_BEGIN_CAM:SetKeyValue("targetname", "playerpod_camera")
	-- D3_BREEN_01_MAP_BEGIN_CAM:Spawn()
	-- D3_BREEN_01_MAP_BEGIN_CAM:Activate()
	
	local camera = ents.Create("point_viewcontrol")
	camera:SetPos(Vector(-2438, -1386, 156))
	camera:SetKeyValue("angles", "0 0 0")
	camera:SetKeyValue("wait", "10")
	camera:SetKeyValue("spawnflags", "44")
	camera:SetKeyValue("acceleration", "500")
	camera:SetKeyValue("deceleration", "500")
	camera:SetKeyValue("targetname", "playerpod_camera")
	camera:Spawn()
	camera:Activate()
	

	local _auto = ents.Create("logic_auto")
	_auto:SetPos(Vector(-2464.44, -1463, 143.335))
	_auto:SetKeyValue("spawnflags", "1")
	_auto:Fire("addoutput", "OnMapSpawn playerpod_camera,SetParent,pod,0,-1")
	_auto:Fire("addoutput", "OnMapSpawn playerpod_camera,SetParentAttachment,vehicle_driver_eyes,0.2,-1")
	_auto:Spawn()	
	_auto:Activate()	

	local _timer_camera_enable = ents.Create("logic_timer")
	_timer_camera_enable:SetPos(Vector(-2493.77, -1463, 143.335))
	_timer_camera_enable:SetKeyValue("targetname", "timer_camera_enable")
	_timer_camera_enable:SetKeyValue("RefireTime", "1")
	--_timer_camera_enable:Fire("addoutput", "OnTimer player,use,button_enable_camera,0,-1", "5")
	--_timer_camera_enable:Fire("addoutput", "OnTimer player,button_enable_camera,use,0,-1", "5")
	--_timer_camera_enable:Fire("addoutput", "OnTimer player,say,hi,0,-1")
	_timer_camera_enable:Fire("addoutput", "OnTimer playerpod_camera,enable,,0.0,-1", "5")
	-- _timer_camera_enable:Fire("addoutput", "OnTimer player,SetParent,pod,0.0,-1", "5")
	-- _timer_camera_enable:Fire("addoutput", "OnTimer player,SetParentAttachment,vehicle_driver_eyes,0.2,-1", "5")
	--_timer_camera_enable:Fire("addoutput", "OnTimer playerpod_camera,SetParent,pod,0,-1")
	--_timer_camera_enable:Fire("addoutput", "OnTimer playerpod_camera,SetParentAttachment,vehicle_driver_eyes,0.2,-1")
	_timer_camera_enable:Spawn()
	_timer_camera_enable:Activate()
	--end)
	
	--local _button_enable_camera = ents.Create("func_button")
	--_button_enable_camera:SetPos(Vector(-2493.77, -1463, 143.335))
	--_button_enable_camera:SetKeyValue("targetname", "button_enable_camera")
	--_button_enable_camera:SetKeyValue("spawnflags", "1056")
	--_button_enable_camera:Fire("addoutput", "OnPressed playerpod_camera,enable,,0,-1")
	--_button_enable_camera:Fire("addoutput", "OnTimer player,playerpod_camera,enable,0,-1", "5")
	--_timer_camera_enable:Spawn()
	--_button_enable_camera:Activate()
	
	
	/*
	d3_breen_01
{
    Remove
    {
        ClassName
        {
            "player_loadsaved" {}
            "trigger_weapon_strip" {}
            "env_message" {}
            "info_player_start" {}
            "trigger_changelevel" {}
        }
        TargetName
        {
            "citadel_scene_br_start" {}
            "teleport_breen_blast_1" {}
            "blackout_viewcontroller" {}
            "path_lift_control_2" {}
            "logic_playerExitPod" {}
            "relay_breenwins" {}
            "relay_consoleareacleanup" {}
            "relay_riftcleanup" {}
            "trigger_gameover_toplevelfallmessage" {}
            "logic_ending_credits" {}
            "menu" {}
        }
        Origin
        {
            "256 0 -576" {}
            "-672 0 -128" {}
        }
    }
    Add
    {
        "path_track"
        {
            "target" "path_lift_control_1"
            "orientationtype" "1"
            "angles" "0 0 0"
            "targetname" "path_lift_control_2"
            "radius" "0"
            "speed" "100"
            "OnPass" "relation_soldier_player_like,RevertRelationship,,1,-1"
            "OnPass" "Train_lift_TP,Resume,,0.1,1"
            "OnPass" "Train_lift_TP,Stop,,0,-1"
            "OnPass" "teleport_breen_into_pod,Teleport,,0,1"
            "OnPass" "timer_relations,Kill,,0,-1"
            "origin" "-1056 464 -264"
        }
        "logic_relay"
        {
            "spawnflags" "0"
            "StartDisabled" "0"
            "targetname" "logic_playerExitPod"
            "OnTrigger" "pod,Unlock,,0.65,-1"
            "OnTrigger" "pod,Open,,0,-1"
            "OnTrigger" "timer_camera_enable,Kill,,0,-1"
            "OnTrigger" "playerpod_camera,Disable,,1,-1"
            "origin" "-2424 632 710"
        }
        "logic_relay"
        {
            "spawnflags" "0"
            "targetname" "relay_breenwins"
            "OnTrigger" "citadel_beam_teleportarc,TurnOff,,7,-1"
            "OnTrigger" "citadel_sound_rift_crack1,PlaySound,,5,-1"
            "OnTrigger" "Train_main_lift,Kill,,4.5,-1"
            "OnTrigger" "Breen,Kill,,4.5,-1"
            "OnTrigger" "citadel_model_breenballrings,Kill,,4.5,-1"
            "OnTrigger" "citadel_model_breenballconsole*,Kill,,4.5,-1"
            "OnTrigger" "citadel_beam_teleportarc,TurnOn,,5,-1"
            "OnTrigger" "lost_text1,Display,,5,-1"
            "OnTrigger" "citadel_scene_br_taunt4,Start,,2,-1"
            "OnTrigger" "countdown,StopCountdown,,0,-1"
            "OnTrigger" "lcs_al_fail_no,Start,,0,-1"
            "OnTrigger" "fade_blast_1,Fade,,4.4,-1"
            "OnTrigger" "lost_text2,Display,,5,-1"
            "OnTrigger" "end_fade,Fade,,4,-1"
            "OnTrigger" "reload,Command,changelevel d3_breen_01,10,-1"
            "origin" "-592 96 1344"
        }
        "logic_relay"
        {
            "targetname" "logic_ending_credits"
            "StartDisabled" "0"
            "spawnflags" "48"
            "OnTrigger" "intro_outro_fx_1,Deactivate,,0,-1"
            "OnTrigger" "end_fade2,Fade,,0,-1"
            "OnTrigger" "end_credits1,Display,,1,-1"
            "OnTrigger" "end_credits2,Display,,2,-1"
            "OnTrigger" "logic_lamarr,Trigger,,6,-1"
            "origin" "14064 14865.8 14960"
        }
        "point_viewcontrol"
        {
            "angles" "0 0 0"
            "wait" "10"
            "spawnflags" "44"
            "acceleration" "500"
            "deceleration" "500"
            "targetname" "playerpod_camera"
            "origin" "-2438 -1386 156"
        }
        "logic_auto"
        {
            "spawnflags" "1"
            "OnMapSpawn" "playerpod_camera,SetParent,pod,0,-1"
            "OnMapSpawn" "playerpod_camera,SetParentAttachment,vehicle_driver_eyes,0.2,-1"
            "origin" "-2464.44 -1463 147.753"
        }
        "logic_timer"
        {
            "targetname" "timer_camera_enable"
            "RefireTime" "1"
            "OnTimer" "playerpod_camera,Enable,,0,-1"
            "origin" "-2493.77 -1463 143.335"
        }
        "logic_timer"
        {
            "RefireTime" "1"
            "targetname" "timer_relations"
            "OnTimer" "relation_soldier_player_like,ApplyRelationship,,0,-1"
            "origin" "-2487.1 -1463 174.606"
        }
        "info_player_deathmatch"
        {
            "angles" "0 90 0"
            "targetname" "spawn1"
            "origin" "-1614 413 577"
        }
        "info_player_deathmatch"
        {
            "angles" "0 90 0"
            "targetname" "spawn1"
            "origin" "-1743.31 406.298 577"
        }
        "info_player_deathmatch"
        {
            "angles" "0 180 0"
            "targetname" "spawn1"
            "origin" "-1621.57 549.478 577"
        }
        "info_player_deathmatch"
        {
            "angles" "0 60 0"
            "targetname" "spawn1"
            "origin" "-2194.49 372.339 577"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn1"
            "origin" "-2384.45 593.237 577"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn1"
            "origin" "-2332.25 729.428 577"
        }
        "info_player_deathmatch"
        {
            "angles" "0 90 0"
            "targetname" "spawn2"
            "StartDisabled" "1"
            "origin" "-1001.85 -123.843 1345"
        }
        "info_player_deathmatch"
        {
            "angles" "0 90 0"
            "targetname" "spawn2"
            "StartDisabled" "1"
            "origin" "-1102.8 -131.447 1345"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn2"
            "StartDisabled" "1"
            "origin" "-1989.46 2.90475 1345"
        }
        "info_player_deathmatch"
        {
            "angles" "0 90 0"
            "targetname" "spawn2"
            "StartDisabled" "1"
            "origin" "-1805.5 -34.1399 1345"
        }
        "info_player_deathmatch"
        {
            "angles" "0 90 0"
            "targetname" "spawn2"
            "StartDisabled" "1"
            "origin" "-1626.83 -34.8062 1345"
        }
        "info_player_deathmatch"
        {
            "angles" "0 90 0"
            "targetname" "spawn2"
            "StartDisabled" "1"
            "origin" "-1489 -31 1345"
        }
        "info_player_deathmatch"
        {
            "angles" "0 304 0"
            "targetname" "spawn3"
            "StartDisabled" "1"
            "origin" "-720.596 151.645 -255"
        }
        "info_player_deathmatch"
        {
            "angles" "0 225 0"
            "targetname" "spawn3"
            "StartDisabled" "1"
            "origin" "-563.782 159.634 -255"
        }
        "info_player_deathmatch"
        {
            "angles" "0 180 0"
            "targetname" "spawn3"
            "StartDisabled" "1"
            "origin" "-559.613 58.9424 -255"
        }
        "info_player_deathmatch"
        {
            "angles" "0 180 0"
            "targetname" "spawn3"
            "StartDisabled" "1"
            "origin" "-550.753 -53.013 -255"
        }
        "info_player_deathmatch"
        {
            "angles" "0 180 0"
            "targetname" "spawn3"
            "StartDisabled" "1"
            "origin" "-551.459 -170.126 -255"
        }
        "info_player_deathmatch"
        {
            "angles" "0 180 0"
            "targetname" "spawn3"
            "StartDisabled" "1"
            "origin" "-550 -351 -255"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn4"
            "StartDisabled" "1"
            "origin" "-790.82 -89.724 1281"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn4"
            "StartDisabled" "1"
            "origin" "-800.262 95.4671 1281"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn4"
            "StartDisabled" "1"
            "origin" "-736.094 178.36 1281"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn4"
            "StartDisabled" "1"
            "origin" "-738.97 -166.744 1281"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn4"
            "StartDisabled" "1"
            "origin" "-603.629 172.792 1281"
        }
        "info_player_deathmatch"
        {
            "angles" "0 0 0"
            "targetname" "spawn4"
            "StartDisabled" "1"
            "origin" "-600.96 -179.773 1281"
        }
        "env_fade"
        {
            "duration" "2"
            "renderamt" "255"
            "rendercolor" "0 0 0"
            "targetname" "end_fade"
            "holdtime" "999"
            "spawnflags" "0"
            "origin" "-759 144.071 1444.4"
        }
        "game_text"
        {
            "x" "-1"
            "y" "-1"
            "color" "255 0 0"
            "color2" "240 110 0"
            "fadein" "1.5"
            "fadeout" "0.5"
            "holdtime" "5"
            "fxtime" "0.25"
            "channel" "1"
            "targetname" "lost_text1"
            "spawnflags" "1"
            "message" "Breen escaped!"
            "origin" "-759 152.502 1506.41"
        }
        "game_text"
        {
            "x" "-1"
            "y" "0.6"
            "color" "255 0 0"
            "color2" "240 110 0"
            "fadein" "1.5"
            "fadeout" "0.5"
            "holdtime" "5"
            "fxtime" "0.25"
            "channel" "2"
            "targetname" "lost_text2"
            "spawnflags" "1"
            "message" "You lost!"
            "origin" "-759 159.693 1477.58"
        }
        "game_text"
        {
            "channel" "1"
            "color" "255 255 255"
            "color2" "240 110 0"
            "fadein" "1.5"
            "fadeout" "0.5"
            "fxtime" "0.25"
            "holdtime" "5"
            "message" "Half-Life 2 By Valve"
            "spawnflags" "1"
            "targetname" "end_credits1"
            "x" "-1"
            "y" "-1"
            "origin" "272.027 -1964.12 -1007"
        }
        "game_text"
        {
            "channel" "2"
            "color" "255 255 255"
            "color2" "240 110 0"
            "fadein" "1.5"
            "fadeout" "0.5"
            "fxtime" "0.25"
            "holdtime" "5"
            "message" "Coop Mapadd Scripts By W0rf0x"
            "spawnflags" "1"
            "targetname" "end_credits2"
            "x" "-1"
            "y" "0.6"
            "origin" "272 -1948 -1007"
        }
        "point_servercommand"
        {
            "targetname" "reload"
            "origin" "-759 148.176 1557.71"
        }
        "game_end"
        {
            "targetname" "end"
            "origin" "-759 178.698 1571.34"
        }
        "env_fade"
        {
            "duration" "1"
            "renderamt" "255"
            "rendercolor" "0 0 0"
            "targetname" "end_fade2"
            "holdtime" "5"
            "spawnflags" "0"
            "origin" "-759 183.776 1532.66"
        }
        "info_teleport_destination"
        {
            "angles" "0 90 0"
            "StartDisabled" "0"
            "targetname" "teleport1_target"
            "origin" "-1002 -123.843 1385"
        }
        "info_teleport_destination"
        {
            "angles" "0 90 0"
            "StartDisabled" "0"
            "targetname" "teleport1_target"
            "origin" "-1102.95 -131.447 1385"
        }
        "info_teleport_destination"
        {
            "angles" "0 90 0"
            "StartDisabled" "0"
            "targetname" "teleport1_target"
            "origin" "-1489.15 -31 1385"
        }
        "info_teleport_destination"
        {
            "angles" "0 90 0"
            "StartDisabled" "0"
            "targetname" "teleport1_target"
            "origin" "-1626.98 -34.8062 1385"
        }
        "info_teleport_destination"
        {
            "angles" "0 90 0"
            "StartDisabled" "0"
            "targetname" "teleport1_target"
            "origin" "-1805.65 -34.1399 1385"
        }
        "info_teleport_destination"
        {
            "angles" "0 0 0"
            "StartDisabled" "0"
            "targetname" "teleport1_target"
            "origin" "-1989.61 2.90475 1385"
        }
        "point_teleport"
        {
            "angles" "0 0 0"
            "radius" "587"
            "spawnflags" "2048"
            "targetname" "teleport1"
            "TeleportDestination" "teleport1_target"
            "origin" "-1912 631 599"
        }
        "info_teleport_destination"
        {
            "angles" "0 304 0"
            "StartDisabled" "0"
            "targetname" "teleport2_target"
            "origin" "-720.596 151.011 -226"
        }
        "info_teleport_destination"
        {
            "angles" "0 225 0"
            "StartDisabled" "0"
            "targetname" "teleport2_target"
            "origin" "-563.782 159 -226"
        }
        "info_teleport_destination"
        {
            "angles" "0 180 0"
            "StartDisabled" "0"
            "targetname" "teleport2_target"
            "origin" "-559.613 58.3084 -226"
        }
        "info_teleport_destination"
        {
            "angles" "0 180 0"
            "StartDisabled" "0"
            "targetname" "teleport2_target"
            "origin" "-550.753 -53.647 -226"
        }
        "info_teleport_destination"
        {
            "angles" "0 180 0"
            "StartDisabled" "0"
            "targetname" "teleport2_target"
            "origin" "-551.459 -170.76 -226"
        }
        "info_teleport_destination"
        {
            "angles" "0 180 0"
            "StartDisabled" "0"
            "targetname" "teleport2_target"
            "origin" "-550 -351.634 -226"
        }
        "point_teleport"
        {
            "angles" "0 0 0"
            "radius" "610"
            "spawnflags" "2048"
            "targetname" "teleport2"
            "TeleportDestination" "teleport2_target"
            "origin" "-1450 -8 1353"
        }
    }
    Modify
    {
        ClassName
        {
            "worldspawn"
            {
                "mapversion" "13"
            }
        }
        TargetName
        {
            "Breen_Teleport"
            {
                "radius" "128"
            }
            "teleport_breen_into_pod"
            {
                "radius" "128"
                "spawnflags" "2048"
            }
            "logic_EMP_plead_door_1"
            {
                "OnTrigger" "spawn1,Disable,,0,-1"
                "OnTrigger" "spawn2,Enable,,0,-1"
                "OnTrigger" "teleport1,Enable,,0,-1"
            }
            "brush_plead_shield_1"
            {
                "spawnflags" "0"
            }
            "teleport_player_gman_1"
            {
                "radius" "128"
            }
            "teleport_gman_2"
            {
                "radius" "128"
            }
            "SS_lamarr"
            {
                "OnBeginSequence" "point_viewcontrol,Disable,,7,-1"
                "OnBeginSequence" "reload,Command,sv_ep1searchpath 1,3,1"
                "OnBeginSequence" "reload,Command,changelevel ep1_citadel_00,8,1"
                "OnBeginSequence" "end,Endgame,,9,-1"
            }
*/
	/*
	local BreenOffice01 = ents.FindByName("lcs_BreenOffice01")
	for k, v in pairs(BreenOffice01) do
			v:Fire("addoutput", "OnTrigger1 tp_p01,Teleport,,0,-1")
	end
	
	local BreenOffice02 = ents.FindByName("lcs_BreenOffice02")
	for k, v in pairs(BreenOffice02) do
			--v:Fire("addoutput", "OnTrigger tp_p01,Teleport,,0,-1")
	end
	
	local BreenOffice03 = ents.FindByName("lcs_BreenOffice03")
	for k, v in pairs(BreenOffice03) do
			--v:Fire("addoutput", "OnTrigger tp_p01,Teleport,,0,-1")
	end
	
	local BreenOffice03b = ents.FindByName("lcs_BreenOffice03b")
	for k, v in pairs(BreenOffice03b) do
			--v:Fire("addoutput", "OnTrigger tp_p01,Teleport,,0,-1")
	end
	
	local BreenOffice04 = ents.FindByName("lcs_BreenOffice04")
	for k, v in pairs(BreenOffice04) do
			--v:Fire("addoutput", "OnTrigger tp_p01,Teleport,,0,-1")
	end
	
	local BreenOffice05 = ents.FindByName("lcs_BreenOffice05")
	for k, v in pairs(BreenOffice05) do
			--v:Fire("addoutput", "OnTrigger tp_p01,Teleport,,0,-1")
	end

	local tp_p01 = ents.Create("point_hl2cteleport")
	tp_p01:SetPos(Vector(-2447, -1489, 955))
	tp_p01:SetKeyValue("targetname", "tp_p01")
	tp_p01:Spawn()
	tp_p01:Activate()
	
	local tp_p02 = ents.Create("point_hl2cteleport")
	tp_p02:SetPos(Vector(-2250, 383, 613))
	tp_p02:SetKeyValue("targetname", "tp_p02")
	tp_p02:Spawn()
	tp_p01:Activate()
	
	local tp_p03 = ents.Create("point_hl2cteleport")
	tp_p03:SetPos(Vector(-2128, 530, 613))
	tp_p03:SetKeyValue("targetname", "tp_p03")
	tp_p03:Spawn()
	tp_p01:Activate()
	
	local tp_p04 = ents.Create("point_hl2cteleport")
	tp_p04:SetPos(Vector(-1808, 621, 613))
	tp_p04:SetKeyValue("targetname", "tp_p04")
	tp_p04:Spawn()
	tp_p01:Activate()
	
	local tp_p05 = ents.Create("point_hl2cteleport")
	tp_p05:SetPos(Vector(-2198, 785, 613))
	tp_p05:SetKeyValue("targetname", "tp_p05")
	tp_p05:Spawn()
	tp_p01:Activate()
	
	local tp_p06 = ents.Create("point_hl2cteleport")
	tp_p06:SetKeyValue("targetname", "tp_p06")
	tp_p06:SetPos(Vector(-2451, -1469, 648))
	tp_p06:Spawn()
	tp_p01:Activate()
	*/
	
	
	
	local envG5 = ents.Create("env_global")
		envG5:SetPos(Vector(-150, 100, -150))
		envG5:SetKeyValue("targetname", "hl2c_super_phys_gun")
		envG5:SetKeyValue("globalstate", "super_phys_gun")
		envG5:SetKeyValue("initialstate", "2")
		envG5:Spawn()
		envG5:Activate()
		-- envG5:Fire("turnoff", "", "1.0")
		envG5:Fire("TurnOn", "", "5.0")
		envG5:Fire("kill", "", "6.0")
	
	for k, v in pairs(ents.FindByName("song_breen_01_hallway")) do
		v:SetKeyValue("message", "music/hl1_song26.mp3")
	end
	
	for k, v in pairs(ents.FindByName("song3")) do
		v:SetKeyValue("message", "music/hl2_song3.mp3")
	end
	
	for k, v in pairs(ents.FindByName("hl1_song25")) do
		v:SetKeyValue("message", "music/hl1_song25_remix3.mp3")
	end
	
	for k, v in pairs(ents.FindByName("music_finalelevator")) do
		v:SetKeyValue("message", "music/hl1_song6.mp3")
	end
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	-- if D3_BREEN_01_MAP_BEGIN then
		-- D3_BREEN_01_MAP_BEGIN_CAM:Fire("Enable")
	-- elseif D3_BREEN_01_MAP_BEGIN_CAM then
	-- D3_BREEN_01_MAP_BEGIN_CAM:Fire("Disable")
		
	-- end
	ents.WaitForEntityByName("timer_camera_enable",function(ent)
		ent:Fire("Enable")
	end)
	if ALLOW_GRAVGUN then
	pl:Give("weapon_physcannon")
	end
end

return MAPSCRIPT