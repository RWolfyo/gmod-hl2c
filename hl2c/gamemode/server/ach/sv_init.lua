local DbgPrint = GetLogging("Achievements")
hook.Add("PlayerDisconnected", "Check_DC_TEST", function( ply )
	
	if isstring(ply:Nick())
	then
		--print("REMOVE ACHIEVEMENT ON DC")
		--print(ply:Nick())
		--print(ply:UniqueID())
		--ply:SetNWInt("CustomSetUpP1_04", 0)
		--ply:SetNWInt("CustomSetUpP1_02", 1)
		if GAME_IS_HL2 or GAME_IS_EP1 or GAME_IS_EP2 and
		(!string.find(game.GetMap(), "d1_trainstation_") or
		game.GetMap() == "d1_trainstation_06")
		then
			sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_03 = ".. 1 .." WHERE UniqueID = '".. ply:UniqueID() .."'")
			sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_04 = ".. 0 .." WHERE UniqueID = '".. ply:UniqueID() .."'")
		end

		if GAME_IS_HL2 and
		game.GetMap() != "d1_town_05" and
		Hl2c.Ravenholm.Maps[game.GetMap()]
		then
			-- print("Achievement Failed Ravenholm Beat Only Gravity Gun")
			sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_02 = ".. 1 .." WHERE UniqueID = '".. ply:UniqueID() .."'")
		end
		--print(ply:GetNWInt("CustomSetUpP1_04"))
		--print(ply:GetNWInt("CustomSetUpP1_02"))
	end
	
end) 


local function EntityValidity(ent)
	if IsValid(ent) and isstring(ent:GetClass()) then
		return true
	end
end

function Hl2c.MaskLoot(ent,pl)
	if ent:GetClass() == "npc_combine_s" then
		local max = 10000 - ( (pl:GetNWInt("PSTAT_3")+pl:GetNWInt("ISTAT_LUCK"))*10 )
		if max <= 0 then
		max = 1
		end
		local loot = math.random(1,max)
		local chance1 = math.random(1,max)
		local chance2 = 1
		-- local random = 15
		if DEV_MODE then Hl2c.ChatPrint("[Loot-Roll]: "..tostring(loot).."/"..tostring(max) ) end
		-- Hl2c.ChatPrint("[Chance-Roll]: "..tostring(chance1).."/"..tostring(max) ) 
		-- Hl2c.ChatPrint("[Chance-Roll]: "..tostring(chance2).."/"..tostring(max) ) 
		-- if (true) then
		if (loot == chance1 or loot == chance2) then
			Hl2c.ChatPrint("[SECRET]: LOOT MASK") 
			pl:SetSetup(4,1)
			pl:AddXP(50)
			-- print("[SECRET]: LOOT MASK")
			-- local pos = ent:GetPos() + Vector(0,0,30)
			-- local dynamic = ents.Create("prop_dynamic")
			-- dynamic:SetPos(pos)
			-- dynamic:SetModel("models/combine/elite_helmet.mdl")
			-- dynamic:Spawn()
			-- local prop = ents.Create("prop_physics_override")
			-- prop:SetPos(pos)
			-- prop:SetModel("models/props_lab/bindergreen.mdl")
			-- prop:SetName("secret_elit_mask")
			-- prop:Spawn()
			-- prop:SetNoDraw(true)
			-- dynamic:SetParent(prop)
		else
			-- print("NO MASK LOOT")
		end
	else
		local max = 1000 - ( pl:GetNWInt("PSTAT_3") + (pl:GetNWInt("ISTAT_LUCK" )*10) )
		if max <= 0 then
		max = 1
		end
		local loot = math.random(1,max)
		local chance1 = math.random(1,max)
		local chance2 = 1
		-- local random = 15
		if DEV_MODE then Hl2c.ChatPrint("[Loot-Roll]: "..tostring(loot).."/"..tostring(max) ) end
		-- Hl2c.ChatPrint("[Chance-Roll]: "..tostring(chance1).."/"..tostring(max) ) 
		-- Hl2c.ChatPrint("[Chance-Roll]: "..tostring(chance2).."/"..tostring(max) ) 
		-- if (true) then
		if (loot == chance1 or loot == chance2) then
			Hl2c.ChatPrint("[SECRET]: LOOT MASK") 
			pl:SetSetup(3,1)
			pl:AddXP(50)
			-- local pos = ent:GetPos() + Vector(0,0,30)
			-- local dynamic = ents.Create("prop_dynamic")
			-- dynamic:SetPos(pos)
			-- dynamic:SetModel("models/BarneyHelmet_faceplate.mdl")
			-- dynamic:Spawn()
			-- local prop = ents.Create("prop_physics_override")
			-- prop:SetPos(pos)
			-- prop:SetModel("models/props_lab/bindergreen.mdl")
			-- prop:SetName("secret_cop_mask")
			-- prop:Spawn()
			-- prop:SetNoDraw(true)
			-- dynamic:SetParent(prop)
		else
			-- print("NO MASK LOOT")
		end
	end
