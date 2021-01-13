local PLAYER = FindMetaTable("Player")

local oldPrint = print

local function print(...)

end

concommand.Add("inv_dropitem",function(pl,cmd,args) 
	-- print("Call Back from command")
	if args and args[1] then
		if pl:Team() != TEAM_COMPLETED_MAP then
			local id = tonumber(args[1])
			pl:inventoryRemoveItem(id)
		end
	end
end)
concommand.Add("inv_useitem",function(pl,cmd,args) 
	
	if args and args[1] and args[2] then
		
		if pl:Team() != TEAM_COMPLETED_MAP then
			
			local id = tonumber(args[1])
			local item = tostring(args[2])
			for i=1, #Hl2c.PlanRole do
				if item == Hl2c.PlanRole[i].name then
					pl:SetPlan(i,1)
					-- oldPrint("id "..i)
					Hl2c.PersonDefaultChatPrint("[Learn]: "..tostring(Hl2c.PlanRole[i].name),pl)
					break 
				end
			end
			
			pl:inventoryRemoveItem(id)
		end
	end
end)
concommand.Add("inv_salvage",function(pl,cmd,args) 
	
	if args and args[1] and args[2] and IsValid(pl) and tonumber(args[1]) >=1 and tonumber(args[1]) <= 50 then
		if pl:Team() != TEAM_COMPLETED_MAP then
			local rarity = tostring(args[2])
			local id = math.Round(tonumber(args[1]))
			pl:inventoryRemoveItem(id)
			local num = 0
			if rarity == "legendary" then
				num = 1
				pl:inventorySetScrap(4,pl:GetNWInt( "ITEM_SCRAP_4")+ num )
				Hl2c.PersonDefaultChatPrint("[SALVAGE] Legendary ".. tostring(num).."x",pl)
				
				return
			elseif rarity == "epic" then
				num = math.random(1,3)
				pl:inventorySetScrap(3,pl:GetNWInt( "ITEM_SCRAP_3")+num )
				Hl2c.PersonDefaultChatPrint("[SALVAGE] Epic ".. tostring(num).."x",pl)
				return
			elseif rarity == "rare" then
				num = math.random(1,9)
				pl:inventorySetScrap(2,pl:GetNWInt( "ITEM_SCRAP_2")+num )
				Hl2c.PersonDefaultChatPrint("[SALVAGE] Rare ".. tostring(num).."x",pl)
				return
			elseif rarity == "common" then
				num = math.random(1,15)
				pl:inventorySetScrap(1,pl:GetNWInt( "ITEM_SCRAP_1")+num )
				Hl2c.PersonDefaultChatPrint("[SALVAGE] Common ".. tostring(num).."x",pl)
				return
			else
				
			end
		end
		Hl2c.PersonDefaultChatPrint("[SALVAGE] ERROR!!",pl)
	end
	
end)

concommand.Add("inv_equipitem",function(pl,cmd,args) 
	-- print("Call Back from command")
	if args and args[1] then
		if pl:Team() != TEAM_COMPLETED_MAP then
			local id = tonumber(args[1])
			pl:inventoryEquipItem(id)
		end
	end
end)
concommand.Add("inv_unequipitem",function(pl,cmd,args) 
	-- print("Call Back from command")
	if args and args[1] then
		if pl:Team() != TEAM_COMPLETED_MAP then
			local id = tonumber(args[1])
			pl:inventoryUnEquipItem(id)
			
		end
	end
end)
concommand.Add("inv_craft",function(pl,cmd,args) 
	-- print("Call Back from command")
	if args and args[1] then
		if pl:Team() != TEAM_COMPLETED_MAP then
			local id = tonumber(args[1])
			pl:inventoryCraft(id)
			
		end
	end
end)

