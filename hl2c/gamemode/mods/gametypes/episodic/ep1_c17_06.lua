local MAPSCRIPT = {}


--INFO_PLAYER_SPAWN = {Vector(10008.950195, 9627.838867, -671.968750),0}

NEXT_MAP = "winter_lobby_2012"

TRIGGER_CHECKPOINT = {

/*
setpos 12065.625977, 9132.747070, -727.115112;setang 13.603756 -95.664970 0.000000

setpos 12254.944336, 9260.023438, -598.538757;setang -14.334051 30.968115 0.000000

*/
	{Vector(12065.625977, 9132.747070, -727.115112), Vector(12254.944336, 9260.023438, -598.538757)},
	
	/*
	setpos 10128.527344, 8259.772461, -724.576355;setang 32.685356 105.385788 0.000000

setpos 10526.544922, 8070.515137, -580.644836;setang -15.703648 -21.521215 0.000000

	*/
	{Vector(10128.527344, 8259.772461, -724.576355), Vector(10526.544922, 8070.515137, -580.644836)}
}

TRIGGER_DELAYMAPLOAD = {Vector(11802, 7937, -699), Vector(11953, 7815, -785)}
-- -14160.657227 -5984.140625 -576.222656

-- -14028.511719 -6121.330566 -407.415466

-- checkpoint maybe 12262.223633 9127.807617 -671.968750

-- VORTEX_POS = Vector(11896, 9427, -416)

GAME_STARTED = false


function MAPSCRIPT:InitPost()
	
	for k, v in pairs(ents.FindByName("relay_start_razortrain")) do
	v:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,100.0,-1")
	end
	
	
