local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "coastline" then
// Include Mapscript.
GAMETYPE.MapScript = include("coastline/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"leonhl2-2",
	"leonhl2-2b",
	"leonhl2-2c",
	"leonhl2-2d",
	"leonhl2-2da",
	"leonhl2-2e",
	"leonhl2-2f",
	"leonhl2-2g",
	"leonhl2-2h",
	"leonhl2-2i",
	"leonhl2-2j",
	"leonhl2-2k",
	"leonhl2-2l",
	"leonhl2-2m",
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


hook.Add("Hl2c.LoadGameTypes", "CoastlineGameType", function(gametypes)
	gametypes:Add("coastline", GAMETYPE)
end)