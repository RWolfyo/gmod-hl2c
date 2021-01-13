local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "oc" then
// Include Mapscript.
GAMETYPE.MapScript = include("oc/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"ep1_oc_broken_escape_01",
	"ep2_oc_broken_escape_02a",
	"ep2_oc_broken_escape_02b",
	"ep2_oc_broken_escape_02c",
	"ep2_oc_outhouse_1r2",
	"ocf_deadland",
	"oc_antlion_attack_01",
	"oc_atfor_cityfight_v3",
	"oc_breakout",
	"oc_bunker",
	"oc_fireteam_1",
	"oc_fireteam_2",
	"oc_harvest",
	"oc_starship_troopers",
	"oc_trashstand_v2",
	"oc_wildfire",
	"rebel_ways_01",
	"rebel_ways_02",
}

GAMETYPE.ClassesEnemyNPC =
{

}

GAMETYPE.ImportantPlayerNPCNames =
{

}

GAMETYPE.ImportantPlayerNPCClasses =
{

}


hook.Add("Hl2c.LoadGameTypes", "OcGameType", function(gametypes)
	gametypes:Add("oc", GAMETYPE)
end)