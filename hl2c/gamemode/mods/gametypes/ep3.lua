local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "ep3" then
// Include Mapscript.
GAMETYPE.MapScript = include("ep3/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"ep3_antarctic_01",
	"ep3_antarctic_02",
	"ep3_antarctic_03",
	"ep3_borealis_01",
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


hook.Add("Hl2c.LoadGameTypes", "Ep3GameType", function(gametypes)
	gametypes:Add("ep3", GAMETYPE)
end)