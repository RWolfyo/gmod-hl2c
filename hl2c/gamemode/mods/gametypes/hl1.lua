local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "hl1" then
// Include Mapscript.
GAMETYPE.MapScript = include("hl1/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"c0a0",
	"c1a0",
	"c1a0a",
	"c1a0b",
	"c1a0c",
	"c1a0d",
	"c1a0e",
	"c1a1",
	"c1a1a",
	"c1a1b",
	"c1a1c",
	"c1a1d",
	"c1a1f",
	"c1a1f",
	"t0a0",
	"t0a0a",
	"t0a0b",
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


hook.Add("Hl2c.LoadGameTypes", "Hl1GameType", function(gametypes)
	gametypes:Add("hl1", GAMETYPE)
end)