// Usermessage for Content Download
local function OpenDownloadContent( ply, text, team )
	if string.sub( text, 1, 8 ) == "!content" then
		ply:SendLua( [[ gui.OpenURL( "http://steamcommunity.com/sharedfiles/filedetails/?id=609160836" ) ]] )
		--gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=129361322")
	end
	if string.sub( text, 1, 11 ) == "!allcontent" then
		ply:SendLua( [[ gui.OpenURL( "http://steamcommunity.com/sharedfiles/filedetails/?id=790788989" ) ]] )
		--gui.OpenURL("http://steamcommunity.com/sharedfiles/filedetails/?id=790788989")
	end
end
hook.Add( "PlayerSay", "OpenDownloadContent", OpenDownloadContent)

// Some Fun with PlayerSay
hook.Add("PlayerSay", "Bring Alyx", function(ply, text, teamonly)
	if ply:IsAdmin() then

		if ( text == "!get alyx" ) then
			local v_alyx = ents.FindByClass( "npc_alyx" )

			local player_pos = ply:GetPos()
			local hit = ply:GetEyeTrace().HitPos
			local offset = Vector(10,0,30)
			--if IsValid(victim) then
			local text =  tostring(ply:Name()).." brought ".."npc_alyx"
			for _, get_alyx in pairs(v_alyx) do
				
				-- PrintMessage(HUD_PRINTTALK, ply:Name().." brought ".."npc_alyx")
				Hl2c.DefaultChatPrint(text)
				-- Hl2c.PersonDefaultChatPrint(text)
				get_alyx:SetPos(hit)
				
			end
			
		end
	end
end)

hook.Add("PlayerSay", "Bring Barney", function(ply, text, teamonly)
	if ply:IsAdmin() then

		if ( text == "!get barney" ) then
			local v_barney = ents.FindByClass( "npc_barney" )

			local player_pos = ply:GetPos()
			local hit = ply:GetEyeTrace().HitPos
			local offset = Vector(10,0,30)
			--if IsValid(victim) then
			local text =  tostring(ply:Name()).." brought ".."npc_barney"
			for _, get_barney in pairs(v_barney) do
				
				-- PrintMessage(HUD_PRINTTALK, ply:Name().." brought ".."npc_barney")
				Hl2c.DefaultChatPrint(text)
				get_barney:SetPos(hit)
				
			end
			
		end
	end
end)

function JoinCommand( pl, text, teamonly )
		    if (text == "!join") then 
			    pl:SendLua([[gui.OpenURL("")]])
			    for k, v in pairs(player.GetAll()) do v:ChatPrint( "Player " .. pl:Nick() .. " has joined our Steam group via !join." )

		end
	end
end
hook.Add( "PlayerSay", "Chat", JoinCommand )


local upr_list = {}
local upr_connect = {}

upr_list["!uprsandbox"] = true
upr_list["!uprcinema"] = true
upr_list["!uprdarkrp"] = true
upr_list["!uprstranded"] = true

upr_connect["!uprsandbox"] = "unitedponyrepublic.eu:27015"
upr_connect["!uprcinema"] = "unitedponyrepublic.eu:27016"
upr_connect["!uprdarkrp"] = "unitedponyrepublic.eu:27017"
upr_connect["!uprstranded"] = "unitedponyrepublic.eu:27018"

function PrintChatStat( pl, text, teamonly )
	-- print("HI_")
	if ( upr_list[text] == true ) and pl:IsValid() then
		pl:SendLua("LocalPlayer():ConCommand('connect ".. upr_connect[text] .."')")
	
	elseif ( string.Left(text,5) == "!loot" ) and pl:IsValid() and pl:IsAdmin() and DEV_MODE then
		local expl = string.Explode(" ",text)
		if expl and expl[2] and expl[2] == "titok" then
			pl:databaseLoot()
			return ""
		end
	elseif (text == "!discord") then
		pl:SendLua([[gui.OpenURL("https://discord.gg/khz3DgZ")]])
	elseif ( text == "!drop" ) then
		
	elseif ( text == "!stat" ) and pl:Team() != TEAM_COMPLETED_MAP then