-- 10008.950195 9627.838867 -671.968750
	--local del_barney = ents.FindByName("barney")
	--del_barney[1]:Remove()
	timer.Simple(1.0,function()
	local make_barney = ents.Create("npc_barney")
	make_barney:SetPos(Vector(9776, 9436, -736))
	make_barney:SetKeyValue("targetname", "barney")
	make_barney:SetKeyValue("spawnflags", "4")
	make_barney:SetKeyValue("GameEndAlly", "1")
	make_barney:SetKeyValue("squadname", "player_squad")
	make_barney:SetKeyValue("DontPickupWeapons", "No")
	make_barney:SetKeyValue("AlwaysTransition", "No")
	make_barney:SetKeyValue("additionalequipment", "weapon_smg1")
	make_barney:SetKeyValue("model", "models/barney.mdl")
	make_barney:SetKeyValue("physdamagescale", "1.0")
	make_barney:SetKeyValue("rendercolor", "255 255 255")
	make_barney:SetKeyValue("renderamt", "255")
	make_barney:SetKeyValue("wakesquad", "0")
	make_barney:SetKeyValue("wakeradius", "0")
	make_barney:SetKeyValue("sleepstate", "0")
	make_barney:SetKeyValue("hintlimiting", "0")
	make_barney:SetKeyValue("disableshadows", "0")
	make_barney:SetKeyValue("disablereceiveshadows", "0")
	make_barney:SetKeyValue("renderfx", "0")
	make_barney:SetKeyValue("rendermode", "0")
	make_barney:Spawn()
	make_barney:Activate()
	/*
	"origin" "9776 9436 -736"
	"GameEndAlly" "1"
	"DontPickupWeapons" "No"
	"AlwaysTransition" "No"
	"targetname" "barney"
	"squadname" "player_squad"
	"spawnflags" "4"
	"additionalequipment" "weapon_smg1"
	"physdamagescale" "1.0"
	"wakesquad" "0"
	"wakeradius" "0"
	"sleepstate" "0"
	"hintlimiting" "0"
	"disableshadows" "0"
	"disablereceiveshadows" "0"
	"rendercolor" "255 255 255"
	"renderamt" "255"
	"rendermode" "0"
	"renderfx" "0"
	"angles" "0 157 0"
	"classname" "npc_barney"
	*/
	end)
	--local create_spawn = ents.Create("info_player_start")
	--create_spawn:SetPos(Vector(10008.950195, 9627.838867, -671.968750))
	timer.Simple(1.0,function()
	local make_alyx = ents.Create("npc_alyx")
	make_alyx:SetPos(Vector(10008.950195, 9627.838867, -671.968750))
	make_alyx:SetKeyValue("targetname", "alyx")
	make_alyx:SetKeyValue("spawnflags", "4")
	make_alyx:SetKeyValue("GameEndAlly", "1")
	make_alyx:SetKeyValue("DontPickupWeapons", "No")
	make_alyx:SetKeyValue("AlwaysTransition", "1")
	make_alyx:SetKeyValue("additionalequipment", "weapon_alyxgun")
	make_alyx:SetKeyValue("model", "models/alyx.mdl")
	make_alyx:SetKeyValue("physdamagescale", "1.0")
	make_alyx:SetKeyValue("rendercolor", "255 255 255")
	make_alyx:SetKeyValue("wakesquad", "0")
	make_alyx:SetKeyValue("wakeradius", "0")
	make_alyx:SetKeyValue("sleepstate", "0")
	make_alyx:SetKeyValue("hintlimiting", "0")
	make_alyx:SetKeyValue("disableshadows", "0")
	make_alyx:SetKeyValue("disablereceiveshadows", "0")
	make_alyx:SetKeyValue("disablereceiveshadows", "0")
	make_alyx:SetKeyValue("rendercolor", "255 255 255")
	make_alyx:SetKeyValue("renderamt", "255")
	make_alyx:SetKeyValue("rendermode", "0")
	make_alyx:SetKeyValue("renderfx", "0")
	make_alyx:Spawn()
	make_alyx:Activate()
	/*
	"origin" "9860.66 9740.54 -723.783"
	"GameEndAlly" "1"
	"DontPickupWeapons" "No"
	"AlwaysTransition" "1"
	"targetname" "alyx"
	"spawnflags" "4"
	"additionalequipment" "weapon_alyxgun"
	"model" "models/alyx.mdl"
	"physdamagescale" "1.0"
	"wakesquad" "0"
	"wakeradius" "0"
	"sleepstate" "0"
	"hintlimiting" "0"
	"disableshadows" "0"
	"disablereceiveshadows" "0"
	"rendercolor" "255 255 255"
	"renderamt" "255"
	"rendermode" "0"
	"renderfx" "0"
	"angles" "0 270 0"
	"classname" "npc_alyx"
	*/
	end)
	for k, v in pairs(ents.FindByName("lcs_train_departure_alyx_barney")) do
		v:Remove()
	end

	
	
	local spawn = ents.Create("point_template")
	spawn:SetKeyValue("targetname", "global_newgame_template")
	spawn:SetKeyValue("spawnflags", "0")
	spawn:SetPos(Vector(9899.66, 9630.34, -706.783))
	spawn:SetKeyValue("Template01", "global_newgame_spawner_ar2")
	spawn:SetKeyValue("Template02", "global_newgame_spawner_crowbar")
	spawn:SetKeyValue("Template03", "global_newgame_spawner_suit")
	spawn:SetKeyValue("Template04", "global_newgame_spawner_dynamic")
	spawn:SetKeyValue("Template05", "global_newgame_spawner_physgun")
	spawn:SetKeyValue("Template06", "global_newgame_spawner_rpg")
	spawn:SetKeyValue("Template07", "global_newgame_spawner_shotgun")
	spawn:SetKeyValue("Template08", "global_newgame_spawner_smg")
	spawn:SetKeyValue("Template09", "barney")
	spawn:SetKeyValue("Template10", "alyx")
	spawn:SetKeyValue("Template11", "global_newgame_spawner_xbow")
	spawn:SetKeyValue("Template13", "citizen_refugees_2")
	spawn:SetKeyValue("Template14", "citizen_refugees_1")
	/*"origin" "9899.66 9630.34 -706.783"
	"Template14" "citizen_refugees_1"
	"Template13" "citizen_refugees_2"
	"Template11" "global_newgame_spawner_xbow"
	"Template10" "alyx"
	"Template09" "barney"
	"Template08" "global_newgame_spawner_dynamic"
	"Template07" "global_newgame_spawner_physgun"
	"Template06" "global_newgame_spawner_rpg"
	"Template05" "global_newgame_spawner_ar2"
	"Template04" "global_newgame_spawner_smg"
	"spawnflags" "2"
	"Template03" "global_newgame_spawner_shotgun"
	"Template02" "global_newgame_spawner_crowbar"
	"Template01" "global_newgame_spawner_suit"
	"targetname" "global_newgame_template"
	"classname" "point_template"*/
	spawn:Spawn()
	spawn:Activate()
	
	local auto = ents.Create( "logic_auto" )
	auto:SetPos(Vector(776, 2592, 333.524))
	auto:SetKeyValue( "spawnflags", "1" )
	auto:Fire("addoutput", "OnMapSpawn alyx,Kill,,0.7,-1")
	auto:Fire("addoutput", "OnMapSpawn barney,Kill,,0.7,-1")
	auto:Fire("addoutput", "OnMapSpawn citizen_refugees_2,Kill,,0.7,-1")
	auto:Fire("addoutput", "OnMapSpawn citizen_refugees_1,Kill,,0.7,-1")
	--auto:Fire("addoutput", "OnMapSpawn door_startmap,Kill,,0,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_entmaker,ForceSpawn,,3.0,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_template,ForceSpawn,,3.0,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_suit,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_crowbar,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_shotgun,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_smg,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_ar2,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_rpg,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_physgun,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_xbow,Kill,,3.3,-1")
	auto:Fire("addoutput", "OnMapSpawn global_newgame_spawner_dynamic,Kill,,3.3,-1")
	--auto:Fire("addoutput", "OnMapSpawn alyx,StartScripting,,4.5,-1")
	--auto:Fire("addoutput", "OnMapSpawn barney,StartScripting,,4.5,-1")
	--auto:Fire("addoutput", "OnMapSpawn assault_cit1_lasttrain,Activate,,4.0,-1")
	--auto:Fire("addoutput", "OnMapSpawn assault_cit2_lasttrain,Activate,,4.1,-1")
	--auto:Fire("addoutput", "OnMapSpawn lcs_train_departure_alyx_barney,Start,,4.4,-1")
	auto:Spawn()
	auto:Activate()
	
	aft = ents.Create("ai_goal_follow")
	aft:SetPos(Vector(1065, 353, -631))
	aft:SetKeyValue("targetname", "hl2c_alyx_temp_follow")
	aft:SetKeyValue("actor", "alyx")
	aft:SetKeyValue("goal", "!player")
	aft:SetKeyValue("Formation", "6")
	aft:Spawn()
	
	local timer = ents.Create( "logic_timer" )
	timer:SetPos(Vector(1066, 353, -631))
	timer:SetKeyValue( "RefireTime", "5" )
	timer:SetKeyValue( "targetname", "hl2c_timer_follow" )
	timer:SetKeyValue( "StartDisabled", "0" )
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Deactivate,,0.0,-1", "1")
	timer:Fire("addoutput", "OnTimer hl2c_alyx_temp_follow,Activate,,0.10,-1", "1")
	timer:Spawn()
	
	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()
	
	--razortrain3
	--local get_trainend = ents.FindByName("razortrain3")
	--get_trainend[1]:Fire("addoutput", "OnUser2 hl2c_changelevel,Changelevel,,30,-1")
	
