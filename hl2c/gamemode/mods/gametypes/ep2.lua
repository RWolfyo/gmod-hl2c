local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "ep2" then
// Include Mapscript.
GAMETYPE.MapScript = include("ep2/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"ep2_outland_01",
	"ep2_outland_01a",
	"ep2_outland_02",
	"ep2_outland_03",
	"ep2_outland_04",
	"ep2_outland_05",
	"ep2_outland_06",
	"ep2_outland_06a",
	"ep2_outland_07",
	"ep2_outland_08",
	"ep2_outland_09",
	"ep2_outland_10",
	"ep2_outland_10a",
	"ep2_outland_11",
	"ep2_outland_11a",
	"ep2_outland_11b",
	"ep2_outland_12",
	"ep2_outland_12a",
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


hook.Add("Hl2c.LoadGameTypes", "Ep2GameType", function(gametypes)
	gametypes:Add("ep2", GAMETYPE)
end)