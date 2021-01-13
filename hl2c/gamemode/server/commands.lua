-- item respawn convar :D
if !ConVarExists("hl2c_items_respawn_time") then
	CreateConVar("hl2c_items_respawn_time", "3", FCVAR_SERVER_CAN_EXECUTE)
end

// Create console variables to make these config vars easier to access
if !ConVarExists("hl2c_admin_physgun") then
	CreateConVar("hl2c_admin_physgun", ADMIN_NOCLIP, FCVAR_NOTIFY)
	CreateConVar("hl2c_admin_noclip", ADMIN_PHYSGUN, FCVAR_NOTIFY)
end

// Let's see if we can turn the playermodel restrictions off
if !ConVarExists("hl2c_playermodel_restrictions") then
	CreateConVar("hl2c_playermodel_restrictions", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Sets whether you want to use custom playermodels.")
end

// Do we want HEV hands?
if !ConVarExists("hl2c_hev_hands") then
	CreateConVar("hl2c_hev_hands", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Choose between HEV hands or normal hands.")
end

// Debug: Show who is an admin
if !ConVarExists("hl2c_betatester_trails") then
	CreateConVar("hl2c_betatester_trails", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Toggle whether beta testers have trails on their feet.")
end

// Toggle whether bots should go on their own team(Spectator)
if !ConVarExists("hl2c_bot_spectate") then
	CreateConVar("hl2c_bot_spectate", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Bots are useless, lets get rid of them.")
end

// ONLY WORKS IN MULTIPLAYER. Allow weapon_stunsticks?
if !ConVarExists("hl2c_allow_stunstick") then
	CreateConVar("hl2c_allow_stunstick", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Only usable in Multiplayer. Toggle whether players can pick up Stunsticks.")
end

// ONLY WORKS IN MULTIPLAYER. Should players drop their current weapon on death?
if !ConVarExists("hl2c_drop_weapon_on_death") then
	CreateConVar("hl2c_drop_weapon_on_death", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Only usable in Multiplayer. Toggle whether players drop weapons on death.")
end

// ONLY WORKS IN MULTIPLAYER. Can players respawn?
if !ConVarExists("hl2c_allow_respawn") then
	CreateConVar("hl2c_allow_respawn", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Only usable in Multiplayer. Do players get to respawn instead of being dead forever?")
end

// ONLY WORKS IN MULTIPLAYER. Make the gamemode add in additions to the gameplay?
if !ConVarExists("hl2c_additions") then
	CreateConVar("hl2c_additions", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Only usable in Multiplayer. Add in additions to the gameplay?")
end

// ONLY WORKS IN MULTIPLAYER. Should we use the old NextMap timer?
if !ConVarExists("hl2c_old_nextmap_timer") then
	CreateConVar("hl2c_old_nextmap_timer", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Only usable in Multiplayer. Use old NextMap timer?")
end

// Try bring back the classic HL2C 1.2.6 features.
if !ConVarExists("hl2c_classic") then
	CreateConVar("hl2c_classic", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Override to make the gamemode act closely to HL2C 1.2.6.")
end

// Shop is optional
if !ConVarExists("hl2c_shop_allowed") then
	CreateConVar("hl2c_shop_allowed", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Allow the Shop?")
end

// Spawnmenu
if !ConVarExists("hl2c_spawnmenu") then
	CreateConVar("hl2c_spawnmenu", "0", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "DOES NOTHING RIGHT NOW.")
end

// Used temporary until spawn menu becomes fully avaliable.
if !ConVarExists("hl2c_custom_weapon_1") then
	CreateConVar("hl2c_custom_weapon_1", "", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Temporary feature.")
	CreateConVar("hl2c_custom_weapon_2", "", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Temporary feature.")
	CreateConVar("hl2c_custom_weapon_3", "", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Temporary feature.")
	CreateConVar("hl2c_custom_weapon_4", "", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Temporary feature.")
	CreateConVar("hl2c_custom_weapon_5", "", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Temporary feature.")
end

// Ammo limiting.
if !ConVarExists("hl2c_ammo_limits") then
	CreateConVar("hl2c_ammo_limits", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Limit your ammo?")
end

// These never appeared when they were merged with hl2c_ammo_limits so just place them seperately.
if !ConVarExists("hl2c_ammo_pistol_max") then
	CreateConVar("hl2c_ammo_pistol_max", "150", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for pistol.")
	CreateConVar("hl2c_ammo_357_max", "12", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for 357.")
	CreateConVar("hl2c_ammo_smg1_max", "225", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for smg1.")
	CreateConVar("hl2c_ammo_smg1_grenade_max", "3", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for smg1 alt-fire.")
	CreateConVar("hl2c_ammo_ar2_max", "60", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for ar2.")
	CreateConVar("hl2c_ammo_ar2altfire_max", "3", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for ar2 alt-fire.")
	CreateConVar("hl2c_ammo_buckshot_max", "30", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for shotgun.")
	CreateConVar("hl2c_ammo_xbowbolt_max", "10", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for crossbow.")
	CreateConVar("hl2c_ammo_rpg_round_max", "3", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for rpg.")
	CreateConVar("hl2c_ammo_slam_max", "5", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for slam.")
	CreateConVar("hl2c_ammo_grenade_max", "5", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Max amount of ammo for grenade.")
end

// Usermessages vs. Net Library
if !ConVarExists("hl2c_use_old_umsg") then
	CreateConVar("hl2c_use_old_umsg", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Use UserMessages instead of NET LIBRARY.")
end

// Small useless cvar to show if it's a holiday
if !ConVarExists("hl2c_holiday") then
	CreateConVar("hl2c_holiday", "0", { FCVAR_GAMEDLL }, "Show if holiday features will be used.")
end



local vote_maps = {}

function Hl2c.SetUpMapList()
	local maps = file.Find("maps/*.bsp", "GAME")
	local maplist = {}
	local is_expression = true
	local amt = 0
	for k, map in RandomPairs(maps) do
		local mapstr = map:sub(1, -5):lower()
		-- if(not current and game.GetMap():lower()..".bsp" == map) then continue end
		-- print(mapstr)
		if is_expression then
			if(string.find(map, "^")) then -- This might work (from gamemode.txt)
				vote_maps[#vote_maps + 1] = map:sub(1, -5)
				amt = amt + 1
			end
		else
			for k, v in pairs(prefix) do
				if string.find(map, "^"..v) then
					vote_maps[#vote_maps + 1] = map:sub(1, -5)
					amt = amt + 1
					break
				end
			end
		end
		
		-- if(limit and amt >= limit) then break end
	end
end

function Hl2c.GetMapList()
	Hl2c.SetUpMapList()
	
	for k, v in pairs(vote_maps) do
		print(k,v)
	end
end

function Hl2c.HasMap(name)
	Hl2c.SetUpMapList()
	for k, v in pairs(vote_maps) do
		if v == name then return true end
	end
end

concommand.Add("hl2c_changelevel",function(pl,cmd,args)
	if !IsValid(pl) or ( (pl:IsPlayer() and (pl:IsUserGroup("owner") or pl:IsSuperAdmin() ) ) or pl:IsListenServerHost() ) then else return end
	
	if args and isstring(args[1]) then else return end
	if Hl2c.HasMap(args[1]) then else 
	print("Invalid Map")
	return end
	if file.Exists("hl2c_data/hl2c_crash_recovery.txt", "DATA") then
	
	file.Delete("hl2c_data/hl2c_crash_recovery.txt")

	end
	for k, v in pairs(player.GetAll()) do
		if v and v.database then 
			v:databaseAllSave()
		end
	end
	if DISCORD_MapSwitch then DISCORD_MapSwitch(args[1]) end
	game.ConsoleCommand("changelevel ".. args[1] .."\n")
	
end)

concommand.Add("hl2c_petfollow",function(pl)
	if !IsValid(pl.pet) then return end
	pl.pet.follow = true
	pl.pet.stopfollow = false
	Hl2c.PetFollowOnwer( pl.pet, pl  )
end)

concommand.Add("hl2c_petstopfollow",function(pl)
	if !IsValid(pl.pet) then return end
	--pl.pet.follow = false
	--pl.pet.stopfollow = true
	Hl2c.PetStopFollowOnwer( pl.pet, pl  )
end)

function PrintXP( pl )
	pl:ChatPrint("Your xp is: " .. pl:GetXP())
end

-- concommand.Add("xp_get",PrintXP)

--concommand.Add("hl2c_inspect",PrintXP)
concommand.Add("hl2c_petsummon",function(pl)
	Hl2c.PetCreate(pl)
end)
concommand.Add("hl2c_petremove",function(pl)
	if IsValid(pl.pet) and pl.petalive == true then
		Hl2c.PetRemove(pl.pet)
		--print("CHAT")
	end
end)
concommand.Add("hl2c_petstat",function(pl)
	if pl:GetNWBool("HasPetBought") == true then
		-- pl:PrintMessage(HUD_PRINTTALK, "**********")
		-- pl:PrintMessage(HUD_PRINTTALK, "Level: ".. pl:GetNWInt("pet_level") )
		-- pl:PrintMessage(HUD_PRINTTALK, "XP: ".. pl:GetNWInt("pet_xp") )
		-- pl:PrintMessage(HUD_PRINTTALK, "XP REQ: ".. pl:Pet_NextLevelReq() )
		if IsValid(pl.pet) and pl.petalive == true then
		-- pl:PrintMessage(HUD_PRINTTALK, "MAX HP: ".. pl.pet:GetMaxHealth() )
		-- pl:PrintMessage(HUD_PRINTTALK, "CUR HP: ".. pl.pet:Health() )
		end
		//--pl:PrintMessage(HUD_PRINTTALK, "XP: ".. pl:GetNWInt("pet_xp") )
		-- pl:PrintMessage(HUD_PRINTTALK, "**********")
	else
		
	end
end)
concommand.Add("hl2c_pet",function(pl)
	if pl:IsPlayer() then
		
		pl:databasePetMenu()
	end
end)


concommand.Add("hl2c_restart_map", function(pl, command, arguments)
	if IsHl2cAdmin(pl) then 
		GAMEMODE:RestartMap() 
		-- Save Kill Stat --
		for k, v in pairs(player.GetAll()) do
			
			if IsValid(v) and 
			( v:Team() == TEAM_ALIVE or 
			v:Team() == TEAM_DEAD or
			v:Team() == TEAM_COMPLETED_MAP ) then
			
				SaveKillsStat(v)
			end
		end
	end 

end)
concommand.Add("hl2c_restart", function(pl, command, arguments)
	if !pl:IsPlayer() then 
		GAMEMODE:RestartMap()
		-- Save Kill Stat --
		for k, v in pairs(player.GetAll()) do
			
			if IsValid(v) and 
			( v:Team() == TEAM_ALIVE or 
			v:Team() == TEAM_DEAD or
			v:Team() == TEAM_COMPLETED_MAP ) then
			
				SaveKillsStat(v)
				Player_PermaPoint_Save(v)
			end
		end
	end 
end)

concommand.Add("hl2c_next_map", function(pl) if pl:IsAdmin() then GAMEMODE:NextMap() end end)

function Hl2c_Give(pl, command, args,ischat)
	
	if IsValid(pl) and pl:IsPlayer() and IsHl2cAdmin(pl) then 
	else
		return
	end
	
	
	if ischat != true and not istable(args) then return end
	
	if args == nil then return end
	
	if not ischat and istable(args) and args[1] == nil then return end
	
	if ischat then
		
		if Hl2c.Weapons.All[args] then
			pl:Give(args)
		end
	else
		--PrintMessage(HUD_PRINTCONSOLE," Mostly Passed Give Command")
		if Hl2c.Weapons.All[args[1]] then
			pl:Give(args[1])
		end
	end
	
	--print(pl,command,args[1])
end
concommand.Add("hl2c_give", function(pl, command, arguments) Hl2c_Give(pl,command,arguments) end)

function Hl2c_Super_GravityGun(pl, com, args)
	for _, ent in pairs(ents.FindByClass("weapon_physcannon")) do
		if IsValid(ent) then
			ent:SetSkin(1)
		end
	end
end
-- concommand.Add("hl2c_super_gravgun", function(pl,com,args) Hl2c_Super_GravityGun(pl, com, args) end)


concommand.Add("hl2c_add_follow_system", function(pl,com,args)
	if not IsValid(pl) or not pl:IsPlayer() then return end
	if not pl:IsAdmin() then return end
	local result = NULL
	for k, v in pairs( ents.FindByClass("hl2c_follow_system") ) do
		if IsValid(v) and v:GetClass("hl2c_follow_system") then
			result = v
			break
		end
	end
	if IsValid(result) and result:GetClass() == "hl2c_follow_system" then return end
	PrintMessage(HUD_PRINTCONSOLE,"[hl2c] Follow System has been created!")
	local ent = ents.Create( "hl2c_follow_system" )
	ent:SetPos(Vector(0,0,0))
	ent:SetKeyValue("targetname", "follow_ent")
	ent:SetKeyValue("FollowerClass", "npc_citizen")
	ent:SetKeyValue("Distance", "100")
	ent:Spawn()
	ent:Activate()
	PrintMessage(HUD_PRINTCONSOLE,"[hl2c] Follow System has been created!")
end)

concommand.Add("hl2c_map", function(pl,com,args)
	if !IsValid(pl) or ( (pl:IsPlayer() and (IsHl2cAdmin(pl) or pl:IsSuperAdmin() ) ) or pl:IsListenServerHost() ) then else return end
	
	if args and isstring(args[1]) then else return end
	if Hl2c.HasMap(args[1]) then else 
	print("Invalid Map")
	return end
	if file.Exists("hl2c_data/hl2c_crash_recovery.txt", "DATA") then
	
	file.Delete("hl2c_data/hl2c_crash_recovery.txt")

	end
	for k, v in pairs(player.GetAll()) do
		if v and v.database then 
			v:databaseAllSave()
		end
	end
	game.ConsoleCommand("changelevel ".. args[1] .."\n")
	
	--ent:Activate()
	-- PrintMessage(HUD_PRINTCONSOLE,"[hl2c] Follow System has been created!")
end)
--util.AddNetworkString("Hl2c_ModifyHat")
concommand.Add("hl2c_buy", function(pl, com, args) if (Hl2c_Valid_Pl(pl)) then Hl2c_Buy_Item(pl, args) end end)
concommand.Add("hl2c_inventory_select", function(pl, com, args) if (Hl2c_Valid_Pl(pl)) then Hl2c.Select_Inventory(pl, args) end end)
concommand.Add("hl2c_hat", function(pl,com,args)
	Hl2c.Add_Hat(pl,com,args)
end)

function Hl2c_Spawn(pl, args)
	if !Hl2c_Valid_Pl(pl) then return end
	if args == nil then return end
	if args[1] == nil then return end
	--[[ print("working") ]]
	for k, v in ipairs(Hl2c.SpawnList.Ent) do
		if tostring(args[1]) == v["spawnid"] then
			local hit = pl:GetEyeTrace().HitPos
			local ent = ents.Create( v["classname"])
			if isstring(v["model"]) and string.len( v["model"] ) > 5 then
			ent:SetModel(v["model"])
			end
			ent:SetKeyValue("targetname", "hl2c_spawned")
			if isvector(v["offset"]) then
			ent:SetPos(hit + v["offset"])
			else
			ent:SetPos(hit)
			end
			if isstring(v["weapon"]) then
			ent:SetKeyValue("additionalequipment", v["weapon"])
			else
			--ent:Give( v["weapon"])
			
			end
			if istable(v["KeyValues"]) then
				
				for key, value in pairs( v["KeyValues"] ) do
					--[[ print(key,value) ]]
					ent:SetKeyValue( tostring(key), tostring(value) )
				end
			else
			end
			if istable(v["Spawnflags"]) then
				for key, value in pairs( v["Spawnflags"] ) do
					ent:SetKeyValue( "spawnflags", tostring(value) )
				end
			else
			end
			ent:Spawn()
			
			ent:SetSkin( v["skin"])
		end
	end
	
end

concommand.Add("hl2c_spawn", function(pl, com, args)
	if (Hl2c_Valid_Pl(pl)) and pl:IsAdmin() and pl:Team() != TEAM_COMPLETED_MAP then
		--[[ print("working") ]]
		Hl2c_Spawn(pl, args)
	end 
end)


concommand.Add("hl2c_joincombine", function(pl, com, args)
	
	if !(IsValid(pl)) then return end
	if HL2C_COMBINE_EVENT != true then 
	-- pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Combine doesnt need you!") 
	Hl2c.PersonDefaultChatPrint("[hl2c] Combine doesnt need you!",pl)
	return 
	end
	if HL2C_COMBINE_JOIN != true then 
	-- pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Combine is not looking for you!") 
	Hl2c.PersonDefaultChatPrint("[hl2c] Combine is not looking for you!",pl)
	return 
	end
	if (IsValid(pl)) and pl:Team() == TEAM_ALIVE then
		
		pl:SetTeam(TEAM_COMBINE_DEAD)
		pl:KillSilent()
		-- pl:Spawn()
	end 
end)
concommand.Add("hl2c_joinrebel", function(pl, com, args)
	if !(IsValid(pl)) then return end
	if (IsValid(pl)) and pl:Team() == TEAM_COMBINE then
		
		pl:SetTeam(TEAM_DEAD)
		pl:KillSilent()
		-- pl:Spawn()
	end 
end)
concommand.Add("hl2c_getteam", function(pl, com, args)
	print("Print Team ID",pl:Team())
	PrintMessage(HUD_PRINTCONSOLE,"Print Team ID: "..tostring(pl:Team()))
end)
concommand.Add("hl2c_getskin", function(pl, com, args)
	print( "Print Skin ID: "..tostring(pl:GetSkin()) )
	PrintMessage( HUD_PRINTCONSOLE, "Print Skin ID: "..tostring(pl:GetSkin()) )
end)
concommand.Add("hl2c_getmodel", function(pl, com, args)
	print( "Print Model ID: "..tostring(pl:GetSkin()) )
	PrintMessage( HUD_PRINTCONSOLE, "Print Model ID: "..tostring(pl:GetModel()) )
end)

concommand.Add("hl2c_head", function(pl,cmd,args) 
	-- print("Call Back from command")
	if args and isstring(args[1]) then
		if SERVER and pl:Team() != TEAM_COMPLETED_MAP then
			pl:SetHeadModel(args[1])
		end
	end

end)
concommand.Add("hl2c_suit", function(pl,cmd,args) 
	-- print("Call Back from command")
	local args = args
	if args and args[1] then else return end
	if DEV_MODE != true and (args[2] == nil or args[2] != "jelszo") then return end
	if args and isstring(args[1]) then
		if SERVER  and pl:Team() != TEAM_COMPLETED_MAP then
			pl:SetSuitModel(args[1])
		end
	end

end)
concommand.Add("hl2c_buy_upgrade", function(pl,cmd,args) 
	-- print("Call Back from command")
	if args and isstring(args[1]) then
		if SERVER and pl:Team() != TEAM_COMPLETED_MAP then
			Hl2c.Buy_Upgrade(pl,args[1])
		end
	end

end)

concommand.Add("hl2c_loot", function(pl,cmd,args) 
	-- print("Call Back from command")
	-- if args and isstring(args[1]) then
		-- if SERVER then
			-- Hl2c.Buy_Upgrade(pl,args[1])
		-- end
	-- end
	-- if DEV_MODE then else return end
	if IsValid(pl) and pl:IsUserGroup("owner") and pl:Team() != TEAM_COMPLETED_MAP then
		-- pl:databaseLoot()
		
		lootBoxDrop(pl)
		
	elseif IsValid(pl) and DEV_MODE and pl:Team() != TEAM_COMPLETED_MAP then
		-- pl:databaseLoot()
		
		lootBoxDrop(pl)
	elseif !IsValid(pl) then
		lootBoxDrop()
	end
	
end)

concommand.Add("hl2c_grubcount", function(pl,cmd,args)
	-- Hl2c.CountAllGrubs()
end)

concommand.Add("hl2c_cheat_lambdacache", function(pl,cmd,args)
	if IsValid(pl) and pl:IsSuperAdmin() then 
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			-- pl:AddAchi(Hl2c.HL2_LAMBDA_LIST[i])
		end
	end
end)

concommand.Add("hl2c_cheat_hl2", function(pl,cmd,args)
	if IsValid(pl) and pl:IsSuperAdmin() then 
		for i=1,#Hl2c.HL2_ACH_LIST do
			-- pl:AddAchi(Hl2c.HL2_ACH_LIST[i])
		end
	end
end)

concommand.Add("hl2c_cheat_ep1", function(pl,cmd,args)
	if IsValid(pl) and pl:IsSuperAdmin() then 
		for i=1,#Hl2c.EP1_ACH_LIST do
			-- pl:AddAchi(Hl2c.EP1_ACH_LIST[i])
		end
	end
end)
concommand.Add("hl2c_cheat_ep2", function(pl,cmd,args)
	if IsValid(pl) and pl:IsSuperAdmin() then 
		for i=1,#Hl2c.EP2_ACH_LIST do
			-- pl:AddAchi(Hl2c.EP2_ACH_LIST[i])
		end
	end
end)

concommand.Add("hl2c_difficulty", function(pl,cmd,args) 
	-- print("Call Back from command")
	-- if args and isstring(args[1]) then
		-- if SERVER then
			-- Hl2c.Buy_Upgrade(pl,args[1])
		-- end
	-- end
	Hl2c.CheckDifficultyCommand(pl)
end)

concommand.Add("hl2c_setdifficulty", function(pl,cmd,args) 
	-- print("Call Back from command")
	-- if args and isstring(args[1]) then
		-- if SERVER then
			-- Hl2c.Buy_Upgrade(pl,args[1])
		-- end
	-- end
	if args and args[1] then
		args[1] = tonumber(args[1])
	end
	if IsValid(pl) and pl:IsSuperAdmin() and args and args[1] then
		if type(args[1]) == "number" then
			
			local num = args[1]
			if num > 14 then num = 14 end
			if num < 0 then num = 0 end
			Hl2c.Diff_Selected = num
			local diff = {}
			diff.selected = num
			file.Delete("hl2c_data/hl2c_difficulty.txt")
			timer.Simple(1,function()
			file.Write("hl2c_data/hl2c_difficulty.txt", util.TableToKeyValues(diff))
			Hl2c.Diff_Selected = num
			end)
			-- print(Hl2c.Diff_Selected)
		end
	elseif !IsValid(pl) and args and args[1] then
		
		if type(args[1]) == "number" then
			local num = args[1]
			if num > 14 then num = 14 end
			if num < 0 then num = 0 end
			Hl2c.Diff_Selected = num
			local diff = {}
			diff.selected = num
			file.Delete("hl2c_data/hl2c_difficulty.txt")
			-- timer.Simple(1,function()
			file.Write("hl2c_data/hl2c_difficulty.txt", util.TableToKeyValues(diff))
			Hl2c.Diff_Selected = num
			DbgPrint(Hl2c.Diff_Selected)
			-- end)
			
		end
	end
	
end)

concommand.Add("hl2c_addxp", function(pl,cmd,args) 
	-- print("Call Back from command")
	-- if args and isstring(args[1]) then
		-- if SERVER then
			-- Hl2c.Buy_Upgrade(pl,args[1])
		-- end
	-- end
	if args and args[1] and args[2] then
		args[2] = tonumber(args[2])
		-- print("Converted")
	end
	if IsValid(pl) and IsHl2cAdvisor(pl) and args and args[1] and args[2] then
		if type(args[2]) == "number" then
			for k, v in pairs(player.GetAll()) do
				if v and v:Alive() and v:Team() != TEAM_COMPLETED_MAP then
					
					if string.find( string.lower(v:Nick()), string.lower(args[1]) ) then
						v:AddXP(args[2])
						DbgPrint("XP ADDED:",args[2],v:Nick())
						break
					end
				end
			end
			-- print(Hl2c.Diff_Selected)
		end
	elseif args and args[1] and args[2] then
		-- print("Called")
		if type(args[2]) == "number" then
			for k, v in pairs(player.GetAll()) do
				if v and v:Alive() and v:Team() != TEAM_COMPLETED_MAP then
					
					if string.find( string.lower(v:Nick()), string.lower(args[1]) ) then
						v:AddXP(args[2])
						-- Msg(args[2])
						DbgPrint("XP ADDED:",args[2],v:Nick())
						break
					end
				end
			end
			-- print(Hl2c.Diff_Selected)
		end
	end
end)

concommand.Add("hl2c_dbconvert", function(pl,cmd,args) 
	-- print("Call Back from command")
	-- if args and isstring(args[1]) then
		-- if SERVER then
			-- Hl2c.Buy_Upgrade(pl,args[1])
		-- end
	-- end
	if !IsValid(pl) then
		--databaseConvertSqlToDB()
	end
end)

concommand.Add("hl2c_console", function(pl,cmd,args) 
	-- print("Call Back from command")
	-- if args and isstring(args[1]) then
		-- if SERVER then
			-- Hl2c.Buy_Upgrade(pl,args[1])
		-- end
	-- end
	if args and #args >= 1 then else return end
	if !IsValid(pl) or ( IsValid(pl) and pl:IsUserGroup( "owner") ) then
		-- args = unpack(args,1,#args)
		local say = ""
		for i=1,#args do
			say = say.." ".. args[i] 
			-- print(args[i])
		end
		-- print(say)
		say = tostring(say)
		Hl2c.DefaultChatPrint("[console]:"..say)
		print("[console]"..say)
	end
	
end)
concommand.Add("hl2c_zoneremove", function(pl,cmd,args) 
	ZONE.zones = {}
	if pl and pl:IsAdmin() then
		net.Start("Hl2c.ZoneSendZones")
			net.WriteTable(ZONE.zones)
		net.Broadcast()
	end
end)
concommand.Add("hl2c_zone1", function(pl,cmd,args) 
	ZONE.zones = ZONE.zones or {}
	if pl and pl:IsAdmin() and istable(ZONE.zones) then
		ZONE.zones[#ZONE.zones+1] = ZONE.zones[#ZONE.zones+1] or {}
		local pos = pl:GetEyeTrace().HitPos
		ZONE.zones[table.GetLastKey( ZONE.zones )].pos1 = pos
	end
end)
concommand.Add("hl2c_zone2", function(pl,cmd,args) 
	ZONE.zones = ZONE.zones or {}
	if pl and pl:IsAdmin() then
		ZONE.zones[table.GetLastKey( ZONE.zones )] = ZONE.zones[table.GetLastKey( ZONE.zones )] or {}
		ZONE.zones[table.GetLastKey( ZONE.zones )].pos2 = pl:GetEyeTrace().HitPos
	end
end)
concommand.Add("hl2c_zoneget", function(pl,cmd,args) 
	ZONE.zones = ZONE.zones or {}
	if pl and pl:IsAdmin() and ZONE.zones[table.GetLastKey( ZONE.zones )].pos2 and ZONE.zones[table.GetLastKey( ZONE.zones )].pos1 then
		-- ZONE.zones[#ZONE.zones] = ZONE.zones[#ZONE.zones] or {}
		local lastkey = table.GetLastKey( ZONE.zones )
		local cp1 = string.Explode(" ",tostring(ZONE.zones[lastkey].pos1))
		local cp2 = string.Explode(" ",tostring(ZONE.zones[lastkey].pos2))
		ZONE.zones[lastkey].typo = true
		ZONE.zones[lastkey].color = Color(math.random(1,255),math.random(1,255),math.random(1,255),255)
		pl:PrintMessage(HUD_PRINTCONSOLE, "\n ")
		pl:PrintMessage(HUD_PRINTCONSOLE, "VECTORS = \t{Vector(".. cp1[1] ..", ".. cp1[2] ..", ".. cp1[3] .."), Vector(".. cp2[1] ..", ".. cp2[2] ..", ".. cp2[3] .."),false,function() end,Vector(0,0,0)}\t")
		pl:PrintMessage(HUD_PRINTCONSOLE, "\n ")
		net.Start("Hl2c.ZoneSendZones")
			net.WriteTable(ZONE.zones)
		net.Broadcast()
	end
	
end)

concommand.Add("hl2c_ach_notify",function(pl,cmd,args)
	
	if IsValid(pl) then
		local id = ""
		if pl:IsUserGroup( "owner") and pl:Team() != TEAM_COMPLETED_MAP then
			
			id = "ACHIEVEMENT_EVENT_HL2_KILL_BARNACLESWITHBARREL"
			Hl2c.Achievement_Notify_V1(id,pl)
			if args and args[1] then
				id = "ACHIEVEMENT_EVENT_"..tostring(args[1])
			end
			--Hl2c.Achievement_Notify_V1(id,pl)
		end
	end
end)

function Hl2c.CheckDifficultyCommand(pl)
	if IsValid(pl) then
		if (Hl2c.DifficultyCheck and Hl2c.DifficultyCheck[Hl2c.Diff_Selected]) or difficulty > 30 then
			local name = Hl2c.DifficultyCheck[Hl2c.Diff_Selected]
			if difficulty > 30 then
				local number = Hl2c.Diff_Selected - 5
				name = "Monster Level ".. tostring(number)
			end
			Hl2c.PersonDefaultChatPrint("[hl2c] Difficulty: ".. name .." ("..tostring(difficulty)..")",pl)
			return
		end
		Hl2c.PersonDefaultChatPrint("[hl2c] Difficulty: "..tostring(difficulty).." Default",pl)
		return
	end
	print("[hl2c] Difficulty: ".. difficulty .." "..Hl2c.DifficultyCheck[Hl2c.Diff_Selected])
end 
 
concommand.Add("hl2c_givecurrentammo",Hl2c.PlayerGiveCurrentAmmo)

function Hl2c.BansCFG(id)
	if file.Exists("hl2c_data/hl2c_bans.txt","DATA") then
		local db = file.Read("hl2c_data/hl2c_bans.txt")
		db = util.KeyValuesToTable(db)
		if table.HasValue(db,id) then
			
		else
			table.insert(db,id)
			file.Write("hl2c_data/hl2c_bans.txt",util.TableToKeyValues(db))
		end
	else
		local db = {}
		table.insert(db,id)
		file.Write("hl2c_data/hl2c_bans.txt",util.TableToKeyValues(db))
	end
end

function Hl2c.Bans(id,mins)
	if id and isstring(id) then
		-- print("FOUNDYA")
		for _, pl in pairs(player.GetAll()) do
			if pl and pl:SteamID() == id then
				pl:Kick("Banned by Hl2c Admins")
				Hl2c.BansCFG(id)
				break
			end
		end
	end
end
function Hl2c.Unbans(id)
	if id and isstring(id) and #id > 0 then
		-- print("FOUNDYA")
		if file.Exists("hl2c_data/hl2c_bans.txt","DATA") then
			db = util.KeyValuesToTable(file.Read("hl2c_data/hl2c_bans.txt","DATA"))
			if table.HasValue(db,id) then
				table.RemoveByValue(db,id)
				file.Write("hl2c_data/hl2c_bans.txt",util.TableToKeyValues(db))
			end
		end
	end
end
local args = {

["nextmap"] = true, 
["lobby"] = true, 
["kick"] = true, 
["admin"] = true, 
["ban"] = true, 
["unban"] = true, 
["slay"] = true, 
["bring"] = true, 
["teleport"] = true, 
["goto"] = true, 
}
concommand.Add("hl2c", function(pl,cmd,arg)
	-- local command = ""
	if !pl or IsHl2cAdmin(pl) or IsHl2cSuperAdmin(pl) then else Hl2c.ChatPrint("[hl2c] No Permission!",pl) return end
	local arg1 = ""
	if arg and #arg >= 1 then else return end
	arg1=arg[1]
	-- args[arg[1]] 
	-- args[arg[1]]
	if args[arg[1]] then else return end
	-- Hl2c.ChatPrint("[hl2c] testing?")
	
	if arg1=="kick" then RunConsoleCommand("kickid",tostring(arg[2]),tostring(arg[3])) end
	if arg1=="ban" then if #arg == 4 then Hl2c.Bans(arg[2],arg[4]) end end
	if arg1=="unban" then Hl2c.Unbans(arg[2]) end
	if arg1=="lobby" then HL2C_AdminChatCommands( pl, "!golobby", false ) end
	if arg1=="nextmap" then GAMEMODE:NextMap() end
	if arg1=="admin" and pl then 
		net.Start("Admin_Menu_Open") 
		net.Send(pl) 
	end
	if arg1=="slay" then 
		for _, ply in pairs(team.GetPlayers( TEAM_ALIVE )) do
			if ply:SteamID() == arg[2] and Hl2c.AdminIMMUNE(ply,pl) then
				ply:Kill()
			end
		end
	end
end)

function Hl2c.AdminIMMUNE(a,b)
	if IsHl2cAdmin(a) then else return true end
	if Hl2c.Admin.List[a:SteamID()][2] > Hl2c.Admin.List[b:SteamID()][2] then return false end
	if Hl2c.Admin.List[a:SteamID()][2] <= Hl2c.Admin.List[b:SteamID()][2] then return true end
	
end