function PLAYER:inventoryCraft(id)
	if true then return end
	local gear = {}
	if id == 0 then
		if self:inventoryHasSpace() then
			if self:GetNWInt( "ITEM_SCRAP_1") >= 50 and
			self:GetNWInt( "ITEM_SCRAP_2") >= 25 and
			self:GetNWInt( "ITEM_SCRAP_3") >= 5 and
			self:GetNWInt( "ITEM_SCRAP_4") >= 1 then
				
				gear = {}
				
				if self.craftCraft then
					gear = self:craftCraft(id)
				end
				--PrintTable(gear)
				if gear and gear.rarity and gear.rarity != nil then
					
					local cut = ""
					for w in string.gmatch( gear.name, "★" ) do
						cut = cut .. w
					end
					Hl2c.PersonDefaultChatPrint("[CRAFT] Gear (".. string.upper(tostring(gear["rarity"])) ..")"..cut,self)
					
					self:inventoryAddItem(gear)
					
					self:inventorySetScrap(1,self:GetNWInt( "ITEM_SCRAP_1")-50)
					self:inventorySetScrap(2,self:GetNWInt( "ITEM_SCRAP_2")-25)
					self:inventorySetScrap(3,self:GetNWInt( "ITEM_SCRAP_3")-5)
					self:inventorySetScrap(4,self:GetNWInt( "ITEM_SCRAP_4")-1)
				else
					Hl2c.PersonDefaultChatPrint("[CRAFT] ERROR!",self)
				end
			else
				Hl2c.PersonDefaultChatPrint("[CRAFT] Not Enough Materials!",self)
			end
		else
			Hl2c.PersonDefaultChatPrint("[CRAFT] Inventory is Full!",self)
		end
		
	elseif id ==1 and self:GetPlan(id) == 1 then -- Craft Legendary Suit
		if self:inventoryHasSpace() then
			if self:GetNWInt("ITEM_SCRAP_4") >= 0 then
				
				gear = self:lootRollGear("Gear Legendary",0,true,id)
				if gear and gear.rarity and gear.rarity != nil then
				-- self:inventorySetScrap(4,self:GetNWInt( "ITEM_SCRAP_4")-5) 
				self:inventoryAddItem(gear) 
				local cut = ""
					for w in string.gmatch( gear.name, "★" ) do
						cut = cut .. w
					end
				Hl2c.PersonDefaultChatPrint("[CRAFT] Suit (".. string.upper(tostring(gear["rarity"])) ..")"..cut,self)
				end
			end
		end
	elseif id == 2 and self:GetPlan(id) == 1 then -- Craft Legendary Mask
		if self:inventoryHasSpace() then
			if self:GetNWInt("ITEM_SCRAP_4") >= 5 then
				gear = self:lootRollGear("Gear Legendary",0,true,id)
				if gear and gear.rarity and gear.rarity != nil then
				self:inventorySetScrap(4,self:GetNWInt( "ITEM_SCRAP_4")-5) self:inventoryAddItem(gear)
				local cut = ""
					for w in string.gmatch( gear.name, "★" ) do
						cut = cut .. w
					end
				Hl2c.PersonDefaultChatPrint("[CRAFT] Suit (".. string.upper(tostring(gear["rarity"])) ..")"..cut,self)
				end
			end
		end
	elseif id == 3 and self:GetPlan(id) == 1 then -- Craft Legendary Boots
		if self:inventoryHasSpace() then
			if self:GetNWInt("ITEM_SCRAP_4") >= 5 then
				gear = self:lootRollGear("Gear Legendary",0,true,id)
				if gear and gear.rarity and gear.rarity != nil then
				self:inventorySetScrap(4,self:GetNWInt( "ITEM_SCRAP_4")-5) self:inventoryAddItem(gear) 
				local cut = ""
					for w in string.gmatch( gear.name, "★" ) do
						cut = cut .. w
					end
				Hl2c.PersonDefaultChatPrint("[CRAFT] Suit (".. string.upper(tostring(gear["rarity"])) ..")"..cut,self)
				end
			end
		end
	
	elseif id == 4 and self:GetPlan(id) == 1 then -- Craft Legendary Weapon
		if self:inventoryHasSpace() then
			if self:GetNWInt("ITEM_SCRAP_4") >= 5 then
				gear = self:lootRollGear("Gear Legendary",0,true,id)
				if gear and gear.rarity and gear.rarity != nil then
				self:inventorySetScrap(4,self:GetNWInt( "ITEM_SCRAP_4")-5) self:inventoryAddItem(gear) 
				local cut = ""
					for w in string.gmatch( gear.name, "★" ) do
						cut = cut .. w
					end
				Hl2c.PersonDefaultChatPrint("[CRAFT] Suit (".. string.upper(tostring(gear["rarity"])) ..")"..cut,self)
				end
			end
		end
	else
		Hl2c.PersonDefaultChatPrint("[CRAFT] Unknown Plan ???",self)
	end
