
local PANEL = {
	
	Init = function(self)
		local selected_id = ""
		local selected_id2 = ""
		self:SetSize( 800, 600 )
		self:Center()
		self:SetVisible(true)
		-- self:SetMouseInputEnabled(false)
		self:MakePopup()
		//gui.EnableScreenClicker( true )
		
		local x,y = self:GetSize()
		
		local button = vgui.Create("DButton", self)
		button:SetText("")
		button:SetSize( 31, 31 )
		button:SetPos( x-32, 1.5 )
		button.DoClick = function()
			self:SetVisible(false)
			gui.EnableScreenClicker( false )
			-- Derma_Message( "You have closed the Admin Menu!", "Info", "OK" )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		button.Paint = function(button, w, h)
			if button:IsDown() then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 0, 255 ) )
			surface.SetDrawColor( 255, 255, 0, 255)
			surface.SetFont( "arial32" )
			surface.SetTextColor( 0, 0, 0, 150 )
			local w2,h2 = surface.GetTextSize("X")
			surface.SetTextPos( w/2 - w2/2, h/2 - h2/2 )
			surface.DrawText( "X" )
			elseif button:IsHovered() then
			draw.RoundedBox( 0, 0, 0, w, h, Color( 255, 255, 0, 255 ) )
			surface.SetDrawColor( 255, 255, 0, 255)
			surface.SetFont( "arial32" )
			surface.SetTextColor( 0, 0, 0, 150 )
			local w2,h2 = surface.GetTextSize("X")
			surface.SetTextPos( w/2 - w2/2, h/2 - h2/2 )
			surface.DrawText( "X" )
			else
			-- draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) )
			surface.SetDrawColor( 255, 255, 0, 255)
			surface.DrawOutlinedRect( 0, 0, w, h )
			surface.SetFont( "arial32" )
			surface.SetTextColor( 255, 255, 0, 255 )
			local w2,h2 = surface.GetTextSize("X")
			surface.SetTextPos( w/2 - w2/2, h/2 - h2/2 )
			surface.DrawText( "X" )
			end
		end

		local sheet = vgui.Create("DColumnSheet", self)
		
		sheet:Dock(FILL)
		
		/*---------
		Panel: Options ( edit gamemode choose map remove stuff )
		-----------*/
		local s_panel1 = vgui.Create("DPanel", sheet)
		s_panel1:Dock(FILL)
		sheet:DockMargin( 0, 40, 40, 40 )
		s_panel1.Paint = function(s_panel1, w, h)
			-- draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) )
			surface.SetDrawColor( 255, 255, 0, 255)
			surface.DrawOutlinedRect(0, 0, w, h)
			-- body
		end
		sheet:AddSheet( "Server Management", s_panel1 )
		
		
		
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Restart Map")
		local t1, t2 = surface.GetTextSize("Restart Map")
		button:SetSize( t1, 31 )
		button:SetPos( 50, 50 )
		button.DoClick = function()
			RunConsoleCommand("hl2c_restart_map")
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Go Lobby")
		local t1, t2 = surface.GetTextSize("Go Lobby")
		button:SetSize( t1, 31 )
		button:SetPos( 140, 50 )
		button.DoClick = function()
			RunConsoleCommand("hl2c","lobby")
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Nextmap")
		local t1, t2 = surface.GetTextSize("Nextmap")
		button:SetSize( t1, 31 )
		button:SetPos( 210, 50 )
		button.DoClick = function()
			RunConsoleCommand("hl2c","nextmap")
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Slay Player")
		local t1, t2 = surface.GetTextSize("Slay Player")
		button:SetSize( t1, 31 )
		button:SetPos( 50, 100 )
		button.DoClick = function()
			RunConsoleCommand("hl2c","slay",tostring(selected_id))
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Ban Player")
		local t1, t2 = surface.GetTextSize("Ban Player")
		button:SetSize( t1, 31 )
		button:SetPos( 50, 150 )
		button.DoClick = function()
			RunConsoleCommand("hl2c","ban",tostring(selected_id),"Kicked By Hl2c Admin",0)
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Kick Player")
		local t1, t2 = surface.GetTextSize("Kick Player")
		button:SetSize( t1, 31 )
		button:SetPos( 50, 200 )
		button.DoClick = function()
			RunConsoleCommand("hl2c","kick",tostring(selected_id),"Kicked By Hl2c Admin")
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		
		local DComboBox = vgui.Create( "DComboBox", s_panel1 ) -- create the form as a child of frame
		DComboBox:SetPos( 50, 250 )
		DComboBox:SetSize( 200, 30 )
		-- DComboBox:SetText( "" )
		-- DComboBox:SetEditable( true )
		-- DComboBox:SetUpdateOnType( true )
		DComboBox:SetDisabled( false )
		for k, v in pairs(Hl2c.GameTypes) do
			DComboBox:AddChoice(k)
		end
		DComboBox:SetValue(DComboBox:GetOptionText( 1 ))
		-- DComboBox.OnEnter = function( self )
			--RunConsoleCommand( "hl2c_map",self:GetValue() )	-- print the form's text as server text
		-- end
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Go")
		local t1, t2 = surface.GetTextSize("Go")
		button:SetSize( t1, 31 )
		button:SetPos( 250, 250 )
		button.DoClick = function()
			RunConsoleCommand("hl2c_map", DComboBox:GetOptionText( DComboBox:GetSelectedID() ) )
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		local DComboBox = vgui.Create( "DComboBox", s_panel1 ) -- create the form as a child of frame
		DComboBox:SetPos( 50, 300 )
		DComboBox:SetSize( 200, 30 )
		DComboBox:SetText( "" )
		-- DTextEntry:AllowInput( true )
		-- DTextEntry:SetEditable( true )
		-- DTextEntry:SetUpdateOnType( true )
		DComboBox:SetDisabled( false )
		-- DTextEntry.OnEnter = function( self )
			--RunConsoleCommand( "hl2c_map",self:GetValue() )	-- print the form's text as server text
		-- end
		local button = vgui.Create("DButton", s_panel1)
		button:SetText("Go")
		local t1, t2 = surface.GetTextSize("Go")
		button:SetSize( t1, 31 )
		button:SetPos( 250, 300 )
		button.DoClick = function()
			RunConsoleCommand("hl2c","unban", DComboBox:GetValue() )
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		
		
		local AppList = vgui.Create( "DListView", s_panel1 )
		
		AppList:DockMargin( 300, 20, 30, 40 )
		AppList:DockPadding( 300, 30, 20, 10 )
		AppList:Dock( FILL )
		-- AppList:SizeToContents()

		AppList:SetMultiSelect( false )
		AppList:AddColumn( "Name" )
		AppList:AddColumn( "ID" )
		local playerlist={}
		AppList.Think = function()
			
			for i, pl in pairs(player.GetAll()) do
				if playerlist[pl:SteamID()]!= pl then
					playerlist[pl:SteamID()]=pl
					AppList:AddLine(pl:Name(), pl:SteamID() ) 
				end
			end
			
		end
		
		AppList.OnRowSelected = function( lst, index, pnl )
			selected_id=tostring(pnl:GetColumnText( 2 ))
		end
		
		
		local panel = vgui.Create("DPanel", sheet)
		panel:Dock(FILL)
		sheet:DockMargin( 0, 40, 40, 40 )
		panel.Paint = function(panel, w, h)
			-- draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) )
			surface.SetDrawColor( 255, 255, 0, 255)
			surface.DrawOutlinedRect(0, 0, w, h)
			-- body
		end
		sheet:AddSheet( "Admin Management", panel )
		
		local AppList = vgui.Create( "DListView", panel )
		
		AppList:DockMargin( 300, 20, 30, 40 )
		AppList:DockPadding( 300, 30, 20, 10 )
		AppList:Dock( FILL )
		-- AppList:SizeToContents()

		AppList:SetMultiSelect( false )
		AppList:AddColumn( "Name" )
		AppList:AddColumn( "ID" )
		local playerlist={}
		AppList.Think = function()
			
			for k, v in pairs(Hl2c.BANS) do
				if playerlist[v]!= v and v!= "STEAM_0:1:000000" then
					playerlist[v]=v
					AppList:AddLine("UNNAMED", v )
				end
			end
			
		end
		
		AppList.OnRowSelected = function( lst, index, pnl )
			selected_id2=tostring(pnl:GetColumnText( 2 ))
		end
		local button = vgui.Create("DButton", panel)
		button:SetText("Unban")
		local t1, t2 = surface.GetTextSize("Restart Map")
		button:SetSize( t1, 31 )
		button:SetPos( 50, 50 )
		button.DoClick = function()
			RunConsoleCommand("hl2c","unban",selected_id2)
			-- PrintTable(Hl2c.BANS)
			AppList:Clear()
			-- if table.HasValue(Hl2c.BANS,selected_id2) then for k, v in pairs(Hl2c.BANS) do if v == selected_id2 then table.remove(Hl2c.Bans,k) end end end
			Hl2c.BANS[selected_id2]=nil
			playerlist[selected_id2]=nil
			-- table.RemoveByValue(playerlist,selected_id2)
			
			-- self:SetVisible(false)
			-- gui.EnableScreenClicker( false )
			-- self:SetMouseInputEnabled(true)
			-- print("working?")
		end
		/*---------
		Panel: Achievements ( Give/Remove Achievements / Add new Achievements )
		-----------*/

		/*---------
		Panel: Other ( )
		-----------*/


	end,
	
	
	Paint = function(self, w, h)
		
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
		surface.SetDrawColor( 255, 255, 0)
		surface.DrawOutlinedRect( 1, 1, w-2, h-2 )
		-- surface.DrawLine( 770, 2, 770, 32 )
		-- surface.DrawLine( 770, 32, 800, 32 )
		
	end
	
	
	
}
vgui.Register("hl2c_admin_menu", PANEL)