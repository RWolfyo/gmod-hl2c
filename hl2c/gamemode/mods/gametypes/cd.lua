local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "cd" then
// Include Mapscript.
GAMETYPE.MapScript = include("cd/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"cd0",
	"cd1",
	"cd10",
	"cd12",
	"cd13",
	"cd14",
	"cd15",
	"cd2",
	"cd2_1",
	"cd2_2",
	"cd3_1",
	"cd3_2",
	"cd3_3",
	"cd3_4",
	"cd4",
	"cd5",
	"cd6",
	"cd7",
	"cd8",
	"cd9",
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


hook.Add("Hl2c.LoadGameTypes", "CdGameType", function(gametypes)
	gametypes:Add("cd", GAMETYPE)
end)