// Send the required lua files to the client
//AddCSLuaFile("sh_config.lua")
//AddCSLuaFile("sh_player.lua")
//AddCSLuaFile("sh_init.lua")

//AddCSLuaFile("cl_init.lua")
//AddCSLuaFile("cl_scoreboard.lua")
//AddCSLuaFile("cl_scoreboard_playerlist.lua")
//AddCSLuaFile("cl_scoreboard_playerrow.lua")
//AddCSLuaFile("cl_targetid.lua")
//AddCSLuaFile("cl_helpmenu.lua")
//AddCSLuaFile("cl_spawnmenu.lua")
--AddCSLuaFile("sh_config.lua")
--AddCSLuaFile("sh_init.lua")
--AddCSLuaFile("sh_player.lua")
//AddCSLuaFile("player_class/player_coop.lua")
//AddCSLuaFile("contenticon.lua")
//AddCSLuaFile("cl_chat.lua")
//AddCSLuaFile("cl_ads.lua")
//AddCSLuaFile("cl_chat_color.lua")
//AddCSLuaFile("cl_upgrade_menu.lua")
//AddCSLuaFile("cl_hud.lua")
//AddCSLuaFile("cl_stat.lua")
//AddCSLuaFile("cl_achi_event.lua")

--AddCSLuaFile("coop/shared.lua")
--AddCSLuaFile("coop/cl_init.lua")

//AddCSLuaFile("modules/von.lua")
//AddCSLuaFile("modules/netstream.lua")
--AddCSLuaFile("sh_spawnmenu_list.lua")


// Include the required lua files
--[[ Core Lua Files ]]
include("secret.lua")
include("resource.lua")
include("network.lua")
include("commands.lua")
include("chat.lua")
include("init_postentity.lua")
include("inputoutput.lua")
include("entitycreate.lua")
include("extend.lua")
include("gmod_fix.lua")
include("keyvalue.lua")
include("mapread.lua")
include("oc_support.lua")
include("scalenpcdamage.lua")
include("mapchange.lua")
include("onnpckilled.lua")
include("think.lua")
include("vortex.lua")
include("vehicle.lua")

-----------------------------]]

--[[ Extension Lua Files ]]
include("player/init.lua")
include("freeman/init.lua")
include("xp_farm/init.lua")
include("event/init.lua")
include("weapon-share/sv_init.lua")
include("engine/init.lua")
include("scene/sv_init.lua")
include("orangebox/sv_init.lua")
include("ach/sv_init.lua")
include("dmg_scan/sv_init.lua")
include("ent_dmg/sv_init.lua")
include("respawn-weapon/sv_init.lua")
include("sql/init.lua")

include("vote/nextmap.lua")
include("vote/lobby.lua")
include("vote/difficulty.lua")
include("squad/sv_init.lua")
include("inventory/database.lua")

//include("restartmap.lua")
include("list/spawnmenu_list.lua")
include("shop/shop_list.lua")
include("list/inventory_list.lua")
include("ai/sv_init.lua")
include("skill/skills.lua")
include("pet/sv_init.lua")

-----------------------------]]

// Include the configuration for this map
if file.Exists("gamemodes/hl2c/gamemode/mods/hl2c_gametype.lua", "MOD") then
	
	DbgPrint("GameTypes Loaded")
	include("../mods/hl2c_gametype.lua")
end
	--custom_maps