/*	
		pl:ChatPrint( "--------------------------------" )
		if pl:GetXP() != nil then
		pl:ChatPrint( "Your xp is: " .. pl:GetXP() )	
		end
		if pl:GetLevel() != nil then
		pl:ChatPrint( "Your level is: " .. pl:GetLevel() )
		end
		if (pl:GetLevel() + 1) != nil then
		pl:ChatPrint( "For level "..(pl:GetLevel() + 1)..": "..LevelCurve[pl:GetLevel() +1] - pl:GetXP().." xp left" )
		end
		pl:ChatPrint( "--------------------------------" )
*/
	--if IsValid(pl) && pl:GetXP() != nil then
		if pl:IsPlayer() then
			net.Start("StatWindow")
			net.Send(pl)
		end
	--end
	elseif ( text == "!seat" ) then

		if pl:IsPlayer() and pl.vehicle and pl.seat then
			pl.seat:SetNoDraw(false)
			pl.seat:SetSaveValue("m_bLocked", false)
		end
	elseif ( text == "!pstat" ) and pl:Team() != TEAM_COMPLETED_MAP then

		if IsValid(pl) and pl.database["powerstat"] != nil then
			pl:ConCommand("hl2c_powerstat")
		end
	elseif ( text == "!inv" ) and IsValid(pl) and pl:Team() != TEAM_COMPLETED_MAP then
		pl:ConCommand("hl2c_inventory")
	elseif ( text == "!difficulty" ) then

		if IsValid(pl) then
			Hl2c.Diff_StartVote(pl)
		end
	elseif (  string.Left(text,8) == "!inspect" ) and pl:Team() != TEAM_COMPLETED_MAP then
		local args = string.Explode(" ",text)
		if args and args[1] == "!inspect" and args[2] and isstring(args[2]) and args[2] != "" then
			local call = false
			for _,play in pairs(player.GetAll()) do
				if play.setup_achi and pl:IsPlayer() and string.find(string.lower(play:Nick()),string.lower(args[2])) then
					
					net.Start("AIM_StatWindow", false)
						net.WriteEntity(play)
					net.Send(pl)
					break
				end
			end
		end
	elseif ( text == "!petsummon" ) and pl:Team() != TEAM_COMPLETED_MAP then
		--Hl2c.Pet_Hunter(pl)
		Hl2c.PetCreate(pl)
		
	elseif ( text == "!petremove" ) then
		--Hl2c.Pet_Hunter(pl)
		if IsValid(pl.pet) and pl.petalive == true then
		Hl2c.PetRemove(pl.pet)
		--print("CHAT")
		end
	elseif ( text == "!petstat" ) and pl:Team() != TEAM_COMPLETED_MAP then
		--Hl2c.Pet_Hunter(pl)
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
	elseif (text == "!pet" ) and pl:Team() != TEAM_COMPLETED_MAP then
		if pl:IsPlayer() and pl:GetNWBool("HasPetBought") then
			pl:databasePetMenu()
		end
		
	elseif ( string.Left(text, 8) == "!petname" ) and pl:Team() != TEAM_COMPLETED_MAP then
		if IsValid(pl.pet) and pl.petalive == true then
	
		local msg = string.Explode( " ", text )
		--print("SET PET NAME?", msg[2])

		if isstring(msg[2]) and 
		isstring(msg[3]) and 
		isstring(msg[4]) and 
		isstring(msg[5]) and 
		isstring(msg[6]) and 
		isstring(msg[7]) and
		isstring(msg[8])
		then
			Hl2c.PersonDefaultChatPrint("[hl2c] Pet Name is too long!",pl)
		elseif isstring(msg[2]) and 
		isstring(msg[3]) and 
		isstring(msg[4]) and 
		isstring(msg[5]) and 
		isstring(msg[6]) and 
		isstring(msg[7]) 
		then
			--print("SET PET NAME?", msg[2])
			local petname = msg[2].." "..msg[3].." "..msg[4].." "..msg[5].." "..msg[6].." "..msg[7]
			pl:SetNWString("pet_name", petname)
			pl.pet:SetNWString("pet_name", pl:GetNWString("pet_name"))
			pl:databaseSetPetName(petname)
			-- Hl2c.SetPetName_SQL(pl:SteamID(),pl:GetNWString("pet_id"),pl:GetNWString("pet_name"))
			--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. pl:GetNWString("pet_name") .."'  WHERE STEAMID = '".. pl:SteamID() .."'")
		elseif isstring(msg[2]) and 
		isstring(msg[3]) and 
		isstring(msg[4]) and 
		isstring(msg[5]) and 
		isstring(msg[6]) 
		then
			--print("SET PET NAME?", msg[2])
			local petname = msg[2].." "..msg[3].." "..msg[4].." "..msg[5].." "..msg[6]
			pl:SetNWString("pet_name", petname)
			pl.pet:SetNWString("pet_name", pl:GetNWString("pet_name"))
			pl:databaseSetPetName(petname)
			-- Hl2c.SetPetName_SQL(pl:SteamID(),pl:GetNWString("pet_id"),pl:GetNWString("pet_name"))
			--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. pl:GetNWString("pet_name") .."'  WHERE STEAMID = '".. pl:SteamID() .."'")
		elseif isstring(msg[2]) and 
		isstring(msg[3]) and 
		isstring(msg[4]) and 
		isstring(msg[5]) 
		then
			--print("SET PET NAME?", msg[2])
			local petname = msg[2].." "..msg[3].." "..msg[4].." "..msg[5]
			pl:SetNWString("pet_name", petname)
			pl.pet:SetNWString("pet_name", pl:GetNWString("pet_name"))
			pl:databaseSetPetName(petname)
			-- Hl2c.SetPetName_SQL(pl:SteamID(),pl:GetNWString("pet_id"),pl:GetNWString("pet_name"))
			--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. pl:GetNWString("pet_name") .."'  WHERE STEAMID = '".. pl:SteamID() .."'")
		elseif isstring(msg[2]) and 
		isstring(msg[3]) and 
		isstring(msg[4]) 
		then
			--print("SET PET NAME?", msg[2])
			local petname = msg[2].." "..msg[3].." "..msg[4]
			pl:SetNWString("pet_name", petname)
			pl.pet:SetNWString("pet_name", pl:GetNWString("pet_name"))
			pl:databaseSetPetName(petname)
			-- Hl2c.SetPetName_SQL(pl:SteamID(),pl:GetNWString("pet_id"),pl:GetNWString("pet_name"))
			--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. pl:GetNWString("pet_name") .."'  WHERE STEAMID = '".. pl:SteamID() .."'")
		elseif isstring(msg[2]) and 
		isstring(msg[3]) 
		then
			--print("SET PET NAME?", msg[2])
			local petname = msg[2].." "..msg[3]
			pl:SetNWString("pet_name", petname)
			pl.pet:SetNWString("pet_name", pl:GetNWString("pet_name"))
			pl:databaseSetPetName(petname)
			-- Hl2c.SetPetName_SQL(pl:SteamID(),pl:GetNWString("pet_id"),pl:GetNWString("pet_name"))
			--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. pl:GetNWString("pet_name") .."'  WHERE STEAMID = '".. pl:SteamID() .."'")
		elseif isstring(msg[2]) then
			--print("SET PET NAME?", msg[2])
			local petname = msg[2]
			pl:SetNWString("pet_name", petname)
			pl.pet:SetNWString("pet_name", pl:GetNWString("pet_name"))
			pl:databaseSetPetName(petname)
			--sql.Query("UPDATE ".. DB.Pet.Main .." SET PET_NAME = '".. pl:GetNWString("pet_name") .."'  WHERE STEAMID = '".. pl:SteamID() .."'")
			-- Hl2c.SetPetName_SQL(pl:SteamID(),pl:GetNWString("pet_id"),pl:GetNWString("pet_name"))
			--print(pl:Nick(),tostring(sql.QueryValue("SELECT PET_NAME FROM ".. DB.Pet.Main .." WHERE STEAMID = '"..pl:SteamID().."'")))
		end
		--pl:SetNWString("pet_name", )
		
		end
	elseif ( text == "!petfollow" ) then
		--Hl2c.Pet_Hunter(pl)
		--pl.pet.follow = true
		--pl.pet.stopfollow = false
		Hl2c.PetFollowOnwer( pl.pet, pl  )
		--print(pl.pet:GetClass())
	elseif ( text == "!petstopfollow" ) then
		--Hl2c.Pet_Hunter(pl)
		--pl.pet.follow = false
		--pl.pet.stopfollow = true
		--print("")
		Hl2c.PetStopFollowOnwer( pl.pet, pl  )
		--print(pl.pet:GetClass())
	elseif ( text == "!combine" ) then
		pl:ConCommand("hl2c_joincombine")
	elseif ( text == "!rebel" ) then
		pl:ConCommand("hl2c_joinrebel")
	elseif string.Left(text,5) == "!hl2c" and pl:IsAdmin() then
		--PrintMessage(HUD_PRINTCONSOLE," Tested Give")
		local msg = string.Explode( " ", text )
		--PrintTable(msg)
		--PrintMessage(HUD_PRINTTALK,"CALLED".. msg[1] .." ".. msg[2] .." ".. msg[3] .."")
		if istable(msg) and isstring( msg[2] ) then
			if msg[2] and msg[2] == "difficulty" then
				Hl2c.CheckDifficultyCommand(pl)
			elseif msg[2] == "give"  and isstring( msg[3] )  then
				Hl2c_Give(pl, "give", msg[3],true)
				--PrintMessage(HUD_PRINTCONSOLE," Tested Give")
			elseif msg[2] == "givecurrentammo" then
				Hl2c.PlayerGiveCurrentAmmo(pl)
				
			elseif string.lower(msg[2]) == "findbyname" and isstring(msg[3]) and isstring(msg[4]) and string.lower(msg[4]) == "fire" and isstring(msg[5]) then
				Hl2c.EntityFinder(pl,"findbyname",msg[3],msg[5])
				
			elseif string.lower(msg[2]) == "firebymapid" and msg[3] != nil and isstring(msg[4]) then
				Hl2c.FireByMapIDEnt(pl,	tonumber(msg[3]),msg[4])
				
			elseif string.lower(msg[2]) == "getmapidbyname" and isstring(msg[3]) then
				-- print("helo?")
				Hl2c.GetMapID_ByName(pl,msg[3])
				
			elseif msg[2] == "map"  and isstring( msg[3] )  then
				
				-- if changingLevel then PrintMessage(HUD_PRINTTALK,"[hl2c] Already changing level") return end
				if changingLevel then Hl2c.PersonDefaultChatPrint("[hl2c] Already changing level",pl) return end
				if Hl2c.HasMap(msg[3]) then else Hl2c.DefaultChatPrint("[error]: Invalid Map") return end
				local text = "[hl2c] Going to change level: ".. tostring(msg[3]) ..""
				-- PrintMessage(HUD_PRINTTALK,"[hl2c] Going to change level: ".. msg[3] .."")
				Hl2c.DefaultChatPrint(text)
				changingLevel = true
				timer.Simple(5, function()
					
					game.ConsoleCommand("hl2c_changelevel ".. msg[3] .."\n")
				end)
			end
		end
		
	elseif ( text == "!freeman" ) then
		if pl:IsPlayer() then
			if GAME_IS_HL2 or GAME_IS_EP1 or GAME_IS_EP2 then
					if pl:GetNWInt("CustomSetUpP1_03") == 0 and
					pl:GetNWInt("CustomSetUpP1_04") == 1 
					then
						-- pl:ChatPrint("[hl2c ach]: True One Freeman is Active")
						Hl2c.PersonDefaultChatPrint("[hl2c ach]: True One Freeman is Active",pl)
					elseif pl:GetNWInt("CustomSetUpP1_03") == 1 and
					pl:GetNWInt("CustomSetUpP1_04") == 0 
					then
						-- pl:ChatPrint("[hl2c ach]: True One Freeman is Failed")
						Hl2c.PersonDefaultChatPrint("[hl2c ach]: True One Freeman is Failed",pl)
					elseif pl:GetNWInt("CustomSetUpP1_03") == 1 
					then
						-- pl:ChatPrint("[hl2c ach]: True One Freeman is Failed")
						Hl2c.PersonDefaultChatPrint("[hl2c ach]: True One Freeman is Failed",pl)
					end
			else 
				-- pl:ChatPrint("[hl2c ach]: Achievement not available on this map.")
				Hl2c.PersonDefaultChatPrint("[hl2c ach]: Achievement not available on this map.",pl)
			end
		end
	end