end


function MAPSCRIPT:PostPlayerSpawn(pl)
	
	timer.Simple(6.0,function()
		if IsValid(pl) and GAME_STARTED != true then
			
			
			local scene = ents.Create("logic_choreographed_scene")
			scene:SetPos(Vector(9758.51, 9416, -622.372))
			scene:SetKeyValue("busyactor","1")
			scene:SetKeyValue("SceneFile","Scenes/episode_1/train_departure_alyx_barney.vcd")
			scene:SetKeyValue("targetname","lcs_train_departure_alyx_barney")
			scene:Fire("addoutput","OnStart barney,StartScripting,,0,-1")
			scene:Fire("addoutput","OnCompletion lcs_opnenexttrack,Start,,0,-1")
			scene:Spawn()
			scene:Activate()
			
			local auto = ents.Create( "logic_auto" )
			auto:SetPos(Vector(776, 2592, 333.524))
			auto:SetKeyValue( "spawnflags", "1" )
			auto:Fire("addoutput", "OnMapSpawn assault_cit1_lasttrain,Activate,,0.0,-1")
			auto:Fire("addoutput", "OnMapSpawn assault_cit2_lasttrain,Activate,,0.1,-1")
			auto:Fire("addoutput", "OnMapSpawn lcs_train_departure_alyx_barney,Start,,2.0,-1")
			auto:Fire("addoutput", "OnMapSpawn alyx,StartScripting,,2.0,-1")
			auto:Fire("addoutput", "OnMapSpawn barney,StartScripting,,2.0,-1")
			auto:Spawn()
			auto:Activate()
			
			for m, n in pairs(ents.FindByName("alyx")) do
				n:Fire("StartScripting","","1.0")
			end
			for b, c in pairs(ents.FindByName("barney")) do
				c:Fire("StartScripting","","1.0")
			end
			GAME_STARTED = true
			--PrintMessage(HUD_PRINTTALK,"SCENE STARTED")
		end
	end)
	
	pl:Give("weapon_crowbar")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_rpg")
	
	timer.Simple(2, function()
		if IsValid(pl) and pl:Team() == TEAM_ALIVE then
			pl:SetAmmo( 0, "rpg_round")
		end
	end)
end


return MAPSCRIPT