net.Receive("Hl2c.Loot.MapEnd.Reward", function(len)
	local loot = net.ReadTable()
	local prog_table = net.ReadTable()
	lootReward(loot,prog_table)
	-- Test()
	-- print("Happened")
end)

function lootReward(tbl,prog_table)
	-- tbl = {1,2}
	if tbl and istable(tbl) then else return end 
	if #tbl >= 1 then else return end
	
	
	if LocalPlayer() and LocalPlayer():SteamID() == "STEAM_0:1:4782422" then
		PrintTable(prog_table)
		PrintTable(tbl)
	end
	
	local left = 0
	local down = 0
	
	local frame = vgui.Create("DFrame")
	frame:SetPos(ScrW()/2 -225,ScrH()/2 -225)
	frame:SetSize(450, 450)
	frame:SetTitle("LOOT")
	frame:SetDraggable(false)
	frame:ShowCloseButton(true)
	frame:MakePopup()
	function frame:Paint(w,h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
		
	end
	local packet = vgui.Create("DPanel",frame)
	packet:DockMargin( 250, 20, 0, 40 )
	packet:DockPadding( 250, 30, 0, 10 )
	packet:Dock( FILL )
	
	
	-- bonus_num = bonus_num + 500
	-- bonus_num = bonus_num + 2000
	local prog_text = vgui.Create( "DTextEntry", packet )
	prog_text:SetPos(5,5)
	prog_text:SetSize(170,200)
	prog_text:SetMultiline( true )
	local progress = "Progress\n---------------------\n 1000 - Completed Map"
	
	local prog_result = vgui.Create( "DTextEntry", packet )
	prog_result:SetPos(5,205)
	prog_result:SetSize(170,15)
	prog_result:SetMultiline( true )
	
	local str = "= " -- Result Text
	local rewnum = 1000 -- Result Default Number
	local bonus_num = 0 -- Result Bonus Numbers
	if LocalPlayer():Deaths() == 0 then
		bonus_num = bonus_num + 1000
		
		progress = progress .. "\n 1000 - No Death"
		-- progress = progress .. "\n 500 - 5 NPC Kills"
		-- progress = progress .. "\n 2000 - Helicopter Kill"
	end
	
	if prog_table["PROG_HELICOPTER"][1] == true then
		progress = progress .. "\n "..tostring(prog_table["PROG_HELICOPTER"][2]).." - Helicopter Kill"
		bonus_num = bonus_num + prog_table["PROG_HELICOPTER"][2]
	end
	if prog_table["PROG_GUNSHIP"][1] == true then
		progress = progress .. "\n "..tostring(prog_table["PROG_GUNSHIP"][2]).." - Gunship Kill"
		bonus_num = bonus_num + prog_table["PROG_GUNSHIP"][2]
	end
	if prog_table["PROG_STRIDER"] == true then
		progress = progress .. "\n "..tostring(prog_table["PROG_STRIDER"][2]).." - Strider Kill"
		bonus_num = bonus_num + prog_table["PROG_STRIDER"][2]
	end
	if prog_table["PROG_HUNTER"][1] == true then
		progress = progress .. "\n "..tostring(prog_table["PROG_HUNTER"][2]).." - Hunter Kill"
		bonus_num = bonus_num + prog_table["PROG_HUNTER"][2]
	end
	
	if prog_table["PROG_NPCKILL_30"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_NPCKILL_30"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_NPCKILL_30"][2]).." - >30 NPC Kill"
	elseif prog_table["PROG_NPCKILL_20"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_NPCKILL_20"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_NPCKILL_20"][2]).." - >20 NPC Kill"
	elseif prog_table["PROG_NPCKILL_15"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_NPCKILL_15"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_NPCKILL_15"][2]).." - >15 NPC Kill"
	elseif prog_table["PROG_NPCKILL_10"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_NPCKILL_10"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_NPCKILL_10"][2]).." - >10 NPC Kill"
	elseif prog_table["PROG_NPCKILL_5"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_NPCKILL_5"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_NPCKILL_5"][2]).." - >5 NPC Kill"
	elseif prog_table["PROG_NPCKILL_1"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_NPCKILL_1"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_NPCKILL_1"][2]).." - >1 NPC Kill"
	end
	
	if prog_table["PROG_TOPKILL"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_TOPKILL"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_TOPKILL"][2]).." - TOP Kill"
	end
	
	if prog_table["PROG_HEAL"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_HEAL"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_HEAL"][2]).." - Heal Friend"
	end
	
	if prog_table["PROG_FREEMAN"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_FREEMAN"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_FREEMAN"][2]).." - Freeman Mode!"
	end
	
	if prog_table["PROG_PETKILL_5"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_PETKILL_5"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_PETKILL_5"][2]).." - Pet Mega Kills!"
	elseif prog_table["PROG_PETKILL_3"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_PETKILL_3"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_PETKILL_3"][2]).." - Pet Super Kills!"
	end
	
	if prog_table["PROG_GUARD"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_GUARD"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_GUARD"][2]).." - Antlionguard Kill"
	end
	
	if prog_table["PROG_BOOM_COUNT_6"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_BOOM_COUNT_6"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_BOOM_COUNT_6"][2]).." - Mega Boom!"
	elseif prog_table["PROG_BOOM_COUNT_3"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_BOOM_COUNT_3"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_BOOM_COUNT_3"][2]).." - Super Boom!"
	end
	
	if prog_table["PROG_PROPKILL_COUNT_3"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_PROPKILL_COUNT_3"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_PROPKILL_COUNT_3"][2]).." - Mega Punch!"
	elseif prog_table["PROG_PROPKILL_COUNT_1"][1] == true then
		bonus_num = bonus_num + prog_table["PROG_PROPKILL_COUNT_1"][2]
		progress = progress .. "\n "..tostring(prog_table["PROG_PROPKILL_COUNT_1"][2]).." - Super Punch!"
	end
	
	rewnum = rewnum + bonus_num -- Result Add
	str = str .. tostring(rewnum) -- Result Print Text
	prog_result:SetText( str )
	prog_text:SetText( progress )
	prog_text.AllowInput = function( self, stringValue )
		return true
	end
	prog_result.AllowInput = function( self, stringValue )
		return true
	end
	
	
	local tip_icon = vgui.Create("SpawnIcon",packet)
	tip_icon:SetModel("models/model.mdl")
	-- tip_icon:SetSize( 80, 80 )
	tip_icon:SetPos(5,230)
	tip_icon:SetMouseInputEnabled(false)
	local tip_label = vgui.Create("DLabel",packet)
	tip_label:SetSize( 80, 20 )
	tip_label:SetPos(70,220)
	tip_label:SetText("Name:")
	tip_label:SetDark(true)
	tip_label:SetMouseInputEnabled(false)
	
	
	local tip_label = vgui.Create("DLabel",packet)
	tip_label:SetSize( 80, 20 )
	tip_label:SetPos(70,240)
	tip_label:SetText("Amount:")
	tip_label:SetDark(true)
	tip_label:SetMouseInputEnabled(false)
	local tip_label = vgui.Create("DLabel",packet)
	tip_label:SetSize( 80, 20 )
	tip_label:SetPos(70,260)
	tip_label:SetText("Rarity:")
	tip_label:SetDark(true)
	tip_label:SetMouseInputEnabled(false)
	local tip_label = vgui.Create("DLabel",packet)
	tip_label:SetSize( 80, 20 )
	tip_label:SetPos(35,300)
	tip_label:SetText("Stat:")
	tip_label:SetDark(true)
	tip_label:SetMouseInputEnabled(false)
	
	// Moddable text
	local tip_name = vgui.Create("DLabel",packet)
	tip_name:SetSize( 80, 20 )
	tip_name:SetPos(105,220)
	tip_name:SetText("")
	tip_name:SetDark(true)
	tip_name:SetMouseInputEnabled(false)
	local tip_amount = vgui.Create("DLabel",packet)
	tip_amount:SetSize( 80, 20 )
	tip_amount:SetPos(115,240)
	tip_amount:SetText("")
	tip_amount:SetDark(true)
	tip_amount:SetMouseInputEnabled(false)
	local tip_rarity = vgui.Create("DLabel",packet)
	tip_rarity:SetSize( 80, 20 )
	tip_rarity:SetPos(105,260)
	tip_rarity:SetText("")
	tip_rarity:SetDark(true)
	tip_rarity:SetMouseInputEnabled(false)
	
	local tip_stat = vgui.Create( "DTextEntry", packet )
	tip_stat:SetPos(70,280)
	tip_stat:SetSize(100,70)
	tip_stat:SetMultiline( true )
	tip_stat:SetText("")
	tip_stat.AllowInput = function( self, stringValue )
		return true
	end
	
	-- MY_TOOLTIP = vgui.Create( "DFrame" )
	-- MY_TOOLTIP:SetSize( 250, 150 )
	-- MY_TOOLTIP:SetTitle( "" )
	-- MY_TOOLTIP:SetVisible( false )
	-- MY_TOOLTIP:ShowCloseButton( false )
	-- MY_TOOLTIP:SetPaintShadow( true )
	-- MY_TOOLTIP:MakePopup()
	
	local List	= vgui.Create( "DIconLayout",frame )
	List:SetSize( 200, 250 )
	List:SetPos( 25,50 )
	List:SetSpaceY( 3 ) //Sets the space in between the panels on the X Axis by 5
	List:SetSpaceX( 3 ) //Sets the space in between the panels on the Y Axis by 5
	
	local current_stat = ""
	for i=1,#tbl do
		local msg = tbl[i]["name"]
		if tbl[i]["xp"] then
			msg = "XP x".. tostring(tbl[i]["amount"])
		end
		local gear_stat = ""
		
		if tbl[i]["gear"] == "true" then
			for k,v in pairs(tbl[i]["stat"]) do
				
				local name = ""
				if k == "lfg" then
				name = "LifeRegen"
				gear_stat = gear_stat .."\n".. tostring(name)..": "..tostring(tbl[i]["stat"][k]) .. "/sec "
				end
				if k == "hp" then
				name = "Health"
				gear_stat = gear_stat .."\n".. tostring(name)..": "..tostring(tbl[i]["stat"][k]) .. " "
				end
				if k == "luck" then
				name = "Luck"
				gear_stat = gear_stat .."\n".. tostring(name)..": "..tostring(tbl[i]["stat"][k]) .. "% "
				end
				if k == "absorb" then
				name = "Absorb"
				gear_stat = gear_stat .."\n".. tostring(name)..": "..tostring(tbl[i]["stat"][k]) .. "% "
				end
				if k == "dmg" then
				name = "damage"
				gear_stat = gear_stat .."\n".. tostring(name)..": "..tostring(tbl[i]["stat"][k]) .. "% "
				end
				
				-- print(gear_stat)
			end
		end
		-- print(gear_stat)
		
		local color = Color(240, 240, 240)
		if tbl[i]["rarity"] == "rare" then
			color = Color( 0, 0, 200 )
		end
		if tbl[i]["rarity"] == "epic" then
			color = Color( 200, 0, 200 )
		end
		if tbl[i]["rarity"] == "legendary" then
			color = Color( 200, 100, 0 )
		end
		if tbl[i]["rarity"] == "common" then
			color = Color( 240, 240, 240 )
		end
		if tbl[i]["rarity"] == "nil" then
			color = Color( 240, 240, 240 )
		end
		-- left = left + 52.5
		local model = tbl[i]["model"]
		local pressed = false
		local looted = false
		local panel = vgui.Create("DPanel")
		panel:SetSize( 80, 80 )
		local icon = vgui.Create("SpawnIcon",panel)
		icon:SetModel("models/items/item_item_crate.mdl")
		icon:SetSize( 80, 80 )
		icon:SetMouseInputEnabled(false)
		local DermaButton = vgui.Create( "DButton",panel ) // Create the button and parent it to the frame
		DermaButton:SetText( "" )					// Set the text on the button
		DermaButton:SetSize( 80, 80 )					// Set the size
		DermaButton:SetMouseInputEnabled(true)
		
		List:Add(panel)
		
		
		function DermaButton:Paint( w, h )
			draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0,0 ) )
		end

		function DermaButton:Think()
			if self:IsHovered() then
				if looted == true then
					tip_icon:SetModel(tostring(tbl[i]["model"]))
					tip_name:SetText( tostring(tbl[i]["name"]))
					tip_amount:SetText( tostring(tbl[i]["amount"]))
					if tbl[i]["gear"] then
						if current_stat != gear_stat then
							tip_stat:SetText(gear_stat)
							current_stat = gear_stat
							-- print("PRINT STAT")
						end
						-- print(current_stat)
					else
						tip_stat:SetText("")
						current_stat = ""
						-- print("WTF?")
					end
					if tostring(tbl[i]["rarity"]) == "nil" then
						tip_rarity:SetText( "" )
					else
						tip_rarity:SetText( tostring(tbl[i]["rarity"]))
					end
				else
					
				end
			end
		end
		function DermaButton:DoClick()
			if (tbl[i]["gear"] == "true" or tbl[i]["scrap"] == "true") and tbl[i]["rarity"] == "common" then
				
				
				
				if pressed == false then
					-- tip:SetPos(gui.MousePos())
					timer.Simple(1,function()
						panel:SetBackgroundColor( color )
						icon:SetModel(model)
						looted = true
						chat.AddText( Color( 200, 255, 100 ), "[LOOT] ("..tostring(i).."): ", color, tostring(msg) )
						-- tip:SetVisible(true)
					end)
				end
			elseif (tbl[i]["gear"] == "true" or tbl[i]["scrap"] == "true") and tbl[i]["rarity"] == "rare" then
				-- function DermaButton:Paint( w, h )
					-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 200 ) )
				-- end
				
				
				if pressed == false then
				-- tip:SetPos(gui.MousePos())
				timer.Simple(1,function()
				panel:SetBackgroundColor( color )
				icon:SetModel(model)
				looted = true
				chat.AddText( Color( 200, 255, 100 ), "[LOOT] ("..tostring(i).."): ", color, tostring(msg) )
				-- tip:SetVisible(true)
				end)
				end
			elseif (tbl[i]["gear"] == "true" or tbl[i]["scrap"] == "true") and tbl[i]["rarity"] == "epic" then
				-- function DermaButton:Paint( w, h )
					-- draw.RoundedBox( 8, 0, 0, w, h, Color( 200, 0, 200 ) )
				-- end
				
				
				if pressed == false then
				-- tip:SetPos(gui.MousePos())
				timer.Simple(1,function()
				panel:SetBackgroundColor( color )
				icon:SetModel(model)
				looted = true
				chat.AddText( Color( 200, 255, 100 ), "[LOOT] ("..tostring(i).."): ", color, tostring(msg) )
				-- tip:SetVisible(true)
				end)
				end
			elseif (tbl[i]["gear"]== "true" or tbl[i]["scrap"]== "true") and tbl[i]["rarity"] == "legendary" then
				-- function DermaButton:Paint( w, h )
					-- draw.RoundedBox( 8, 0, 0, w, h, Color( 200, 100, 0 ) )
				-- end
				
				
				if pressed == false then
					-- tip:SetPos(gui.MousePos())
					timer.Simple(1,function()
						panel:SetBackgroundColor( color )
						icon:SetModel(model)
						looted = true
						chat.AddText( Color( 200, 255, 100 ), "[LOOT] ("..tostring(i).."): ", color, tostring(msg) )
						-- tip:SetVisible(true)

					end)
				end
			else
				-- function DermaButton:Paint( w, h )
					-- draw.RoundedBox( 8, 0, 0, w, h, Color( 200, 200, 200 ) )
				-- end
				-- color = Color( 240, 240, 240 )
				
				if pressed == false then
					-- tip:SetPos(gui.MousePos())
					timer.Simple(1,function()
						panel:SetBackgroundColor( color )
						icon:SetModel(model)
						looted = true
						chat.AddText( Color( 200, 255, 100 ), "[LOOT] ("..tostring(i).."): ", color, tostring(msg) )
						-- tip:SetVisible(true)
					end)
				end
			end
			
			pressed = true
		end
		
	end
	
	-- if DermaButton:IsHovered() then
		-- MY_TOOLTIP:SetVisible(true)
		-- MY_TOOLTIP:SetPos(DermaButton:GetPos())
	-- else
		-- MY_TOOLTIP:SetVisible(false)
	-- end
	
	

	-- function MY_TOOLTIP:Paint( w, h )
		-- local x = gui.MouseX()+10
		-- local y = gui.MouseY()+24
		-- MY_TOOLTIP:SetPos( x, y )
		-- if EOTI.Stats:IsChildHovered() then
			-- draw.RoundedBoxEx( EOTI.Menu.corner, 0, 0, w, h, EOTI.Menu.color, false, true, true, true )
		-- end
	-- end
	
	-- timer.Simple(10,function() List:Remove() end)
end