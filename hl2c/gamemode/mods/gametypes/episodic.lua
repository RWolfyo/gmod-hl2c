local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "episodic" then
// Include Mapscript.
GAMETYPE.MapScript = include("episodic/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"ep1_citadel_00",
	"ep1_citadel_01",
	"ep1_citadel_02",
	"ep1_citadel_02b",
	"ep1_citadel_03",
	"ep1_citadel_04",
	"ep1_c17_00",
	"ep1_c17_00a",
	"ep1_c17_01",
	"ep1_c17_02",
	"ep1_c17_02a",
	"ep1_c17_02b",
	"ep1_c17_05",
	"ep1_c17_06",
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


hook.Add("Hl2c.LoadGameTypes", "EpisodicGameType", function(gametypes)
	gametypes:Add("episodic", GAMETYPE)
end)