end

function craftLegendaryRandom(id)
	if self:inventoryHasSpace() and (id >=2 and id <= 4) then
		if self:GetNWInt("ITEM_SCRAP_4") >= 30 then
			if (true) -- and HasPlan
			then
			
				local name = ""
				local model = ""
				local typo = ""
				-- Special Chance to get Ranked 1 Legendaries 10%
				local ranked_1 = math.random(1,10) 
				--
				local rank = 0

				local dmg = 1

				if ranked_1 == 1 then
				rank = 1
				if (rank == 1 and math.random(1,10) == 2) then
					rank = 2
				end
				
				else
					
				end
				
				
				if (id == 4) then
				
					local u = math.random(1,8)
					local name_tbl = {}
					name_tbl[1] = "Crowbar"
					name_tbl[2] = "Pistol"
					name_tbl[3] = "357"
					name_tbl[4] = "SMG1"
					name_tbl[5] = "AR2"
					name_tbl[6] = "Shotgun"
					name_tbl[7] = "Crossbow"
					name_tbl[8] = "RPG"
					local mdl_tbl = {}
					mdl_tbl[1] = "w_crowbar"
					mdl_tbl[2] = "w_pistol"
					mdl_tbl[3] = "w_357"
					mdl_tbl[4] = "w_smg1"
					mdl_tbl[5] = "w_irifle"
					mdl_tbl[6] = "w_shotgun"
					mdl_tbl[7] = "w_crossbow"
					mdl_tbl[8] = "w_rocket_launcher"
					
					name = name_tbl[u]
					model = "models/weapons/".. tostring(mdl_tbl[u]) ..".mdl"
					typo = "weapon"
				
					if rank == 1 then
						local bonus_dmg1 = 0
						local bonus_dmg2 = 0
						local szam = 7 - luck
						if szam < 2 then szam = 2 end
						
						if math.random(1,szam) <= 1 then
							bonus_dmg1 = math.random(1,9)
						end
						
						szam = 7 - luck
						if szam < 3 then szam = 3 end
						
						if math.random(1,szam) <= 1 then
							bonus_dmg2 = math.random(1,9)
						end
						
						dmg = math.random(19,20 + bonus_dmg1 + bonus_dmg2)
					elseif(rank == 2) then
						local bonus_dmg1 = 0
						local bonus_dmg2 = 0
						local szam = 7 - luck
						if szam < 2 then szam = 2 end
						
						if math.random(1,szam) <= 1 then
							bonus_dmg1 = math.random(1,9)
						end
						
						szam = 7 - luck
						if szam < 3 then szam = 3 end
						
						if math.random(1,szam) <= 1 then
							bonus_dmg2 = math.random(1,9)
						end
						
						dmg = math.random(39,40 + bonus_dmg1 + bonus_dmg2)
					else
						dmg = math.random(11,18)
					end
					
				elseif id == 1 then
					name = "Cop Mask"
					model = "models/BarneyHelmet_faceplate.mdl"
					typo = "helm"

				elseif id == 2 then
					name = "Shoes"
					model = "models/props_junk/shoe001a.mdl"
					typo = "boots"

				elseif id == 3 then
					model = "models/items/hevsuit.mdl"
					name = "Hev Suit"
					typo = "suit"
				end

				if rank == 1 and loot == "Gear Legendary" then
					name = name .. "★"
				end
				local gear = {}
				
				
				
			end
			
		end
	end
end


