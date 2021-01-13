util.AddNetworkString("Achievement_Event")
--ENT.Base = "base_entity"
ENT.Type = "point"

local DbgPrint = GetLogging("LogicAchievement")

--[[---------------------------------------------------------
   Name: Initialize
   Desc: First function called. Use to set up your entity
-----------------------------------------------------------]]
function ENT:Initialize()

--	timer.Simple(2, function()
		self.called = false
		-- body
		local has = false
		for i=1,#Hl2c.EP2_RADARCACHE_LIST do
		
			if self["AchievementEvent"] == Hl2c.EP2_RADARCACHE_LIST[i] then
				has = true
				-- DbgPrint("Called?")
			end
		end
		for i=1,#Hl2c.EP2_WEBCACHE_LIST do
			if self["AchievementEvent"] == Hl2c.EP2_WEBCACHE_LIST[i] then
				has = true
				
			end
		end
		if table.HasValue(HL2_LAMDACACHE,self["AchievementEvent"]) then
		
		elseif table.HasValue(HL2_ACH_LIST,self["AchievementEvent"]) then
		
		elseif table.HasValue(EP1_ACH_LIST,self["AchievementEvent"]) then
		
		elseif table.HasValue(EP2_ACH_LIST,self["AchievementEvent"]) then
		
		elseif self["AchievementEvent"] == "ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END" then
			
			--if file.Exists("hl2c_data/ravenholm-no-achi.txt", "DATA") then
			--	file.Delete("hl2c_data/ravenholm-no-achi.txt")
			--	print("[hl2c] Beat Ravenholm Gravgun only. Failed!")
			--	self:Remove()
			--end
			self.called = true
			self:Remove()
			
		elseif has then
			
		else
			-- DbgPrint("Kill it")
			self.called = true
			self:Remove()
			
		end
--	end)
	if self:GetNWInt("StartDisabled.Called") != 1 then
		self:SetNWBool("Enable",true)
	end

end

--[[---------------------------------------------------------
   Name: KeyValue
   Desc: Called when a keyvalue is added to us
-----------------------------------------------------------]]
function ENT:KeyValue( key, value )
/*
	if (key == "StartDisabled" and value == "0") then
		self.L_STARTDISABLED = "true"
		print("StartDisabled: "..self.L_STARTDISABLED.."")
	elseif (key == "StartDisabled" and value == "1") then
		self.L_STARTDISABLED = "false"
		print("StartDisabled: "..self.L_STARTDISABLED.."")
	end
	
	if (key == "AchievementEvent" ) then
		self.L_ACHIEVEMENTEVENT = value
		print("AchievementEvent: "..self.L_ACHIEVEMENTEVENT.."")
	end
	if (key == "origin" ) then
		self.L_ACHIEVEMENTEVENT = value
		print("AchievementEvent: "..self.L_ACHIEVEMENTEVENT.."")
	end
	if (key == "AchievementEvent" ) then
		self.L_ACHIEVEMENTEVENT = value
		print("AchievementEvent: "..self.L_ACHIEVEMENTEVENT.."")
	end
	if (key == "AchievementEvent" ) then
		self.L_ACHIEVEMENTEVENT = value
		print("AchievementEvent: "..self.L_ACHIEVEMENTEVENT.."")
	end
*/
	
	 -- Find out what's being passed
		--print(tostring(self) .. " with -- Key : " .. key .. "     Value : " .. value)
		
		if key == "targetname" then
			self[key] = tostring(value)
		elseif key == "StartDisabled" then
			self:SetNWInt("StartDisabled.Called",1)
			if tonumber(value) == 0 then
				self:SetNWBool("Enable",true)
			else
				self:SetNWBool("Enable",false)
			end
		elseif key == "origin" then
			self[key] = tostring(value)
		elseif key == "classname" then
			self[key] = tostring(value)
		elseif key == "hammerid" then
			self[key] = tostring(value)
		elseif key == "AchievementEvent" then
			self[key] = tostring(value)
			print("[hl2c] ",self:GetClass(),value)
		else
			--print("!!Unknown Key Value!!")
			--print("Key : " .. key .. " -- Value : " .. value)
		end
	
	--[[ Keys and Values for a trigger_teleport
		
		Entity [14][sent_brush] with -- Key : ScriptName     Value : trigger_teleport
		Entity [14][trigger_teleport] with -- Key : model     Value : *2
		Entity [14][trigger_teleport] with -- Key : targetname     Value : Teleport_Top
		Entity [14][trigger_teleport] with -- Key : target     Value : TeleDest_Bottom
		Entity [14][trigger_teleport] with -- Key : StartDisabled     Value : 0
		Entity [14][trigger_teleport] with -- Key : spawnflags     Value : 15
		Entity [14][trigger_teleport] with -- Key : origin     Value : 0 0.01 14946.5
		Entity [14][trigger_teleport] with -- Key : landmark     Value : TeleDest_Top
		Entity [14][trigger_teleport] with -- Key : classname     Value : trigger_teleport
		Entity [14][trigger_teleport] with -- Key : hammerid     Value : 4934
		Entity [14][trigger_teleport] with -- Key : OnStartTouch     Value : Teleport_Bottom,Disable,,0,-1
		Entity [14][trigger_teleport] with -- Key : OnEndTouch     Value : Teleport_Bottom,Enable,,0.01,-1
	--]]
