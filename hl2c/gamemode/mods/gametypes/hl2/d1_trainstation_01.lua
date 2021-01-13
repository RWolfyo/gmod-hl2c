local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-14576, -14208, -1264), 90}
//INFO_PLAYER_SPAWN = {Vector(-5853, -1962.81, -31), 90}

NEXT_MAP = "d1_trainstation_02"

RESET_PL_INFO = true

PLAYER_IS_CITIZEN = true

TARGET_TELEPORT_HL2C = "barneyroom_door_cop_1"

POINT_TRIGGER_DEBUG = true

BRUSH_PLAYERFREEZE = {
	{Vector(-14576, -14208, -1291), Vector(-14452, -14329, -1163)},
}

TRIGGER_CHECKPOINT = {
	{Vector(-9386, -2488, 24), Vector(-9264, -2367, 92), true},
	{Vector(-5396, -1984, 16), Vector(-5310, -1932, 113)},
	{Vector(-4012, -551, -32), Vector(-4004, -472, 62)},
	{Vector(-3607, -368, -17), Vector(-3273, -141, 86)},
	{Vector(-3427, -118, -32), Vector(-3417, -13, 62)}
}

GAME_STARTED = false

-- VORTEX_POS = Vector(-5139.758301, -1003.363525, 272.513977)
VORTEX_POS = Vector(-9978.893555, -3279.185059, 3.031250)


function MAPSCRIPT:EntityRemoved(ent)
	if game.SinglePlayer() then return end
	if ent:GetClass() == "info_target" then
		if !GAME_STARTED then
	
			GAME_STARTED = true
			local hl2c_auto = ents.Create("logic_auto")
			hl2c_auto:SetKeyValue("spawnflags", "1")
			hl2c_auto:Fire("addoutput", "OnMapSpawn hl2c_wait_text,Kill,,0,-1")
			hl2c_auto:Fire("addoutput", "OnMapSpawn hl2c_text_timer,Kill,,0,-1")
			hl2c_auto:Fire("addoutput", "OnMapSpawn startintro_relay,Trigger,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn cam_relay_*,Trigger,,0,-1")
			--hl2c_auto:Fire("addoutput," "OnMapSpawn cam_relay_*,Trigger,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn light_end,TurnOff,,6.1,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn light_tracktrain,TurnOff,,6.1,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn viewcontrol_black,Enable,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn intro_music,PlaySound,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn starfield_logic_start_sparse,Trigger,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn scene1_start,Trigger,,6,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn intro_version3,Activate,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn credits_go,ShowLogo,,0,-1")
			--hl2c_auto:Fire("addoutput", "OnMapSpawn intro_version3,FadeTo,255 0.01,0,-1")
			hl2c_auto:Spawn()
			hl2c_auto:Activate()
	
		end
	end
	/*
	"spawnflags" "1"
	"classname" "logic_auto"
	connections
	{
		"OnNewGame" "light_end,TurnOff,,6.1,-1"
		"OnNewGame" "light_tracktrain,TurnOff,,6.1,-1"
		"OnNewGame" "viewcontrol_black,Enable,,6,-1"
		"OnNewGame" "intro_music,PlaySound,,6,-1"
		"OnNewGame" "starfield_logic_start_sparse,Trigger,,6,-1"
		"OnNewGame" "scene1_start,Trigger,,6,-1"
		"OnNewGame" "intro_version3,Activate,,0,-1"
		"OnNewGame" "credits_go,ShowLogo,,0,-1"
		"OnNewGame" "intro_version3,FadeTo,255 0.01,0,-1"
		
	}*/

end

