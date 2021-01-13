local MAPSCRIPT = {}


ALLOWED_VEHICLE = "Van"

NEXT_MAP = "ep2_outland_09"


-- VORTEX_POS = Vector(-12367.332031, -4640.553223, 64.031250)


-- TRIGGER_AIRBOATGUN_HL2C = {
	-- {Vector(-1784.355469, 868.977905, 80.024521), Vector(-2360.106934, 273.855072, 242.136810)}
-- } 

TRIGGER_CHECKPOINT = {

/*
setpos -1923.714844, 1632.543823, 89.777832;setang 9.138125 -95.496666 0.000000
] getpos 
setpos -2152.793213, 381.259827, 247.390808;setang 13.429230 -49.207523 0.000000

*/
	{Vector(-1923.714844, 1632.543823, 89.777832), Vector(-2152.793213, 381.259827, 247.390808)}
}




function MAPSCRIPT:InitPost()
--setpos -2725.281494 795.795898 187.606201;setang 0.190786 -140.603271 0.000000   --- FOr teleport

	--trigger_alyx_throwmed
	/*
		"origin" "-1555.85 1222 452.337"
	"UseRandomTime" "1"
	"UpperRandomBound" "11"
	"targetname" "timer_alarm"
	"StartDisabled" "1"
	"spawnflags" "0"
	"LowerRandomBound" "7"
	"classname" "logic_timer"
	"hammerid" "1457244"
	connections
	{
		"OnTimer" "sound_alarm,PlaySound,,0,-1"
		"OnTimer" "sound_alarm,StopSound,,4,-1"
	}
	*/
	timer.Simple(30, function()
	--local alyx_guns = ents.FindByName("trigger_alyx_throwmed")
	--alyx_guns[1]:Fire("addoutput", "OnTrigger give_players_airboatgun,Use,,1,-1")
	--alyx_guns[1]:Fire("addoutput", "OnTrigger give_players_airboatgun,Use,,2,-1")
	--alyx_guns[1]:Fire("addoutput", "OnTrigger give_players_airboatgun,Use,,3,-1")
	--alyx_guns[1]:Fire("addoutput", "OnTrigger give_players_airboatgun,Use,,4,-1")
	--alyx_guns[1]:Fire("addoutput", "OnTrigger give_players_airboatgun,Use,,5,-1")
	--alyx_guns[1]:Fire("addoutput", "OnTrigger give_players_airboatgun,Use,,6,-1")
	
	local opengate_guy = ents.FindByName("alyx")
	opengate_guy[1]:Fire("addoutput", "OnDeath player_failed,RestartMap,,1,-1")
	end)
	--local get_grav = ents.Create("game_player_equip")
	--get_grav:SetPos(Vector( -1857, 681, 109 ))
	--get_grav:SetKeyValue("targetname", "give_players_airboatgun")
	--get_grav:SetKeyValue("weapon_airboatgun_hl2c", "1")
	--get_grav:SetKeyValue("spawnflags", "1")
	--get_grav:Spawn()
	
	/*local mytimer = ents.Create("logic_timer")
	mytimer:SetPos(Vector(-1857, 681, 107))
	mytimer:SetKeyValue("targetname", "weapon_give_timer")
	mytimer:SetKeyValue("spawnflags", "0")
	mytimer:SetKeyValue( "RefireTime", "5" )
	mytimer:SetKeyValue("StartDisabled", "1")
	mytimer:Fire("addoutput", "OnTimer give_players_airboatgun,Use,,1,-1", "1")
	mytimer:Fire("addoutput", "OnTimer give_players_airboatgun,Use,,0,-1", "1")
	mytimer:Spawn()*/
	
	-- npc_citizen_opengate
	local map_fail_event = ents.Create("point_map_failed")
	map_fail_event:SetKeyValue("targetname", "player_failed")
	map_fail_event:SetPos(Vector(0, 0, 90))
	map_fail_event:Spawn()
	

	
end

function MAPSCRIPT:KeyValue(ent, key, value)
	if IsValid(ent) and
	key == "origin" and
	value == "-869.482 394.923 141.372"
	then
	--print("\nFOUND ALYX CHECK FAIL RELAY\n")
		--timer.Simple(0.5, function()
			if IsValid(ent) then
				--print("\nFOUND ALYX CHECK FAIL RELAY\n")
				print("*********************************")
				print("** Found alyx check fail relay **")
				print("*********************************")
				ent:Remove()
			end
		--end)
	end
	
	if IsValid(ent) and
	key == "targetname" and
	value == "relay_wooddoor_break"
	then
			if IsValid(ent) then
				print("********************************")
				print("** Found relay_wooddoor_break **")
				print("********************************")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Activate,,1.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Activate,,6.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Activate,,10.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Activate,,20.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Activate,,35.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Activate,,55.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Enable,,1.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Enable,,6.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Enable,,10.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Enable,,20.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Enable,,35.0,-1")
				ent:Fire("addoutput", "OnTrigger trigger_dropbomb,Enable,,55.0,-1")
			end
	end
	
	-- trigger_dropbomb
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	if IsValid(pl) then
		pl:Give("weapon_physcannon")
		pl:Give("weapon_crowbar")
		pl:Give("weapon_pistol")
		pl:Give("weapon_357")
		pl:Give("weapon_smg1")
		pl:Give("weapon_ar2")
		pl:Give("weapon_shotgun")
		pl:Give("weapon_frag")
		pl:Give("weapon_crossbow")
	end
	
end
 
return MAPSCRIPT