--[[ if file.Exists("hl2c_custom/maps/"..game.GetMap()..".lua", "LUA") then
	include("hl2c_custom/maps/"..game.GetMap()..".lua")
	-- Default
elseif file.Exists("maps/"..game.GetMap()..".lua", "LUA") then
	include("maps/"..game.GetMap()..".lua")
	--oc
elseif file.Exists("oc/maps/"..game.GetMap()..".lua", "LUA") then
	include("oc/maps/"..game.GetMap()..".lua")
	--syn
elseif file.Exists("syn/maps/"..game.GetMap()..".lua", "LUA") then
	include("syn/maps/"..game.GetMap()..".lua")
elseif file.Exists("cd/maps/"..game.GetMap()..".lua", "LUA") then
	include("cd/maps/"..game.GetMap()..".lua")
	--hl2
elseif file.Exists("hl2/maps/"..game.GetMap()..".lua", "LUA") then
	include("hl2/maps/"..game.GetMap()..".lua")
	--lostcoast
elseif file.Exists("lostcoast/maps/"..game.GetMap()..".lua", "LUA") then
	include("lostcoast/maps/"..game.GetMap()..".lua")
	--episodic
elseif file.Exists("episodic/maps/"..game.GetMap()..".lua", "LUA") then
	include("episodic/maps/"..game.GetMap()..".lua")
	--ep2
elseif file.Exists("ep2/maps/"..game.GetMap()..".lua", "LUA") then
	include("ep2/maps/"..game.GetMap()..".lua")
	--ep3
elseif file.Exists("ep3/maps/"..game.GetMap()..".lua", "LUA") then
	include("ep3/maps/"..game.GetMap()..".lua")
	--ep1
elseif file.Exists("ep1/maps/"..game.GetMap()..".lua", "LUA") then
	include("../ep1/maps/"..game.GetMap()..".lua")
	--hl1
elseif file.Exists("hl1/maps/"..game.GetMap()..".lua", "LUA") then
	include("../hl1/maps/"..game.GetMap()..".lua")
	--lobby
elseif (game.GetMap() == LOBBY_TEXT_MAP and file.Exists("lobby/maps/keyfox_lobby.lua", "LUA") then
	include("lobby/maps/keyfox_lobby.lua")
	--Minerva Metastasis
elseif file.Exists("metastasis/maps/"..game.GetMap()..".lua", "LUA") then
	include("metastasis/maps/"..game.GetMap()..".lua")
	
else
	include("../maps/"..game.GetMap()..".lua")
end ]]



// This Stuff Allow weapon respawn :P //

ALLOW_WEAPON_RESPAWNS = true

/////////////////////////////////////////
-----------------------------------------

/////////////////////////////////////////
// 			Some hooks				   //
/////////////////////////////////////////
gameevent.Listen("player_connect")
hook.Add("player_connect", "PlayerConnectedAnnouncement", function(data)
	local name = data.name			// Same as Player:Nick()
	local steamid = data.networkid	// Same as Player:SteamID()
	local ip = data.address			// Same as Player:IPAddress()
	local id = data.userid			// Same as Player:UserID()
	local bot = data.bot			// Same as Player:IsBot()
	local index = data.index		// Same as Player:EntIndex()
	for _, pl in pairs(player.GetAll()) do
		-- if GetConVarNumber("hl2c_use_old_umsg") >= 1 then
			-- umsg.Start("PlayerJoinMessage", pl)
			-- umsg.String(data.name)
			-- umsg.End()
		-- elseif GetConVarNumber("hl2c_use_old_umsg") == 0 then
			-- net.Start("PlayerJoinMessage")
				-- net.WriteString(data.name)
			-- net.Send(pl)
		-- end
		umsg.Start("PlayerJoinMessage", pl)
			umsg.String(data.name)
		umsg.End()
	end
	if ( AirboatBattle_Bug ) then
	
		if game.GetMap() == "d1_canals_11" then
			if player.GetCount() >= 1 then
				game.KickID( id, "While Players started the encounter on d1_canals_11 You Cannot Join!" )
			end
		end
		
		if game.GetMap() == "d1_canals_12" then
			if player.GetCount() >= 1 then
				game.KickID( id, "While Players started the encounter on d1_canals_12 You Cannot Join!" )
			end
		end
		
		if game.GetMap() == "d1_canals_13" then
			if player.GetCount() >= 1 then
				game.KickID( id, "While Players started the encounter on d1_canals_13 You Cannot Join!" )
			end
		end
	
	end
	--file.Delete("golobby.txt")
	--DbgPrint("[hl2c] Timer Destroyed")
	timer.Destroy("LetsGoLobby")
	timer.Destroy("RestartNoPl")
end)

gameevent.Listen( "player_disconnect" )
hook.Add( "player_disconnect", "player_disconnect_example", function( data )
	local name = data.name			// Same as Player:Nick()
	local steamid = data.networkid		// Same as Player:SteamID()
	local id = data.userid			// Same as Player:UserID()
	local bot = data.bot			// Same as Player:IsBot()
	local reason = data.reason		// Text reason for disconnected such as "Kicked by console!", "Timed out!", etc...
	
	for _, pl in pairs(player.GetAll()) do
		umsg.Start("PlayerLeaveMessage", pl)
			umsg.String(name)
			umsg.String(reason)
		umsg.End()
	end
	
	Hl2c.IsServerEmpty_RestartMap()
	-- PrintMessage(HUD_PRINTTALK, "Player "..name.." has ( Disconnected from the Server Reason: "..reason.." )")
	// Player has disconnected - this is more reliable than PlayerDisconnect

end )
/////////////////////////////////////////


function GM:CreateEntityRagdoll( entity, ragdoll )
	-- DbgPrint("new ragdoll?")
end

-- ragdoll:Fire( "FadeAndRemove", "", 0)


function GM:CheckStuckScenes()
	-- oldPrint("HI")
	for ent,_ in pairs(self.LogicChoreographedScenes or {}) do

		if not IsValid(ent) then
			table.remove(self.LogicChoreographedScenes, ent)
			continue
		end

		local savetable = ent:GetSaveTable()
		if savetable.m_bWaitingForActor == true then
			if ent.WaitingForActor ~= true then
				oldPrint(ent, "now waiting for actor")
				ent.WaitingForActorTime = CurTime()
				ent.WaitingForActor = true
			elseif ent.WaitingForActor == true then
				local delta = CurTime() - ent.WaitingForActorTime
				if delta >= 10 then
					oldPrint("Long waiting logic_choreographed_scene")
					ent:SetKeyValue("busyactor", "0")
					ent.WaitingForActor = false
				end
			end
		else
			if ent.WaitingForActor == true then
				oldPrint(ent, "no longer waiting")
			end
			ent.WaitingForActor = false
		end

	end

end


// This is called when the player calls a question line
net.Receive("PlayerCalledVoiceLine", function(len, pl)
	PlayerVoiceLine(pl)
end)
util.AddNetworkString("PlayerCalledCheer")
// This is called when the player calls a question line
net.Receive("PlayerCalledCheer", function(len, pl)
	PlayerCheer(pl)
	-- DbgPrint("called?")
end)

// This is called when the player calls a warning
net.Receive("PlayerCalledWarning", function(len, pl)
	PlayerWarning(pl)
end)

--concommand.Add( "open_spawnmenu", SpawnMenuEnabled )




// Creates a spawn point
function GM:CreateSpawnPoint(pos, yaw)
	local ips = ents.Create("info_player_start")
	ips:SetPos(pos)
	ips:SetAngles(Angle(0, yaw, 0))
	ips:Spawn()
end


// Creates a trigger delaymapload
function GM:CreateTDML(min, max)
	tdmlPos = max - ((max - min) / 2)
	
	local tdml = ents.Create("trigger_delaymapload")
	tdml:SetPos(tdmlPos)
	tdml.min = min
	tdml.max = max
	tdml:Spawn()
end


// Creates a brush playerfreeze
function GM:CreatePF(min, max)
	pfPos = max - ((max - min) / 2)
	
	local pf = ents.Create("brush_playerfreeze")
	pf:SetPos(pfPos)
	pf.min = min
	pf.max = max
	pf:Spawn()
end

// Creates a brush trigger_airboatgun_hl2c
function GM:CreateABG(min, max)
	abgPos = max - ((max - min) / 2)

	local abg = ents.Create("trigger_airboatgun_hl2c")
	abg:SetPos(abgPos)
	abg.min = min
	abg.max = max
	abg:Spawn()
end

// Creates a brush playerclip
// BROUGHT BACK FROM THE DEAD
function GM:CreatePC(min, max)
	pcPos = max - ((max - min) / 2)
	
	local pc = ents.Create("brush_playerclip")
	pc:SetPos(pcPos)
	pc.min = min
	pc.max = max
	pc:Spawn()
end

function GM:CreateVC(min, max)
	vcPos = max - ((max - min) / 2)
	
	local vc = ents.Create("brush_vehicleclip")
	vc:SetPos(vcPos)
	vc.min = min
	vc.max = max
	vc:Spawn()
end


// Creates a trigger vehiclespawn
function GM:CreateTVS(min, max)
	tvsPos = max - ((max - min) / 2)
	
	local tvs = ents.Create("trigger_vehiclespawn")
	tvs:SetPos(tvsPos)
	tvs.min = min
	tvs.max = max
	tvs:Spawn()
end

function Hl2c.CountAllGrubs()
	local count = 0
	for k, v in pairs(ents.FindByClass("npc_antlion_grub")) do
		count = count + 1
		print("Vector: ".. tostring(v:GetPos()) )
	end
	print("Grubs Count: "..count)
	Hl2c.DefaultChatPrint("Grubs Count: "..tostring(count))
end



function GM:CreateEntityRagdoll( owner, ragdoll )
end

// Added these here because they were undefined!
deadPlayers = deadPlayers or {}
difficulty = difficulty or 1
changingLevel = changingLevel or false
checkpointPositions = checkpointPositions or {}
nextAreaOpenTime = 0 
startingWeapons = startingWeapons or {}
warningPositions = warningPositions or {}
HL2C_COMBINE_JOIN = false

function Init_Map()
	-- databaseConvertSqlToDB()
	if file.Exists( "dev.txt", "DATA" ) then
		DEV_MODE = true
		print("DEV_MODE ON")
	end
	
	if game.GetMap() == "ep2_outland_01a"
	then
		EP2_GRUB_ACH = true	
	end
	
	if game.GetMap() == "ep2_outland_02" and
	file.Exists("hl2c_data/".."ep2_outland_01a".."grub.txt","DATA")
	then
		EP2_GRUB_ACH = true			
	end
	
	if game.GetMap() == "ep2_outland_03" and
	file.Exists("hl2c_data/".."ep2_outland_02".."grub.txt","DATA")
	then
		EP2_GRUB_ACH = true			
	end
	
	if game.GetMap() == "ep2_outland_04" and
	file.Exists("hl2c_data/".."ep2_outland_03".."grub.txt","DATA")
	then
		EP2_GRUB_ACH = true			
	end
	
	
	GAME_MAP_SET = false
	GAME_IS_EP2 = false
	GAME_IS_EP1  = false
	GAME_IS_HL2 = false
	GAME_IS_LOSTCOAST = false
	
	if GAME_MAP_SET != true then
		
		if Hl2c.Maps.Hl2[game.GetMap()] then
			GAME_MAP_SET = true
			GAME_IS_EP2 = false
			GAME_IS_EP1 = false
			GAME_IS_HL2 = true
			GAME_MAP_SET = true
			--GAME_HL2_CHECKED = true
			DbgPrint("[hl2c]: Initialized Half - Life 2 Map")
		elseif Hl2c.Maps.Ep1[game.GetMap()] then
			GAME_MAP_SET = true
			GAME_IS_EP2 = false
			GAME_IS_EP1 = true
			GAME_IS_HL2 = false
			GAME_MAP_SET = true
			DbgPrint("[hl2c]: Initialized Episode Two Map")
		elseif Hl2c.Maps.Ep2[game.GetMap()] then
			GAME_MAP_SET = true
			GAME_IS_EP2 = true
			GAME_IS_EP1 = false
			GAME_IS_HL2 = false
			GAME_MAP_SET = true
			DbgPrint("[hl2c]: Initialized Episode Two Map")
		elseif game.GetMap() == "d2_lostcoast" then
			GAME_MAP_SET = true
			GAME_IS_EP2 = false
			GAME_IS_EP1 = false
			GAME_IS_HL2 = false
			GAME_IS_LOSTCOAST = true
			GAME_MAP_SET = true
			DbgPrint("[hl2c]: Initialized LostCoast Map")
		else
			GAME_MAP_SET = true
			GAME_IS_EP2 = false
			GAME_IS_EP1 = false
			GAME_IS_HL2 = false
			GAME_MAP_SET = true
			DbgPrint("[hl2c]: Initialized Custom Map")
		end
	end
	if GAME_MAP_NOT_FOUND and (GAME_IS_EP2 != true and GAME_IS_EP1 != true and GAME_IS_HL2 != true) then
		--DbgPrint("[hl2c]: Initialized Custom Map")
	end
	
	if CD_MAP then
		resource.AddWorkshop("653495819")
		DbgPrint("[hl2c]: Initialized Combine Destinty Map")
	elseif COASTLINE then
		resource.AddWorkshop("815865048")
		resource.AddWorkshop("815866528")
		resource.AddWorkshop("815867109")
		resource.AddWorkshop("815873943")
	elseif GAME_IS_EP3 then
		resource.AddWorkshop("743294633")
	elseif METASTASIS_MAP then
		resource.AddWorkshop("707999614")
		resource.AddWorkshop("708409658")
		DbgPrint("[hl2c]: Initialized Metastasis:Minvera Map")
	elseif OC_MAP then
		resource.AddWorkshop("790775665") 
		resource.AddWorkshop("790770878") 
		resource.AddWorkshop("790769835") 
		resource.AddWorkshop("790769256")
		--http://steamcommunity.com/sharedfiles/filedetails/?id=790775665
		--http://steamcommunity.com/sharedfiles/filedetails/?id=790770878
		-- http://steamcommunity.com/sharedfiles/filedetails/?id=790769835
		--http://steamcommunity.com/sharedfiles/filedetails/?id=790769256
		DbgPrint("[hl2c]: Initialized Obsidian Conflict Map")
	elseif SYN_MAP then
		resource.AddWorkshop("790786002") 
		resource.AddWorkshop("790785380") 
		resource.AddWorkshop("790784523") 
		--http://steamcommunity.com/sharedfiles/filedetails/?id=790786002
		-- http://steamcommunity.com/sharedfiles/filedetails/?id=790785380
		-- http://steamcommunity.com/sharedfiles/filedetails/?id=790784523
		DbgPrint("[hl2c]: Initialized Synergy Map")
	elseif HL2MP_IS_COOP_MAP and SYN_MAP != true and OC_MAP != true then
		resource.AddWorkshop("790538375") 
		resource.AddWorkshop("790534909") 
		resource.AddWorkshop("790532991") 
		resource.AddWorkshop("790531384") 
		resource.AddWorkshop("790527383") 
		resource.AddWorkshop("790530306") 
		resource.AddWorkshop("790523020") 
		resource.AddWorkshop("813841940") 
		/*
		http://steamcommunity.com/sharedfiles/filedetails/?id=790538375
		http://steamcommunity.com/sharedfiles/filedetails/?id=790534909
		http://steamcommunity.com/sharedfiles/filedetails/?id=790532991
		http://steamcommunity.com/sharedfiles/filedetails/?id=790531384
		http://steamcommunity.com/sharedfiles/filedetails/?id=790527383
		http://steamcommunity.com/sharedfiles/filedetails/?id=790530306
		http://steamcommunity.com/sharedfiles/filedetails/?id=790523020
		*/
		DbgPrint("[hl2c]: Initialized HL2DM Map")
	end
end

// Called immediately after starting the gamemode  
function GM:Initialize()
	
	--
	-- Set Up Game Map
	--
	
	// Precache all the player models ahead of time
	for _, playerModel in pairs(PLAYER_MODELS) do
		util.PrecacheModel(playerModel)
	end

	-- for _, adminModel in pairs(PLAYER_MODELS_ADMIN) do
		-- util.PrecacheModel(adminModel)
	-- end
	self:LoadGameTypes()
	-- DbgPrint(Hl2c.GameTypes[game.GetMap():lower()])
	self:SetGameType(Hl2c.GameTypes[game.GetMap():lower()])
	
	-- if MapScript then self.MapScript = MapScript end
	Init_Map()
	
	-- print(GameTypes.Registered[""])
	
	--
	-- Remove Achievement reminder.
	--
	if game.GetMap() == "d2_coast_01" then
		--if file.Exists("hl2c_data/ravenholm-no-achi.txt", "DATA") then
		--	file.Delete("hl2c_data/ravenholm-no-achi.txt")
		--	DbgPrint("hl2c_data/ravenholm-no-achi.txt".." DELETED")
		--end
	end
	if game.GetMap() == "d1_eli_02" then
		--if file.Exists("hl2c_data/ravenholm-no-achi.txt", "DATA") then
		--	file.Delete("hl2c_data/ravenholm-no-achi.txt")
		--	DbgPrint("hl2c_data/ravenholm-no-achi.txt".." DELETED")
		--end
	end
	if game.GetMap() == LOBBY_TEXT_MAP then
		file.Delete("hl2c_data/".."ep2_outland_01a".."grub.txt")		
		file.Delete("hl2c_data/".."ep2_outland_02".."grub.txt")		
		file.Delete("hl2c_data/".."ep2_outland_03".."grub.txt")	
		
		--if file.Exists("hl2c_data/ravenholm-no-achi.txt", "DATA") then
		--	file.Delete("hl2c_data/ravenholm-no-achi.txt")
		--	DbgPrint("hl2c_data/ravenholm-no-achi.txt".." DELETED")
		--end
		INLOBBY = true
		--DbgPrint("[hl2c] We are in lobby? true")
		--DbgPrint("[hl2c] We are in lobby? true")
	else
		INLOBBY = false
		--DbgPrint("[hl2c] We are in lobby? false")
		--DbgPrint("[hl2c] We are in lobby? false")
	end
	
	if CD_MAP then
		if SERVER then
			resource.AddWorkshop("653495819")
		end
	end
	if METASTASIS_MAP then
		if SERVER then
			resource.AddWorkshop("707999614")
		end
	end
	resource.AddWorkshop("717483488")
	
	-- if file.Exists("hl2c_data/hl2c_crash_recovery.txt", "DATA") then
		--if mapRecover.predicted_crash == nil && mapRecover.predicted_crash == game.GetMap() then
		-- timer.Simple( 45, function()
			-- file.Delete("hl2c_data/hl2c_crash_recovery.txt")
			--game.ConsoleCommand("changelevel "..mapRecover.predicted_crash.."\n")
		-- end)
	-- end


	deadPlayers = {}
	difficulty = difficulty or 1
	changingLevel = false
	checkpointPositions = {}
	nextAreaOpenTime = 0
	startingWeapons = {}
	warningPositions = {}
	
	
	// We want regular fall damage and the ai to attack players and stuff
	game.ConsoleCommand("ai_disabled 0\n")
	game.ConsoleCommand("ai_ignoreplayers 0\n")
	game.ConsoleCommand("hl2_episodic 0\n")
	game.ConsoleCommand("mp_falldamage 1\n")
	game.ConsoleCommand("physgun_limited 1\n")
	game.ConsoleCommand("ai_serverragdolls 0\n")
	if GetConVarNumber("hl2c_additions") >= 1 then
		game.ConsoleCommand("sv_rollangle 2\n")
	else
		game.ConsoleCommand("sv_rollangle 0\n")
	end
	if string.find(game.GetMap(), "ep1_") || string.find(game.GetMap(), "ep2_") then
		game.ConsoleCommand("hl2_episodic 1\n")
	end
	if string.find(game.GetMap(), "t0a") || string.find(game.GetMap(), "c0a") || string.find(game.GetMap(), "c1a") || string.find(game.GetMap(), "c2a") || string.find(game.GetMap(), "c3a") || string.find(game.GetMap(), "c4a") || string.find(game.GetMap(), "c5a") then
		HL1_CAMPAIGN = true
	else
		HL1_CAMPAIGN = false
	end
	
	// Super gravity gun test
	if SUPER_GRAVITY_GUN then
		RunConsoleCommand("physcannon_pullforce", "8000")
		RunConsoleCommand("physcannon_tracelength", "850")
	elseif !SUPER_GRAVITY_GUN then
		RunConsoleCommand("physcannon_pullforce", "4000")
		RunConsoleCommand("physcannon_tracelength", "250")
	end
	
	// Kill the engine if *** is not mounted.
	if GetConVarNumber("hl2c_classic") == 0 then
		if !game.IsDedicated(true) then
			-- Half-Life 2
			if string.find(game.GetMap(), "d1_") || string.find(game.GetMap(), "d2_") || string.find(game.GetMap(), "d3_") then
				if !IsMounted("hl2") then
					// Just kill the whole engine with this.
					game.ConsoleCommand("killserver\n")
				end
			end
				
			-- Episode 1
			if string.find(game.GetMap(), "ep1_") then
				if !IsMounted("episodic") then
					// Just kill the whole engine with this.
					game.ConsoleCommand("killserver\n")
				end
			end
			
			-- Episode 2
			if string.find(game.GetMap(), "ep2_") then
				if !IsMounted("ep2") then
					// Just kill the whole engine with this.
					game.ConsoleCommand("killserver\n")
				end
			end
				
			-- Half-Life: Source
			if HL1_CAMPAIGN == true && !IsMounted("hl1") then
				// Just kill the whole engine with this.
				game.ConsoleCommand("killserver\n")
			end
		end
	end
	
	// Create directories for data
	file.CreateDir("hl2c_userid_info")
	file.CreateDir("hl2c_data")
	
	
	
	if Hl2c and Hl2c.Init_Vehicles then
		Hl2c.Init_Vehicles()
	end
	
	// Check f the server is empty?
	timer.Simple(60,function()
		Hl2c.IsServerEmpty_NeedLobby()
	end)
	
end

function Hl2c.EmptyGoLobby()
	timer.Simple( 5, function()
		if player.GetCount() > 0 then
		else
			if changingLevel then
			-- DbgPrint("[hl2c] No Players We go back to Lobby!")
			else
				game.ConsoleCommand("hl2c_changelevel ".. LOBBY_TEXT_MAP .."\n")
			end
		end
	end)
end

// We must check because of the problem with the empty server stuck on maps.
function Hl2c.IsServerEmpty_NeedLobby()
	if player.GetCount() == 0 and LOBBY_MAP != true then
		if timer.Exists( "LetsGoLobby" ) then
		else
			if HL2MP_IS_COOP_MAP then
				timer.Create( "LetsGoLobby", 1800, 1, function() 
					Hl2c.EmptyGoLobby()
				end)
			else
				timer.Create( "LetsGoLobby", 28800, 1, function() 
					
					Hl2c.EmptyGoLobby()
				end)
			end
		
		end
	end
	if player.GetCount() > 0 and timer.Exists( "LetsGoLobby" ) then
		timer.Destroy( "LetsGoLobby" )
	end
end
function Hl2c.IsServerEmpty_RestartMap()
	timer.Create( "RestartNoPl", 30, 1, function() 
		if player.GetCount() == 0 and LOBBY_MAP != true then
			game.ConsoleCommand('changelevel '.. game.GetMap() ..'\n')
		end
	end)
end

function Hl2c:Challange_Hl2()
	if self.Challange.Current.time == nil then else return end
	self.Challange.Current.time = CurTime()
	self.ChallangeOn = true
	-- self.ChallangeLastTime = 0
end

function Hl2c:AddPlayerChallange(pl)
	-- self.ChallangeList = self.ChallangeList or {}
	-- self.Challange.Current.time = self.ChallangeList.time or 0
	self.Challange.Current.players = self.Challange.Current.players or {}
	if GAME_IS_HL2 then
		self:Challange_Hl2()
		if game.GetMap() == "d1_trainstation_01" then
		else
			if self.Challange.Current != nil then end
			--if self.ChallangeList.players[pl:SteamID()] != nil then end
			return
		end
	end
	
	if pl and IsValid(pl) and pl.setup_achi then
		self.Challange.Current.players[pl:SteamID()] = {name=pl:Nick()}
		
	end
end

function Hl2c:SavePlayerChallange()
	if (true) then return end
	-- if self.Challange.Last != nil then self.ChallangeList = self.LastChallange end
	self.Challange.Current.time = self.Challange.Last.time + ( CurTime() - self.ChallangeStartTime )
	
	for k,v in pairs(self.Challange.Current.players) do 
		local found = false
		for _,pl in pairs(player.GetAll()) do
			found = false
			if self.Challange.Current.players[pl:SteamID()] != nil then
				found = true
			end
			if !found then self.Challange.Current.players[k] = nil end
		end
		
	end
	local save = self.Challange.Current
	save = util.TableToKeyValues(save)
	
	if GAME_IS_HL2 and game.GetMap()=="d3_breen_01" then
		// Should start Saving to global one.
		self:SyncChallangeComplete()
	else
		file.Write("hl2c_challange.txt",save)
	end
	
	
end

function Hl2c:SyncChallangeComplete()
	self.Challange.Current.time = math.Round(self.Challange.Current.time)
	local ctime =self.Challange.Current.time
	if GAME_IS_HL2 then
		for i=1,5 do
			self.Challange.Global.hl2[i].time=math.Round(self.Challange.Global.hl2[i].time)
			local gtime=self.Challange.Global.hl2[i].time
			local t1=self.Challange.Global.hl2[1]
			local t2=self.Challange.Global.hl2[2]
			local t3=self.Challange.Global.hl2[3]
			local t4=self.Challange.Global.hl2[4]
			local t5=self.Challange.Global.hl2[5]
			if ctime > gtime then
				if i==5  then
					self.Challange.Global.hl2[i] = self.Challange.Current
				elseif i==4 then
					self.Challange.Global.hl2[i] = self.Challange.Current
					self.Challange.Global.hl2[5] = t4
				elseif i==3 then
					self.Challange.Global[i] = self.Challange.Current
					self.Challange.Global.hl2[4] = t3
					self.Challange.Global.hl2[5] = t4
				elseif i==2 then
					self.Challange.Global.hl2[i] = self.Challange.Current
					self.Challange.Global.hl2[3] = t2
					self.Challange.Global.hl2[4] = t3
					self.Challange.Global.hl2[5] = t4
				elseif i==1 then
					self.Challange.Global.hl2[i] = self.Challange.Current
					self.Challange.Global.hl2[2] = t1
					self.Challange.Global.hl2[3] = t2
					self.Challange.Global.hl2[4] = t3
					self.Challange.Global.hl2[5] = t4
				end
			end
			
		end
	end
end

function Hl2c:LoadPlayerChallange()
	
	if GAME_IS_Hl2 then
		if file.Exists("hl2c_challange.txt","DATA") then
			local read = file.Read("hl2c_challange.txt","DATA")
			read = util.KeyValuesToTable( read )
			self.Challange.Last = read
			-- return read
		else
			-- return nil
		end
	end
	-- return nil
end

function Hl2c:LoadChallange()
	self.Challange = self.Challange or {}
	self.Challange.Last = self.Challange.Last or {}
	self.Challange.Global = self.Challange.Global or {}
	self.Challange.Current = self.Challange.Current or {}
	if file.Exists("hl2c_all_challange.txt","DATA") then
		local read = file.Read("hl2c_all_challange.txt","DATA")
		read = util.KeyValuesToTable( read )
		self.Challange.Global = read
		-- return read
	else
		local data = {}
		data.hl2 = {}
		data.ep1 = {}
		data.ep2 = {}
		
		for i=1,5 do
			data.hl2[i]={} 
		end
		for i=1,5 do
			data.ep1[i]={} 
		end
		for i=1,5 do
			data.ep2[i]={} 
		end
		
		file.Write("hl2c_all_challange.txt",util.TableToKeyValues(data))
	end
end

gameevent.Listen( "entity_killed" )
hook.Add( "entity_killed", "entity_killed_Event", function( data )
	local inf_index = data.entindex_inflictor		// Same as Weapon:EntIndex() / weapon used to kill victim
	local atk_index = data.entindex_attacker		// Same as Player/Entity:EntIndex() / person or entity who did the damage
	local dmgbits = data.damagebits			// DAMAGE_TYPE - use BIT operations to decipher damage types...
	local vict_index = data.entindex_killed		// Same as Victim:EntIndex() / the entity / player victim
	
	// Called when a Player or Entity is killed

	local weapon = nil
	local attacker = nil 
	local victim = nil

	for _, e in pairs(ents.FindByClass("*")) do
		if e:EntIndex() == inf_index then 
			weapon = e
		end
		if e:EntIndex() == atk_index then
			attacker = e
		end
		if e:EntIndex() == vict_index then
			victim = e
		end
	end
	
	-- DbgPrint(victim:GetClass())
	if IsValid( weapon ) and IsValid( attacker ) and IsValid( victim ) then
		if victim:GetClass() == "npc_barnacle" or
		-- victim:GetClass() == "npc_combinegunship" or
		victim:GetClass() == "npc_sniper" --or
		-- victim:GetClass() == "npc_helicopter"
		then
			-- DbgPrint(victim:GetClass())
			hook.Call("OnNPCKilled", GAMEMODE, victim,weapon,attacker )
		end
		--hook.Call("OnNPCKilled", GAMEMODE, victim,weapon,attacker )
	end

	--DbgPrint(inf_index,atk_index,dmgbits,vict_index)
end )

--oc.waypoints = oc.waypoints or {}
--oc.pointmsgs = oc.pointmsgs or {}



net.Receive("RequestCPAgain", function(len,pl)
	Hl2c.Send_CheckpointData(pl)
end)

function Hl2c.Send_CheckpointData(pl)
	if !HL2MP_IS_COOP_MAP then
		// Set current checkpoint
		if checkpointPositions and checkpointPositions[1] then
			pl:SetLastCP(checkpointPositions[1])
			--DbgPrint("Vector = ",pl:GetLastCP())
			
			if GetConVarNumber("hl2c_use_old_umsg") >= 1 then
				
				umsg.Start("PlayerInitialSpawn", pl)
				umsg.Vector(checkpointPositions[1])
				umsg.End()
			elseif GetConVarNumber("hl2c_use_old_umsg") == 0 then
				net.Start("PlayerInitialSpawn")
				if !HL2MP_IS_COOP_MAP then
					repeat
					
					net.WriteVector(checkpointPositions[1])
					until isvector(checkpointPositions[1])
				end
				net.Send(pl)
				--DbgPrint("*******************")
				--DbgPrint("* Checkpoint Sent *")
				--DbgPrint("*******************")
			end
			
		end
	end
end


// Admins can respawn all the dead players.
function GM:HL2CForceRespawn()
	return
	-- if table.Empty(deadPlayers) == 0 then return end
	-- table.Empty(deadPlayers)
	-- DbgPrint("Are We Having Same Bug Again?")
	-- for _, pl in pairs(player.GetAll()) do
		-- if IsValid(pl) && pl:Team() == TEAM_DEAD  then
			-- pl:SetTeam(TEAM_ALIVE)
			-- pl:UnSpectate()
			-- pl:Spawn()
			-- pl:SetNoTarget(false)
			-- DbgPrint( "Respawning Dead Player:",pl:Nick() )
		-- end
		-- if IsValid(pl) && pl:Team() == TEAM_COMBINE_DEAD  then
			-- pl:SetTeam(TEAM_COMBINE)
			-- pl:UnSpectate()
			-- pl:Spawn()
			-- pl:SetNoTarget(false)
			-- DbgPrint( "Respawning Dead Player:",pl:Nick() )
		-- end
	-- end
	--for _, pl in pairs(player.GetAll()) do
		--DbgPrint( "Respawning Dead Player:",pl:Nick(),pl:Team() )
	--end
end

// Admins can respawn all the dead players.
function GM:Hl2c_ForceSpawn()
	-- return
	if #deadPlayers == 0 then return end
	-- table.Empty(deadPlayers)
	-- if table.HasValue(deadPlayers, pl:UniqueID()) then
		-- DbgPrint( "Respawning Alive Dead Player:",pl:Nick() )
	-- end
	for _, pl in pairs(player.GetAll()) do
		if IsValid(pl) && pl:Team() == TEAM_DEAD and table.HasValue(deadPlayers, pl:UniqueID()) then
			timer.Destroy(pl:UniqueID().."_Respawn_Dead")
			pl:SetTeam(TEAM_ALIVE)
			table.RemoveByValue(deadPlayers,pl:UniqueID() )
			pl:UnSpectate()
			pl.AllowSpectating = false
			pl:Spawn()
			pl:SetNoTarget(false)
			pl:UnSpectate()
			DbgPrint( "Respawning Alive Dead Player:",pl:Nick() )
		end
		if IsValid(pl) && pl:Team() == TEAM_COMBINE_DEAD and table.HasValue(deadPlayers, pl:UniqueID()) then
			-- pl:KillSilent()
			timer.Destroy(pl:UniqueID().."_Respawn_Dead")
			pl:SetTeam(TEAM_COMBINE)
			table.RemoveByValue(deadPlayers,pl:UniqueID() )
			pl:UnSpectate()
			pl.AllowSpectating = false
			pl:Spawn()
			pl:SetNoTarget(false)
			pl:UnSpectate()
			DbgPrint( "Respawning Combine Dead Player:",pl:Nick() )
		end
	end
	--for _, pl in pairs(player.GetAll()) do
		--DbgPrint( "Respawning Dead Player:",pl:Nick(),pl:Team() )
	--end
end

net.Receive("HL2CForceRespawn_com", function(len, pl)
	-- GAMEMODE:HL2CForceRespawn()
end)

net.Receive("HL2CLobby", function(len, pl)
	Hl2c.DefaultChatPrint("Admin Forced To Lobby")
	-- PrintMessage(HUD_PRINTTALK,"Admin Forced To Lobby")
	--DbgPrint("Admin Forced To Lobby")
	timer.Simple(2.5, function()
	game.ConsoleCommand("changelevel ".. LOBBY_TEXT_MAP .."\n")
	end)
end)

net.Receive("HL2CTest", function(len, pl)
	Hl2c.DefaultChatPrint("Admin Forced To Test")
	-- PrintMessage(HUD_PRINTTALK,"Admin Forced To Test")
	--DbgPrint("Admin Forced To Test")
	timer.Simple(2.5, function()
	game.ConsoleCommand("changelevel gm_flatgrass\n")
	end)
end)



// Called when player presses their help key
function GM:ShowHelp(pl)
	--net.Start("ShowHelp")
	--net.Send(pl)
	--if pl:Team() != TEAM_ALIVE then return end
	umsg.Start( "ShowHelp", pl )
	umsg.End()
end


// Called when a player presses their show team key
function GM:ShowTeam(pl)
	--net.Start("ShowTeam")
	--net.Send(pl)
	if pl:Team() != TEAM_ALIVE then return end
	umsg.Start( "ShowTeam", pl )
	umsg.End()
end

local nextclass, nextpos, nextang
 
local function RespawnTrigger(ply,wep)
    nextclass, nextpos, nextang = wep:GetClass(), wep:GetPos(), wep:GetAngles()
    wep:Respawn()   
    return(true)
end


function GM:ReplaceItem( item, replacement )
	local phys = item:GetPhysicsObject()
	local new = ents.Create( replacement )
	new:SetPos( item:GetPos() )
	new:SetAngles( item:GetAngles() )
	new:Spawn()
	new:Activate()
	local new_phys = new:GetPhysicsObject()
	if phys:IsMotionEnabled() != true then
		new_phys:EnableMotion(false)
	end
	SafeRemoveEntity(item)
	/*
	for k, v in pairs( ents.FindByClass( item ) ) do
		local wep_ar = ents.Create( replacement )
		wep_ar:SetPos( v:GetPos() )
		wep_ar:SetAngles( v:GetAngles() )
		
		v:Remove()
		wep_ar:Spawn()
		wep_ar:Activate()
	end
	*/
end

function GM:DMSkills()

	timer.Simple(2, function()
	
		game.ConsoleCommand("sk_gunship_health_increments 6\n")
		game.ConsoleCommand("sk_helicopter_health 2600\n")
	
	end)

end

function GM:EntityRemoved( ent )
	--if IsValid(ent) and ent:IsNPC() and ent:GetClass() == "npc_barnacle" then
		--DbgPrint(ent:GetClass())
	--end
	if !IsValid(ent) then
		return
	end
	
	if self.MapScript.EntityRemoved ~= nil then
		self.MapScript:EntityRemoved( ent )
	end
	
	if IsValid(ent) and ent:IsNPC() then
		for k, v in pairs(player.GetAll()) do
			if v["TargetBar"] and v["TargetBar"][ent:EntIndex()] == true then
				v["TargetBar"][ent:EntIndex()] = false
				-- umsg.Start("Hl2c.OnHit.NPC.Close",v)
					-- umsg.Short(ent:EntIndex())
				-- umsg.End()
			end
		end
	end
	Helicopter_RemoveXP(ent)
	
	
	Ach_HL2_KILL_SIXGUNSHIPS(ent)
	
end

function Hl2c.ChatPrint(text)
	Hl2c.DefaultChatPrint( tostring(text) )
end

hook.Add( "OnLuaError", "Hl2c.ErrorHandler", function( str, realm, addontitle, addonid )
	local text = "Something is creating script errors"

	--
	-- This error is caused by a specific addon
	--
	if ( isstring( addonid ) ) then

		--
		-- Down Vote
		--
		-- steamworks.Vote( addonid, false )

		--
		-- Disable Naughty Addon
		--
		--timer.Simple( 5, function()
		--	MsgN( "Disabling addon '", addontitle, "' due to lua errors" )
		--	steamworks.SetShouldMountAddon( addonid, false )
		--	steamworks.ApplyAddons()
		--end )

		text = "The addon \"" .. addontitle .. "\" is creating errors, check the console for details"

	end

	if ( addonid == nil ) then addonid = 0 end

	if ( Errors[ addonid ] ) then

		Errors[ addonid ].times	= Errors[ addonid ].times + 1
		Errors[ addonid ].last	= SysTime()

		return
	end

	local error =
	{
		first	= SysTime(),
		last	= SysTime(),
		times	= 1,
		title	= addontitle,
		x		= 32,
		text	= text
	}

	Errors[ addonid ] = error
end)
/*
hook.Add("OnNPCKilled", "Mod_OnNPCKilled", function(npc, attacker, weapon)
	if IsValid(ent) and ent:IsNPC() and ent:GetClass() == "npc_barnacle" then
		DbgPrint(ent:GetClass())
	end
	if IsValid(ent) and
	ent:GetClass() != nil and
	ent:GetClass() == "npc_helicopter" and
	ent.LastAttacker != nil
	then
		--DbgPrint("Last Attacker:",ent.LastAttacker:Nick())
	end
end)
*/


--[[---------------------------------------------------------
	These are buttons that the client is pressing. They're used
	in Sandbox mode to control things like wheels, thrusters etc.
-----------------------------------------------------------]]
function GM:PlayerButtonDown( ply, btn ) 

	numpad.Activate( ply, btn )

end

--[[---------------------------------------------------------
	These are buttons that the client is pressing. They're used
	in Sandbox mode to control things like wheels, thrusters etc.
-----------------------------------------------------------]]
function GM:PlayerButtonUp( ply, btn ) 

	numpad.Deactivate( ply, btn )

end

-- local need = "1,0,1,0,0,0,0,1,0,0,0,0,0,0,0,1"
-- local compressed = util.Compress( need )
-- local uncompressed = util.Decompress( compressed )
-- DbgPrint("UnCompressed Length:",string.len(uncompressed),"Compressed Length:",string.len(compressed))
-- DbgPrint("UnCompressed:",uncompressed,"Compressed:",compressed)

-- local query = [[
-- DROP TABLE Test_Hl2c;
-- CREATE TABLE Test_Hl2c
-- (
-- STEAMID varchar(255),
-- DATA BINARY(256)
-- );

-- ]] 
-- sql.Query(query)
-- local query = "INSERT INTO Test_Hl2c (STEAMID,DATA)VALUES ('0',".. need ..");"
-- sql.Query(query)
-- DbgPrint("-------------------------")
-- DbgPrint("[hl2c] Server loaded")
-- DbgPrint("-------------------------")

-- local function crypt_key( key, rec )
	-- if #key < 2 then return end
	-- if not rec then math.randomseed(123) end
	-- math.randomseed( tonumber(string.sub(key, 1, 2), 16 ) * math.random() )
	-- return crypt_key( string.sub( key, 3 ), true )
-- end
-- local function encrypt( key, text )
	-- crypt_key(key)
	-- local out = ""
	-- for i=1,#text do
		-- out = out.. bit.tohex((string.byte(text[i])+math.random(255))%255, 2)
	-- end
	-- return out
-- end
-- local function decrypt( key, text )
	-- crypt_key(key)
	-- local out = ""
	-- for i=1,#text,2 do
		-- out = out.. string.char((tonumber(string.sub(text, i, i+1), 16)-math.random(255))%255)
	-- end
	-- return out
-- end

-- local text = "9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1"
-- local key = "666" 
-- print(encrypt(key,text))
-- print(#encrypt(key,text),encrypt(key,text),decrypt(key,encrypt(key,text)))
DbgPrint("[hl2c] Server loaded")

/*
Szia!
Ez a klán az akadémiánk, az anya klánunk: [ally]Inv[/ally]
Erősek vagyunk és egyre többen is leszünk. Csatlakozz te is, hogy beváltsd a végzeted:)

*/


/*
mat_dxlevel 90
mat_hdr_level 2
mat_specular 0
mat_hdr_enabled
mat_fullbright 0


euro217.vpnbook.com
euro214.vpnbook.com
us1.vpnbook.com (US VPN - optimized for fast web surfing; no p2p downloading)
us2.vpnbook.com (US VPN - optimized for fast web surfing; no p2p downloading)
ca1.vpnbook.com (Canada VPN - optimized for fast web surfing; no p2p downloading)
de233.vpnbook.com (Germany VPN - optimized for fast web surfing; no p2p downloading)
Username: vpnbook
Password: Fuza6Eph


DOOM
magnet:?xt=urn:btih:0bf052649b38573aa16e638cda7b4b1657ed2ed6&dn=DOOM.SteamRip-Fisher


void CHL2_Player::StartAdmireGlovesAnimation( void )
{
	MDLCACHE_CRITICAL_SECTION();
	CBaseViewModel *vm = GetViewModel( 0 );

	if ( vm && !GetActiveWeapon() )
	{
		vm->SetWeaponModel( "models/weapons/v_hands.mdl", NULL );
		ShowViewModel( true );
						
		int	idealSequence = vm->SelectWeightedSequence( ACT_VM_IDLE );
		
		if ( idealSequence >= 0 )
		{
			vm->SendViewModelMatchingSequence( idealSequence );
			m_flAdmireGlovesAnimTime = gpGlobals->curtime + vm->SequenceDuration( idealSequence ); 
		}
	}
}
















*/
