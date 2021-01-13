include("sv_player_spawn.lua")
DB = {};

DB.Player = {};

DB.Player.Table = "hl2c_playerdata"
DB.Player.Appear = "hl2c_player_appear"

DB.LambdaHlTwo = {};
DB.LambdaHlTwo.Table = "hl2c_hl2_lambdacache"


DB.PermaPoint = {}
DB.PermaPoint.Table = "hl2c_permapoint"
DB.PermaPoint.Items = {}
DB.PermaPoint.Items.Upgrades = {}
DB.PermaPoint.Items.Upgrades.P1 = "hl2c_item_shop_upgrade_p1"
DB.PermaPoint.ItemsEQ = {}
DB.PermaPoint.ItemsB = {}
DB.PermaPoint.ItemsEQ.P1 = "hl2c_pp_items_EQ_01"
DB.PermaPoint.ItemsB.P1 = "hl2c_pp_items_B_01"

DB.CustomSetUp = {
--	P1 = "hl2c_csetup_p1",
--	P2 = "hl2c_csetup_p2",
--	P3 = "hl2c_csetup_p3",
--	P4 = "hl2c_csetup_p4",
--	P5 = "hl2c_csetup_p5"
--	colummns = {
--		"c_counter_01",
--		"c_counter_02",
--		"c_counter_03",
--		"c_counter_04",
--		"c_counter_05"
--	}
}


DB.CustomSetUp.P1 = "hl2c_csetup_p1"	-- Already set Perma Yes/No
DB.CustomSetUp.P2 = "hl2c_csetup_p2"
DB.CustomSetUp.P3 = "hl2c_csetup_p3"
DB.CustomSetUp.P4 = "hl2c_csetup_p4"

DB.CustomCounters = {}
DB.CustomCounters.P1 = "hl2c_ccounters_p1"
DB.CustomCounters.P2 = "hl2c_ccounters_p2"
DB.CustomCounters.P3 = "hl2c_ccounters_p3"
DB.CustomCounters.P4 = "hl2c_ccounters_p4"

DB.RadarEpTwo = {};
DB.RadarEpTwo.Table = "hl2c_ep2_radar"

DB.WebCacheEpTwo = {};
DB.WebCacheEpTwo.Table = "hl2c_ep2_webcache"

DB.AchEpTwo = {};
DB.AchEpTwo.Table = "hl2c_ep2_ach"
DB.AchEpTwo.P2 = {};
DB.AchEpTwo.P2.Table = "hl2c_ep2_p2_ach"

DB.AchEpOne = {};
DB.AchEpOne.Table = "hl2c_ep1_ach"
DB.AchEpOne.P2 = {};
DB.AchEpOne.P2.Table = "hl2c_ep1_p2_ach"

DB.AchHlTwo = {};
DB.AchHlTwo.Table = "hl2c_hl2_ach"
DB.AchHlTwo.P2 = {};
DB.AchHlTwo.P2.Table = "hl2c_hl2_p2_ach"

DB.AchGenP1 = {};
DB.AchGenP2 = {};
DB.AchGenP1.Table = "hl2c_genp1_ach"
DB.AchGenP2.Table = "hl2c_genp2_ach"

DB.KillsP1 = {};
DB.KillsP1.Table = "hl2c_p1_kills"

DB.VortexHl2 = {};
DB.VortexHl2.Table = "hl2c_vortex_hl2"

DB.VortexEP1 = {};
DB.VortexEP1.Table = "hl2c_vortex_ep1"

DB.VortexEP2 = {};
DB.VortexEP2.Table = "hl2c_vortex_ep2"

DB.VortexEP2 = {};
DB.VortexEP2.Table = "hl2c_vortex_ep2"

DB.Pet = {};
DB.Pet.List = "hl2c_pet_list"
DB.Pet.Main = "hl2c_pet_main"
DB.Pet.Setting = "hl2c_pet_setting"
DB.Pet.Shop = "hl2c_pet_shop"

