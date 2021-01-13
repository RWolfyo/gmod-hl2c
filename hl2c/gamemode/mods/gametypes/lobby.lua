local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "lobby" then
// Include Mapscript.
-- GAMETYPE.MapScript = include("lobby/" .. game.GetMap():lower() .. ".lua")
GAMETYPE.MapScript = include("lobby/keyfox_lobby.lua")
end
GAMETYPE.MapList =
{
	"keyfox_lobby_summer",
	"winter_lobby_2012",
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


hook.Add("Hl2c.LoadGameTypes", "LobbyGameType", function(gametypes)
	gametypes:Add("lobby", GAMETYPE)
	-- print("lobby")
end)