end
hook.Remove("PlayerSay", "PrintChatStat")
hook.Add( "PlayerSay", "PrintChatStat", PrintChatStat)

function HL2C_AdminChatCommands( pl, text, teamonly )
	if ( text == "!golobby" ) then
		if pl:IsAdmin() && pl:IsValid() && !pl:IsBot() then
		-- PrintMessage( HUD_PRINTTALK, "Admin Forced The Server To Go Lobby" )
		Hl2c.DefaultChatPrint("Admin Forced The Server To Go Lobby" )
		timer.Simple(5, function()
			
			game.ConsoleCommand("hl2c_changelevel ".. LOBBY_TEXT_MAP .."\n")
		end)
		else
			-- pl:ChatPrint( "Need Admin Permission!" )
			Hl2c.PersonDefaultChatPrint( "Need Admin Permission!" , pl )
		end
		
	elseif ( text == "!gotest" ) then
		if pl:IsAdmin() && pl:IsValid() && !pl:IsBot() then
		-- PrintMessage( HUD_PRINTTALK, "Admin Forced The Server To Go Test" )
		Hl2c.DefaultChatPrint( "Admin Forced The Server To Go Test" )
		timer.Simple(5, function()
			game.ConsoleCommand("hl2c_changelevel gm_flatgrass\n")
		end)
		else
			-- pl:ChatPrint( "Need Admin Permission!" )
			Hl2c.PersonDefaultChatPrint( "Need Admin Permission!" , pl )
		end
		
	elseif (text == "!donate" ) then
	
		-- pl:SendLua([[gui.OpenURL("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=VJZF2KRW39W6A")]]) -- Change ADDRESS to your chosen page.
		pl:SendLua([[gui.OpenURL("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=WHKHUUAC56E5U")]])
	--elseif ( text == "!getpos" ) then
		
	--	pl:ChatPrint( "Pos: "..pl:Entity:GetPos().."" )
	end
	
	if ( text == "!admin" )
	then
		
		if IsValid(pl) and
		IsHl2cAdmin(pl) and
		!pl:IsBot() and
		pl:IsPlayer()
		then
			net.Start("Admin_Menu_Open")
			net.Send(pl)
		end
		
	end
	
	if ( text == "!gettables" )
	then
		--print("Done")
		local tr = util.GetPlayerTrace( pl )
		local trace = util.TraceLine( tr )
		--PrintTable(trace.Entity:GetSaveTable())
		if IsValid(pl) and
		IsValid(trace.Entity) and
		istable(trace.Entity:GetSaveTable()) and
		pl:IsAdmin() and
		!pl:IsBot() and
		pl:IsPlayer()
		then
			for k, v in pairs( trace.Entity:GetSaveTable() ) do
				pl:PrintMessage( HUD_PRINTCONSOLE, tostring(k).." = "..tostring(v) )
			end
		end
		
	end
	
	if ( text == "!getid" )
	then
		--print("Done")
		local tr = util.GetPlayerTrace( pl )
		local trace = util.TraceLine( tr )
		--PrintTable(trace.Entity:GetSaveTable())
		if IsValid(pl) and
		IsValid(trace.Entity) and
		trace.Entity:CreatedByMap() and
		--istable(trace.Entity:GetSaveTable()) and
		pl:IsAdmin() and
		!pl:IsBot() and
		pl:IsPlayer()
		then
			pl:PrintMessage( HUD_PRINTCONSOLE, tostring( trace.Entity:MapCreationID() ) )
		end
		
	end
	
	if ( text == "!getclass" )
	then
		--print("Done")
		local tr = util.GetPlayerTrace( pl )
		local trace = util.TraceLine( tr )
		--PrintTable(trace.Entity:GetSaveTable())
		if IsValid(pl) and
		IsValid(trace.Entity) and
		--trace.Entity:CreatedByMap() and
		--istable(trace.Entity:GetSaveTable()) and
		pl:IsAdmin() and
		!pl:IsBot() and
		pl:IsPlayer()
		then
			pl:PrintMessage( HUD_PRINTCONSOLE, tostring( trace.Entity:GetClass() ) )
		end
		
	end
	
	if ( text == "!getname" )
	then
		--print("Done")
		local tr = util.GetPlayerTrace( pl )
		local trace = util.TraceLine( tr )
		--PrintTable(trace.Entity:GetSaveTable())
		if IsValid(pl) and
		IsValid(trace.Entity) and
		--trace.Entity:CreatedByMap() and
		--istable(trace.Entity:GetSaveTable()) and
		pl:IsAdmin() and
		!pl:IsBot() and
		pl:IsPlayer()
		then
			pl:PrintMessage( HUD_PRINTCONSOLE, tostring( trace.Entity:GetName() ) )
		end
		
	end