end

--[[ function Hl2c.MaskPickUp( pl, ent )
	if IsValid(pl) and IsValid(ent) then
		if ent:GetName() and ent:GetName() == "secret_cop_mask" and pl:GetNWInt("customsetup_3") != 1 then
			-- Hl2c.Ach
			pl:SetSetup(3,1)
			pl:AddXP(50)
			

			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(SECRET_ACHIEVEMENT_MASK1_TITLE) .. " + 50 Points" )
			
			Hl2c.Achievement_Notify_V1(SECRET_ACHIEVEMENT_MASK1_ID,pl)
		end
		if ent:GetName() and ent:GetName() == "secret_elit_mask" and pl:GetNWInt("customsetup_4") != 1 then
			-- Hl2c.Ach
			pl:SetSetup(4,1)
			pl:AddXP(50)
			

			-- Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(SECRET_ACHIEVEMENT_MASK1_TITLE) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1(SECRET_ACHIEVEMENT_MASK1_ID,pl)
		end
	end
end
hook.Add( "AllowPlayerPickup", "hl2c.maskpickup.secret", Hl2c.MaskPickUp )
 ]]
function Hl2c.HL2_KILL_BARNACLESWITHBARREL()
	for _, pl in pairs(player.GetAll()) do
		if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_HL2_KILL_BARNACLESWITHBARREL") != 1 then
			pl:AddAchi("ACHIEVEMENT_EVENT_HL2_KILL_BARNACLESWITHBARREL")
			pl:AddXP(50)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_BARNACLESWITHBARREL"]) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_KILL_BARNACLESWITHBARREL",pl)
		end
	end
end

function Hl2c.EP2_KILL_HUNTER_WITHFLECHETTES()
	for _, pl in pairs(player.GetAll()) do
		if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_EP2_KILL_HUNTER_WITHFLECHETTES") != 1 then
			pl:AddAchi("ACHIEVEMENT_EVENT_EP2_KILL_HUNTER_WITHFLECHETTES")
			pl:AddXP(50)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_KILL_HUNTER_WITHFLECHETTES"]) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_KILL_HUNTER_WITHFLECHETTES",pl)
		end
	end
end

function Hl2c.HLX_KILL_SOLDIER_WITHHISGRENADE(pl)
	-- for _, pl in pairs(player.GetAll()) do
		if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_HLX_KILL_SOLDIER_WITHHISGRENADE") != 1 then
			pl:AddAchi("ACHIEVEMENT_EVENT_HLX_KILL_SOLDIER_WITHHISGRENADE")
			pl:AddXP(50)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HLX_KILL_SOLDIER_WITHHISGRENADE"]) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HLX_KILL_SOLDIER_WITHHISGRENADE",pl)
		end
	-- end
end


function Hl2c.HLX_KILL_ENEMY_WITHHOPPERMINE()
	for _, pl in pairs(player.GetAll()) do
		if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_HLX_KILL_ENEMY_WITHHOPPERMINE") != 1 then
			pl:AddAchi("ACHIEVEMENT_EVENT_HLX_KILL_ENEMY_WITHHOPPERMINE")
			pl:AddXP(50)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HLX_KILL_ENEMY_WITHHOPPERMINE"]) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HLX_KILL_ENEMY_WITHHOPPERMINE",pl)
		end
	end
end

function Hl2c.EP2_FIND_ALLRADARCACHES(pl)
	if pl and pl.setup_achi and pl:GetAllRadarCache() >= 5 -(1) and pl:GetAchi("ACHIEVEMENT_EVENT_EP2_FIND_ALLRADARCACHES") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_EP2_FIND_ALLRADARCACHES")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_FIND_ALLRADARCACHES"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_FIND_ALLRADARCACHES",pl)
	end
end

function Hl2c.EP2_BREAK_ALLWEBS(pl)
	if pl and pl.setup_achi and pl:GetAllWebCache() >= 9 and pl:GetAchi("ACHIEVEMENT_EVENT_EP2_BREAK_ALLWEBS") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_EP2_BREAK_ALLWEBS")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BREAK_ALLWEBS"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_BREAK_ALLWEBS",pl)
	end
end

function Hl2c.EP2_GRUB_ACH(pl)
	if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_EP2_KILL_ALLGRUBS") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_EP2_KILL_ALLGRUBS")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_KILL_ALLGRUBS"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_KILL_ALLGRUBS",pl)
	end
end

function Hl2c.EP2_MISSILESILO2_ACH(pl)
	if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_EP2_BEAT_MISSILESILO2") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_EP2_BEAT_MISSILESILO2")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_BEAT_MISSILESILO2"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_BEAT_MISSILESILO2",pl)
	end
