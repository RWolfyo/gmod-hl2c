local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "metastasis" then
// Include Mapscript.
GAMETYPE.MapScript = include("metastasis/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"metastasis_1",
	"metastasis_2",
	"metastasis_3",
	"metastasis_4a",
	"metastasis_4b",
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


hook.Add("Hl2c.LoadGameTypes", "MetastasisGameType", function(gametypes)
	gametypes:Add("metastasis", GAMETYPE)
end)