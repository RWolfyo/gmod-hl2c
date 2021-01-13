local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "gmod" then
// Include Mapscript.
GAMETYPE.MapScript = include("gmod/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"gm_construct",
	"gm_flatgrass",
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


hook.Add("Hl2c.LoadGameTypes", "GmodGameType", function(gametypes)
	gametypes:Add("gmod", GAMETYPE)
end)