end

function Hl2c.HL2_FOLLOWFREEMAN_ACH(pl)
	if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_HL2_FOLLOWFREEMAN") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_HL2_FOLLOWFREEMAN")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_FOLLOWFREEMAN"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_FOLLOWFREEMAN",pl)
	end
end
function Hl2c.LT_SECRET_ACH(pl)
	if pl and pl.setup_achi and pl:GetNWInt("customsetup_2") != 1 and game.GetMap() == "d2_lostcoast" then
		pl:SetSetup(2,1)
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(SECRET_ACHIEVEMENT_LT_TITLE) .. " + 50 Points" )
		
		Hl2c.Achievement_Notify_V1(SECRET_ACHIEVEMENT_LT_ID,pl)
	end
end

function Hl2c.EP2_KILL_ENEMIES_WITHCAR()
	for _, pl in pairs(player.GetAll()) do
		if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR") != 1 then
			if pl:GetCounter(2) + 1 >= 20 then 
			pl:AddAchi("ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR")
			pl:AddXP(50)
			pl:SetCounter(2,20)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR"]) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR",pl)
			else
				pl:AddCounter(2,1)
				-- print( pl:GetCounter(2) )
			end
		end
	end
end

function Hl2c.EP1_KILL_ANTLIONS_WITHCARS()
	for _, pl in pairs(player.GetAll()) do
		if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_EP1_KILL_ANTLIONS_WITHCARS") != 1 then
			if pl:GetCounter(3) + 1 >= 15 then 
			pl:AddAchi("ACHIEVEMENT_EVENT_EP1_KILL_ANTLIONS_WITHCARS")
			pl:AddXP(50)
			pl:SetCounter(3,15)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP1_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP1_KILL_ANTLIONS_WITHCARS"]) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP1_KILL_ANTLIONS_WITHCARS",pl)
			else
				pl:AddCounter(3,1)
				-- print( pl:GetCounter(3) )
			end
		end
	end
end

function Hl2c.EP1_KILL_ENEMIES_WITHSNIPERALYX()
	for _, pl in pairs(player.GetAll()) do
		if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_EP1_KILL_ENEMIES_WITHSNIPERALYX") != 1 then
			if pl:GetCounter(4) + 1 >= 30 then 
			pl:AddAchi("ACHIEVEMENT_EVENT_EP1_KILL_ENEMIES_WITHSNIPERALYX")
			pl:AddXP(50)
			pl:SetCounter(4,30)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP1_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP1_KILL_ENEMIES_WITHSNIPERALYX"]) .. " + 50 Points" )
			
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP1_KILL_ENEMIES_WITHSNIPERALYX",pl)
			else
				pl:AddCounter(4,1)
				-- print( pl:GetCounter(4) )
			end
		end
	end
end


function Hl2c.HLX_KILL_ENEMIES_WITHPHYSICS(pl)
	if pl and pl.setup_achi and pl:GetAchi("ACHIEVEMENT_EVENT_HLX_KILL_ENEMIES_WITHPHYSICS") != 1 then
		if pl:GetCounter(1) + 1 >= 30 then 
		pl:AddAchi("ACHIEVEMENT_EVENT_HLX_KILL_ENEMIES_WITHPHYSICS")
		pl:AddXP(50)
		pl:SetCounter(1,30)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HLX_KILL_ENEMIES_WITHPHYSICS"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HLX_KILL_ENEMIES_WITHPHYSICS",pl)
		else
			pl:AddCounter(1,1)
			-- print( pl:GetCounter(2) )
		end
	end
end

function Hl2c.GEN_BEAT_ALLEP2(pl)
	if pl and pl.setup_achi and pl:GetAllEP2Ach() >= 22 and pl:GetAchi("ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP2") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP2")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(GEN_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP2"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP2",pl)
	end
end
function Hl2c.GEN_BEAT_ALLEP1(pl)
	if pl and pl.setup_achi and pl:GetAllEP1Ach() >= #Hl2c.EP1_ACH_LIST -1 and pl:GetAchi("ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP1") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP1")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(GEN_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP1"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_GEN_BEAT_ALLEP1",pl)
	end
end
function Hl2c.GEN_BEAT_ALLHL2(pl)
	if pl and pl.setup_achi and pl:GetAllHL2Ach() >= #Hl2c.HL2_ACH_LIST -1 and pl:GetAchi("ACHIEVEMENT_EVENT_GEN_BEAT_ALLHL2") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_GEN_BEAT_ALLHL2")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(GEN_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_GEN_BEAT_ALLHL2"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_GEN_BEAT_ALLHL2",pl)
	end
end

function Hl2c.HL2_FIND_ALLLAMBDAS(pl)
	if pl and pl.setup_achi and pl:GetAllLambdaCache() >= 47 and pl:GetAchi("ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS") != 1 then
		pl:AddAchi("ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS")
		pl:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS",pl)
	end
