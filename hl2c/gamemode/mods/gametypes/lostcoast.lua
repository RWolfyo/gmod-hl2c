local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "lostcoast" then
// Include Mapscript.
GAMETYPE.MapScript = include("lostcoast/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"d2_lostcoast",
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


hook.Add("Hl2c.LoadGameTypes", "LostCoastGameType", function(gametypes)
	gametypes:Add("lostcoast", GAMETYPE)
end)