end

hook.Add( "PlayerSay", "_HL2C_AdminChatCommands", HL2C_AdminChatCommands)



function Combine_Chattalk(pl, text, teamonly)
	if IsValid(pl) then
		if pl:Alive() and pl:Team() == TEAM_ALIVE then
			if CD_MAP then
				print(pl:Nick())
				--if CD_CHATTALK then
				if (math.random(1, 6) <= 3) then
				--PlayerTaunt(killer)
				//	Force Combine to talk when say anything on chat ^^	\\
				local modelNameGender = pl:GetModel()
				if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
					pl:EmitSound(COMBINE_VOICELINE_SOUNDS[math.random(1,#COMBINE_VOICELINE_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
				end
				
				end
				--end
			end
		end
	end
end

hook.Add( "PlayerSay", "Combinetalk", Combine_Chattalk)


function PrintChatReport( pl, text, teamonly )
	
	if ( text == "!report" ) then

		if pl:IsPlayer() then
			net.Start("ReportWindow")
			net.Send(pl)
		end
	elseif ( text == "!top5" ) then
		if (sql.TableExists("hl2c_playerdata") == true) then
			-- local query = sql.Query("SELECT Name FROM hl2c_playerdata Order By Level Desc LIMIT 5")
			
			-- for k, v in pairs(query) do
				-- Hl2c.TopList[k] = (k ..". Name: ".. v["Name"])
				
			-- end
			-- net.Start("TopWindow")
					-- net.WriteString(Hl2c.TopList[1])
					-- net.WriteString(Hl2c.TopList[2])
					-- net.WriteString(Hl2c.TopList[3])
					-- net.WriteString(Hl2c.TopList[4])
					-- net.WriteString(Hl2c.TopList[5])
			-- net.Send(pl)
		end
	end
end

hook.Add( "PlayerSay", "Print-Chat-Report", PrintChatReport)

function Hl2c_PosPrint(pl, text, teamonly)
	if (text == "!hl2c vortex") then
		if IsValid(pl) and pl:IsPlayer() and pl:IsAdmin() then
			
			if IsValid(pl) and isvector(pl:GetPos()) then
				local pos = pl:GetPos() + Vector(0,0,35)
				if pl:Crouching() then pos = pl:GetPos() end
				pl.vortex_getpos = string.Explode(" ", tostring(pos) )
				pl:PrintMessage(HUD_PRINTCONSOLE, "\n ")
				pl:PrintMessage(HUD_PRINTCONSOLE, "\nVORTEX_POS = Vector("..pl.vortex_getpos[1]..", "..pl.vortex_getpos[2]..", "..pl.vortex_getpos[3]..")\n")
				pl:PrintMessage(HUD_PRINTCONSOLE, "\n ")
			end
		end
	end
	if (text == "!hl2c getpos") then
		if IsValid(pl) and pl:IsPlayer() and pl:IsAdmin() then
			
			if IsValid(pl) and isvector(pl:GetPos()) then
				local pos = pl:GetPos()
				pl.spawn_getpos = string.Explode(" ", tostring(pos) )
				pl:PrintMessage(HUD_PRINTCONSOLE, "\n ")
				pl:PrintMessage(HUD_PRINTCONSOLE, "\nVORTEX_POS = Vector("..pl.spawn_getpos[1]..", "..pl.spawn_getpos[2]..", "..pl.spawn_getpos[3]..")\n")
				pl:PrintMessage(HUD_PRINTCONSOLE, "\n ")
			end
		end
	end
	if (text == "!zone1") then
		if IsValid(pl) and pl:IsPlayer() and pl:IsAdmin() then
			
			pl:ConCommand("hl2c_zone1")
		end
	end
	if (text == "!zoneremove") then
		if IsValid(pl) and pl:IsPlayer() and pl:IsAdmin() then
			
			pl:ConCommand("hl2c_zoneremove")
		end
	end
	if (text == "!zone2") then
		if IsValid(pl) and pl:IsPlayer() and pl:IsAdmin() then
			
			pl:ConCommand("hl2c_zone2")
		end
	end
	if (text == "!zoneget") then
		if IsValid(pl) and pl:IsPlayer() and pl:IsAdmin() then
			
			pl:ConCommand("hl2c_zoneget")
		end
	end
end   

hook.Remove( "PlayerSay", "Hl2c-PosPrint")
hook.Add( "PlayerSay", "Hl2c-PosPrint", Hl2c_PosPrint)

hook.Add("PlayerSay", "ThirdPerson_ChatAccess", function(ply, text, teamonly)
	if not ply:Alive() or ( ply:Team() == TEAM_DEAD or ply:Team() == TEAM_COMBINE_DEAD or ply:Team() == TEAM_COMPLETED_MAP ) then return end
	if string.lower(text) == "!3p" then ply:ConCommand( "thirdperson_toggle" ) end
	if string.lower(text) == "!thirdperson" then ply:ConCommand( "thirdperson_toggle" ) end
end)