end

function Ach_HL2_KILL_SIXGUNSHIPS(ent)
	local text = ""


	if IsValid(ent) and
	ent:GetClass() != nil and
	ent:GetClass() == "npc_combinegunship" and
	ent.LastAttacker != nil and
	ent.input_kill != 1 and
	changingLevel != true
	then
		if GAME_IS_HL2 and
		IsValid(ent) and
		IsValid(ent.LastAttacker) and
		ent:IsNPC() and
		ent.LastAttacker:IsPlayer() and
		ent.LastAttacker.setup_achi == true and
		ent.LastAttacker:GetAchi("ACHIEVEMENT_EVENT_HL2_KILL_SIXGUNSHIPS") != 1
		--npc:GetClass() == "npc_manhack"
		--weapon:GetModel() == "models/manhack.mdl" and
		--weapon:IsNPC() and
		--weapon != npc
		--attacker:InVehicle() 
		then
			local expr = ( ent.LastAttacker:GetNWInt("CCustomCounterP1_02") + 1 )
			--local expr = 0
			--expr = ent.LastAttacker:GetNWInt("CCustomCounterP1_02") + 1
			--print("[hl2c] Player: ".. ent.LastAttacker:Nick(),"KILLED GUNSHIPS: 6/".. expr)
			if expr >= 6 then
				ent.LastAttacker:AddAchi("ACHIEVEMENT_EVENT_HL2_KILL_SIXGUNSHIPS", 1)
				
				-- PrintMessage(HUD_PRINTTALK, "[Achievement]: ".. ent.LastAttacker:Nick() .. " ".. HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_SIXGUNSHIPS"] .." + 500 Points")
				text = "[Achievement]: ".. tostring(ent.LastAttacker:Nick()) .. " ".. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_SIXGUNSHIPS"]) .." + 50 Points"
				Hl2c.DefaultChatPrint(text)
				ent.LastAttacker:AddXP(50)
				ent.LastAttacker:SetNWInt("CCustomCounterP1_02", 6)
				sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_02 = ".. 6 .." WHERE UniqueID = '".. ent.LastAttacker:UniqueID() .."'")
				Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_KILL_SIXGUNSHIPS",ent.LastAttacker)
			else
				ent.LastAttacker:SetNWInt("CCustomCounterP1_02", expr)
				sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_02 = ".. expr .." WHERE UniqueID = '".. ent.LastAttacker:UniqueID() .."'")
			end
		end
		ent.input_kill = 1
		if ent.last_damage and ent.sharedamage then
			XP_OnNPCKilled( ent,ent.last_attacker,ent.last_weapon )
		end
		-- ent.LastAttacker:AddFrags(1)
		-- ent.LastAttacker:AddXP(50)
		--print("NPC Class:",ent:GetClass())
		--print("Last Attacker:",ent.LastAttacker:Nick())
	end
end

function ACH_OnNPCKilled(npc, attacker, weapon)

	local text = ""
	if IsValid(npc) and 
	isstring(npc:GetClass()) and 
	npc:GetClass() == "npc_bullseye" 
	then 
		--print("TURRET?",npc:GetClass()) 
		return 
	end
	--print(npc,weapon,attacker)
	if GAME_IS_EP2 and
	IsValid(npc) and 
	npc:GetClass() == "npc_combine_s" and 
	IsValid(attacker) and attacker:IsPlayer() and 
	IsValid(weapon) and weapon:GetClass() == "npc_grenade_frag" and 
	IsValid( weapon:GetOriginalGrenadeThrower() ) and 
	weapon:GetOriginalGrenadeThrower() == npc 
	then
		if IsValid(attacker) and attacker:GetNWInt("CCustomCounterP1_05") != 1 then
			-- PrintMessage(HUD_PRINTTALK,"[Achievement]: ".. attacker:Nick() .. " Hot Potat0wned + 50 Points")
			-- text = "[Achievement]: ".. tostring(attacker:Nick()) .. " Hot Potat0wned + 50 Points"
			-- Hl2c.DefaultChatPrint(text)
		end 
		-- PrintMessage(HUD_PRINTTALK,"Player Killed Combine Soldier with his Own Grenade")
	end
	
--hook.Add("OnNPCKilled", "ACH_OnNPCKilled", function(npc, attacker, weapon)
	
	// POISONANTLION
	if IsValid(npc) and
	IsValid(attacker) and
	IsValid(weapon) and
	attacker:IsPlayer() and
	npc:IsNPC() and
	npc:GetClass() == "npc_antlion" and
	npc:HasSpawnFlags(262144) and
	GAME_IS_EP2 and
	attacker:GetAchi("ACHIEVEMENT_EVENT_EP2_KILL_POISONANTLION") != 1
	then
		attacker:AddAchi("ACHIEVEMENT_EVENT_EP2_KILL_POISONANTLION")
		attacker:AddXP(50)
		Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(attacker:Nick()) .. " " .. tostring(EP2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_EP2_KILL_POISONANTLION"]) .. " + 50 Points" )
		
		-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_KILL_POISONANTLION",attacker)
	end
	/*
	if game.GetMap() == "winter_lobby_2012" and
	IsValid(npc) and
	IsValid(attacker) and
	attacker:IsPlayer() and
	npc:IsNPC()
	then
		attacker:AddXP(50)
		attacker:PrintMessage(HUD_PRINTTALK,"[hl2c event] + 50 Points")
	end
	*/
	if GAME_IS_HL2 and
	IsValid(npc) and
	IsValid(attacker) and
	(game.GetMap() == "d2_coast_12" or 
	string.find(game.GetMap(), "d2_prison") ) and
	attacker:IsNPC() and
	attacker:GetClass() == "npc_antlion" and
	npc:IsNPC() and
	npc:GetClass() != "npc_citizen"
	--attacker:IsPlayer() and
	--attacker:InVehicle() 
	then
		-- Add 1 to the counter for Kill npc by npc_antlion.
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) and 
			(v:Team() == TEAM_ALIVE or 
			v:Team() == TEAM_DEAD ) and
			v.setup_achi == true
			then
				v:SetNWInt("CCustomCounterP1_00", v:GetNWInt("CCustomCounterP1_00") + 1)
				if v:GetNWInt("CCustomCounterP1_00") >= 50 and
				v:GetAchi("ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHANTLIONS") != 1
				then 
					v:AddAchi("ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHANTLIONS", 1)
					
					v:AddXP(50)
					-- PrintMessage(HUD_PRINTTALK, "[Achievement]: ".. v:Nick() .. " "..HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHANTLIONS"] .." + 50 Points")
					text = "[Achievement]: ".. tostring(v:Nick()) .. " ".. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHANTLIONS"]) .." + 50 Points"
					Hl2c.DefaultChatPrint(text)
					sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_00 = ".. 50 .." WHERE UniqueID = '"..v:UniqueID().."'")
					v:SetNWInt("CCustomCounterP1_00", 50)
					-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHANTLIONS",v)
					-- sql.Query("UPDATE ".. DB.AchHlTwo.P2.Table .." SET ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHANTLIONS = ".. 1 .." WHERE UniqueID = '"..v:UniqueID().."'")
				else
					--v:SetNWInt("CCustomCounterP1_00", expr)
					sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_00 = ".. v:GetNWInt("CCustomCounterP1_00") .." WHERE UniqueID = '"..v:UniqueID().."'")
					
				end
			end
		end
	end
	
	-- Add 1 to the counter for Kill manhack by player.
	if GAME_IS_HL2 and
	IsValid(npc) and
	IsValid(attacker) and
	IsValid(weapon) and
	npc:IsNPC() and
	attacker:IsPlayer() and
	attacker.setup_achi == true and
	--npc:GetClass() == "npc_manhack"
	weapon:GetModel() == "models/manhack.mdl" and
	weapon:IsNPC() and
	weapon != npc
	--attacker:InVehicle() 
	then
		--print("Manhack Achi Kill Counted")
		if attacker:GetAchi("ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHMANHACK") != 1 then
			
			attacker:SetNWInt("CCustomCounterP1_01", attacker:GetNWInt("CCustomCounterP1_01") + 1)
			if attacker:GetNWInt("CCustomCounterP1_01") >= 5 then
				attacker:AddAchi("ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHMANHACK", 1)
				-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHMANHACK",attacker)
				-- PrintMessage(HUD_PRINTTALK, "[Achievement]: ".. attacker:Nick() .. " ".. HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHMANHACK"] .." + 50 Points")
				text = "[Achievement]: ".. tostring(attacker:Nick()) .. " ".. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHMANHACK"]) .." + 50 Points"
				Hl2c.DefaultChatPrint(text)
				attacker:AddXP(50)
				attacker:SetNWInt("CCustomCounterP1_01", 5)
				sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_01 = ".. 5 .." WHERE UniqueID = '"..attacker:UniqueID().."'")
				
				-- sql.Query("UPDATE ".. DB.AchHlTwo.P2.Table .." SET ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHMANHACK = ".. 1 .." WHERE UniqueID = '"..attacker:UniqueID().."'")
			else
				sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_01 = ".. attacker:GetNWInt("CCustomCounterP1_01") .." WHERE UniqueID = '"..attacker:UniqueID().."'")
			end
			
		end
	end
	
	
	if Hl2c.Ravenholm.Maps[game.GetMap()] then
		if (IsValid(attacker) and
			attacker:IsPlayer() and
			attacker.setup_achi == true and
			IsValid(weapon) and 
			(
			--!weapon:IsWeapon() or 
			(isstring(weapon:GetClass()) and
			weapon:GetClass() != "prop_physics" and
			weapon:GetClass() != "entityflame" and
			weapon:GetClass() != "weapon_physcannon"
			) )
			) and
			attacker:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END") != 1 and
			attacker:GetNWInt("CustomSetUpP1_02") != 1
			then 
			
			--if 
			--!file.Exists("hl2c_data/ravenholm-no-achi.txt", "DATA") 
			--then
				--file.Write("hl2c_data/ravenholm-no-achi.txt")
				--print(weapon)
				attacker:SetNWInt("CustomSetUpP1_02", 1) 
				sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_02 = 1 WHERE UniqueID = '"..  attacker:UniqueID() .."'")
				-- attacker:ChatPrint("[hl2c] Beat Ravenholm Gravity Gun only. Failed!")
				Hl2c.PersonDefaultChatPrint("[hl2c] Beat Ravenholm Gravity Gun only. Failed!",attacker)
				--print('"[hl2c] file.Write("hl2c_data/ravenholm-no-achi.txt")"')
			--end
			--print("------------------------------------------------------------------")
			--print("[hl2c ach] ".. attacker:Nick() .." Ravenholm Gravgun failed!")
			--print("------------------------------------------------------------------")
		end
	end
	
	if GAME_IS_HL2 then
		if (IsValid(attacker) and
			attacker:IsPlayer() and
			attacker.setup_achi == true and
			IsValid(weapon) and
			weapon:GetModel() == "models/props_wasteland/prison_toilet01.mdl" ) and
			attacker:GetAchi("ACHIEVEMENT_EVENT_HL2_KILL_ENEMY_WITHTOILET") != 1
			
			then
			--print(weapon:GetModel())
			--Give Count
			--If Dont have Achievement then
			--If Max Reach Give Achievement
			-- Print message about the award
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_KILL_ENEMY_WITHTOILET",attacker)
			attacker:AddAchi("ACHIEVEMENT_EVENT_HL2_KILL_ENEMY_WITHTOILET", 1)
			-- if sql.TableExists( DB.AchHlTwo.P2.Table ) == true then
				-- sql.Query("UPDATE ".. DB.AchHlTwo.P2.Table .." SET ACHIEVEMENT_EVENT_HL2_KILL_ENEMY_WITHTOILET = ".. 1 .." WHERE UniqueID = '"..attacker:UniqueID().."'")
			attacker:AddXP(50)
			-- PrintMessage(HUD_PRINTTALK, "[Achievement]: ".. attacker:Nick() .. " "..HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_ENEMY_WITHTOILET"] .." + 50 Points")
			text = "[Achievement]: ".. tostring(attacker:Nick()) .. " ".. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_KILL_ENEMY_WITHTOILET"]) .." + 50 Points"
			Hl2c.DefaultChatPrint(text)
			
			-- end
		end
	end
	
	
	
	if 
	(GAME_IS_HL2 or
	GAME_IS_EP1 or
	GAME_IS_EP2)
	then
		if (IsValid(attacker) and
		IsValid(weapon) and 
		IsValid(npc) and
		attacker:IsPlayer() and
		npc:IsNPC() and
		npc.LastDamage != nil and
		isnumber(npc.LastDamage:GetDamageType()) and
		npc.LastDamage:GetDamageType() != 128) --and
		--(attacker:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_GAME_ONLYCROWBAR") != 1 or
		--attacker:GetNWInt("ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONLYCROWBAR") != 1 or
		--attacker:GetNWInt("ACHIEVEMENT_EVENT_EP2_BEAT_GAME_ONLYCROWBAR") != 1) and
		--attacker:GetNWInt("CustomSetUpP1_03") != 1 and
		--attacker:GetNWInt("CustomSetUpP1_04") != 0
		 then
			
			attacker:FailFreeman()
			
		elseif IsValid(attacker) and
		IsValid(weapon) and 
		IsValid(npc) and
		attacker:IsPlayer() and
		npc:IsNPC() and
		attacker:InVehicle()
		then
			attacker:FailFreeman()
		end
		
	end
	
	
end
local delay = 0
function Find_FlareProp()
	if CurTime() < delay then return end
	for k, v in pairs( ents.GetAll() ) do
		
		if v and v:GetClass() == "prop_physics" and v:GetModel() == "models/props_junk/flare.mdl" and IsValid( v:GetSaveTable().m_hFlareEnt ) then
			
			-- PrintMessage(HUD_PRINTCONSOLE,"Found Flare")
		end
	end
	delay = CurTime() + 1
end

hook.Add("Think","Hl2c_Ach_Think", function()
	Ach_Ravenholm_Think()
	Find_FlareProp()
end)

function Ach_Ravenholm_Think()
	local text = ""
	if (game.GetMap() == "winter_lobby_2012" or game.GetMap() == "keyfox_lobby_summer") or 
	(!string.find(game.GetMap(), "d1_town_") and
	GAME_IS_HL2)
	then
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) and
			(v:Team() == TEAM_ALIVE or
			v:Team() == TEAM_DEAD) and
			v.setup_achi == true and
			v.hl2_ravenholm_ready != true and
			v:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END") != 1
			then
				v:SetNWInt("CustomSetUpP1_02", 0)
				v.hl2_ravenholm_ready = true
				--print("RAVENHOLM SET UP")
				sql.Query("UPDATE ".. DB.CustomSetUp.P1 .." SET CustomSetUpP1_02 = ".. 0 .." WHERE UniqueID = '"..v:UniqueID().."'")
			end
		end
	end
	if game.GetMap() == "d1_town_05" then
		for k, v in pairs(player.GetAll()) do
			-- Give them The Only Gravity Gun Using in Ravenholm Achievement.
			if IsValid(v) and
			(v:Team() == TEAM_ALIVE or
			v:Team() == TEAM_DEAD) and
			v.setup_achi == true and
			v:GetNWInt("CustomSetUpP1_02") == 1 and
			v:GetNWInt("ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END") != 1
			then
				v:AddAchi("ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END", 1)
				-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END",v)
				--v:SetNWInt("CustomSetUpP1_02", 1)
				v:AddXP(50)
				-- MESSAGE ANNOUNCE
				-- PrintMessage(HUD_PRINTTALK, "[Achievement]: ".. v:Nick() .. " ".. HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END"] .." + 50 Points")
				text = "[Achievement]: ".. tostring(v:Nick()) .. " ".. tostring(HL2_ACH_LIST_TITLE["ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END"]) .." + 50 Points"
				Hl2c.DefaultChatPrint(text)
				-- SQL CODE
				-- sql.Query("UPDATE hl2c_hl2_ach SET ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END = ".. 1 .." WHERE UniqueID = '"..v:UniqueID().."'")
			end
			
		end
	end
end

hook.Add("OnEntityCreated", "Hl2cAch_OnEntityCreated", function(ent)
	Ach_OnEntSpawn(ent)
end)
function Ach_OnEntSpawn(ent)

	timer.Simple(0.1,function()
	if EntityValidity(ent) and ent:GetClass() == "npc_grenade_frag" then
		ent:SetOriginalGrenadeThrower()
		-- [[ print(ent:GetOriginalGrenadeThrower()) ]]
	end
	end)
	
end
/*
IGameEvent *event = gameeventmanager->CreateEvent( "physgun_pickup" );
		if ( event )
		{
			event->SetInt( "entindex", pPickedUpObject->entindex() );
			gameeventmanager->FireEvent( event );
		}*/


function Ach_UseFlares()
	local text = ""
	for _, pl in pairs(player.GetAll( ) ) do
		if IsValid(pl) and pl:Alive()
		and pl:Team() == TEAM_ALIVE	and 
		pl:IsSetUpAchi() and (pl:GetAchi("ACHIEVEMENT_EVENT_EP1_KILL_ZOMBIES_WITHFLARES") == 0 ) 
		then
			-- PrintMessage(HUD_PRINTCONSOLE,"Flare Ach ".. tostring(pl:GetNWInt("CCustomCounterP1_03")).." Player ".. pl:Nick() .."")
			-- PrintMessage(HUD_PRINTTALK,"Flare Ach ".. tostring(pl:GetNWInt("CCustomCounterP1_03")).." Player ".. pl:Nick() .."")
			pl:SetNWInt("CCustomCounterP1_03", pl:GetNWInt("CCustomCounterP1_03") + 1 )
			sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_03 = ".. pl:GetNWInt("CCustomCounterP1_03") .." WHERE UniqueID = '"..pl:UniqueID().."'")
			if (pl:GetNWInt("CCustomCounterP1_03") >= 15) then
				-- PrintMessage(HUD_PRINTTALK, "[Achievement]: ".. pl:Nick() .. " ".. EP1_ACH_LIST_TEXT["ACHIEVEMENT_EVENT_EP1_KILL_ZOMBIES_WITHFLARES"] .." + 50 Points")
				text = "[Achievement]: ".. tostring(pl:Nick()) .. " ".. tostring(EP1_ACH_LIST_TEXT["ACHIEVEMENT_EVENT_EP1_KILL_ZOMBIES_WITHFLARES"]) .." + 50 Points"
				Hl2c.DefaultChatPrint(text)
				pl:AddXP(50)
				
				pl:AddAchi("ACHIEVEMENT_EVENT_EP1_KILL_ZOMBIES_WITHFLARES",1)
				-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP1_KILL_ZOMBIES_WITHFLARES",pl)
				sql.Query("UPDATE ".. DB.CustomCounters.P1 .." SET CCustomCounterP1_03 = ".. 15 .." WHERE UniqueID = '".. pl:UniqueID() .."'")
				-- sql.Query("UPDATE hl2c_ep1_ach SET ACHIEVEMENT_EVENT_EP1_KILL_ZOMBIES_WITHFLARES = ".. 1 .." WHERE UniqueID = '".. pl:UniqueID() .."'")
			end
		end
	end
end		
gameevent.Listen( "flare_ignite_npc" )
hook.Remove("flare.ignite.npc.Zombie")
hook.Add( "flare_ignite_npc", "flare.ignite.npc.Zombie", function( data )
	local index = data.entindex				// The written text.
	--print("Ignited Entity",tostring(GetByIndex(index)))
	
	if IsValid(GetByIndex(index)) and GetByIndex(index):IsNPC() and  GAME_IS_EP1 and
	(GetByIndex(index):GetClass() == "npc_zombie" or
	GetByIndex(index):GetClass() == "npc_zombine" or
	GetByIndex(index):GetClass() == "npc_fastzombie" or
	GetByIndex(index):GetClass() == "npc_poisonzombie")
	then
		--print("Ignited Entity",tostring(GetByIndex(index)))
		Ach_UseFlares()
	end
	// Called when a player writes text ( Called by the SERVER on the client AFTER the PlayerSay hook )

end )

function Hl2c.EP2_KILL_HOTPOTATOWNED(ply)

end

function Hl2c.EP2_KILL_GRAVEROBBER(ply,old)
	if old then
		-- local query sql.Query("SELECT CustomSetUpP1_05 FROM ".. DB.CustomSetUp.P1 .." WHERE UniqueID = '"..ply:UniqueID().."'")
		local query = ply:GetNWInt("CCustomCounterP1_04")
		if query and query != nil and query >= 1 then
		else
			query = 0
		end
		
		if query >= 1 and ply:GetAchi("ACHIEVEMENT_EVENT_EP2_KILL_GRAVEROBBER") != 1 and ply:IsSetUpAchi()
		then
			local text = ""
			ply:AddAchi("ACHIEVEMENT_EVENT_EP2_KILL_GRAVEROBBER")
			
			ply:AddXP(50)
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_KILL_GRAVEROBBER",ply)
			text = "[Achievement]: ".. tostring(ply:Nick()) .. ": Grave Robber  + 50 Points"
			Hl2c.DefaultChatPrint(text)
		end
	else
		local text = ""
		if IsValid(ply) and ply:IsPlayer() and ply:Team() == TEAM_ALIVE and ply:IsSetUpAchi() and
		ply:GetAchi("ACHIEVEMENT_EVENT_EP2_KILL_GRAVEROBBER") != 1 then
			ply:AddAchi("ACHIEVEMENT_EVENT_EP2_KILL_GRAVEROBBER")
			ply:AddXP(50)
			-- Hl2c.Achievement_Notify_V1("ACHIEVEMENT_EVENT_EP2_KILL_GRAVEROBBER",ply)
			text = "[Achievement]: ".. tostring(ply:Nick()) .. ": Grave Robber  + 50 Points"
			Hl2c.DefaultChatPrint(text)
			
			
		end
	end
end
hook.Remove("GravGunOnPickedUp","Ach.ListenPhysgunPick")
hook.Add("GravGunOnPickedUp", "Ach.ListenPhysgunPick", function( ply, ent )
	--print(ply,ent)
	util.RunNextFrame(function()
		if not IsValid(ply) then return end
		if not IsValid(ent) then return end
		
		if GAME_IS_EP2 and EntityValidity(ent) and ent:GetClass() == "npc_grenade_frag" and
		ent:IsOriginalGrenadeThrower("npc_combine_s") 
		then
			ent:SetNWBool("HOTPOTAT0WNED",true)
		end
		
		if GAME_IS_EP2 and EntityValidity(ent) and ent:GetClass() == "npc_grenade_frag" and
		ent:IsOriginalGrenadeThrower("npc_zombine") --or ent:IsOriginalGrenadeThrower("npc_combine_s")
		then
		-- PrintMessage(HUD_PRINTTALK,"Combine Soldier is Thrower?: ".. tostring(ent:IsOriginalGrenadeThrower("npc_combine_s")))
		-- PrintMessage(HUD_PRINTTALK,"Zombine is Thrower?: ".. tostring(ent:IsOriginalGrenadeThrower("npc_zombine")))
			
			-- if GAME_IS_EP2 then else return end
			if ent:IsOriginalGrenadeThrower("npc_zombine") then else return end
			
			if ent["Ach_EP2_GraveRobber"] == true then return end
			--PrintMessage(HUD_PRINTCONSOLE,"[hl2c achi tracker]: Stolen Zombine Grenade")
			ent["Ach_EP2_GraveRobber"] = true
			Hl2c.EP2_KILL_GRAVEROBBER(ply)
			
		end
	end)
end)