function PLAYER:craftCraft(id)
	local luck = math.Round( (self:GetNWInt("PSTAT_LUCK")/10 + self:GetNWInt("ISTAT_LUCK") ) )
	if id == 0 then
		local tbl = {}
		
		for i=1,10 do
			tbl[i] = i
		end
		local roll_legendary = math.shuffle(tbl,#tbl)
		
		tbl = {}
		for i=1,6 do
			tbl[i] = i
		end
		local roll_epic = math.shuffle(tbl,#tbl)
		
		tbl = {}
		for i=1,2 do
			tbl[i] = i
		end
		local roll_rare = math.shuffle(tbl,#tbl)
		
		local name = ""
			local model = ""
		local typo = ""
		local loot = "Gear Common"
		
		if roll_legendary == 1 then
			loot = "Gear Legendary"
		elseif roll_epic == 1 then
			loot = "Gear Epic"
		elseif roll_rare == 1 then
			loot = "Gear Rare"
		end
		local random = math.random(1,5)

		-- Special Chance to get Ranked 1 Legendaries 10%
		local ranked_1 = math.random(1,10) 
		--
		local rank = 0

		local dmg = 1

		if ranked_1 == 1 then
		rank = 1
		if (rank == 1 and math.random(1,10) == 2) then
			rank = 2
		end
		
		else
			
		end
		-- random = 5
		if random == 5 then

			local u = math.random(1,8)
			local name_tbl = {}
			name_tbl[1] = "Crowbar"
			name_tbl[2] = "Pistol"
			name_tbl[3] = "357"
			name_tbl[4] = "SMG1"
			name_tbl[5] = "AR2"
			name_tbl[6] = "Shotgun"
			name_tbl[7] = "Crossbow"
			name_tbl[8] = "RPG"
			local mdl_tbl = {}
			mdl_tbl[1] = "w_crowbar"
			mdl_tbl[2] = "w_pistol"
			mdl_tbl[3] = "w_357"
			mdl_tbl[4] = "w_smg1"
			mdl_tbl[5] = "w_irifle"
			mdl_tbl[6] = "w_shotgun"
			mdl_tbl[7] = "w_crossbow"
			mdl_tbl[8] = "w_rocket_launcher"
			
			name = name_tbl[u]
			model = "models/weapons/".. tostring(mdl_tbl[u]) ..".mdl"
			typo = "weapon"
			
			if loot == "Gear Common" then
				dmg = math.random(1,3)
			elseif loot == "Gear Rare" then
				dmg = math.random(3,6)
			elseif loot == "Gear Epic" then
				dmg = math.random(6,10)
			elseif loot == "Gear Legendary" then
				if rank == 1 then
					local bonus_dmg1 = 0
					local bonus_dmg2 = 0
					local szam = 7 - luck
					if szam < 2 then szam = 2 end
					
					if math.random(1,szam) <= 1 then
						bonus_dmg1 = math.random(1,9)
					end
					
					szam = 7 - luck
					if szam < 3 then szam = 3 end
					
					if math.random(1,szam) <= 1 then
						bonus_dmg2 = math.random(1,9)
					end
					
					dmg = math.random(19,20 + bonus_dmg1 + bonus_dmg2)
				elseif(rank == 2) then
					local bonus_dmg1 = 0
					local bonus_dmg2 = 0
					local szam = 7 - luck
					if szam < 2 then szam = 2 end
					
					if math.random(1,szam) <= 1 then
						bonus_dmg1 = math.random(1,9)
					end
					
					szam = 7 - luck
					if szam < 3 then szam = 3 end
					
					if math.random(1,szam) <= 1 then
						bonus_dmg2 = math.random(1,9)
					end
					
					dmg = math.random(39,40 + bonus_dmg1 + bonus_dmg2)
				else
					dmg = math.random(11,18)
				end
			end

		elseif random == 1 then
			name = "Cop Mask"
			model = "models/BarneyHelmet_faceplate.mdl"
			typo = "helm"

		elseif random == 2 then
			name = "Shoes"
			model = "models/props_junk/shoe001a.mdl"
			typo = "boots"

		else
			model = "models/items/hevsuit.mdl"
			name = "Hev Suit"
			typo = "suit"
		end

		if rank == 1 and loot == "Gear Legendary" then
			name = name .. "★"
		end
		local gear = {}

			if loot == "Gear Common" then
				
				local afx = 1
				gear = {
				["name"] = name,
				["rarity"] = "common",
				[typo] = "true",
				["model"] = model,
				["amount"] = 1,
				["gear"] = "true",
				["afx"] = afx,
				["stat"] = self:lootGearRoll(loot)
				}
				-- return gear
			elseif loot == "Gear Rare" then
				local afx = 2
				gear = {
				["name"] = name,
				["rarity"] = "rare",
				["gear"] = "true",
				[typo] = "true",
				["amount"] = 1,
				["afx"] = afx,
				["model"] = model,
				["stat"] = self:lootGearRoll(loot)
				}
				-- return gear
			elseif loot == "Gear Epic" then
				local afx = 3
				gear = {
				["gear"] = "true",
				[typo] = "true",
				["name"] = name,
				["rarity"] = "epic",
				["amount"] = 1,
				["afx"] = afx,
				["model"] = model,
				["stat"] = self:lootGearRoll(loot)
				}
				-- return gear
			elseif loot == "Gear Legendary" then
			
				-- if ranked_1 == 1 then
				-- if DISCORD_LootLegendaryGear then  DISCORD_LootLegendaryGear(self,1) end
				-- else
				-- if DISCORD_LootLegendaryGear then  DISCORD_LootLegendaryGear(self,0) end
				-- end
				local afx = math.random(3,5)
				gear = {
				["gear"] = "true",
				[typo] = "true",
				["name"] = name,
				["rarity"] = "legendary",
				["afx"] = afx,
				["model"] = model,
				["amount"] = 1,
				["stat"] = self:lootGearRoll(loot,rank)
				}
				-- return gear
			end
			
		if typo == "weapon" then
			gear["stat"]["absorb"] = nil
			gear["stat"]["dmg"] = dmg
		end

		return gear
			
			
	end
	return {}
end

function PLAYER:inventoryHasSpace()
	if self.database and self.database.inventory and self.database.inventory.slot then
		for i=1,self.database.inventory["inventory-size"] do
			if self.database["inventory"]["slot"][i]["item"] == "false" then
				-- oldPrint(true)
				return true
			end
		end
		-- oldPrint(false)
		return false
	end
end
function PLAYER:inventoryGetSpace()
	if self.database and self.database.inventory and self.database.inventory.slot then
		for i=1,self.database.inventory["inventory-size"] do
			if self.database["inventory"]["slot"][i]["item"] == "false" then
				-- oldPrint(i)
				return i
			end
		end
		-- oldPrint(nil)
		return nil
	end
end
function PLAYER:inventoryGetSize()
	if self.database and self.database.inventory and self.database.inventory.slot then
		if self.database.inventory["inventory-size"] then
			return tonumber(self.database.inventory["inventory-size"])
		end
		-- oldPrint(nil)
		
	end
	return 0
end
function PLAYER:inventoryAddItem(item)
	if self.database and self.database.inventory and self.database.inventory.slot then
		if self:inventoryHasSpace() and item and item != nil then
			local space_id = self:inventoryGetSpace()
			self.database["inventory"]["slot"][space_id] = {["item"] = "true",["item_data"]=item}
			self:databaseSend("inventory")
			self:inventoryItemStatReset()
			return true
		end
	end
	return false
end
function PLAYER:inventoryRemoveItem(id)
	if self.database and self.database.inventory and self.database.inventory.slot then
		local id = math.Round(tonumber(id) )
		if id and id > 0 and id < 51 then
			-- local space_id = self:inventoryGetSpace()
			self.database["inventory"]["slot"][id] = {["item"] = "false"}
			self:databaseSend("inventory")
		end
	end
end
function PLAYER:inventoryEquipItem(id)
	if self.database and self.database.inventory and self.database.inventory.slot then
		if id and isnumber(id) and id>0 and id<51 then
			if self.database["inventory"]["slot"][id]["item"] == "true" then
				local item = {}
				local unequip = {}
				item = self.database["inventory"]["slot"][id]
				if item["item_data"]["suit"] == "true" and self.database["inventory"]["equip"][1]["item"] == "true" and self:inventoryHasSpace() then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self:inventoryUnEquipItem(1)
					self.database["inventory"]["equip"][1] = item
					
				elseif item["item_data"]["suit"] == "true" and self.database["inventory"]["equip"][1]["item"] == "false" then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self.database["inventory"]["equip"][1] = item
				end
				if item["item_data"]["helm"] == "true" and self.database["inventory"]["equip"][2]["item"] == "true" and self:inventoryHasSpace() then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self:inventoryUnEquipItem(2)
					self.database["inventory"]["equip"][2] = item
					
				elseif item["item_data"]["helm"] == "true" and self.database["inventory"]["equip"][2]["item"] == "false" then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self.database["inventory"]["equip"][2] = item
				end
				if item["item_data"]["boots"] == "true" and self.database["inventory"]["equip"][3]["item"] == "true" and self:inventoryHasSpace() then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self:inventoryUnEquipItem(3)
					self.database["inventory"]["equip"][3] = item
					
				elseif item["item_data"]["boots"] == "true" and self.database["inventory"]["equip"][3]["item"] == "false" then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self.database["inventory"]["equip"][3] = item
				end
				
				if item["item_data"]["weapon"] == "true" and self.database["inventory"]["equip"][5]["item"] == "true" and self:inventoryHasSpace() then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self:inventoryUnEquipItem(5)
					self.database["inventory"]["equip"][5] = item
					
				elseif item["item_data"]["weapon"] == "true" and self.database["inventory"]["equip"][5]["item"] == "false" then
					self.database["inventory"]["slot"][id] = {["item"] = "false"}
					self.database["inventory"]["equip"][5] = item
				end
			end
		end
		
		self:databaseSend("inventory")
		self:inventoryItemStatReset()
	end
end
function PLAYER:inventoryUnEquipItem(id)
	if self.database and self.database.inventory and self.database.inventory.slot and self.database.inventory.equip then
		local id = math.Round(tonumber(id))
		if id and id>0 and id< (self:inventoryGetSize()+1) then
			if self.database["inventory"]["equip"][id]["item"] == "true" and self:inventoryHasSpace() then
				local unequip = self.database["inventory"]["equip"][id]["item_data"]
				self.database["inventory"]["equip"][id] = {["item"]="false"}
				self:inventoryAddItem(unequip)
				
			end
		end
	end
end

function PLAYER:inventoryItemStatReset()
	-- ISTAT HP
	-- ISTAT LFG
	-- ISTAT LUCK
	-- ISTAT ABSORB
	if self.database and self.database.inventory and self.database.inventory.equip then
		local hp = 0
		local lfg = 0
		local luck = 0
		local absorb = 0
		local dmg = 0
		if self.database.inventory.equip[1] and self.database.inventory.equip[1]["item"] == "true" then
			
			local stat = self.database.inventory.equip[1]["item_data"]["stat"]
			if stat and istable(stat) then
				if stat["hp"] then
					if self.database.inventory.equip[1]["item_data"]["rarity"] == "common" and tonumber(stat["hp"]) > 50 then
						hp = hp + 50
					elseif self.database.inventory.equip[1]["item_data"]["rarity"] == "rare" and tonumber(stat["hp"]) > 100 then
						hp = hp + 100
					elseif self.database.inventory.equip[1]["item_data"]["rarity"] == "epic" and tonumber(stat["hp"]) > 150 then
						hp = hp + 150
					elseif self.database.inventory.equip[1]["item_data"]["rarity"] == "legendary" and tonumber(stat["hp"]) > 200 then
						hp = hp + 200
					else
						hp = hp + tonumber(stat["hp"])
					end
				end
				if stat["luck"] then
					
					luck = luck + tonumber(stat["luck"])
				end
				if stat["lfg"] then
					if self.database.inventory.equip[1]["item_data"]["rarity"] == "common" and tonumber(stat["lfg"]) > 5 then
						lfg = lfg + 5
					elseif self.database.inventory.equip[1]["item_data"]["rarity"] == "rare" and tonumber(stat["lfg"]) > 10 then
						lfg = lfg + 10
					elseif self.database.inventory.equip[1]["item_data"]["rarity"] == "epic" and tonumber(stat["lfg"]) > 20 then
						lfg = lfg + 20
					elseif self.database.inventory.equip[1]["item_data"]["rarity"] == "legendary" and tonumber(stat["lfg"]) > 40 then
						lfg = lfg + 40
					else
						lfg = lfg + tonumber(stat["lfg"])
					end
				end
				if stat["absorb"] and self.database.inventory.equip[1]["item_data"]["rarity"] == "legendary" then
					absorb = absorb + tonumber(stat["absorb"])
				end
				
			end
		end
		if self.database.inventory.equip[2] and self.database.inventory.equip[2]["item"] == "true" then
			
			local stat = self.database.inventory.equip[2]["item_data"]["stat"]
			if stat and istable(stat) then
				if stat["hp"] then
					if self.database.inventory.equip[2]["item_data"]["rarity"] == "common" and tonumber(stat["hp"]) > 50 then
						hp = hp + 50
					elseif self.database.inventory.equip[2]["item_data"]["rarity"] == "rare" and tonumber(stat["hp"]) > 100 then
						hp = hp + 100
					elseif self.database.inventory.equip[2]["item_data"]["rarity"] == "epic" and tonumber(stat["hp"]) > 150 then
						hp = hp + 150
					elseif self.database.inventory.equip[2]["item_data"]["rarity"] == "legendary" and tonumber(stat["hp"]) > 200 then
						hp = hp + 200
					else
						hp = hp + tonumber(stat["hp"])
					end
				end
				if stat["luck"] then
					
					luck = luck + tonumber(stat["luck"])
				end
				if stat["lfg"] then
					if self.database.inventory.equip[2]["item_data"]["rarity"] == "common" and tonumber(stat["lfg"]) > 5 then
						lfg = lfg + 5
					elseif self.database.inventory.equip[2]["item_data"]["rarity"] == "rare" and tonumber(stat["lfg"]) > 10 then
						lfg = lfg + 10
					elseif self.database.inventory.equip[2]["item_data"]["rarity"] == "epic" and tonumber(stat["lfg"]) > 20 then
						lfg = lfg + 20
					elseif self.database.inventory.equip[2]["item_data"]["rarity"] == "legendary" and tonumber(stat["lfg"]) > 40 then
						lfg = lfg + 40
					else
						lfg = lfg + tonumber(stat["lfg"])
					end
				end
				if stat["absorb"] and self.database.inventory.equip[2]["item_data"]["rarity"] == "legendary" then
					absorb = absorb + tonumber(stat["absorb"])
				end
				
			end
		end
		if self.database.inventory.equip[3] and self.database.inventory.equip[3]["item"] == "true" then
			
			local stat = self.database.inventory.equip[3]["item_data"]["stat"]
			if stat and istable(stat) then
				if stat["hp"] then
					if self.database.inventory.equip[3]["item_data"]["rarity"] == "common" and tonumber(stat["hp"]) > 50 then
						hp = hp + 50
					elseif self.database.inventory.equip[3]["item_data"]["rarity"] == "rare" and tonumber(stat["hp"]) > 100 then
						hp = hp + 100
					elseif self.database.inventory.equip[3]["item_data"]["rarity"] == "epic" and tonumber(stat["hp"]) > 150 then
						hp = hp + 150
					elseif self.database.inventory.equip[3]["item_data"]["rarity"] == "legendary" and tonumber(stat["hp"]) > 200 then
						hp = hp + 200
					else
						hp = hp + tonumber(stat["hp"])
					end
				end
				if stat["luck"] then
					
					luck = luck + tonumber(stat["luck"])
				end
				if stat["lfg"] then
					if self.database.inventory.equip[3]["item_data"]["rarity"] == "common" and tonumber(stat["lfg"]) > 5 then
						lfg = lfg + 5
					elseif self.database.inventory.equip[3]["item_data"]["rarity"] == "rare" and tonumber(stat["lfg"]) > 10 then
						lfg = lfg + 10
					elseif self.database.inventory.equip[3]["item_data"]["rarity"] == "epic" and tonumber(stat["lfg"]) > 20 then
						lfg = lfg + 20
					elseif self.database.inventory.equip[3]["item_data"]["rarity"] == "legendary" and tonumber(stat["lfg"]) > 40 then
						lfg = lfg + 40
					else
						lfg = lfg + tonumber(stat["lfg"])
					end
				end
				if stat["absorb"] and self.database.inventory.equip[3]["item_data"]["rarity"] == "legendary" then
					absorb = absorb + tonumber(stat["absorb"])
				end
				
			end
		end
		if self.database.inventory.equip[4] and self.database.inventory.equip[4]["item"] == "true" then
			
			local stat = self.database.inventory.equip[4]["item_data"]["stat"]
			if stat and istable(stat) then
				if stat["hp"] then
					if self.database.inventory.equip[4]["item_data"]["rarity"] == "common" and tonumber(stat["hp"]) > 50 then
						hp = hp + 50
					elseif self.database.inventory.equip[4]["item_data"]["rarity"] == "rare" and tonumber(stat["hp"]) > 100 then
						hp = hp + 100
					elseif self.database.inventory.equip[4]["item_data"]["rarity"] == "epic" and tonumber(stat["hp"]) > 150 then
						hp = hp + 150
					elseif self.database.inventory.equip[4]["item_data"]["rarity"] == "legendary" and tonumber(stat["hp"]) > 200 then
						hp = hp + 200
					else
						hp = hp + tonumber(stat["hp"])
					end
				end
				if stat["luck"] then
					
					luck = luck + tonumber(stat["luck"])
				end
				if stat["lfg"] then
					if self.database.inventory.equip[4]["item_data"]["rarity"] == "common" and tonumber(stat["lfg"]) > 5 then
						lfg = lfg + 5
					elseif self.database.inventory.equip[4]["item_data"]["rarity"] == "rare" and tonumber(stat["lfg"]) > 10 then
						lfg = lfg + 10
					elseif self.database.inventory.equip[4]["item_data"]["rarity"] == "epic" and tonumber(stat["lfg"]) > 20 then
						lfg = lfg + 20
					elseif self.database.inventory.equip[4]["item_data"]["rarity"] == "legendary" and tonumber(stat["lfg"]) > 40 then
						lfg = lfg + 40
					else
						lfg = lfg + tonumber(stat["lfg"])
					end
				end
				if stat["absorb"] and self.database.inventory.equip[4]["item_data"]["rarity"] == "legendary" then
					absorb = absorb + tonumber(stat["absorb"])
				end
				
			end
		end
		if self.database.inventory.equip[5] and self.database.inventory.equip[5]["item"] == "true" then
			
			local stat = self.database.inventory.equip[5]["item_data"]["stat"]
			if stat and istable(stat) then
				if stat["hp"] then
					if self.database.inventory.equip[5]["item_data"]["rarity"] == "common" and tonumber(stat["hp"]) > 50 then
						hp = hp + 50
					elseif self.database.inventory.equip[5]["item_data"]["rarity"] == "rare" and tonumber(stat["hp"]) > 100 then
						hp = hp + 100
					elseif self.database.inventory.equip[5]["item_data"]["rarity"] == "epic" and tonumber(stat["hp"]) > 150 then
						hp = hp + 150
					elseif self.database.inventory.equip[5]["item_data"]["rarity"] == "legendary" and tonumber(stat["hp"]) > 200 then
						hp = hp + 200
					else
						hp = hp + tonumber(stat["hp"])
					end
				end
				if stat["luck"] then
					
					luck = luck + tonumber(stat["luck"])
				end
				if stat["lfg"] then
					if self.database.inventory.equip[5]["item_data"]["rarity"] == "common" and tonumber(stat["lfg"]) > 5 then
						lfg = lfg + 5
					elseif self.database.inventory.equip[5]["item_data"]["rarity"] == "rare" and tonumber(stat["lfg"]) > 10 then
						lfg = lfg + 10
					elseif self.database.inventory.equip[5]["item_data"]["rarity"] == "epic" and tonumber(stat["lfg"]) > 20 then
						lfg = lfg + 20
					elseif self.database.inventory.equip[5]["item_data"]["rarity"] == "legendary" and tonumber(stat["lfg"]) > 40 then
						lfg = lfg + 40
					else
						lfg = lfg + tonumber(stat["lfg"])
					end
				end
				if stat["dmg"] then
					dmg = dmg + tonumber(stat["dmg"])
				end
				
			end
		end
		-- self:SetNWInt("ISTAT_HP",hp)
		-- self:SetNWInt("ISTAT_LFG",lfg)
		-- self:SetNWInt("ISTAT_LUCK",luck)
		-- self:SetNWInt("ISTAT_ABSORB",absorb)
		-- self:SetNWInt("ISTAT_DMG",dmg)
		self:SetUpMaxHP()
		self:databaseSetLFG()
	end
end