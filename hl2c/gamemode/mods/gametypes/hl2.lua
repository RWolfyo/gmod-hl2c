local GAMETYPE = {}

// Include Mapscript.
if Hl2c.GameTypes[game.GetMap():lower()] == "hl2" then
-- print("Found HL2 MapScripts")
GAMETYPE.MapScript = include("hl2/" .. game.GetMap():lower() .. ".lua")
end

GAMETYPE.MapList =
{
	"d1_trainstation_01",
	"d1_trainstation_02",
	"d1_trainstation_03",
	"d1_trainstation_04",
	"d1_trainstation_05",
	"d1_trainstation_06",
	"d1_canals_01",
	"d1_canals_01a",
	"d1_canals_02",
	"d1_canals_03",
	"d1_canals_05",
	"d1_canals_06",
	"d1_canals_07",
	"d1_canals_08",
	"d1_canals_09",
	"d1_canals_10",
	"d1_canals_11",
	"d1_canals_12",
	"d1_canals_13",
	"d1_eli_01",
	"d1_eli_02",
	"d1_town_01",
	"d1_town_01a",
	"d1_town_02",
	"d1_town_03",
	"d1_town_02",
	"d1_town_02a",
	"d1_town_04",
	"d1_town_05",
	"d2_coast_01",
	"d2_coast_03",
	"d2_coast_04",
	"d2_coast_05",
	"d2_coast_07",
	"d2_coast_08",
	"d2_coast_07",
	"d2_coast_09",
	"d2_coast_10",
	"d2_coast_11",
	"d2_coast_12",
	"d2_prison_01",
	"d2_prison_02",
	"d2_prison_03",
	"d2_prison_04",
	"d2_prison_05",
	"d2_prison_06",
	"d2_prison_07",
	"d2_prison_08",
	"d3_c17_01",
	"d3_c17_02",
	"d3_c17_03",
	"d3_c17_04",
	"d3_c17_05",
	"d3_c17_06a",
	"d3_c17_06b",
	"d3_c17_07",
	"d3_c17_08",
	"d3_c17_09",
	"d3_c17_10a",
	"d3_c17_10b",
	"d3_c17_11",
	"d3_c17_12",
	"d3_c17_12b",
	"d3_c17_13",
	"d3_citadel_01",
	"d3_citadel_02",
	"d3_citadel_03",
	"d3_citadel_04",
	"d3_citadel_05",
	"d3_breen_01"
}

GAMETYPE.ClassesEnemyNPC =
{
	["npc_metropolice"] = true,
	["npc_combine"] = true,
	["npc_combine_s"] = true,
	["npc_zombie"] = true,
	["npc_headcrab"] = true,
}

GAMETYPE.ImportantPlayerNPCNames =
{
	["arrest_cit_female"] = true, -- Come on, give her some slack.
	["boxcar_human"] = true,
	["boxcar_vort"] = true,
	["citizen_greeter"] = true,
	["mary"] = true,
	["Al"] = true,
	["Arlene"] = true,
	["citizen_b_regular_original"] = true,
	["gatekeeper"] = true,
	["Chester"] = true,
	["lamarr_jumper"] = true,
	["stanley"] = true,
	["warehouse_citizen_jacobs"] = true,
	["warehouse_citizen"] = true,
	["warehouse_citizen_leon"] = true,
	["winston"] = true,
	["vort_Lab"] = true,
	["vort_lab"] = true,
	["rocketman"] = true, -- Mission critical
	["citizen_a_medic_original"] = true,
	["citizen_a_ammo_original"] = true,
	["vort"] = true,
	["citizen_3"] = true,
	["vortigaunt_bugbait"] = true, -- Well guess why
	["stanley"] = true, -- He will loose his friend!
}

GAMETYPE.ImportantPlayerNPCClasses =
{
	["npc_alyx"] = true,
	["npc_barney"] = true,
	["npc_odessa"] = true,
	["npc_kleiner"] = true,
	["npc_dog"] = true,
	["npc_mossman"] = true,
}

-- function GAMETYPE:ShouldRestartRound()

    -- local playerCount = 0
    -- local aliveCount = 0

    -- Collect how many players exist and how many are alive, in case they are all dead
    -- we have to restart the round.
    -- for _,ply in pairs(player.GetAll()) do
        -- if ply:Alive() then
            -- aliveCount = aliveCount + 1
        -- end
        -- playerCount = playerCount + 1
    -- end

    -- if playerCount > 0 and aliveCount == 0  then
        -- DbgPrint("All players are dead, restart required")
		-- return true
    -- end

	-- return false

-- end

hook.Add("Hl2c.LoadGameTypes", "HL2GameType", function(gametypes)
	gametypes:Add("hl2", GAMETYPE)
end)