function MAPSCRIPT:InitPost()
	-- if game.SinglePlayer() then return end
	
	-- Block players from escaping control gate.
	-- local cage_playerclip = ents.Create("func_brush")
	-- cage_playerclip:SetPos(Vector(-4226.9350585938, -417.03271484375,-31.96875))
	-- cage_playerclip:SetModel("*68")
	-- cage_playerclip:SetKeyValue("spawnflags", "2")
	-- cage_playerclip:Spawn()
	-- cage_playerclip:SetNoDraw(false)

	
	local hl2c_startintro_relay = ents.Create("logic_relay")
	hl2c_startintro_relay:SetKeyValue("targetname", "startintro_relay")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger light_tracktrain,TurnOff,,6.1,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger light_end,TurnOff,,6.1,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger scene1_start,Trigger,,6.1,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger starfield_logic_start_sparse,Trigger,,6.1,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger intro_music,PlaySound,,6,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger viewcontrol_black,Enable,,6.1,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger intro_version3,FadeTo,255 0.01,6,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger credits_go,ShowLogo,,0,-1")
	hl2c_startintro_relay:Fire("addoutput", "OnTrigger intro_version3,Activate,,0,-1")
	hl2c_startintro_relay:SetPos(Vector(-14016, -14232, -1291))
	hl2c_startintro_relay:Spawn()
	hl2c_startintro_relay:Activate()
	
	
	local hl2c_auto_del = ents.FindInSphere( Vector(-14112, -13824, -1140), 1 )
	hl2c_auto_del[1]:Remove()
	
	local game_starter = ents.Create("info_target")
	game_starter:SetKeyValue("targetname", "killmeplz")
	game_starter:SetPos(Vector(0, 0, 0))
	game_starter:Spawn()
	game_starter:Activate()
	
	
	local hl2c_wait_txt = ents.Create("game_text")
	hl2c_wait_txt:SetKeyValue("channel", "1")
	hl2c_wait_txt:SetKeyValue("color", "100 100 100")
	hl2c_wait_txt:SetKeyValue("color2", "240 110 0")
	hl2c_wait_txt:SetKeyValue("effect", "2")
	hl2c_wait_txt:SetKeyValue("fadein", "0.01")
	hl2c_wait_txt:SetKeyValue("fadeout", "1.5")
	hl2c_wait_txt:SetKeyValue("fxtime", "0.25")
	hl2c_wait_txt:SetKeyValue("holdtime", "3.5")
	hl2c_wait_txt:SetKeyValue("message", "Game Starts Soon...")
	hl2c_wait_txt:SetKeyValue("spawnflags", "1")
	hl2c_wait_txt:SetKeyValue("targetname", "hl2c_wait_text")
	hl2c_wait_txt:SetKeyValue("x", "-1")
	hl2c_wait_txt:SetKeyValue("y", "-1")
	hl2c_wait_txt:SetPos(Vector(-14000, -14200, -1291))
	hl2c_wait_txt:Spawn()
	hl2c_wait_txt:Activate()
	--hl2c_wait_txt:Fire("Display", "", "0")
	
	local hl2c_timer = ents.Create("logic_timer")
	hl2c_timer:SetKeyValue("RefireTime", "5")
	hl2c_timer:SetKeyValue("targetname", "hl2c_text_timer")
	hl2c_timer:Fire("addoutput", "OnTimer hl2c_wait_text,Display,,5,-1")
	hl2c_timer:Spawn()
	hl2c_timer:Activate()	
	
	for k, v in pairs(ents.FindByName("viewcontrol_left_eye")) do
		v:SetAngles( Angle(0, 90, 0) )
	end
	
	for k, v in pairs(ents.FindByName("viewcontrol_mouth")) do
		v:SetAngles( Angle(0, 90, 0) )
	end
	
	for k, v in pairs(ents.FindByName("viewcontrol_left_cheek")) do
		v:SetAngles( Angle(0, 90, 0) )
	end
	
	local tp = ents.Create("target_tp")
	tp:SetPos(Vector(-3568,-416,11))
	tp:SetKeyValue("targetname", "doorcop_tp01")
	tp:Spawn()
	
	local tp = ents.Create("point_barney_teleport")
	tp:SetPos(Vector(-3464,-388,27))
	tp:SetKeyValue("targetname", "barney_tp01")
	tp:Spawn()
	
	local tp = ents.Create("point_hl2cteleport")
	tp:SetPos(Vector(-3520,-351,20))
	tp:SetKeyValue("targetname", "player_tp01")
	tp:Spawn()
	
	local point_t = ents.Create("point_trigger")
	--	xmasstar_physics
	point_t:SetPos(Vector(-3468, -527, 1))
	-- point_t:SetKeyValue("origin", "-3468 -527 1")
	point_t:SetKeyValue("targetname", "debug_point_trigger")
	point_t:SetKeyValue("spawnflags", "2")
	point_t:SetKeyValue("StartDisabled", "0")
	point_t:SetKeyValue("TriggerRadius", "50")
	point_t:SetKeyValue("TriggerOnce", "1")
	--point_t:Fire("addoutput", "OnStartTouch !self,Kill,,0.1,1")
	point_t:Fire("addoutput", "OnStartTouch barneyroom_door_cop_1,StartScripting,,3.0,1")
	point_t:Fire("addoutput", "OnStartTouch logic_comblock_1,Trigger,,3.0,1")
	point_t:Fire("addoutput", "OnStartTouch barney_door_2,Unlock,,5.9,-1")
	point_t:Fire("addoutput", "OnStartTouch barney_door_2,Open,,6.0,-1")
	point_t:Fire("addoutput", "OnStartTouch barney_ss_2,BeginSequence,,5.0,1")
	point_t:Fire("addoutput", "OnStartTouch doorcop_tp01,Teleport,,5.8,1")
	point_t:Fire("addoutput", "OnStartTouch barney_door_2_slot,SetAnimation,open,6.0,-1")
	point_t:Fire("addoutput", "OnStartTouch barney_door_2_slot,SetAnimation,close,16.0,-1")
	point_t:Fire("addoutput", "OnStartTouch barney_tp01,Teleport,,14.0,-1")
	point_t:Fire("addoutput", "OnStartTouch player_tp01,Teleport,,14.0,-1")
	point_t:Spawn()
	point_t:Activate()
	/*
	"OnCompletion" "security_intro_01b,Start,,0,-1"
	"OnTrigger3" "barney_door_2_slot,SetAnimation,close,1,-1"
	"OnTrigger3" "barney_door_2_slot,SetAnimation,open,0,-1"
	"OnTrigger2" "barney_ss_2,BeginSequence,,0,-1"
	"OnTrigger1" "barney_door_2,Open,,0.1,-1"
	"OnTrigger1" "barney_door_2,Unlock,,0,-1"
	"OnStart" "barneyroom_door_cop_1,StartScripting,,0,-1"
	"OnTrigger1" "logic_comblock_1,Trigger,,0,-1"
	*/
	
	local getpl = ents.Create("point_hl2cteleport")
	getpl:SetPos(Vector(-4200,-516,42))
	getpl:SetKeyValue("targetname", "plget")
	getpl:Spawn()
	getpl:Activate()
	
	for k, v in pairs(ents.FindInSphere(Vector(-4211,-492,28),2)) do
		v:Fire("addoutput", "OnStartTouch plget,Teleport,,0.1,1")
		v:Fire("addoutput", "OnStartTouch cage_playerclip,Enable,,0,1")
		v:Fire("addoutput", "OnStartTouch barney_hallway_clip,Enable,,0,1")
	end
	
	DbgPrint("-- MapScript Loaded --")
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	if !GAME_STARTED then
		local black = ents.FindByName("viewcontrol_black")
		for m, n in pairs(black) do
			n:Fire("Enable")
		end
		timer.Simple(45, function()
			if !GAME_STARTED then
			--local black = ents.FindByName("viewcontrol_black")
			--for m, n in pairs(black) do
			--	n:Fire("Enable")
			--end
			end
			local killgame_starter = ents.FindByName("killmeplz")
			for k, v in pairs(killgame_starter) do
			v:Remove()
			end
			/*
			local relay01 = ents.FindByName("cam_relay_*")
			local relay02 =
			local relay03 =
			local relay04 =
			*/
		end)
	end
end

return MAPSCRIPT