function DB.Initialize()

local query = "CREATE TABLE " .. DB.Player.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		SteamID text,
		Name text,
		Experience int,
		Level int
		)
		]]
		
	if (sql.TableExists( DB.Player.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.Player.Table ) );
		-- print("Table " .. DB.Player.Table .. " was created.")
	end
	
	
	
	/*
	local query = "DROP TABLE ".. DB.AchHlTwo.Table .. "\n"
	if (sql.TableExists( DB.AchHlTwo.Table ) == true) then
	
		
		sql.Begin();
		sql.Query(query)
		sql.Commit();
		
		print(sql.LastError())
		print(query);
		print(sql.TableExists( DB.AchHlTwo.Table ) );
		print("Table " .. DB.AchHlTwo.Table .. " was created.")
	end
	*/
	local query = "CREATE TABLE " .. DB.AchHlTwo.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_HL2_HIT_CANCOP_WITHCAN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_PUT_CANINTRASH INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_ESCAPE_APARTMENTRAID INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BREAK_MINITELEPORTER INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_GET_CROWBAR INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_GET_AIRBOAT INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_GET_AIRBOATGUN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_FIND_VORTIGAUNTCAVE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_CHOPPER INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_FIND_HEVFACEPLATE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_GET_GRAVITYGUN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_MAKEABASKET INTEGER NOT NULL DEFAULT 0,

		ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_CEMETERY INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHCRANE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_PIN_SOLDIER_TOBILLBOARD INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_ODESSAGUNSHIP INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_DONTTOUCHSAND INTEGER NOT NULL DEFAULT 0,
		
		ACHIEVEMENT_EVENT_HL2_BEAT_TURRETSTANDOFF2 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_FOLLOWFREEMAN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_TOXICTUNNEL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_PLAZASTANDOFF INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_ALLC1709SNIPERS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_SUPRESSIONDEVICE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_C1713STRIDERSTANDOFF INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_GAME INTEGER NOT NULL DEFAULT 0
		
		)
		]]
		
	if (sql.TableExists( DB.AchHlTwo.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchHlTwo.Table ) );
		-- print("Table " .. DB.AchHlTwo.Table .. " was created.")
	end
	
	
	local query = "CREATE TABLE " .. DB.LambdaHlTwo.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALSSTATION INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_VENTCRAWL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALSTUNNEL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SEWERGRATE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STEAMPIPE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CURVEDROOM INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SHANTYTOWN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_TUNNELLADDER INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_REDBARN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FLOATINGRAMP INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_ZOMBIEAMBUSH INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BELOWAPCS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COUNTERWEIGHT INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAILWAYBRIDGE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_TUNNELPLATFORMS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BANKEDCANAL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALWALL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CHANNELSPLIT INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BMEDOCK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GENERATORS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CARCRUSHERARENA INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAVENHOLMATTIC INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_MINETUNNELEXIT INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COASTSHACK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONSHACK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GUNSHIPVAN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SUICIDECITIZEN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAILROADSHACK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COASTABOVEBATTERY INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SANDSHACK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GMANCACHE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CELLCACHE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONLAUNDRY INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SODAMACHINE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARDOGWALL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARSHACK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARFENCE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FREEWAYTUNNEL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_DRAWBRIDGE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_PLAZAFENCE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SEWERSCATWALKS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONZOMBIEALCOVE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_PIPEHOPTUNNEL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_EXITCATWALK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_ENDOFC1712B INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_LAMDACACHE_WHITEVAN INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.LambdaHlTwo.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.LambdaHlTwo.Table ) );
		-- print("Table " .. DB.LambdaHlTwo.Table .. " was created.")
	end
	
	if (sql.TableExists("hl2c_playerdata") == true) then
		-- local query = sql.Query("SELECT Name FROM hl2c_playerdata Order By Level Desc LIMIT 5")
	
	
		-- if istable(query) then
		-- for k, v in ipairs(query) do
		
		-- end
		
		-- end
	
	end
	
	local query = "CREATE TABLE " .. DB.AchEpOne.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_EP1_BEAT_MAINELEVATOR INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_CITADELCORE_END INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_CITADELCORE_NOSTALKERKILLS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_GARAGEELEVATORSTANDOFF INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_HOSPITALATTICGUNSHIP INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_CITIZENESCORT_NOCITIZENDEATHS_END INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_GAME INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.AchEpOne.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchEpOne.Table ) );
		-- print("Table " .. DB.AchEpOne.Table .. " was created.")
	end
	
	local query = "CREATE TABLE " .. DB.AchEpTwo.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_EP2_BEAT_ANTLIONINVASION INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_ANTLIONGUARDS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_HUNTERAMBUSH INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_KILL_CHOPPER_NOMISSES_END INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_KILL_COMBINECANNON INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_RACEWITHDOG INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_ROCKETCACHEPUZZLE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_WHITEFORESTINN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_PUT_ITEMINROCKET INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_MISSILESILO2 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_GAME INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_OUTLAND12_NOBUILDINGSDESTROYED INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.AchEpTwo.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchEpTwo.Table ) );
		-- print("Table " .. DB.AchEpTwo.Table .. " was created.")
	end
	
	
	local query = "CREATE TABLE " .. DB.AchGenP1.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_GEN_BEAT_ALLHL2 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP1 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP2 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100ANTLIONS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_1000ANTLIONS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_10000ANTLIONS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100000ANTLIONS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100ZOMBIES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_1000ZOMBIES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_10000ZOMBIES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100000ZOMBIES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100COMBINES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_1000COMBINES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_10000COMBINES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100000COMBINES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100REBELS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_1000REBELS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_10000REBELS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100000REBELS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100VORTIGAUNTS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_1000VORTIGAUNTS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_10000VORTIGAUNTS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100000VORTIGAUNTS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100HEADCRABS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_1000HEADCRABS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_10000HEADCRABS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_100000HEADCRABS INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.AchGenP1.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchGenP1.Table ) );
		-- print("Table " .. DB.AchGenP1.Table .. " was created.")
	end
	
	local query = "CREATE TABLE " .. DB.AchGenP2.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP3 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_BEAT_ALLCD INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_BEAT_ALLMETA INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_LOVE_4EVER INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_FIND_EGGS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_HALLOWEEN_2016 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_KILL_HEADLESS_BOSS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_CHRISTMAS_2016 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_SAVE_SANTA INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_NEWYEAR_2017 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_LOVE_2017 INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_GEN_EVENT_EASTER_2017 INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.AchGenP2.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchGenP2.Table ) );
		-- print("Table " .. DB.AchGenP2.Table .. " was created.")
	end
	
	
	local query = "CREATE TABLE " .. DB.KillsP1.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		COUNT_KILLS_ANTLIONS INTEGER NOT NULL DEFAULT 0,
		COUNT_KILLS_ZOMBIES INTEGER NOT NULL DEFAULT 0,
		COUNT_KILLS_COMBINES INTEGER NOT NULL DEFAULT 0,
		COUNT_KILLS_REBELS INTEGER NOT NULL DEFAULT 0,
		COUNT_KILLS_VORTIGAUNTS INTEGER NOT NULL DEFAULT 0,
		COUNT_KILLS_HEADCRABS INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.KillsP1.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.KillsP1.Table ) );
		-- print("Table " .. DB.KillsP1.Table .. " was created.")
	else
		--sql.Query("DROP TABLE " .. DB.KillsP1.Table .. "")
	end
	
	
	local query = "CREATE TABLE " .. DB.VortexHl2.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		v_d1_trainstation_01 INTEGER NOT NULL DEFAULT 0,
		v_d1_trainstation_02 INTEGER NOT NULL DEFAULT 0,
		v_d1_trainstation_03 INTEGER NOT NULL DEFAULT 0,
		v_d1_trainstation_04 INTEGER NOT NULL DEFAULT 0,
		v_d1_trainstation_05 INTEGER NOT NULL DEFAULT 0,
		v_d1_trainstation_06 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_01 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_01a INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_02 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_03 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_05 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_06 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_07 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_08 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_09 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_10 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_11 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_12 INTEGER NOT NULL DEFAULT 0,
		v_d1_canals_13 INTEGER NOT NULL DEFAULT 0,
		v_d1_eli_01 INTEGER NOT NULL DEFAULT 0,
		v_d1_eli_02 INTEGER NOT NULL DEFAULT 0,
		v_d1_town_01 INTEGER NOT NULL DEFAULT 0,
		v_d1_town_01a INTEGER NOT NULL DEFAULT 0,
		v_d1_town_02 INTEGER NOT NULL DEFAULT 0,
		v_d1_town_02a INTEGER NOT NULL DEFAULT 0,
		v_d1_town_03 INTEGER NOT NULL DEFAULT 0,
		v_d1_town_04 INTEGER NOT NULL DEFAULT 0,
		v_d1_town_05 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_01 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_03 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_04 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_05 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_07 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_08 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_09 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_10 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_11 INTEGER NOT NULL DEFAULT 0,
		v_d2_coast_12 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_01 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_02 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_03 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_04 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_05 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_06 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_07 INTEGER NOT NULL DEFAULT 0,
		v_d2_prison_08 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_01 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_02 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_03 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_04 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_05 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_06a INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_06b INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_07 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_08 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_09 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_10a INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_10b INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_11 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_12 INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_12b INTEGER NOT NULL DEFAULT 0,
		v_d3_c17_13 INTEGER NOT NULL DEFAULT 0,
		v_d3_citadel_01 INTEGER NOT NULL DEFAULT 0,
		v_d3_citadel_03 INTEGER NOT NULL DEFAULT 0,
		v_d3_citadel_04 INTEGER NOT NULL DEFAULT 0,
		v_d3_citadel_05 INTEGER NOT NULL DEFAULT 0,
		v_d3_breen_01 INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.VortexHl2.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.VortexHl2.Table ) );
		-- print("Table " .. DB.VortexHl2.Table .. " was created.")
	-- elseif file.Exists("vortexhl2.txt", "DATA") and (sql.TableExists( DB.VortexHl2.Table ) == true) then
		-- sql.Query("DROP TABLE " .. DB.VortexHl2.Table .. "")
		-- print(sql.LastError())
		-- print(sql.TableExists( DB.VortexHl2.Table ) );
		-- print("Table " .. DB.VortexHl2.Table .. " was removed.")
	end
	
	
	local query = "CREATE TABLE " .. DB.VortexEP1.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		v_ep1_citadel_00 INTEGER NOT NULL DEFAULT 0,
		v_ep1_citadel_01 INTEGER NOT NULL DEFAULT 0,
		v_ep1_citadel_02 INTEGER NOT NULL DEFAULT 0,
		v_ep1_citadel_02b INTEGER NOT NULL DEFAULT 0,
		v_ep1_citadel_03 INTEGER NOT NULL DEFAULT 0,
		v_ep1_citadel_04 INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_00 INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_00a INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_01 INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_02 INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_02a INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_02b INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_05 INTEGER NOT NULL DEFAULT 0,
		v_ep1_c17_06 INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.VortexEP1.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.VortexEP1.Table ) );
		-- print("Table " .. DB.VortexEP1.Table .. " was created.")
	-- elseif file.Exists("vortexep1.txt", "DATA") and (sql.TableExists( DB.VortexEP1.Table ) == true) then
		-- sql.Query("DROP TABLE " .. DB.VortexEP1.Table .. "")
		-- print(sql.LastError())
		-- print(sql.TableExists( DB.VortexEP1.Table ) );
		-- print("Table " .. DB.VortexEP1.Table .. " was removed.")
	end
	
	
	local query = "CREATE TABLE " .. DB.VortexEP2.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		v_ep2_outland_01 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_01a INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_02 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_03 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_04 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_05 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_06 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_06a INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_07 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_08 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_09 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_10 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_10a INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_11 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_11a INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_11b INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_12 INTEGER NOT NULL DEFAULT 0,
		v_ep2_outland_12a INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.VortexEP2.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.VortexEP2.Table ) );
		-- print("Table " .. DB.VortexEP2.Table .. " was created.")
	-- elseif file.Exists("vortexep2.txt", "DATA") and (sql.TableExists( DB.VortexEP2.Table ) == true) then
		-- sql.Query("DROP TABLE " .. DB.VortexEP2.Table .. "")
		-- print(sql.LastError())
		-- print(sql.TableExists( DB.VortexEP2.Table ) );
		-- print("Table " .. DB.VortexEP2.Table .. " was removed.")
	end


	local query = "CREATE TABLE " .. DB.PermaPoint.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		Perma_Number INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.PermaPoint.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.PermaPoint.Table ) );
		-- print("Table " .. DB.PermaPoint.Table .. " was created.")
	-- elseif file.Exists("permapoint.txt", "DATA") and (sql.TableExists( DB.PermaPoint.Table ) == true) then
		-- sql.Query("DROP TABLE " .. DB.PermaPoint.Table .. "")
		-- print(sql.LastError())
		-- print(sql.TableExists( DB.PermaPoint.Table ) );
		-- print("Table " .. DB.PermaPoint.Table .. " was removed.")
	end

	local query = "CREATE TABLE " .. DB.CustomSetUp.P1 .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		CustomSetUpP1_01 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_02 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_03 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_04 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_05 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_06 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_07 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_08 INTEGER NOT NULL DEFAULT 0,
		CustomSetUpP1_09 INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.CustomSetUp.P1 ) == false) then

		
		sql.Begin();
		sql.Query(query)
		sql.Commit();
		
		print(sql.LastError())
		print(query);
		print(sql.TableExists( DB.CustomSetUp.P1 ) );
		print("Table " .. DB.CustomSetUp.P1 .. " was created.")
	elseif file.Exists("permapoint.txt", "DATA") and (sql.TableExists( DB.CustomSetUp.P1 ) == true) then
		--sql.Query("DROP TABLE " .. DB.CustomSetUp.P1 .. "")
		--print(sql.LastError())
		--print(sql.TableExists( DB.CustomSetUp.P1 ) );
		--print("Table " .. DB.CustomSetUp.P1 .. " was removed.")
	end
	
	local query = "CREATE TABLE " .. DB.CustomCounters.P1 .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		CCustomCounterP1_00 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_01 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_02 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_03 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_04 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_05 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_06 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_07 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_08 INTEGER NOT NULL DEFAULT 0,
		CCustomCounterP1_09 INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.CustomCounters.P1 ) == false) then

		
		sql.Begin();
		sql.Query(query)
		sql.Commit();
		
		print(sql.LastError())
		print(query);
		print(sql.TableExists( DB.CustomCounters.P1 ) );
		print("Table " .. DB.CustomCounters.P1 .. " was created.")
	elseif file.Exists("permapoint.txt", "DATA") and (sql.TableExists( DB.CustomCounters.P1 ) == true) then
		--sql.Query("DROP TABLE " .. DB.CustomCounters.P1 .. "")
		--print(sql.LastError())
		--print(sql.TableExists( DB.CustomCounters.P1 ) );
		--print("Table " .. DB.CustomCounters.P1 .. " was removed.")
	end
	
	local query = "CREATE TABLE " .. DB.AchHlTwo.P2.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS  INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_SIXGUNSHIPS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_BARNACLESWITHBARREL INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_ENEMY_WITHTOILET INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHMANHACK INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHANTLIONS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR INTEGER NOT NULL DEFAULT 0 
		)
		]]
		
	if (sql.TableExists( DB.AchHlTwo.P2.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchHlTwo.P2.Table ) );
		-- print("Table " .. DB.AchHlTwo.P2.Table .. " was created.")
	-- elseif file.Exists("reset_part2achies.txt", "DATA") and (sql.TableExists( DB.AchHlTwo.P2.Table ) == true) then
		-- sql.Query("DROP TABLE " .. DB.AchHlTwo.P2.Table .. "")
	end
	
	local query = "CREATE TABLE " .. DB.AchEpOne.P2.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_EP1_KILL_ANTLIONS_WITHCARS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_KILL_ENEMIES_WITHSNIPERALYX INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONEBULLET INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_KILL_ZOMBIES_WITHFLARES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.AchEpOne.P2.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchEpOne.P2.Table ) );
		-- print("Table " .. DB.AchEpOne.P2.Table .. " was created.")
	-- elseif file.Exists("reset_part2achies.txt", "DATA") and (sql.TableExists( DB.AchEpOne.P2.Table ) == true) then
		-- sql.Query("DROP TABLE " .. DB.AchEpOne.P1.Table .. "")
	end
	
	local query = "CREATE TABLE " .. DB.AchEpTwo.P2.Table .. "\n" ..
		[[
		(
		UniqueID text UNIQUE NOT NULL,
		ACHIEVEMENT_EVENT_EP2_KILL_POISONANTLION INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_KILL_ALLGRUBS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_KILL_HUNTER_WITHFLECHETTES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_KILL_ENEMY_WITHHOPPERMINE INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHPHYSICS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_FIND_ALLRADARCACHES INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BREAK_ALLWEBS INTEGER NOT NULL DEFAULT 0,
		ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.AchEpTwo.P2.Table ) == false) then

		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.AchEpTwo.P2.Table ) );
		-- print("Table " .. DB.AchEpTwo.P2.Table .. " was created.")
	-- elseif file.Exists("reset_part2achies.txt", "DATA") and (sql.TableExists( DB.AchEpTwo.P2.Table ) == true) then
		-- sql.Query("DROP TABLE " .. DB.AchEpTwo.P2.Table .. "")
	end
	
	/* --------------------------------------------
	DB.Pet = {};
	DB.Pet.List = "hl2c_pet_list"
	DB.Pet.Main = "hl2c_pet_main"
	DB.Pet.Setting = "hl2c_pet_setting"
	DB.Pet.Shop = "hl2c_pet_shop"
	----------------------------------------------- */
	local query = "CREATE TABLE " .. DB.Pet.Main .. "\n" ..
		[[
		(
		STEAMID text UNIQUE NOT NULL,
		PET_ID varchar(255) NOT NULL DEFAULT '999',
		PET_NAME text NOT NULL DEFAULT 'pet',
		PET_LEVEL INTEGER NOT NULL DEFAULT 1,
		PET_XP INTEGER NOT NULL DEFAULT 0,
		PET_TALENT INTEGER NOT NULL DEFAULT 0,
		PET_HP INTEGER NOT NULL DEFAULT 250,
		PET_SCALE INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_01_INT INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_02_INT INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_03_INT INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_01_TEXT varchar(255) NOT NULL DEFAULT '999',
		PET_CUSTOM_02_TEXT varchar(255) NOT NULL DEFAULT '999',
		PET_CUSTOM_03_TEXT varchar(255) NOT NULL DEFAULT '999'
		)
		]]
		
	if (sql.TableExists( DB.Pet.Main ) == false) then
		
		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.Pet.Main ) );
		-- print("Table " .. DB.Pet.Main .. " was created.")
	-- elseif file.Exists("reset_petmain.txt", "DATA") and (sql.TableExists( DB.Pet.Main ) == true) then
		-- sql.Query("DROP TABLE " .. DB.Pet.Main .. "")
	end
	
	local query = "CREATE TABLE " .. DB.Pet.List .. "\n" ..
		[[
		(
		STEAMID text NOT NULL,
		PET_ID varchar(255) NOT NULL DEFAULT '999',
		PET_NAME text NOT NULL DEFAULT 'pet',
		PET_LEVEL INTEGER NOT NULL DEFAULT 1,
		PET_XP INTEGER NOT NULL DEFAULT 0,
		PET_TALENT INTEGER NOT NULL DEFAULT 0,
		PET_HP INTEGER NOT NULL DEFAULT 250,
		PET_SCALE INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_01_INT INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_02_INT INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_03_INT INTEGER NOT NULL DEFAULT 0,
		PET_CUSTOM_01_TEXT varchar(255) NOT NULL DEFAULT '999',
		PET_CUSTOM_02_TEXT varchar(255) NOT NULL DEFAULT '999',
		PET_CUSTOM_03_TEXT varchar(255) NOT NULL DEFAULT '999'
		)
		]]
		
	if (sql.TableExists( DB.Pet.List ) == false) then
		
		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.Pet.List ) );
		-- print("Table " .. DB.Pet.List .. " was created.")
	-- elseif file.Exists("reset_petlist.txt", "DATA") and (sql.TableExists( DB.Pet.List ) == true) then
		-- sql.Query("DROP TABLE " .. DB.Pet.List .. "")
	end
	
	local query = "CREATE TABLE " .. DB.Pet.Shop .. "\n" ..
		[[
		(
		STEAMID text UNIQUE NOT NULL,
		PET_000 INTEGER NOT NULL DEFAULT 0,
		PET_001 INTEGER NOT NULL DEFAULT 0,
		PET_002 INTEGER NOT NULL DEFAULT 0,
		PET_003 INTEGER NOT NULL DEFAULT 0,
		PET_004 INTEGER NOT NULL DEFAULT 0,
		PET_005 INTEGER NOT NULL DEFAULT 0,
		PET_006 INTEGER NOT NULL DEFAULT 0,
		PET_007 INTEGER NOT NULL DEFAULT 0,
		PET_008 INTEGER NOT NULL DEFAULT 0,
		PET_009 INTEGER NOT NULL DEFAULT 0,
		PET_010 INTEGER NOT NULL DEFAULT 0,
		PET_011 INTEGER NOT NULL DEFAULT 0,
		PET_012 INTEGER NOT NULL DEFAULT 0,
		PET_013 INTEGER NOT NULL DEFAULT 0,
		PET_014 INTEGER NOT NULL DEFAULT 0,
		PET_015 INTEGER NOT NULL DEFAULT 0,
		PET_016 INTEGER NOT NULL DEFAULT 0,
		PET_017 INTEGER NOT NULL DEFAULT 0,
		PET_018 INTEGER NOT NULL DEFAULT 0,
		PET_019 INTEGER NOT NULL DEFAULT 0,
		PET_020 INTEGER NOT NULL DEFAULT 0,
		PET_021 INTEGER NOT NULL DEFAULT 0,
		PET_022 INTEGER NOT NULL DEFAULT 0,
		PET_023 INTEGER NOT NULL DEFAULT 0,
		PET_024 INTEGER NOT NULL DEFAULT 0,
		PET_025 INTEGER NOT NULL DEFAULT 0,
		PET_026 INTEGER NOT NULL DEFAULT 0,
		PET_027 INTEGER NOT NULL DEFAULT 0,
		PET_028 INTEGER NOT NULL DEFAULT 0,
		PET_029 INTEGER NOT NULL DEFAULT 0,
		PET_030 INTEGER NOT NULL DEFAULT 0,
		PET_031 INTEGER NOT NULL DEFAULT 0,
		PET_032 INTEGER NOT NULL DEFAULT 0,
		PET_033 INTEGER NOT NULL DEFAULT 0,
		PET_034 INTEGER NOT NULL DEFAULT 0,
		PET_035 INTEGER NOT NULL DEFAULT 0,
		PET_036 INTEGER NOT NULL DEFAULT 0,
		PET_037 INTEGER NOT NULL DEFAULT 0,
		PET_038 INTEGER NOT NULL DEFAULT 0,
		PET_039 INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.Pet.Shop ) == false) then
		
		
		-- sql.Begin();
		-- sql.Query(query)
		-- sql.Commit();
		
		-- print(sql.LastError())
		-- print(query);
		-- print(sql.TableExists( DB.Pet.Shop ) );
		-- print("Table " .. DB.Pet.Shop .. " was created.")
	-- elseif file.Exists("reset_petshop.txt", "DATA") and (sql.TableExists( DB.Pet.Shop ) == true) then
		-- sql.Query("DROP TABLE " .. DB.Pet.Shop .. "")
	end
	
	local query = "CREATE TABLE " .. DB.PermaPoint.Items.Upgrades.P1 .. "\n" ..
		[[
		(
		STEAMID text UNIQUE NOT NULL,
		SHOP_UPGRADE_001 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_003 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_004 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_005 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_006 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_007 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_008 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_009 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_010 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_011 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_012 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_013 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_014 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_015 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_016 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_017 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_018 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_019 INTEGER NOT NULL DEFAULT 0,
		SHOP_UPGRADE_020 INTEGER NOT NULL DEFAULT 0
		)
		]]
		
	if (sql.TableExists( DB.PermaPoint.Items.Upgrades.P1 ) == false) then
		
		
		sql.Begin();
		sql.Query(query)
		sql.Commit();
		
		print(sql.LastError())
		print(query);
		print(sql.TableExists( DB.PermaPoint.Items.Upgrades.P1 ) );
		print("Table " .. DB.PermaPoint.Items.Upgrades.P1 .. " was created.")
	elseif file.Exists("reset_petshop.txt", "DATA") and (sql.TableExists( DB.PermaPoint.Items.Upgrades.P1 ) == true) then
		-- sql.Query("DROP TABLE " .. DB.Pet.Shop .. "")
	end

	local query = "CREATE TABLE " .. DB.Player.Appear .. "\n" ..
		[[
		(
		STEAMID text UNIQUE NOT NULL,
		MODEL text NULL,
		HEAD text NULL
		)
		]]
		
	if (sql.TableExists( DB.Player.Appear ) == false) then
		
		
		sql.Begin();
		sql.Query(query)
		sql.Commit();
		
		print(sql.LastError())
		print(query);
		print(sql.TableExists( DB.Player.Appear ) );
		print("Table " .. DB.Player.Appear .. " was created.")
	elseif file.Exists("reset_petshop.txt", "DATA") and (sql.TableExists( DB.Player.Appear ) == true) then
		-- sql.Query("DROP TABLE " .. DB.Player.Appear .. "")
	end

	
	/*
	ALTER TABLE Customers
	ADD Ach text DEFAULT 'Hello'
	*/
	
end
hook.Add("Initialize", "DBInitalizeHook", DB.Initialize)
/*

"ACHIEVEMENT_EVENT_EP2_KILL_POISONANTLION",
	"ACHIEVEMENT_EVENT_EP2_KILL_ALLGRUBS",
	"ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR",
	"ACHIEVEMENT_EVENT_EP2_KILL_HUNTER_WITHFLECHETTES",
	"ACHIEVEMENT_EVENT_EP2_KILL_ENEMY_WITHHOPPERMINE",
	"ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHPHYSICS",
	"ACHIEVEMENT_EVENT_EP2_FIND_ALLRADARCACHES",
	"ACHIEVEMENT_EVENT_EP2_BREAK_ALLWEBS",
	"ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR"
*/