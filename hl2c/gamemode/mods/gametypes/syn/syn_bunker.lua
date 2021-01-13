--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--HL2MP_SPAWN_ENT = "info_player_rebel"
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
SYN_MAP = true
NEXT_MAP_TIME = 5

local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["subway_powerbox_relay"] = true
}

function MAPSCRIPT:InitPost()

	--local change = ents.Create("point_changelevel")
	--change:SetPos(Vector(3840, 13366, 4266))
	--change:SetKeyValue("targetname", "hl2c_changelevel")
	--change:Spawn()
	--change:Activate()
	
	-- Add ending to the map
	--local trigger_strider_end = ents.FindByName("trigger_strider_end")
	--trigger_strider_end[1]:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,15,-1")
	
	-- remove weapon remover on spawn fuck this stripper
	--local remove1 = ents.FindByName("usedstripper")
	--remove1[1]:Remove()
	
	
	
	
	/*
	"entity"
	{
		// Use new ammo types
		"delete" { "classname" "info_player_equip" }
		"create"
		{
			"classname" "info_player_equip"
			"origin" "0 -448 96"
			"values"
			{
				"item_suit"					"1"
				"weapon_smg1"			"1"
				"weapon_pistol"			"1"
				"weapon_physcannon"		"1"
				"weapon_frag"			"1"
				"weapon_crowbar"		"1"
				"ammo_smg1"				"225"
				"ammo_pistol"			"150"
			}
		}*/
		/*
	ents.RemoveByName("door3")
	ents.RemoveByName("elevator1")
	ents.RemoveByName("antlionguards_exitdoor")*/
	ents.RemoveByName("subway_powerbox_relay")
	
		// Saves when door is fully open
		/*
	local ent = ents.Create("func_door")
	ent:SetPos( Vector(64, 2312, -72) )
	ent:SetKeyValue("model", "*10")
	ent:SetKeyValue("wait", "-1")
	ent:SetKeyValue("unlocked_sentence", "0")
	ent:SetKeyValue("targetname", "door3")
	ent:SetKeyValue("speed", "60")
	ent:SetKeyValue("startclosesound", "Doors.Move7")
	ent:SetKeyValue("spawnpos", "0")
	ent:SetKeyValue("spawnflags", "544")
	ent:SetKeyValue("rendermode", "0")
	ent:SetKeyValue("renderfx", "0")
	ent:SetKeyValue("rendercolor", "255 255 255")
	ent:SetKeyValue("renderamt", "255")
	ent:SetKeyValue("movedir", "-90 0 0")
	ent:SetKeyValue("loopmovesound", "0")
	ent:SetKeyValue("locked_sentence", "0")
	ent:SetKeyValue("lip", "4")
	ent:SetKeyValue("ignoredebris", "0")
	ent:SetKeyValue("health", "0")
	ent:SetKeyValue("forceclosed", "1")
	ent:SetKeyValue("dmg", "200")
	ent:SetKeyValue("noise2", "Doors.FullOpen8")
	ent:SetKeyValue("noise1", "Doors.Move7")
	ent:SetKeyValue("closesound", "Doors.FullOpen8")
	ent:SetKeyValue("disableshadows", "0")
	ent:SetKeyValue("disablereceiveshadows", "0")
	ent:SetKeyValue("hammerid", "5710")
	ent:Spawn()
		*/
		// Save when the elevator starts moving
		/*
	local ent = ents.Create("func_tracktrain")
	ent:SetPos(Vector(-380, 8294, -198))
	ent:SetKeyValue("model", "*27")
	ent:SetModel("models/props_mining/elevator01_cage.mdl")
	ent:SetKeyValue("wheels", "50")
	ent:SetKeyValue("volume", "10")
	ent:SetKeyValue("velocitytype", "0")
	ent:SetKeyValue("targetname", "elevator1")
	ent:SetKeyValue("target", "elevator1_path1")
	ent:SetKeyValue("StopSound", "plats/elevator_stop.wav")
	ent:SetKeyValue("startspeed", "100")
	ent:SetKeyValue("StartSound", "plats/elevator_move_loop2.wav")
	ent:SetKeyValue("speed", "0")
	ent:SetKeyValue("spawnflags", "539")
	ent:SetKeyValue("rendermode", "10")
	ent:SetKeyValue("renderfx", "0")
	ent:SetKeyValue("rendercolor", "255 255 255")
	ent:SetKeyValue("renderamt", "255")
	ent:SetKeyValue("orientationtype", "0")
	ent:SetKeyValue("MoveSoundMinTime", "0")
	ent:SetKeyValue("MoveSoundMinPitch", "60")
	ent:SetKeyValue("MoveSoundMaxTime", "0")
	ent:SetKeyValue("MoveSoundMaxPitch", "200")
	ent:SetKeyValue("MoveSound", "plats/elevator_move_loop2.wav")
	ent:SetKeyValue("ManualSpeedChanges", "0")
	ent:SetKeyValue("ManualDecelSpeed", "0")
	ent:SetKeyValue("ManualAccelSpeed", "0")
	ent:SetKeyValue("height", "0")
	ent:SetKeyValue("dmg", "500")
	ent:SetKeyValue("disableshadows", "0")
	ent:SetKeyValue("disablereceiveshadows", "0")
	ent:SetKeyValue("bank", "0")
	ent:SetKeyValue("hammerid", "20830")
	ent:Fire("addoutput", "OnStart elevator1_button_dynamic,SetAnimation,idleon,0,-1")
	ent:Fire("addoutput", "OnStart elevator1_door_top,Close,,0,-1")
	ent:Fire("addoutput", "OnStart elevator1_door_bottom,Close,,0,-1")
	ent:Fire("addoutput", "OnStart elevator1_walkway_top,Open,,0,-1")
	ent:Fire("addoutput", "OnStart elevator1_walkway_bottom,Open,,0,-1")
	ent:Fire("addoutput", "OnStart elevator1_dynamicdoor,SetAnimation,close,0,-1")
	ent:Fire("addoutput", "OnStart elevator1_shaft_button,Lock,,0,-1")
	--ent:Fire("addoutput", "OnStart savemap,save,,0,1")
	ent:Spawn()
	*/
		
		// Saves when door fully opens
		/*
	local ent = ents.Create("func_door")
	ent:SetPos( Vector(-3904, 5076, -64) )
	ent:SetKeyValue("model", "*59")
	ent:SetKeyValue("wait", "-1")
	ent:SetKeyValue("unlocked_sentence", "0")
	ent:SetKeyValue("targetname", "antlionguards_exitdoor")
	ent:SetKeyValue("speed", "100")
	ent:SetKeyValue("spawnpos", "0")
	ent:SetKeyValue("spawnflags", "544")
	ent:SetKeyValue("rendermode", "0")
	ent:SetKeyValue("renderfx", "0")
	ent:SetKeyValue("rendercolor", "255 255 255")
	ent:SetKeyValue("renderamt", "255")
	ent:SetKeyValue("movedir", "-90 0 0")
	ent:SetKeyValue("loopmovesound", "0")
	ent:SetKeyValue("locked_sentence", "0")
	ent:SetKeyValue("lip", "4")
	ent:SetKeyValue("ignoredebris", "0")
	ent:SetKeyValue("health", "0")
	ent:SetKeyValue("dmg", "0")
	ent:SetKeyValue("disableshadows", "0")
	ent:SetKeyValue("disablereceiveshadows", "0")
	ent:SetKeyValue("forceclosed", "0")
	ent:SetKeyValue("hammerid", "65315")
	ent:Spawn()
		*/
		// Saves when power fails, just before Antlion ambush starts
	local ent = ents.Create("logic_relay")
	ent:SetPos( Vector( -11080, 7544, -1992) )
	ent:SetKeyValue( "targetname", "subway_powerbox_relay" )
	ent:SetKeyValue( "StartDisabled", "1" )
	ent:SetKeyValue( "spawnflags", "0" )
	ent:SetKeyValue( "hammerid", "231476" )
	ent:Fire("addoutput", "OnTrigger subway_lights,TurnOn,,0,-1")
	ent:Fire("addoutput", "OnTrigger subway_lights,TurnOff,,3,-1")
	ent:Fire("addoutput", "OnTrigger subway_powerbox_button,Lock,,0,-1")
	ent:Fire("addoutput", "OnTrigger subway_powerbox_sparks,SparkOnce,,3,-1")
	ent:Fire("addoutput", "OnTrigger subway_antlion_spawner,Enable,,4,-1")
	ent:Fire("addoutput", "OnTrigger subway_powerbox,SetAnimation,closePowerBox,5,-1")
	ent:Fire("addoutput", "OnTrigger subway_antlion_song,PlaySound,,6,-1")
	ent:Fire("addoutput", "OnTrigger subway_zombielight_sparks,StartSpark,,0,-1")
	ent:Fire("addoutput", "OnTrigger subway_zombielight_sparks,StopSpark,,3,-1")
	ent:Fire("addoutput", "OnTrigger subway_antlion_spawner2,Enable,,4,-1")
	--ent:Fire("addoutput", "OnTrigger savemap,save,,3.1,1")
	ent:Spawn()
		
		// Spawn Antlion higher so it doesn't spawn in the ground and die
	local ent = ents.FindFirstByName("antlionworker2_maker")
	ent:SetKeyValue("origin", "-467 6943 -232")
	ent:SetPos( Vector( -467, 6943, -232 ) )
	
		//Optimize Target
	local ent = ents.FindFirstByName("combine_mortar_trigger")
	ent:Fire("addoutput", "OnStartTouch combine_mortar01,SetTargetEntity,!player,0.1,-1")
	
		//Optimize EndGame
	local ent = ents.FindFirstByName("subway_passenger_train2_startbutton")
	ent:Fire("addoutput", "OnPressed endgame,EndGame,,25,-1")
	
		//Optimize SpawnTarget
	local ent = ents.FindFirstByName("mine_antlion_maker")
	ent:SetKeyValue("spawntarget", "!player")
	
		//Optimize Zombine Spawn subway_zombie_fence_zombine_maker
	local ent = ents.FindFirstByName("subway_powerbox_button")
	ent:Fire("addoutput", "OnPressed subway_zombie_fence_zombine_maker,Spawn,,12,-1")
	
		// Optimize drops
	local ent = ents.Create("game_weapon_manager")
	ent:SetKeyValue("weaponname", "weapon_physcannon")
	ent:SetKeyValue("maxpieces", "0")
	ent:Spawn()
		
	local ent = ents.Create("game_weapon_manager")
	ent:SetKeyValue("weaponname", "weapon_crowbar")
	ent:SetKeyValue("maxpieces", "0")
	ent:Spawn()
	
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	--if not IsValid(pl) or pl:Team() == TEAM_ALIVE then return end
	pl:Give("weapon_crowbar")
	pl:Give("weapon_smg1")
	pl:Give("weapon_pistol")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_frag")
	if IsValid(pl) and pl:GetAmmoCount( "Pistol" ) < 51 then
	pl:GiveAmmo( 50, "Pistol", true )
	end
	if IsValid(pl) and pl:GetAmmoCount( "SMG1" ) < 91 then
	pl:GiveAmmo( 90, "SMG1", true )
	end

end

return MAPSCRIPT