end

--[[---------------------------------------------------------
   Name: AcceptInput
   Desc: Entity's AcceptInput function. 
-----------------------------------------------------------]]
function ENT:AcceptInput( name, activator, caller )
    -- if ( string.lower(name) == "Kill" ) then
		-- self.called = true
		-- DbgPrint(name)
	-- end
	if ( string.lower(name) == "enable" ) then
		self:SetNWBool("Enable",true)	
	end
	if ( string.lower(name) == "disable" ) then
		self:SetNWBool("Enable",false)
	end
	
	
    if ( string.lower(name) == "fireevent" ) and self:GetNWBool("Enable") then
		--print("Achievement Earned: " ..self["AchievementEvent"].. "")
		/*
		net.Start("Achievement_Event")
			net.WriteString(self["AchievementEvent"])
		net.Broadcast()
    	*/
		self.called = true
		local text = ""
		if self["AchievementEvent"] then
			for k, v in pairs(player.GetAll()) do
				if table.HasValue(HL2_ACH_LIST, self["AchievementEvent"] ) then
					if IsValid(v) and ( v:IsPlayer() and v:Alive() ) then
						if v:Team() == TEAM_ALIVE or v:Team() == TEAM_DEAD or v:Team() == TEAM_COMPLETED_MAP  then
							if v:GetNWInt(self["AchievementEvent"]) == 0 then
							
								v:AddAchi(self["AchievementEvent"])
								v:AddXP(50)
								text =  "[Achievement]: ".. tostring(v:Nick()) .. " ".. tostring(HL2_ACH_LIST_TITLE[self["AchievementEvent"]]) .." + 50 Points"
								Hl2c.DefaultChatPrint(text)
								--Hl2c.Achievement_Notify_V1(self["AchievementEvent"],v)
									
							end
						end
					end
				--end
				
				elseif table.HasValue(EP1_ACH_LIST, self["AchievementEvent"] ) then
					if IsValid(v) and ( v:IsPlayer() and v:Alive() ) then
						if v:Team() == TEAM_ALIVE or v:Team() == TEAM_DEAD or v:Team() == TEAM_COMPLETED_MAP  then
							if v:GetNWInt(self["AchievementEvent"]) == 0 then
							
								v:AddAchi(self["AchievementEvent"])
								v:AddXP(50)
								
								text = "[Achievement]: ".. tostring(v:Nick()) .. " ".. tostring(EP1_ACH_LIST_TITLE[self["AchievementEvent"]]) .." + 50 Points"
								Hl2c.DefaultChatPrint(text)
								--Hl2c.Achievement_Notify_V1(self["AchievementEvent"],v)
							end
						end
					end
				--end
				
				elseif table.HasValue(EP2_ACH_LIST, self["AchievementEvent"] ) then
					if IsValid(v) and ( v:IsPlayer() and v:Alive() ) then
						if v:Team() == TEAM_ALIVE or v:Team() == TEAM_DEAD or v:Team() == TEAM_COMPLETED_MAP  then
						if v:GetNWInt(self["AchievementEvent"]) == 0 then
							v:AddAchi(self["AchievementEvent"])
							v:AddXP(50)
							text = "[Achievement]: ".. tostring(v:Nick()) .. " ".. tostring(EP2_ACH_LIST_TITLE[self["AchievementEvent"]]) .." + 50 Points"
							Hl2c.DefaultChatPrint(text)
							--Hl2c.Achievement_Notify_V1(self["AchievementEvent"],v)
								
							end
						end
					end
				--end
				
				elseif table.HasValue(HL2_LAMDACACHE, self["AchievementEvent"] ) then
					if IsValid(v) and ( v:IsPlayer() and v:Alive() ) then
						
						if v:Team() == TEAM_ALIVE or v:Team() == TEAM_DEAD or v:Team() == TEAM_COMPLETED_MAP  then
							if v:GetNWInt(self["AchievementEvent"]) == 0 then
								v:AddAchi(self["AchievementEvent"])
								v:AddXP(50)
								local count = 0
								count = v:GetAllLambdaCache()
								text = "Lambda Locator: 47/".. tostring(count) .." + 50 Points" 
								Hl2c.PersonDefaultChatPrint(text,v)
							end
						end
							
					end
				else
					for i=1,#Hl2c.EP2_WEBCACHE_LIST do
						if v:Team() == TEAM_ALIVE and 
						Hl2c.EP2_WEBCACHE_LIST[i] == self["AchievementEvent"] and
						v:GetNWInt(self["AchievementEvent"]) != 1
						then
							v:AddAchi(self["AchievementEvent"])
							v:AddXP(50)
							text = "Webcache: ".. tostring(#Hl2c.EP2_WEBCACHE_LIST) .."/".. tostring(v:GetAllWebCache()) .." + 50 Points"
							Hl2c.PersonDefaultChatPrint(text,v)
						end
						-- v.count_webcache_ep2 = 0
						-- if Hl2c.EP2_WEBCACHE_LIST[i] == self["AchievementEvent"] and
						-- v:GetNWInt(self["AchievementEvent"]) == 1
						-- then
							-- v.count_webcache_ep2 = v.count_webcache_ep2 + 1
						-- end
						
					end
					
					for i=1,#Hl2c.EP2_RADARCACHE_LIST do
						if v:Team() == TEAM_ALIVE and 
						Hl2c.EP2_RADARCACHE_LIST[i] == self["AchievementEvent"] and
						v:GetNWInt(self["AchievementEvent"]) != 1
						then
							v:AddAchi(self["AchievementEvent"])
							v:AddXP(50)
							text = "Radarcache: ".. tostring(#Hl2c.EP2_RADARCACHE_LIST) .."/".. tostring( v:GetAllRadarCache() ) .." + 50 Points"
							Hl2c.PersonDefaultChatPrint(text,v)
						end
					end
					
				end
			end

			self:Remove()
		end
    end
	
	if ( name == "Kill" or name == "kill" ) then
		self:Remove()
    end
end

--[[---------------------------------------------------------
   Name: Think
   Desc: Entity's think function. 
-----------------------------------------------------------]]
function ENT:Think()
end


--
--   Name: OnRemove
--   Desc: Called just before entity is deleted
--
function ENT:OnRemove()
	local text = ""
	/*if IsValid(self) && self["AchievementEvent"] == nil then
		print("[hl2c achi] Removed: Pos:".. self:GetPos() )
	end*/
	-- DbgPrint(tostring(self.called))
	if IsValid(self) && self["AchievementEvent"] != nil then
		-- print("[hl2c achi] Removed: "..self:GetName().."\nAchievement: "..self["AchievementEvent"].."")
	end 
	if IsValid(self) and self.called != true and isstring(self["AchievementEvent"]) and self["AchievementEvent"] == "ACHIEVEMENT_EVENT_EP1_BEAT_CITIZENESCORT_NOCITIZENDEATHS_END" then
		-- PrintMessage( HUD_PRINTTALK, "[hl2c achi] Failed: ".. EP1_ACH_LIST_TITLE[self["AchievementEvent"]] .."" )
		text = "[Achievement] Failed: ".. tostring(EP1_ACH_LIST_TITLE[self["AchievementEvent"]]) .."" 
		Hl2c.DefaultChatPrint(text)
	end
	if IsValid(self) and self.called != true and isstring(self["AchievementEvent"]) and Hl2c.Ach.Title and isstring(Hl2c.Ach.Title[self["AchievementEvent"]]) then
		-- PrintMessage( HUD_PRINTTALK, "[hl2c achi] Failed: ".. EP1_ACH_LIST_TITLE[self["AchievementEvent"]] .."" )
		text = "[Achievement] Failed: ".. tostring(Hl2c.Ach.Title[self["AchievementEvent"]]) .."" 
		-- print(text)
		Hl2c.DefaultChatPrint(text)
	end
	-- DbgPrint("/------------------")
	DbgPrint("REMOVE "..tostring(self).." "..tostring(self["AchievementEvent"]))
	-- DbgPrint("/ "..tostring(self["AchievementEvent"]))
	-- DbgPrint("/------------------")
end

--
--	UpdateTransmitState
--
/*
function ENT:UpdateTransmitState()

	--
	-- The default behaviour for point entities is to not be networked.
	-- If you're deriving an entity and want it to appear clientside, override this
	-- TRANSMIT_ALWAYS = always send, TRANSMIT_PVS = send if in PVS
	--
	return TRANSMIT_NEVER

end
*/


/*
ACHIEVEMENT LIST IMPORTANT TO GET DATA

		"ACHIEVEMENT_EVENT_HL2_HIT_CANCOP_WITHCAN"				: "[HL2] Hit the trashcan cop with the can."
		"ACHIEVEMENT_EVENT_HL2_PUT_CANINTRASH"					: "[HL2] Put the can in the trash."
		"ACHIEVEMENT_EVENT_HL2_ESCAPE_APARTMENTRAID"			: "[HL2] Escape the apartment block raid."
		"ACHIEVEMENT_EVENT_HL2_BREAK_MINITELEPORTER"			: "[HL2] Break the mini-teleporter in Kleiner's lab."
		"ACHIEVEMENT_EVENT_HL2_GET_CROWBAR"						: "[HL2] Get the crowbar."
		"ACHIEVEMENT_EVENT_HL2_GET_AIRBOAT"						: "[HL2] Get the Airboat"
		"ACHIEVEMENT_EVENT_HL2_GET_AIRBOATGUN"					: "[HL2] Get the airboat's mounted gun."
		"ACHIEVEMENT_EVENT_HL2_FIND_VORTIGAUNTCAVE"				: "[HL2] Discover the hidden singing vortigaunt cave in chapter Water Hazard."
		"ACHIEVEMENT_EVENT_HL2_KILL_CHOPPER"					: "[HL2] Destroy the hunter-chopper in Half-Life 2."
		"ACHIEVEMENT_EVENT_HL2_FIND_HEVFACEPLATE"				: "[HL2] Find the HEV Suit Charger faceplate in Eli's scrapyard."
		"ACHIEVEMENT_EVENT_HL2_GET_GRAVITYGUN"					: "[HL2] Get the Gravity Gun in Black Mesa East"
		"ACHIEVEMENT_EVENT_HL2_MAKEABASKET"						: "[HL2] Make a basket in Eli's scrapyard."
		"ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_START"	: "[HL2] Beat Ravenholm Gravgun only. (Start)."
		"ACHIEVEMENT_EVENT_HL2_BEAT_RAVENHOLM_NOWEAPONS_END"	: "[HL2] Beat Ravenholm Gravgun only. (End)."
		"ACHIEVEMENT_EVENT_HL2_BEAT_CEMETERY"					: "[HL2] Escort Gregori safely through the church cemetery."
		"ACHIEVEMENT_EVENT_HL2_KILL_ENEMIES_WITHCRANE"			: "[HL2] Kill 3 enemies using the crane."
		"ACHIEVEMENT_EVENT_HL2_PIN_SOLDIER_TOBILLBOARD"			: "[HL2] Pin the soldier to the billboard with the crossbow in chapter Highway 17."
		"ACHIEVEMENT_EVENT_HL2_KILL_ODESSAGUNSHIP"				: "[HL2] Defend Little Odessa from the gunship attack."
		"ACHIEVEMENT_EVENT_HL2_BEAT_DONTTOUCHSAND"				: "[HL2] Cross the antlion beach in chapter Sandtraps without touching the sand."
		"ACHIEVEMENT_EVENT_HL2_ENTER_NOVAPROSPEKT"				: "[HL2] Get inside Nova Prospekt"
		"ACHIEVEMENT_EVENT_HL2_BEAT_TURRETSTANDOFF2"			: "[HL2] Survive the second turret standoff in the prison."
		"ACHIEVEMENT_EVENT_HL2_FOLLOWFREEMAN"					: "[HL2] Gain command of a squad of rebels in the uprising"
		"ACHIEVEMENT_EVENT_HL2_BEAT_TOXICTUNNEL"				: "[HL2] Get through the toxic tunnel under City 17 in Half-Life 2."
		"ACHIEVEMENT_EVENT_HL2_BEAT_PLAZASTANDOFF"				: "[HL2] Survive the Generator Plaza standoff in chapter Anticitizen One."
		"ACHIEVEMENT_EVENT_HL2_KILL_ALLC1709SNIPERS"				: "[HL2] Kill all of the snipers in City 17."
		"ACHIEVEMENT_EVENT_HL2_BEAT_SUPRESSIONDEVICE"			: "[HL2] Shut down the supression device by disabling its generators."
		"ACHIEVEMENT_EVENT_HL2_BEAT_C1713STRIDERSTANDOFF"			: "[HL2] Survive the rooftop strider battle in the ruins of City 17."
		"ACHIEVEMENT_EVENT_HL2_BEAT_GAME"						: "[HL2] Destroy the Citadel's reactor core (Beat Game)."

		"ACHIEVEMENT_EVENT_HL2_GMAN_KLEINERSLAB"				: "[HL2] G-Man: trainstation_05 on Kleiner's Monitor"
		"ACHIEVEMENT_EVENT_HL2_GMAN_TRAINCAR"					: "[HL2] G-Man: canals_01 on TV in vort train car"
		"ACHIEVEMENT_EVENT_HL2_GMAN_REDBARN"					: "[HL2] G-Man: canals_06 at the red barn"
		"ACHIEVEMENT_EVENT_HL2_GMAN_OUTDOORMONITOR"				: "[HL2] G-Man: canals_06 on giant outdoor monitor"
		"ACHIEVEMENT_EVENT_HL2_GMAN_CATWALK"					: "[HL2] G-Man: canals_12 on catwalk"
		"ACHIEVEMENT_EVENT_HL2_GMAN_DAM"					: "[HL2] G-Man: canals_13 to the left of the dam"
		"ACHIEVEMENT_EVENT_HL2_GMAN_TRAINTRACKS"				: "[HL2] G-Man: town_05 at the end of the tracks"
		"ACHIEVEMENT_EVENT_HL2_GMAN_ODESSA"					: "[HL2] G-Man: coast_03 odessa meeting"
		"ACHIEVEMENT_EVENT_HL2_GMAN_PRISONMONITOR"				: "[HL2] G-Man: prison_02 control room monitor"
		"ACHIEVEMENT_EVENT_HL2_GMAN_FOYERTV"					: "[HL2] G-Man: c17_02 on TV in the destroyed foyer"
		
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_KLEINERSLAB"			: "[HL2] Lamda: Secret entrance to Kleiner's lab in trainstation_05"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALSSTATION"		: "[HL2] Lamda: canals_01 building by tracks"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_VENTCRAWL"			: "[HL2] Lamda: canals_01 vent crawl"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALSTUNNEL"			: "[HL2] Lamda: canals_01a tunnel"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SEWERGRATE"			: "[HL2] Lamda: canals_02 below grate in sewer corridor"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STEAMPIPE"			: "[HL2] Lamda: canals_03 under steam pipe"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CURVEDROOM"			: "[HL2] Lamda: canals_05 on second level of curved room"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SHANTYTOWN"			: "[HL2] Lamda: canals_05 before shanty town"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_TUNNELLADDER"			: "[HL2] Lamda: canals_06 on overhead metal walkway in tunnel"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_REDBARN"			: "[HL2] Lamda: canals_06 at the red barn"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FLOATINGRAMP"			: "DON'T USE ME [HL2] Lamda: canals_06 outside the pipe at floating ramp puzzle"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_ZOMBIEAMBUSH"			: "[HL2] Lamda: canals_06 outside exploded tanker (zombie ambush)"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BELOWAPCS"			: "[HL2] Lamda: canals_07 in the wall below apcs"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COUNTERWEIGHT"		: "[HL2] Lamda: canals_08 in counterweighted basket"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAILWAYBRIDGE"		: "[HL2] Lamda: canals_08 behind railway bridge piling"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_TUNNELPLATFORMS"		: "[HL2] Lamda: canals_09 on wooden platforms in tunnel"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BANKEDCANAL"			: "[HL2] Lamda: canals_10 up banked side of canals passage"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CANALWALL"			: "[HL2] Lamda: canals_10 in wall opening after canals passage"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CHANNELSPLIT"			: "[HL2] Lamda: canals_12 right side of split channel"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_BMEDOCK"				: "[HL2] Lamda: eli_01 Black Mesa East dock"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GENERATORS"			: "[HL2] Lamda: town_01 through ductwork behind generators"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CARCRUSHERARENA"		: "[HL2] Lamda: town_01 behind fence in car-crusher arena"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAVENHOLMATTIC"		: "[HL2] Lamda: town_01a in attic opposite map exit"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_MINETUNNELEXIT"		: "[HL2] Lamda: town_05 tunnel exit from ravenholm mine"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COASTSHACK"			: "[HL2] Lamda: coast_01 shack after the buggy jump"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONSHACK"			: "[HL2] Lamda: coast_03 poison headcrab shack"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GUNSHIPVAN"			: "[HL2] Lamda: coast_04 broken down van after the gunship"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SUICIDECITIZEN"		: "[HL2] Lamda: coast_05 suicide citizen's gas tank cache"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_RAILROADSHACK"		: "[HL2] Lamda: coast_07 fenced off area outside of town"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_COASTABOVEBATTERY"		: "[HL2] Lamda: coast_09 above the bathroom in the battery puzzle building"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SANDSHACK"			: "[HL2] Lamda: coast_11 elevated shack after the board bridge"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_GMANCACHE"			: "[HL2] Lamda: prison_02 in the boarded up area of the gman sighting"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_CELLCACHE"			: "[HL2] Lamda: prison_03 in the prison cell"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONLAUNDRY"		: "[HL2] Lamda: prison_05 in the laundry utility room"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SODAMACHINE"			: "[HL2] Lamda: prison_06 on top of the soda machine"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARDOGWALL"		: "[HL2] Lamda: c17_02 next to first Combine wall"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARSHACK"		: "[HL2] Lambda: c17_04 inside shack before metrocop holdout"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_STREETWARFENCE"		: "[HL2] Lamda: c17_05 behind fence before end of map"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_FREEWAYTUNNEL"		: "[HL2] Lamda: c17_06a at start of freeway tunnel"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_DRAWBRIDGE"			: "[HL2] Lamda: c17_06b before second drawbridge"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_PLAZAFENCE"			: "[HL2] Lamda: c17_06b behind fence before end of map"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_SEWERSCATWALKS"		: "[HL2] Lamda: c17_08 lowest catwalk at sewer entrance"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_POISONZOMBIEALCOVE"	: "[HL2] Lamda: c17_08 wall cubby next to poison zombie"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_PIPEHOPTUNNEL"		: "[HL2] Lamda: c17_08 end of pipe hop tunnel by poison zombie"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_EXITCATWALK"		: "[HL2] Lamda: c17_08 side of building next to hallway leading to level exit"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_ENDOFC1712B"			: "[HL2] Lamda: c17_12b at map exit"
		"ACHIEVEMENT_EVENT_HL2_LAMDACACHE_WHITEVAN"				: "[HL2] Lamda: c17_13 white van in underground garage"
		


		"ACHIEVEMENT_EVENT_EP1_BEAT_MAINELEVATOR"						: "[EP1] Reach the bottom of the main elevator shaft."
		"ACHIEVEMENT_EVENT_EP1_BEAT_CITADELCORE_START"						: "[EP1] Contain the citadel core. (start)"
		"ACHIEVEMENT_EVENT_EP1_BEAT_CITADELCORE_END"						: "[EP1] Contain the citadel core. (end)"
		"ACHIEVEMENT_EVENT_EP1_BEAT_CITADELCORE"						: "[EP1] Contain the citadel core."
		"ACHIEVEMENT_EVENT_EP1_BEAT_CITADELCORE_NOSTALKERKILLS"					: "[EP1] Contain the citadel core with no stalker kills"
		"ACHIEVEMENT_EVENT_EP1_BEAT_GARAGEELEVATORSTANDOFF"					: "[EP1] Survive long enough to get on the elevator in the parking garage."
		"ACHIEVEMENT_EVENT_EP1_BEAT_HOSPITALATTICGUNSHIP"					: "[EP1] Destroy the gunship in the hospital attic."
		"ACHIEVEMENT_EVENT_EP1_BEAT_CITIZENESCORT_NOCITIZENDEATHS_START"	: "[EP1] Don't let any citizens die when escorting them to the escape train (start)."
		"ACHIEVEMENT_EVENT_EP1_BEAT_CITIZENESCORT_NOCITIZENDEATHS_END"		: "[EP1] Don't let any citizens die when escorting them to the escape train (end)."
		"ACHIEVEMENT_EVENT_EP1_BEAT_GAME_NOHEALTHPICKUPS_START"				: "[EP1] Beat EP1 without picking up any health. (start)"
		"ACHIEVEMENT_EVENT_EP1_BEAT_GAME_NOHEALTHPICKUPS_END"				: "[EP1] Beat EP1 without picking up any health. (end)"

		"ACHIEVEMENT_EVENT_EP1_START_GAME"						: "[EP1] Began EP1 (for tracking One Free Bullet)"
		"ACHIEVEMENT_EVENT_EP1_BEAT_GAME"						: "[EP1] Beat EP1 (for tracking One Free Bullet)"



		"ACHIEVEMENT_EVENT_EP2_BEAT_ANTLIONINVASION"				: "[EP2] Hold off the antlion invasion inside the mine shaft"
		"ACHIEVEMENT_EVENT_EP2_BEAT_ANTLIONGUARDS"					: "[EP2] Defeat both antlion guards outside the White Forest"
		"ACHIEVEMENT_EVENT_EP2_BEAT_HUNTERAMBUSH"					: "[EP2] Survive the Hunter ambush at the radio tower."

		"ACHIEVEMENT_EVENT_EP2_KILL_CHOPPER_NOMISSES_START"					: "[EP2] Start of the chopper arena battle."
		"ACHIEVEMENT_EVENT_EP2_KILL_CHOPPER_NOMISSES_END"					: "[EP2] End of the chopper arena battle."

		"ACHIEVEMENT_EVENT_EP2_KILL_COMBINECANNON"					: "[EP2] Destroy the Combine Cannon in the junkyard."
		"ACHIEVEMENT_EVENT_EP2_BEAT_RACEWITHDOG"					: "[EP2] Beat DOG in the race to the White Forest."
		"ACHIEVEMENT_EVENT_EP2_BEAT_ROCKETCACHEPUZZLE"				: "[EP2] Unlock the Rocket Launcher lambda cache in chapter Under The Radar."
		"ACHIEVEMENT_EVENT_EP2_BEAT_WHITEFORESTINN"					: "[EP2] Survive the invasion at White Forest Inn"
		"ACHIEVEMENT_EVENT_EP2_PUT_ITEMINROCKET"					: "[EP2] Send <some object from chapter 1> into space."
		"ACHIEVEMENT_EVENT_EP2_BEAT_MISSILESILO2"					: "[EP2] Secure the launch doors on missile silo 2."
		"ACHIEVEMENT_EVENT_EP2_BEAT_GAME" 						: "[EP2] Save the missile silo from the Combine offensive."
		"ACHIEVEMENT_EVENT_EP2_BEAT_OUTLAND12_NOBUILDINGSDESTROYED" : "[EP2] Save the missile silo without losing any buildings."

		"ACHIEVEMENT_EVENT_EP2_FIND_RADAR_CACHE"					: "[EP2] Found a radar cache in chapter Under The Radar."

		"ACHIEVEMENT_EVENT_EP2_RADARCACHE_VAN"		: "[EP2] Radar Cache: 09 first van cache"
		"ACHIEVEMENT_EVENT_EP2_RADARCACHE_RPG"		: "[EP2] Radar Cache: 09 rpg cache"
		"ACHIEVEMENT_EVENT_EP2_RADARCACHE_SHACK"			: "[EP2] Radar Cache: 09 shack floor board cache"
		"ACHIEVEMENT_EVENT_EP2_RADARCACHE_CAVE"			: "[EP2] Radar Cache: 10 cave cache"
		"ACHIEVEMENT_EVENT_EP2_RADARCACHE_HANGING"		: "[EP2] Radar Cache: 10 hanging crate cache"
		
				
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_01"		: "[EP2] Web Cache: ep2_outland_01a underwater cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_02"		: "[EP2] Web Cache: ep2_outland_03 grim pinata cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_03"		: "[EP2] Web Cache: ep2_outland_03 first arena exit tunnel wall cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_04"		: "[EP2] Web Cache: ep2_outland_03 second arena exit tunnel ceiling cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_05"		: "[EP2] Web Cache: ep2_outland_03 zombine grenade trap cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_06"		: "[EP2] Web Cache: ep2_outland_04 gear cave entry wall cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_07"		: "[EP2] Web Cache: ep2_outland_04 gear cave rockfall ceiling cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_08"		: "[EP2] Web Cache: ep2_outland_04 gear cave barnacle ceiling cache"
		"ACHIEVEMENT_EVENT_EP2_WEBCACHE_09"		: "[EP2] Web Cache: ep2_outland_04 gear cave poison crab wall cache"
*/