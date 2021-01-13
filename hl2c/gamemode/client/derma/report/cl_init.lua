local hl2c_report = {
	ReportSizeW = 450,
	ReportSizeH = 320,
	ReportTitle = "Report Window",
	Report = nil,
	--ReportType = Hl2c.reports,
	ReportPlayerTip = "Tip: Type what you expected what the player caused to you to report him. But do not create a report if he did nothing wrong to you. You must select Player Name and Reason then detail what happened."

}

local ReportTitle = hl2c_report.ReportTitle
local ReportPlayerTip = hl2c_report.ReportPlayerTip
local ReportSizeW = hl2c_report.ReportSizeW 
local ReportSizeH = hl2c_report.ReportSizeH 

function OpenReportWindow()
	
	local Report = vgui.Create( "DFrame" )
	--StatWindow:SetPos( 100, 100 )
	Report:SetSize( ReportSizeW, ReportSizeH )
	Report:SetTitle( ReportTitle )
	Report:SetDraggable( true )
	Report:Center()
	Report:MakePopup()
	
	local Reportsheet = vgui.Create( "DPropertySheet", Report )
	Reportsheet:Dock( FILL )
	
	for i=1,1 do
		


		local panel = vgui.Create( "DPanel", Reportsheet )
		panel:SetBackgroundColor(Color(0,0,0,0))
		--panel.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) ) end
		Reportsheet:AddSheet( "Player", panel )
		
		
		local cb_player = vgui.Create( "DComboBox", panel )
		cb_player:SetPos( 10, 30 )
		cb_player:SetSize( 100, 20 )
		--cb_player:SetValue( "options" )
		for k, v in pairs(player.GetAll()) do
			if IsValid(v) then
				cb_player:AddChoice( v:Nick() )
			end
		end
		cb_player:SetValue( cb_player:GetOptionText( 1 ) )
		
		local lb_player = vgui.Create( "DLabel", panel )
		lb_player:SetPos( 10, 10 )
		lb_player:SetColor( Color(255, 255, 255))
		lb_player:SetText( "Player Name:" )
		
		local cb_type = vgui.Create( "DComboBox", panel )
		cb_type:SetPos( 130, 30 )
		cb_type:SetSize( 100, 20 )
		--cb_type:SetValue( "options" )
		for k, v in pairs(Hl2c.reports) do
			cb_type:AddChoice( v )
		end
		cb_type:SetValue( cb_type:GetOptionText( 1 ) )
		
		local cb_reason = vgui.Create( "DLabel", panel )
		cb_reason:SetPos( 130, 10 )
		cb_reason:SetColor( Color(255, 255, 255))
		cb_reason:SetText( "Reason:" )
		
		local te_detail = vgui.Create( "DTextEntry", panel )	-- create the form as a child of frame
		te_detail:SetPos( 10, 90 )
		te_detail:SetSize( 300, 100 )
		te_detail:SetText( "Detail your Report Please!" )
		te_detail:SetWrap(true)
		--te_detail.OnEnter = function( self )
		--	chat.AddText( self:GetValue() )	-- print the form's text as server text
		--end
		te_detail:SetVerticalScrollbarEnabled( true )
		te_detail:SetMultiline( true )
		
		local lb_detail = vgui.Create( "DLabel", panel )
		lb_detail:SetPos( 10, 70 )
		lb_detail:SetColor( Color(255, 255, 255))
		lb_detail:SetText( "Detail:" )
		
		local lb_tip = vgui.Create( "DLabel", panel )
		lb_tip:SetPos( 10, 195 )
		lb_tip:SetSize( 280, 330 )
		lb_tip:SetColor( Color(255, 255, 255))
		lb_tip:SetContentAlignment( 7 )
		lb_tip:SetWrap( true )
		lb_tip:SetAutoStretchVertical( true )
		lb_tip:SetText( ReportPlayerTip )
		
		local bt_send = vgui.Create( "DButton", panel )
		bt_send:SetPos( 320, 200 )
		bt_send:SetText( "Send Report!" )
		bt_send:SetSize( 90, 25 )
	end	
	//
	for i=1,1 do
	

		local panel = vgui.Create( "DPanel", Reportsheet )
		--panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) ) end
		panel:SetBackgroundColor(Color(0,0,0,0))
		Reportsheet:AddSheet( "Map", panel )
		// PANEL2 Map
		local cb_player = vgui.Create( "DComboBox", panel )
		cb_player:SetPos( 10, 30 )
		cb_player:SetSize( 100, 20 )
		--cb_player:SetValue( "options" )
		for k, v in pairs(player.GetAll()) do
			cb_player:AddChoice( v:Nick() )
		end
		cb_player:SetValue( cb_player:GetOptionText( 1 ) )
		
		local lb_player = vgui.Create( "DLabel", panel )
		lb_player:SetPos( 10, 10 )
		lb_player:SetColor( Color(255, 255, 255))
		lb_player:SetText( "Player Name:" )
		
		local cb_type = vgui.Create( "DComboBox", panel )
		cb_type:SetPos( 130, 30 )
		cb_type:SetSize( 100, 20 )
		--cb_type:SetValue( "options" )
		for k, v in pairs(Hl2c.reports) do
			cb_type:AddChoice( v )
		end
		cb_type:SetValue( cb_type:GetOptionText( 1 ) )
		
		local lb_reason = vgui.Create( "DLabel", panel )
		lb_reason:SetPos( 130, 10 )
		lb_reason:SetColor( Color(255, 255, 255))
		lb_reason:SetText( "Reason:" )
		
		local te_detail = vgui.Create( "DTextEntry", panel )	-- create the form as a child of frame
		te_detail:SetPos( 10, 90 )
		te_detail:SetSize( 300, 100 )
		te_detail:SetText( "Detail your Report Please!" )
		te_detail:SetWrap(true)
		--te_detail.OnEnter = function( self )
		--	chat.AddText( self:GetValue() )	-- print the form's text as server text
		--end
		te_detail:SetVerticalScrollbarEnabled( true )
		te_detail:SetMultiline( true )
		
		local lb_detail = vgui.Create( "DLabel", panel )
		lb_detail:SetPos( 10, 70 )
		lb_detail:SetColor( Color(255, 255, 255))
		lb_detail:SetText( "Detail:" )
		
		local lb_tip = vgui.Create( "DLabel", panel )
		lb_tip:SetPos( 10, 195 )
		lb_tip:SetSize( 280, 330 )
		lb_tip:SetColor( Color(255, 255, 255))
		lb_tip:SetContentAlignment( 7 )
		lb_tip:SetWrap( true )
		lb_tip:SetAutoStretchVertical( true )
		lb_tip:SetText( ReportPlayerTip )
		
		local bt_send = vgui.Create( "DButton", panel )
		bt_send:SetPos( 320, 200 )
		bt_send:SetText( "Send Report!" )
		bt_send:SetSize( 90, 25 )

	end
	
	for i=1,1 do
	
	

		local panel = vgui.Create( "DPanel", Reportsheet )
		--panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) ) end
		panel:SetBackgroundColor(Color(0,0,0,0))
		Reportsheet:AddSheet( "Error", panel )
		// PANEL3 Error
		local cb_player = vgui.Create( "DComboBox", panel )
		cb_player:SetPos( 10, 30 )
		cb_player:SetSize( 100, 20 )
		--cb_player:SetValue( "options" )
		for k, v in pairs(player.GetAll()) do
			cb_player:AddChoice( v:Nick() )
		end
		cb_player:SetValue( cb_player:GetOptionText( 1 ) )
		
		local lb_player = vgui.Create( "DLabel", panel )
		lb_player:SetPos( 10, 10 )
		lb_player:SetColor( Color(255, 255, 255))
		lb_player:SetText( "Player Name:" )
		
		local cb_reason = vgui.Create( "DComboBox", panel )
		cb_reason:SetPos( 130, 30 )
		cb_reason:SetSize( 100, 20 )
		--cb_reason:SetValue( "options" )
		for k, v in pairs(Hl2c.reports) do
			cb_reason:AddChoice( v )
		end
		cb_reason:SetValue( cb_reason:GetOptionText( 1 ) )
		
		local lb_reason = vgui.Create( "DLabel", panel )
		lb_reason:SetPos( 130, 10 )
		lb_reason:SetColor( Color(255, 255, 255))
		lb_reason:SetText( "Reason:" )
		
		local te_detail = vgui.Create( "DTextEntry", panel )	-- create the form as a child of frame
		te_detail:SetPos( 10, 90 )
		te_detail:SetSize( 300, 100 )
		te_detail:SetText( "Detail your Report Please!" )
		te_detail:SetWrap(true)
		--te_detail.OnEnter = function( self )
		--	chat.AddText( self:GetValue() )	-- print the form's text as server text
		--end
		te_detail:SetVerticalScrollbarEnabled( true )
		te_detail:SetMultiline( true )
		
		local lb_detail = vgui.Create( "DLabel", panel )
		lb_detail:SetPos( 10, 70 )
		lb_detail:SetColor( Color(255, 255, 255))
		lb_detail:SetText( "Detail:" )
		
		local lb_tip = vgui.Create( "DLabel", panel )
		lb_tip:SetPos( 10, 195 )
		lb_tip:SetSize( 280, 330 )
		lb_tip:SetColor( Color(255, 255, 255))
		lb_tip:SetContentAlignment( 7 )
		lb_tip:SetWrap( true )
		lb_tip:SetAutoStretchVertical( true )
		lb_tip:SetText( ReportPlayerTip )
		
		local db_send = vgui.Create( "DButton", panel )
		db_send:SetPos( 320, 200 )
		db_send:SetText( "Send Report!" )
		db_send:SetSize( 90, 25 )
		
	end
	
	/*
	local Report_Panel01 = vgui.Create("DPanel",Report)
	Report_Panel01:SetPos(7,30)
	Report_Panel01:SetSize( 120, 225 )
	Report_Panel01:SizeToContents() 
	--Report_Panel01:SetBackgroundColor( Color(0,0,0,0) )
	
	
	local Report_Grid01 = vgui.Create( "DGrid", Report_Panel01 )
	Report_Grid01:SetPos( 5, 5 )
	Report_Grid01:SetCols( 1 )
	Report_Grid01:SetColWide( 120 )
	Report_Grid01:SetRowHeight(30)
	
	local Report_But01 = vgui.Create( "DButton" )
	Report_But01:SetPos( 40, 40 )
	Report_But01:SetText( "Player" )
	Report_But01:SetSize( 110, 25 )
	Report_But01.DoClick = function()
		//print( "Button was clicked!" )
	end
	Report_Grid01:AddItem( Report_But01 )
	
	local Report_But01 = vgui.Create( "DButton" )
	Report_But01:SetPos( 40, 40 )
	Report_But01:SetText( "Map" )
	Report_But01:SetSize( 110, 25 )
	Report_But01.DoClick = function()
		//print( "Button was clicked!" )
	end
	Report_Grid01:AddItem( Report_But01 )
	
	local Report_But01 = vgui.Create( "DButton" )
	Report_But01:SetPos( 40, 40 )
	Report_But01:SetText( "Error" )
	Report_But01:SetSize( 110, 25 )
	Report_But01.DoClick = function()
		//print( "Button was clicked!" )
	end
	Report_Grid01:AddItem( Report_But01 )
	*/
	
	
end

net.Receive("ReportWindow", OpenReportWindow ) 