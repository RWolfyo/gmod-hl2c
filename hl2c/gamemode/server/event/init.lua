function Hl2c:Event_Ep2Open()
	
	--
	-- EP2 OPEN EVENT
	--
	if (game.GetMap() == "winter_lobby_2012" or game.GetMap() == "keyfox_lobby_summer") and
	file.Exists("hl2c_data/ep2_door_open.txt","DATA") 
	then
		for k, v in pairs(ents.FindByName("ep2_chapter1_brush")) do
			if IsValid(v)
			then
				if file.Exists("hl2c_data/ep2_door_open_alyx.txt","DATA") 
				then
					
					local npc = ents.Create("prop_dynamic")
					npc:SetKeyValue("targetname", "alyx")
					npc:SetKeyValue("model", "models/alyx.mdl")
					npc:SetKeyValue("models", "models/alyx.mdl")
					npc:SetKeyValue("skin", "1")
					npc:SetPos(Vector(-1183.988892, 945.296265, 32.031250))
					npc:Spawn()
					npc:Activate()
					npc:SetModel("models/alyx.mdl")
					npc:SetSkin(1)
					npc:SetAnimation("cheer1")
					timer.Create( "EP2_EVENT_DOOR_OPEN_ALYX_ANIM", 1.5, 0, function()
						--PrintMessage(HUD_PRINTTALK, "[hl2c] If the map is bugged please type in chat !skip \nIt will open the exit door to skip the map.")
						if IsValid(npc) then
							npc:Fire("SetAnimation","cheer1")
						end
					end )
					npc:Fire("SetAnimation","cheer1")
				end
				--npc:SetAngles(Angle(48.206333, 1.599719, 0.000000))
				
				print("Event Ep2 Door Opened")
				PrintMessage(HUD_PRINTTALK,"[hl2c event] Episode Two Door is open.")
				v:Fire("Disable")
				v:Fire("Kill")
				
			end
		end
		
	end
	
	
	--
	-- EP2 OPEN EVENT
	--
	if (game.GetMap() == "winter_lobby_2012" or game.GetMap() == "keyfox_lobby_summer") and
	file.Exists("hl2c_data/ep2_event_battle_for_lobby.txt","DATA") and
	sql.TableExists( DB.CustomSetUp.P1 ) == true
	then
		if HL2C_EVENT_ON != 001
		then
			
			local npc_maker = ents.Create("npc_maker")
			npc_maker:SetKeyValue("targetname", "event001_maker_01")
			npc_maker:SetKeyValue("additionalequipment", "weapon_ar2")
			npc_maker:SetKeyValue("MaxLiveChildren", "1")
			npc_maker:SetKeyValue("StartDisabled", "0")
			npc_maker:SetKeyValue("MaxNPCCount", "25000")
			npc_maker:SetKeyValue("NPCType", "npc_combine_s")
			npc_maker:SetKeyValue("SpawnFrequency", "5")
			npc_maker:SetKeyValue("spawnflags", "8320")
			npc_maker:SetPos(Vector(1773.273926, 4.910764, 61.652344))
			npc_maker:Spawn()
			npc_maker:Activate()
			
			local npc_maker = ents.Create("npc_maker")
			npc_maker:SetKeyValue("targetname", "event001_maker_01")
			npc_maker:SetKeyValue("additionalequipment", "weapon_ar2")
			npc_maker:SetKeyValue("MaxLiveChildren", "1")
			npc_maker:SetKeyValue("StartDisabled", "0")
			npc_maker:SetKeyValue("MaxNPCCount", "25000")
			npc_maker:SetKeyValue("NPCType", "npc_combine_s")
			npc_maker:SetKeyValue("SpawnFrequency", "5")
			npc_maker:SetKeyValue("spawnflags", "8320")
			npc_maker:SetPos(Vector(-778.564758, 441.806152, 72.616112))
			npc_maker:Spawn()
			npc_maker:Activate()
			
			local npc_maker = ents.Create("npc_maker")
			npc_maker:SetKeyValue("targetname", "event001_maker_01")
			npc_maker:SetKeyValue("additionalequipment", "weapon_ar2")
			npc_maker:SetKeyValue("MaxLiveChildren", "1")
			npc_maker:SetKeyValue("StartDisabled", "0")
			npc_maker:SetKeyValue("MaxNPCCount", "25000")
			npc_maker:SetKeyValue("NPCType", "npc_combine_s")
			npc_maker:SetKeyValue("SpawnFrequency", "5")
			npc_maker:SetKeyValue("spawnflags", "8320")
			npc_maker:SetPos(Vector(-560.000977, -827.120056, 313.840942))
			npc_maker:Spawn()
			npc_maker:Activate()
			/*
			local npc_maker = ents.Create("npc_maker")
			npc_maker:SetKeyValue("targetname", "event001_maker_01")
			npc_maker:SetKeyValue("additionalequipment", "weapon_ar2")
			npc_maker:SetKeyValue("MaxLiveChildren", "3")
			npc_maker:SetKeyValue("StartDisabled", "0")
			npc_maker:SetKeyValue("MaxNPCCount", "25000")
			npc_maker:SetKeyValue("NPCType", "npc_combine_s")
			npc_maker:SetKeyValue("SpawnFrequency", "5")
			npc_maker:SetKeyValue("spawnflags", "8320")
			npc_maker:SetPos(Vector(850.362854, 665.914185, 304.665955))
			npc_maker:Spawn()
			npc_maker:Activate()
			*/
			local npc_maker = ents.Create("npc_maker")
			npc_maker:SetKeyValue("targetname", "event001_maker_01")
			--npc_maker:SetKeyValue("additionalequipment", "weapon_ar2")
			npc_maker:SetKeyValue("MaxLiveChildren", "1")
			npc_maker:SetKeyValue("StartDisabled", "0")
			npc_maker:SetKeyValue("MaxNPCCount", "25000")
			npc_maker:SetKeyValue("NPCType", "npc_hunter")
			npc_maker:SetKeyValue("SpawnFrequency", "5")
			npc_maker:SetKeyValue("spawnflags", "8320")
			npc_maker:SetPos(Vector(2027.519409, 435.970459, 61.929913))
			npc_maker:Spawn()
			npc_maker:Activate()
			
			local npc_maker = ents.Create("npc_maker")
			npc_maker:SetKeyValue("targetname", "event001_maker_01")
			--npc_maker:SetKeyValue("additionalequipment", "weapon_ar2")
			npc_maker:SetKeyValue("MaxLiveChildren", "1")
			npc_maker:SetKeyValue("StartDisabled", "0")
			npc_maker:SetKeyValue("MaxNPCCount", "25000")
			npc_maker:SetKeyValue("NPCType", "npc_hunter")
			npc_maker:SetKeyValue("SpawnFrequency", "5")
			npc_maker:SetKeyValue("spawnflags", "8320")
			npc_maker:SetPos(Vector(2132.082031, -472.889099, 89.702194))
			npc_maker:Spawn()
			npc_maker:Activate()
			
		end
		
		--HL2C_EVENT_ON = 001
		
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) and
			(v:Team() == TEAM_ALIVE or
			v:Team() == TEAM_DEAD) and
			v.setup_achi == true and
			v:GetNWInt("CustomSetUpP1_05") != 1
			then
				v:SetNWInt("CustomSetUpP1_05", 1)
				--v.hl2_ravenholm_ready = true
				print("Event Ep2 Added",v:Nick())
				PrintMessage(HUD_PRINTTALK,"[hl2c event] Episode Two Added: "..v:Nick())
				sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_05 = ".. 1 .." WHERE UniqueID = '"..v:UniqueID().."'")
			end
		end
		
		
	end
	
	
	--
	-- EP2 EVENT GIVE
	--
	if (!file.Exists("hl2c_data/ep2_door_open.txt","DATA") and
	!file.Exists("hl2c_data/ep2_event_battle_for_lobby.txt","DATA") and
	!file.Exists("hl2c_data/ep2_door_open_alyx.txt","DATA") )
	then
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) and 
			v:IsPlayer() and
			v.setup_achi == true and
			v:GetNWInt("ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN") != 1 and
			v:GetNWInt("CustomSetUpP1_05") == 1
			
			then
				-- PrintMessage(HUD_PRINTTALK, "[hl2c ach]: ".. v:Nick() .."Ep2 Opening event + 20 000 points")
				-- v:AddXP(20000)
				v:SetNWInt("ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN", 1)
				sql.Query("UPDATE ".. DB.AchGenP2.Table .." SET ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN = ".. 1 .." WHERE UniqueID = '"..v:UniqueID().."'")
			end
		end
		if game.GetMap() == "winter_lobby_2012" or game.GetMap() == "keyfox_lobby_summer" then
		
			for k, v in pairs(ents.FindByClass("npc_maker")) do
				if IsValid(v)
				then
					v:Fire("Deactivate")
					v:Fire("Disable")
					v:Fire("Kill")
				end
			end
			
			for k, v in pairs(ents.FindByClass("npc_combine_s")) do
				if IsValid(v)
				then
					v:Fire("Deactivate")
					v:Fire("Disable")
					v:Fire("Kill")
				end
			end
			
			for k, v in pairs(ents.FindByClass("npc_hunter")) do
				if IsValid(v)
				then
					v:Fire("Deactivate")
					v:Fire("Disable")
					v:Fire("Kill")
				end
			end
			
			for k, v in pairs(ents.FindByName("alyx")) do
				if IsValid(v)
				then
					v:Fire("Kill")
				end
			end
			--HL2C_EVENT_ON = false
			for k, v in pairs(ents.FindByName("ep2_chapter1_brush")) do
				if IsValid(v)
				then
					v:Fire("Disable")
					v:Fire("Deactivate")
					v:Fire("Kill")
					
				end
			end
		end
	end
	
end

function Hl2c:Event()
	-- if 
end

function Hl2c:Event_Christhmas()

end