local GAMETYPE = {}

if Hl2c.GameTypes[game.GetMap():lower()] == "syn" then
// Include Mapscript.
GAMETYPE.MapScript = include("syn/" .. game.GetMap():lower() .. ".lua")
end
GAMETYPE.MapList =
{
	"synb2_fast_df_extinction_hl2mp",
	"synb2_grand_bleu_b1",
	"syn_antlions_way",
	"syn_breenoffice_v1c",
	"syn_bunker",
	"syn_desolate",
	"syn_forgotten_evils",
	"syn_kab_escape_part1_v4",
	"syn_littletowndefense_hl2mp",
	"syn_lvcoop_part1",
	"syn_lvcoop_part2",
	"syn_oldcanals",
	"syn_sevenhourwar_part1",
	"syn_silent_house",
	"syn_takeover",
	"syn_urbanchaos",
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


hook.Add("Hl2c.LoadGameTypes", "SynGameType", function(gametypes)
	gametypes:Add("syn", GAMETYPE)
end)