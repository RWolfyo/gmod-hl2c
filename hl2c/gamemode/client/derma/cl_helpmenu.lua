// Called by show help
function ShowHelp()
	local helpText = [[-= KEYBOARD SHORTCUTS =-
	[F1] (Show Help) - Opens this menu.
	[F2] (Show Team) - Toggles the navigation marker on your HUD.
	[F3] (Spare 1) - Spawns a vehicle if allowed.
	[F4] (Spare 2) - Removes a vehicle if you have one.]]
	
	local helpMenu = vgui.Create("DFrame")
	local helpPanel = vgui.Create("DPanel", helpMenu)
	local helpLabel = vgui.Create("DLabel", helpPanel)
	
	helpLabel:SetText(helpText)
	helpLabel:SetTextColor(color_black)
	helpLabel:SizeToContents()
	helpLabel:SetPos(5, 5)
	
	local w, h = helpLabel:GetSize()
	helpMenu:SetSize(w + 10, h + 10)
	
	helpPanel:StretchToParent(5, 28, 5, 5)
	
	helpMenu:SetTitle("Half-Life 2 Campaign Help")
	helpMenu:Center()
	helpMenu:MakePopup()
	helpMenu:SetKeyboardInputEnabled( false )
	helpMenu:SetMouseInputEnabled( false )
end

--net.Receive("ShowHelp", function(len)
function Show_Help()
--function ShowHelp()
--hook.Add("ShowHelp", function()
	local jatekos = LocalPlayer()
	local helpText = [[
-= CREDITS =-
AMT - Original creator
daunknownman2010

]]
	--New HUD:\n\nHeroes Halo:\n\nCitizens Halo:\n\nCombines Halo:\n\nPlayers Halo:\n\nAntlions Halo:\n\nZombie/Headcrab Halo:\n\nVortigaunts Halo:
	
	local helpMenu = vgui.Create("DFrame")
	
	
	local ice_sheet = vgui.Create( "DColumnSheet", helpMenu )
	ice_sheet:Dock( FILL )
	if LocalPlayer():IsPlayer() and LocalPlayer():IsAdmin() then
	ice_sheet.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h-280, Color( 208, 166, 0 ) ) end
	elseif LocalPlayer():IsPlayer() and !LocalPlayer():IsAdmin() then
	ice_sheet.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h-300, Color( 208, 166, 0 ) ) end
	end

	local ice_panel1 = vgui.Create( "DPanel", ice_sheet )
	ice_panel1:Dock( FILL )
	ice_panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 249, 199, 0 ) ) end
	ice_sheet:AddSheet( "Help", ice_panel1, "icon16/cross.png" )
	local tab_stat = vgui.Create( "DPanel", ice_sheet )
	tab_stat:Dock( FILL )
	tab_stat.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 249, 199, 0 ) ) end
	ice_sheet:AddSheet( "Stat", tab_stat, "icon16/cross.png" )

	local ice_panel2 = vgui.Create( "DPanel", ice_sheet )
	ice_panel2:Dock( FILL )
	function ice_panel2:Paint( w, h )
	draw.RoundedBox( 4, 0, 0, w, h, Color( 249, 199, 0 ) )
	--ice_panel2.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 249, 199, 0 ) ) end
	draw.RoundedBox(4, 7, 12, 160, 23, Color(208, 166, 0) )
	draw.RoundedBox(4, 7, 37, 160, 23, Color(208, 166, 0) )
	draw.RoundedBox(4, 7, 62, 160, 23, Color(208, 166, 0) )
	draw.RoundedBox(4, 7, 87, 160, 23, Color(208, 166, 0) )
	draw.RoundedBox(4, 7, 112, 160, 23, Color(208, 166, 0) )
	draw.RoundedBox(4, 7, 137, 160, 23, Color(208, 166, 0) )
	draw.RoundedBox(4, 7, 163, 160, 23, Color(208, 166, 0) )
	--draw.RoundedBox(4, 7, 162, 160, 23, Color(208, 166, 0) )
	--draw.RoundedBox(4, 7, 187, 160, 23, Color(208, 166, 0) )
	--draw.RoundedBox(4, 7, 212, 160, 23, Color(208, 166, 0) )
	--draw.RoundedBox(4, 7, 237, 160, 23, Color(208, 166, 0) )
	end
	ice_sheet:AddSheet( "Options", ice_panel2, "icon16/tick.png" )
	
	/*local ice_panel3 = vgui.Create( "DPanel", ice_sheet )
	ice_panel3:Dock( FILL )
	ice_panel3.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 249, 199, 0 ) ) end
	ice_sheet:AddSheet( "Models", ice_panel3, "icon16/tick.png" )*/
	
	--local ice_shop = vgui.Create( "DPanel", ice_shop )
	--ice_shop:Dock( FILL )
	--ice_shop.Paint
	--function ice_shop:Paint( w, h )
	--draw.RoundedBox( 4, 0, 0, w, h, Color( 249, 199, 0 ) )
	--end
	--ice_sheet:AddSheet( "Shop Menu", ice_shop, "icon16/tick.png" )
	
	-- local ice_admin = vgui.Create( "DPanel", ice_sheet )
	-- ice_admin:Dock( FILL )
	-- ice_admin.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 249, 199, 0 ) ) end
	-- ice_sheet:AddSheet( "Admin Menu", ice_admin, "icon16/tick.png" )
	
	--local helpPanel = vgui.Create("DPanel", ice_panel1)
	local helpLabel = vgui.Create("DLabel", ice_panel1)
	--local Openmymodelmenu = vgui.Create("DButton", ice_panel2)
	--local Icechud = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	local Icechud_labe = vgui.Create( "DLabel", ice_panel2 )// Create the checkbox
	--local buy_airboatgun = vgui.Create("DButton", ice_shop)
	--local buy_suitrecharger = vgui.Create("DButton", ice_shop)
	--local buy_invincibility = vgui.Create("DButton", ice_shop)
	--local buy_hprecharger = vgui.Create("DButton", ice_shop)
	--local buy_ioncannon = vgui.Create("DButton", ice_shop)
	--local buy_csniper = vgui.Create("DButton", ice_shop)
	--local buy_gr9 = vgui.Create("DButton", ice_shop)
	--local buy_mgun = vgui.Create("DButton", ice_shop)
	--if LocalPlayer():IsAdmin() then
	--local Openmymodelmenu = vgui.Create("DButton", ice_admin)
	--local Open_SpawnMenu = vgui.Create("DButton", ice_admin)
	--end
	
	
	helpLabel:SetText(helpText)
	helpLabel:SetTextColor(color_black)
	helpLabel:Dock(FILL)
	helpLabel:DockMargin( 20,0,0,250 )
	//helpLabel:SetSize(600,300)
	helpLabel:SetContentAlignment( 5 )
	//helpLabel:SetWrap( true )
	//helpLabel:SetAutoStretchVertical( true )
	
	local ListView = vgui.Create( "DListView", ice_panel1 )
	ListView:Dock( FILL )
	ListView:DockMargin( 10, 100, 10, 10 )
	ListView:DockPadding( 10, 100, 10, 10 )
	ListView:SetMultiSelect( false )
	ListView:AddColumn( "Button" )
	ListView:AddColumn( "Chat" )
	ListView:AddColumn( "Console" )
	ListView:AddColumn( "Description" )
	
	
	ListView:AddLine("F1","","","Help Menu")
	ListView:AddLine("F2","","","Upgrade Menu")
	ListView:AddLine("F3","","","Spawn Car")
	ListView:AddLine("F4","","","Remove Car")
	ListView:AddLine("I","","hl2c_inventory","Inventory")
	ListView:AddLine("C","","","Voice Menu")
	ListView:AddLine("0","","","Spawn Menu")
	ListView:AddLine("","!nextmap","","Vote for nextmap if you stuck or bored")
	ListView:AddLine("","!lobby","","Vote for lobby if you wanna start something else from lobby map")
	ListView:AddLine("","!difficulty","","Vote for difficulty if you wanna find some challange.")
	ListView:AddLine("","!squad create","","Create squad")
	ListView:AddLine("","!squad leave","","Leave squad")
	ListView:AddLine("","!squad join NUMBER","","Join squad by ID")
	ListView:AddLine("","!squad list","","List existing squads")
	ListView:AddLine("","!petsummon","hl2c_petsummon","Summon your pet")
	ListView:AddLine("","!pet","hl2c_pet","Open pet selection menu")
	ListView:AddLine("","!petname","hl2c_petname","Set your pet name")
	ListView:AddLine("","!petfollow","hl2c_petfollow","Set your pet follow u")
	ListView:AddLine("","!petstopfollow","hl2c_petstopfollow","Set your pet to stop following")
	ListView:AddLine("","!petremove","hl2c_petremove","Dismiss your pet")
	ListView:AddLine("","!admin","hl2c_admin","Call admin menu")
	
	local w, h = ice_panel1:GetSize()
	--helpMenu:SetSize(600, 400)
	
	--helpPanel:StretchToParent(5, 28, 5, 5)
	--helpPanel:SetSize(459,355)
	--helpPanel:SetPos(5, 5)
	helpMenu:SetSize(600, 400)
	helpMenu:SetTitle("                                             Half-Life 2 Campaign Menu")
	helpMenu:Center()
	helpMenu.Paint = function(self, w, h) draw.RoundedBox(8, 115, 0, w, h, Color(208, 166, 0) ) end
	helpMenu:MakePopup()
	
	--local Openmymodelmenu = vgui.Create("DButton", ice_admin)
	/*	
	buy_suitrecharger:SetSize(75, 20)
	buy_suitrecharger:SetPos(10, 195)
	buy_suitrecharger:SetText("Suit Recharge") --Set the name of the button
	buy_suitrecharger.DoClick = function() RunConsoleCommand("hl2c_buy_suitrecharger", "hl2c_buy_suitrecharger") end
	
	buy_hprecharger:SetSize(75, 20)
	buy_hprecharger:SetPos(100, 195)
	buy_hprecharger:SetText("HP Recharge") --Set the name of the button
	buy_hprecharger.DoClick = function() RunConsoleCommand("hl2c_buy_hprecharger", "hl2c_buy_hprecharger") end
	
	buy_invincibility:SetSize(75, 20)
	buy_invincibility:SetPos(190, 195)
	buy_invincibility:SetText("Invincibility") --Set the name of the button
	buy_invincibility.DoClick = function() RunConsoleCommand("hl2c_buy_invincibility", "hl2c_buy_invincibility") end
	
	buy_airboatgun:SetSize(75, 20)
	buy_airboatgun:SetPos(100, 105)
	buy_airboatgun:SetText("Airboatgun") --Set the name of the button
	buy_airboatgun.DoClick = function() RunConsoleCommand("hl2c_buy_airboatgun", "hl2c_buy_airboatgun") end
	
	buy_ioncannon:SetSize(75, 20)
	buy_ioncannon:SetPos(10, 105)
	buy_ioncannon:SetText("Ioncannon") --Set the name of the button
	buy_ioncannon.DoClick = function() RunConsoleCommand("hl2c_buy_ioncannon", "hl2c_buy_ioncannon") end
	
	buy_csniper:SetSize(75, 20)
	buy_csniper:SetPos(190, 105)
	buy_csniper:SetText("Sniper") --Set the name of the button
	buy_csniper.DoClick = function() RunConsoleCommand("hl2c_buy_csniper", "hl2c_buy_csniper") end
	
	buy_gr9:SetSize(75, 20)
	buy_gr9:SetPos(280, 105)
	buy_gr9:SetText("Gr9") --Set the name of the button
	buy_gr9.DoClick = function() RunConsoleCommand("hl2c_buy_gr9", "hl2c_buy_gr9") end
	
	local buy_ammo_pistol = vgui.Create("DButton", ice_shop)
	buy_ammo_pistol:SetSize(85, 20)
	buy_ammo_pistol:SetPos(10, 270)
	buy_ammo_pistol:SetText("Pistol Ammo") --Set the name of the button
	buy_ammo_pistol.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_pistol", "hl2c_buy_ammo_pistol") end
	
	local buy_ammo_357 = vgui.Create("DButton", ice_shop)
	buy_ammo_357:SetSize(85, 20)
	buy_ammo_357:SetPos(10, 300)
	buy_ammo_357:SetText("357 Ammo") --Set the name of the button
	buy_ammo_357.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_357", "hl2c_buy_ammo_357") end
	
	local buy_ammo_smg = vgui.Create("DButton", ice_shop)
	buy_ammo_smg:SetSize(85, 20)
	buy_ammo_smg:SetPos(100, 270)
	buy_ammo_smg:SetText("Smg Ammo") --Set the name of the button
	buy_ammo_smg.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_smg", "hl2c_buy_ammo_smg") end
	
	local buy_ammo_ar2 = vgui.Create("DButton", ice_shop)
	buy_ammo_ar2:SetSize(85, 20)
	buy_ammo_ar2:SetPos(100, 300)
	buy_ammo_ar2:SetText("Ar2 Ammo") --Set the name of the button
	buy_ammo_ar2.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_ar2", "hl2c_buy_ammo_ar2") end
	
	local buy_ammo_buckshot = vgui.Create("DButton", ice_shop)
	buy_ammo_buckshot:SetSize(85, 20)
	buy_ammo_buckshot:SetPos(190, 270)
	buy_ammo_buckshot:SetText("Shotgun Ammo") --Set the name of the button
	buy_ammo_buckshot.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_buckshot", "hl2c_buy_ammo_buckshot") end
	
	local buy_ammo_xbowbolt = vgui.Create("DButton", ice_shop)
	buy_ammo_xbowbolt:SetSize(85, 20)
	buy_ammo_xbowbolt:SetPos(190, 300)
	buy_ammo_xbowbolt:SetText("Crossbow Ammo") --Set the name of the button
	buy_ammo_xbowbolt.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_xbowbolt", "hl2c_buy_ammo_xbowbolt") end
	--hl2c_buy_ammo_xbowbolt
	*/
	--if !LocalPlayer():IsAdmin() then
	local Icechud = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	Icechud:SetPos( 148, 15 )// Set the position
	if GetConVarNumber( "hl2c_custom_hud" ) == 1 then 
		Icechud:SetValue( 1 )// Initial value ( will determine whether the box is ticked too )
	else
		Icechud:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	end
	function Icechud:OnChange( bVal )
		if ( bVal ) then
			--print( "Checked!" )
			RunConsoleCommand("hl2c_custom_hud", "1")
		else
			--print( "Unchecked!" )
			RunConsoleCommand("hl2c_custom_hud", "0")
		end
	end
	
	local Icechud2 = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	Icechud2:SetPos( 148, 42 )// Set the position
	if GetConVarNumber( "hl2c_vital_npc_halo" ) == 1 then 
		Icechud2:SetValue( 1 )// Initial value ( will determine whether the box is ticked too )
	else
		Icechud2:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	end
	function Icechud2:OnChange( bVal )
		if ( bVal ) then
			--print( "Checked!" )
			RunConsoleCommand("hl2c_vital_npc_halo", "1")
		else
			--print( "Unchecked!" )
			RunConsoleCommand("hl2c_vital_npc_halo", "0")
		end
	end
	
	local Icechud3 = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	Icechud3:SetPos( 148, 66 )// Set the position
	if GetConVarNumber( "hl2c_citizen_npc_halo" ) == 1 then 
		Icechud3:SetValue( 1 )// Initial value ( will determine whether the box is ticked too )
	else
		Icechud3:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	end
	function Icechud3:OnChange( bVal )
		if ( bVal ) then
			--print( "Checked!" )
			RunConsoleCommand("hl2c_citizen_npc_halo", "1")
		else
			--print( "Unchecked!" )
			RunConsoleCommand("hl2c_citizen_npc_halo", "0")
		end
	end
	
	local Icechud4 = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	Icechud4:SetPos( 148, 90 )// Set the position
	if GetConVarNumber( "hl2c_combine_npc_halo" ) == 1 then 
		Icechud4:SetValue( 1 )// Initial value ( will determine whether the box is ticked too )
	else
		Icechud4:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	end
	function Icechud4:OnChange( bVal )
		if ( bVal ) then
			--print( "Checked!" )
			RunConsoleCommand("hl2c_combine_npc_halo", "1")
		else
			--print( "Unchecked!" )
			RunConsoleCommand("hl2c_combine_npc_halo", "0")
		end
	end
	
	local Icechud5 = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	Icechud5:SetPos( 148, 117 )// Set the position
	if GetConVarNumber( "hl2c_player_halo" ) == 1 then 
		Icechud5:SetValue( 1 )// Initial value ( will determine whether the box is ticked too )
	else
		Icechud5:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	end
	function Icechud5:OnChange( bVal )
		if ( bVal ) then
			--print( "Checked!" )
			RunConsoleCommand("hl2c_player_halo", "1")
		else
			--print( "Unchecked!" )
			RunConsoleCommand("hl2c_player_halo", "0")
		end
	
	end
	--hl2c_custom_targetid
	local Icechud6 = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	Icechud6:SetPos( 148, 141 )// Set the position
	if GetConVarNumber( "hl2c_custom_targetid" ) == 1 then 
		--print("hl2c_custom_targetid 1")
		Icechud6:SetValue( 1 )// Initial value ( will determine whether the box is ticked too )
	else
		--print("hl2c_custom_targetid 0")
		Icechud6:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	end
	function Icechud6:OnChange( bVal )
		if ( bVal ) then
			print( "Checked!" )
			RunConsoleCommand("hl2c_custom_targetid", "1")
		else
			print( "Unchecked!" )
			RunConsoleCommand("hl2c_custom_targetid", "0")
		end
	end
	
	Icechud_labe:SetText("New HUD:\n\nHeroes Halo:\n\nCitizens Halo:\n\nCombines Halo:\n\nPlayers Halo:\n\nCustom TargedID:\n\nShow FPS:")
	Icechud_labe:SetTextColor(color_black)
	Icechud_labe:SetPos(10, 14)
	Icechud_labe:SetSize(630,300)
	Icechud_labe:SizeToContents()
	/*function Icechud_labe:Paint( w, h )
	draw.RoundedBox(8, 0, 0, 160, 20, Color(208, 166, 0) )
	draw.RoundedBox(8, 0, 25, 160, 20, Color(208, 166, 0) )
	draw.RoundedBox(8, 0, 50, 160, 20, Color(208, 166, 0) )
	draw.RoundedBox(8, 0, 75, 160, 20, Color(208, 166, 0) )
	draw.RoundedBox(8, 0, 100, 160, 20, Color(208, 166, 0) )
	draw.RoundedBox(8, 0, 125, 160, 20, Color(208, 166, 0) )*/
	
	--end
	--end
	--LocalPlayer() = iceply
	/*local Icedhud = vgui.Create( "DCheckBox", helpMenu )// Create the checkbox
	Icedhud:SetPos( 10, 190 )// Set the position
	Icedhud:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	function Icedhud:OnChange( bVal )
		if ( bVal ) then
			print( "Checked!" )
			RunConsoleCommand("cl_drawhud", "1")
		else
			print( "Unchecked!" )
			RunConsoleCommand("cl_drawhud", "0")
		end
	end*/
	local adminbox1 = vgui.Create( "DCheckBox", ice_panel2 )// Create the checkbox
	adminbox1:SetPos( 148, 165 )// Set the position
	if GetConVarNumber( "cl_showfps" ) == 1 then 
		adminbox1:SetValue( 1 )// Initial value ( will determine whether the box is ticked too )
	else
		adminbox1:SetValue( 0 )// Initial value ( will determine whether the box is ticked too )
	end
	function adminbox1:OnChange( bVal )
		if ( bVal ) then
			--print( "Checked!" )
			RunConsoleCommand("cl_showfps", "1")
		else
			--print( "Unchecked!" )
			RunConsoleCommand("cl_showfps", "0")
		end
	end
	local Openmymodelmenu = vgui.Create("DButton", ice_panel2)
	Openmymodelmenu:SetSize(75, 30)
	Openmymodelmenu:SetPos(350, 10)
	Openmymodelmenu:SetText("Model Menu") --Set the name of the button
	function Openmymodelmenu:DoClick()
	RunConsoleCommand("playermodel_selector") 
	helpMenu:Close()
	end
	

-- PLAYER TOP RIGHT CORNER SCREEN ScrW() * 0.835, ScrH() * -0.26	
--Notification panel
/*
NotifyPanel = vgui.Create( "DNotify" )
NotifyPanel:SetPos( ScrW() *0.2, ScrH() *0.44 )
NotifyPanel:SetSize( 500, 500 )

-- Text label
local lbl = vgui.Create( "DLabel", NotifyPanel )
lbl:Dock( FILL )
lbl:SetText( "You Have Opened the Help Menu" )
lbl:SetFont( "impactnot01" )
lbl:SetTextColor( Color( 255, 255, 255, 200 ) )
--lbl:SetDark( true )

-- Add the label to the notification and begin fading
NotifyPanel:AddItem( lbl )
*/	
--end)



	local inspect=LocalPlayer()
	if LocalPlayer() == inspect
	then 
		--print("HAPPENED")
		aimtarget = LocalPlayer()
	
	elseif IsValid(inspect) and 
	aim_stat_menu and
	inspect:IsPlayer() and
	inspect != LocalPlayer()
	then
		aimtarget = inspect
		
	elseif aimtarget == nil
	then
		--print("[hl2c] SOMETHING WENT WRONG WITH !STAT")
		--print("[hl2c] inspect:",inspect)
		--print("[hl2c] aimtarget:",aimtarget)
		return
	end
	--LocalPlayer():PrintMessage(HUD_PRINTTALK, "Opened Window")
	local StatWindow=tab_stat

	Stat_sheet = vgui.Create( "DPropertySheet", StatWindow )
	Stat_sheet:Dock( FILL )

	Stat_panel1 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, 0 ) ) end
	Stat_sheet:AddSheet( "Player Stat", Stat_panel1 )
	/*
	local Stat_DLabel = vgui.Create( "DLabel", Stat_panel1 )
	Stat_DLabel:SetPos( 0, 0-60 )
	Stat_DLabel:SetSize( 300, 200 )
	Stat_DLabel:SetFont("arial16")
	Stat_DLabel:SetTextColor(Color(255,255,255,255))
	Stat_DLabel:SetText( "Player Name: "..LocalPlayer():Nick().."\nCurrent Xp: "..LocalPlayer():GetXP().."\nYour level is: "..LocalPlayer():GetCLevel().."\nFor level "..(LocalPlayer():GetCLevel() + 1)..": "..LevelCurve[LocalPlayer():GetCLevel() +1] - LocalPlayer():GetXP().." Xp left" )
	*/
	hl2c_props = vgui.Create( "DProperties", Stat_panel1 )
	hl2c_props:Dock( FILL )
	XRow1 = hl2c_props:CreateRow( "Xp Stats", "Level:" )
	XRow1:Setup( "Generic" )
	XRow1:SetValue( aimtarget:GetCLevel() )
	XRow2 = hl2c_props:CreateRow( "Xp Stats", "Total Xp:" )
	XRow2:Setup( "Generic" )
	if IsValid(aimtarget) then
		if aimtarget:GetCLevel() == 150 then
			XRow2:SetValue( "MAXIMUM" )
		else
			XRow2:SetValue( aimtarget:GetXP() )
		end
	else
		if aimtarget:GetCLevel() == 150 then
			XRow2:SetValue( "MAXIMUM" )
		else
			XRow2:SetValue( LocalPlayer():GetXP() )
		end
	end
	XRow3 = hl2c_props:CreateRow( "Xp Stats", "Xp for Next Level:" )
	XRow3:Setup( "Generic" )
	if aimtarget:GetCLevel() == 150 then
		XRow3:SetValue( "NOTHING" )
	else
	--XRow3:SetValue( "NOTHING" )
		XRow3:SetValue( LevelCurve[aimtarget:GetCLevel() +1] - aimtarget:GetXP() )
	end
	
	GRow1 = hl2c_props:CreateRow( "General", "Name:" )
	GRow1:Setup( "Generic" )
	GRow1:SetValue( aimtarget:Nick() )
	GRow2 = hl2c_props:CreateRow( "General", "Deaths:" )
	GRow2:Setup( "Generic" )
	GRow2:SetValue( "Under Development o_O" )
	GRow3 = hl2c_props:CreateRow( "General", "Map Rusher:" )
	GRow3:Setup( "Generic" )
	GRow3:SetValue( "Under Development o_O" )
	GRow4 = hl2c_props:CreateRow( "General", "Perma: " )
	GRow4:Setup( "Generic" )
	GRow4:SetValue( aimtarget:GetPerma() )
	GRow5 = hl2c_props:CreateRow( "General", "Antlion Kills: " )
	GRow5:Setup( "Generic" )
	GRow5:SetValue( aimtarget:GetNWInt("COUNT_KILLS_ANTLIONS") )
	GRow6 = hl2c_props:CreateRow( "General", "Zombie Kills: " )
	GRow6:Setup( "Generic" )
	GRow6:SetValue( aimtarget:GetNWInt("COUNT_KILLS_ZOMBIES") )
	GRow7 = hl2c_props:CreateRow( "General", "Combine Kills: " )
	GRow7:Setup( "Generic" )
	GRow7:SetValue( aimtarget:GetNWInt("COUNT_KILLS_COMBINES") )
	GRow8 = hl2c_props:CreateRow( "General", "Rebel Kills: " )
	GRow8:Setup( "Generic" )
	GRow8:SetValue( aimtarget:GetNWInt("COUNT_KILLS_REBELS") )
	GRow9 = hl2c_props:CreateRow( "General", "Vortigaunt Kills: " )
	GRow9:Setup( "Generic" )
	GRow9:SetValue( aimtarget:GetNWInt("COUNT_KILLS_VORTIGAUNTS") )
	GRow10 = hl2c_props:CreateRow( "General", "Headcrab Kills: " )
	GRow10:Setup( "Generic" )
	GRow10:SetValue( aimtarget:GetNWInt("COUNT_KILLS_HEADCRABS") )
	
	
--[[ 	mPanel = vgui.Create( "DPanel", Stat_panel1)
	mPanel:SetPos( 220, 320 )
	--mPanel:Dock(BOTTOM)
	mPanel:SetSize( 75, 100 )
	//function mPanel:Paint(self, w, h)
	//draw.RoundedBox( 4, 0, 0, 200, 200, Color( 255, 128, 0, 100 ) )
	//surface.SetDrawColor( 255, 255, 255, 255 )
	//surface.DrawOutlinedRect( 0, 0, 100, 200 )
	//end
	hl2c_micon = vgui.Create( "DModelPanel", mPanel )
	hl2c_micon:Dock(FILL)
	hl2c_micon:SetSize( 115, 185 )
	--hl2c_micon:SetPos( 0,275 )
	hl2c_micon:SetModel( aimtarget:GetModel() )


	function hl2c_micon:LayoutEntity( ent )
	-- do nothing
	end
	
	local eyepos = hl2c_micon.Entity:GetBonePosition( hl2c_micon.Entity:LookupBone( "ValveBiped.Bip01_Head1" ) )

	eyepos:Add( Vector( 0, 0, 2.3 ) )	-- Move up slightly

	hl2c_micon:SetLookAt( eyepos )

	hl2c_micon:SetCamPos( eyepos-Vector( -13.3, 0, 0 ) )	-- Move cam in front of eyes

	hl2c_micon.Entity:SetEyeTarget( eyepos-Vector( -13.3, 0, 0 ) )
	
	--[[
	local PRow1 = hl2c_props:CreateRow( "Pet", "Name:" )
	PRow1:Setup( "Generic" )
	PRow1:SetValue( "Under Development o_O" )
	]]-- ]]
	
	
	
	
	
	
	
	local Stat_panel2 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panel2.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "HL2 Achievements", Stat_panel2 )
	local hl2a_ProgPanel = vgui.Create("DPanel", Stat_panel2)
	-- hl2a_ProgPanel:SetSize( 252, 45 )
	hl2a_ProgPanel:Dock(FILL)
	hl2a_ProgPanel:DockMargin(0,0,0,285)
	-- hl2a_ProgPanel:SetPos( 20, 10 ) 
	hl2a_ProgPanel:SetBackgroundColor(Color(0,0,0))

	local hl2a_DProgress = vgui.Create( "DProgress", hl2a_ProgPanel )
	hl2a_DProgress:SetPos( 1, 19 )
	-- hl2a_DProgress:SetSize( hl2a_ProgPanel.x, 25 )
	hl2a_DProgress:Dock( FILL )
	hl2a_DProgress:DockMargin( 1,20,1,1 )
	--if exprhl2 > 1 then
	if Hl2AllAchExpr(aimtarget) > 1 then
	hl2a_DProgress:SetFraction( 1 )
	--elseif exprhl2 < 0 then
	elseif Hl2AllAchExpr(aimtarget) < 0 then
	hl2a_DProgress:SetFraction( 0 )
	--elseif exprhl2 == nil then
	elseif Hl2AllAchExpr(aimtarget) == nil then
	hl2a_DProgress:SetFraction( 0 )
	else
	--hl2a_DProgress:SetFraction( exprhl2 )
	hl2a_DProgress:SetFraction( Hl2AllAchExpr(aimtarget) )
	end
	
	local hl2a_ProgTxt = vgui.Create( "DLabel", hl2a_ProgPanel )
	-- hl2a_ProgTxt:SetPos( 0, 5 )
	-- hl2a_ProgTxt:SetPos(
	hl2a_ProgTxt:SetTextColor( Color(255,255,255) )
	--hl2a_ProgTxt:SetText( "Progress: ("..hl2asum.."/"..allhl2ach..") "..exprhl2percent.."%" )
	hl2a_ProgTxt:SetText( "Progress: ("..Hl2PlyAchSum(aimtarget).."/"..Hl2AllAchSum()..") "..Hl2AllAchExprPercent(aimtarget).."%" )
	hl2a_ProgTxt:SetAutoStretchVertical( false )
	hl2a_ProgTxt:SetContentAlignment( 5 )
	-- hl2a_ProgTxt:SetSize( 180,60 )
	hl2a_ProgTxt:Dock(FILL)
	hl2a_ProgTxt:DockMargin(0,3,0,0)
	--hl2a_ProgTxt:SetWrap( true )
	hl2a_ProgTxt:SetAutoStretchVertical( true )
	
	local hl2ach_panel = vgui.Create("DPanel", Stat_panel2)
	-- hl2ach_panel:SetSize( 430, 240 )
	hl2ach_panel:Dock(FILL)
	hl2ach_panel:DockMargin( 0, 60, 0, 10)
	-- hl2ach_panel:SetPos( 10, 80 ) 
	hl2ach_panel:SetBackgroundColor(Color(0,0,0))
	hl2ach_panel:SizeToContents() 
	--hl2ach_panel:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one
	
	local hl2ach_DScrollPanel = vgui.Create( "DScrollPanel", hl2ach_panel )
	-- hl2ach_DScrollPanel:SetSize( 430, 240 )
	hl2ach_DScrollPanel:Dock( FILL )
	hl2ach_DScrollPanel:SetPos( 0, 0 )
	
	local hl2ach_grid = vgui.Create( "DGrid", hl2ach_DScrollPanel )
	hl2ach_grid:SetPos( 1, 1 )
	hl2ach_grid:SetCols( 1 )
	hl2ach_grid:SetColWide( 437 )
	hl2ach_grid:SetRowHeight(71)
	
	
	
	for i=1,#Hl2c.HL2_ACH_LIST do
		local v = Hl2c.HL2_ACH_LIST[i]
		if (v == "ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS" and aimtarget:GetNWInt(v) == 1) or (v != "ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS") then
			local hl2achlist_panel = vgui.Create("DPanel")
			hl2achlist_panel:SetSize( 463, 70 )
			-- hl2achlist_panel:Dock(FILL)
			hl2achlist_panel:SizeToContents() 
			hl2achlist_panel:SetBackgroundColor( Color(150,150,150) )
			--local hl2cach_but = vgui.Create( "DButton", hl2achlist_panel )
			--hl2cach_but:SetText( i )
			--hl2cach_but:SetSize( 30, 20 )
			local mat = vgui.Create( "Material", hl2achlist_panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local hl2cachelist_locktxt = vgui.Create( "DLabel", hl2achlist_panel )
			hl2cachelist_locktxt:SetPos( 80, 10 )
			hl2cachelist_locktxt:SetAutoStretchVertical( false )
			hl2cachelist_locktxt:SetContentAlignment( 7 )
			hl2cachelist_locktxt:SetSize( 180,60 )
			hl2cachelist_locktxt:SetWrap( true )
			hl2cachelist_locktxt:SetTextColor( Color(255,255,255) )
			if aimtarget:GetNWInt(v) == 0  then
				hl2cachelist_locktxt:SetText( HL2_ACH_LIST_TITLE[v] )
			else
				hl2cachelist_locktxt:SetText( HL2_ACH_LIST_TITLE[v] )
				hl2achlist_panel:SetBackgroundColor( Color(200,200,200) )
				mat:SetMaterial( HL2_ACH_LIST_MAT[v] )	-- Path to material VMT
				
			end
			hl2cachelist_locktxt:SetAutoStretchVertical( true )
			
			local hl2cachelist_detailtxt = vgui.Create( "DLabel", hl2achlist_panel )
			hl2cachelist_detailtxt:SetPos( 80, 30 )
			hl2cachelist_detailtxt:SetTextColor( Color(255,255,255) )
			hl2cachelist_detailtxt:SetText( HL2_ACH_LIST_TEXT[v] )
			hl2cachelist_detailtxt:SetAutoStretchVertical( false )
			hl2cachelist_detailtxt:SetContentAlignment( 7 )
			hl2cachelist_detailtxt:SetSize( 180,60 )
			hl2cachelist_detailtxt:SetWrap( true )
			
			hl2ach_grid:AddItem( hl2achlist_panel )
		end
	end
	
		
		
	for i=1,1 do
		local v = "customsetup_1"
		if (aimtarget:GetNWInt(v) == 1)
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize( 463, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local title = vgui.Create( "DLabel", panel )
			title:SetPos( 80, 10 )
			title:SetAutoStretchVertical( false )
			title:SetContentAlignment( 7 )
			title:SetSize( 180,60 )
			title:SetWrap( true )
			title:SetTextColor( Color(255,255,255) )
			title:SetText( SECRET_ACHIEVEMENT_HL2_TITLE )
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( SECRET_ACHIEVEMENT_HL2_MATERIAL )	-- Path to material VMT
			
			title:SetAutoStretchVertical( true )
			
			local detail = vgui.Create( "DLabel", panel )
			detail:SetPos( 80, 30 )
			detail:SetTextColor( Color(255,255,255) )
			detail:SetText( SECRET_ACHIEVEMENT_HL2_DETAIL )
			detail:SetAutoStretchVertical( false )
			detail:SetContentAlignment( 7 )
			detail:SetSize( 180,60 )
			detail:SetWrap( true )
			
			hl2ach_grid:AddItem( panel )
		
		end
	end
	for i=1,1 do
		local v = "customsetup_2"
		if (aimtarget:GetNWInt(v) == 1)
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize( 463, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local title = vgui.Create( "DLabel", panel )
			title:SetPos( 80, 10 )
			title:SetAutoStretchVertical( false )
			title:SetContentAlignment( 7 )
			title:SetSize( 180,60 )
			title:SetWrap( true )
			title:SetTextColor( Color(255,255,255) )
			title:SetText( SECRET_ACHIEVEMENT_LT_TITLE )
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( SECRET_ACHIEVEMENT_LT_MATERIAL )	-- Path to material VMT
			
			title:SetAutoStretchVertical( true )
			
			local detail = vgui.Create( "DLabel", panel )
			detail:SetPos( 80, 30 )
			detail:SetTextColor( Color(255,255,255) )
			detail:SetText( SECRET_ACHIEVEMENT_LT_DETAIL )
			detail:SetAutoStretchVertical( false )
			detail:SetContentAlignment( 7 )
			detail:SetSize( 180,60 )
			detail:SetWrap( true )
			
			hl2ach_grid:AddItem( panel )
		
		end
	end
	for i=1, 1 do
		if aimtarget:GetNWInt("ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS") != 0 then
		else
		local hl2achlist_panel = vgui.Create("DPanel")
		hl2achlist_panel:SetSize( 463, 70 )
		hl2achlist_panel:SizeToContents() 
		hl2achlist_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", hl2achlist_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", hl2achlist_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local hl2cachelist_locktxt = vgui.Create( "DLabel", hl2achlist_panel )
		hl2cachelist_locktxt:SetPos( 80, 10 )
		hl2cachelist_locktxt:SetTextColor( Color(255,255,255) )
		hl2cachelist_locktxt:SetAutoStretchVertical( false )
		hl2cachelist_locktxt:SetContentAlignment( 7 )
		hl2cachelist_locktxt:SetSize( 180,60 )
		hl2cachelist_locktxt:SetWrap( true )
		local counter = 0
		for k, v in pairs(HL2_LAMDACACHE) do
			if aimtarget:GetNWInt(v) == 1 then
				counter = counter + 1
				if aimtarget:GetNWInt(v) != 47  then
					--hl2cachelist_locktxt:SetText( "Locked" )
				else
					--hl2cachelist_locktxt:SetText( "Unlocked" )
					hl2achlist_panel:SetBackgroundColor( Color(200,200,200) )
					mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
				
				end
				
			end
			hl2cachelist_locktxt:SetText( "Lambda Locator 47 / ".. counter .."" )
		end
		
		hl2cachelist_locktxt:SetAutoStretchVertical( true )
		
		local hl2cachelist_detailtxt = vgui.Create( "DLabel", hl2achlist_panel )
		hl2cachelist_detailtxt:SetPos( 80, 30 )
		hl2cachelist_detailtxt:SetTextColor( Color(255,255,255) )
		hl2cachelist_detailtxt:SetText( "Find all lambda caches in Half-Life 2." )
		hl2cachelist_detailtxt:SetAutoStretchVertical( false )
		hl2cachelist_detailtxt:SetContentAlignment( 7 )
		hl2cachelist_detailtxt:SetSize( 180,60 )
		hl2cachelist_detailtxt:SetWrap( true )
		
		hl2ach_grid:AddItem( hl2achlist_panel )
		end
		
		
	
	end
	
	
	// vgui/hud/icon_locked
	
	//////////////////////////////////////////////////////////////////////////////
	// HL2 LamdaCache Panel //////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	local Stat_panel3 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panel3.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "HL2 LamdaCache", Stat_panel3 )
	
	local hl2cache_panel = vgui.Create("DPanel", Stat_panel3)
	-- hl2cache_panel:SetSize( 280, 400 )
	-- hl2cache_panel:SetPos( 10, 10 ) 
	hl2cache_panel:Dock(FILL)
	hl2cache_panel:DockMargin( 0, 60, 0, 10)
	hl2cache_panel:SetBackgroundColor(Color(0,0,0))
	hl2cache_panel:SizeToContents() 
	--hl2cache_panel:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one
	
	local hl2cache_DScrollPanel = vgui.Create( "DScrollPanel", hl2cache_panel )
	hl2cache_DScrollPanel:Dock( FILL )
	hl2cache_DScrollPanel:SetPos( 0, 0 )
	
	local hl2cache_grid = vgui.Create( "DGrid", hl2cache_DScrollPanel )
	hl2cache_grid:SetPos( 1, 1 )
	hl2cache_grid:SetCols( 1 )
	hl2cache_grid:SetColWide( 437 )
	hl2cache_grid:SetRowHeight(71)
	
	for k, v in pairs(HL2_LAMDACACHE) do

		local hl2cache_ach_panel = vgui.Create("DPanel")
		hl2cache_ach_panel:SetSize( 463, 70 )
		hl2cache_ach_panel:SetPos( 4, 5 )
		hl2cache_ach_panel:SizeToContents() 
		hl2cache_ach_panel:SetBackgroundColor( Color(150,150,150) )
		local hl2cachelist_locktxt = vgui.Create( "DLabel", hl2cache_ach_panel )
		hl2cachelist_locktxt:SetPos( 80, 10 )
		hl2cachelist_locktxt:SetTextColor( Color(255,255,255) )
		local mat = vgui.Create( "Material", hl2cache_ach_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
		hl2cache_grid:AddItem( hl2cache_ach_panel )
		if aimtarget:GetNWInt(v) == 1 then
			hl2cachelist_locktxt:SetText( "Unlocked" )
			hl2cache_ach_panel:SetBackgroundColor( Color(200,200,200) )
			
		else
			hl2cachelist_locktxt:SetText( "Locked" )
			mat:SetMaterial("vgui/hud/icon_locked")
		end
		hl2cachelist_locktxt:SetAutoStretchVertical( true )
		local hl2cachelist_detailtxt = vgui.Create( "DLabel", hl2cache_ach_panel )
		hl2cachelist_detailtxt:SetPos( 80, 30 )
		hl2cachelist_detailtxt:SetTextColor( Color(255,255,255) )
		hl2cachelist_detailtxt:SetText( HL2_LAMDACACHE_TEXT[v] )
		hl2cachelist_detailtxt:SetAutoStretchVertical( false )
		hl2cachelist_detailtxt:SetContentAlignment( 7 )
		hl2cachelist_detailtxt:SetSize( 180,60 )
		hl2cachelist_detailtxt:SetWrap( true )
		
		
		/*
		local hl2cache_but = vgui.Create( "DButton", hl2cache_ach_panel )
		hl2cache_but:SetText( i )
		hl2cache_but:SetSize( 30, 20 )
		*/
	end
	
	//////////////////////////////////////////////////////////////////////////////
	// HL2 LamdaCache Panel //////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	local tab = vgui.Create( "DPanel", Stat_sheet )
	tab.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "EP2 LamdaCache", tab )
	
	local panel = vgui.Create("DPanel", tab)
	-- panel:SetSize( 280, 400 )
	-- panel:SetPos( 10, 10 ) 
	panel:Dock( FILL )
	panel:DockMargin(0,60,0,10)
	panel:SetBackgroundColor(Color(0,0,0))
	panel:SizeToContents() 
	--panel:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one
	
	local scroll = vgui.Create( "DScrollPanel", panel )
	scroll:Dock( FILL )
	
	
	local grid = vgui.Create( "DGrid", scroll )
	grid:SetPos( 1, 1 )
	grid:SetCols( 1 )
	grid:SetColWide( 437 )
	grid:SetRowHeight(71)
	
	for i=1,#Hl2c.EP2_WEBCACHE_LIST do
		local v = Hl2c.EP2_WEBCACHE_LIST[i]
		local ach_panel = vgui.Create("DPanel")
		ach_panel:SetSize( 463, 70 )
		ach_panel:SetPos( 4, 5 )
		ach_panel:SizeToContents() 
		ach_panel:SetBackgroundColor( Color(150,150,150) )
		local text_lock = vgui.Create( "DLabel", ach_panel )
		text_lock:SetPos( 80, 10 )
		text_lock:SetTextColor( Color(255,255,255) )
		local mat = vgui.Create( "Material", ach_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
		grid:AddItem( ach_panel )
		if aimtarget:GetNWInt(v) == 1 then
			text_lock:SetText( "Unlocked" )
			ach_panel:SetBackgroundColor( Color(200,200,200) )
			
		else
			text_lock:SetText( "Locked" )
			mat:SetMaterial("vgui/hud/icon_locked")
		end
		text_lock:SetAutoStretchVertical( true )
		local detail = vgui.Create( "DLabel", ach_panel )
		detail:SetPos( 80, 30 )
		detail:SetTextColor( Color(255,255,255) )
		detail:SetText( Hl2c.EP2_WEBCACHE_TEXT[i] )
		detail:SetAutoStretchVertical( false )
		detail:SetContentAlignment( 7 )
		detail:SetSize( 180,60 )
		detail:SetWrap( true )
		
	end
	for i=1,#Hl2c.EP2_RADARCACHE_LIST do
		local v = Hl2c.EP2_RADARCACHE_LIST[i]
		local ach_panel = vgui.Create("DPanel")
		ach_panel:SetSize( 463, 70 )
		ach_panel:SetPos( 4, 5 )
		ach_panel:SizeToContents() 
		ach_panel:SetBackgroundColor( Color(150,150,150) )
		local text_lock = vgui.Create( "DLabel", ach_panel )
		text_lock:SetPos( 80, 10 )
		text_lock:SetTextColor( Color(255,255,255) )
		local mat = vgui.Create( "Material", ach_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
		grid:AddItem( ach_panel )
		if aimtarget:GetNWInt(v) == 1 then
			text_lock:SetText( "Unlocked" )
			ach_panel:SetBackgroundColor( Color(200,200,200) )
			
		else
			text_lock:SetText( "Locked" )
			mat:SetMaterial("vgui/hud/icon_locked")
		end
		text_lock:SetAutoStretchVertical( true )
		local detail = vgui.Create( "DLabel", ach_panel )
		detail:SetPos( 80, 30 )
		detail:SetTextColor( Color(255,255,255) )
		detail:SetText( Hl2c.EP2_RADARCACHE_TEXT[i] )
		detail:SetAutoStretchVertical( false )
		detail:SetContentAlignment( 7 )
		detail:SetSize( 180,60 )
		detail:SetWrap( true )
		
	end
	
	
	----------------------
	-- EP1 Achievements --
	----------------------
	local Stat_panelEP1 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panelEP1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "EP1 Achievements", Stat_panelEP1 )
	
	local EP1a_ProgPanel = vgui.Create("DPanel", Stat_panelEP1)
	EP1a_ProgPanel:Dock(FILL)
	EP1a_ProgPanel:DockMargin(0,0,0,285)
	EP1a_ProgPanel:SetBackgroundColor(Color(0,0,0))

	local EP1a_DProgress = vgui.Create( "DProgress", EP1a_ProgPanel )
	EP1a_DProgress:Dock( FILL )
	EP1a_DProgress:DockMargin( 1,20,1,1 )
	
	if EP1AllAchExpr(aimtarget) > 1 then
	EP1a_DProgress:SetFraction( 1 )
	elseif EP1AllAchExpr(aimtarget) < 0 then
	EP1a_DProgress:SetFraction( 0 )
	elseif EP1AllAchExpr(aimtarget) == nil then
	EP1a_DProgress:SetFraction( 0 )
	else
	EP1a_DProgress:SetFraction( EP1AllAchExpr(aimtarget) )
	end
	
	local EP1a_ProgTxt = vgui.Create( "DLabel", EP1a_ProgPanel )
	EP1a_ProgTxt:Dock(FILL)
	EP1a_ProgTxt:DockMargin(0,3,0,0)
	EP1a_ProgTxt:SetTextColor( Color(255,255,255) )
	EP1a_ProgTxt:SetText( "Progress: ("..EP1PlyAchSum(aimtarget).."/"..EP1AllAchSum()..") "..EP1AllAchExprPercent(aimtarget).."%" )
	EP1a_ProgTxt:SetAutoStretchVertical( false )
	EP1a_ProgTxt:SetContentAlignment( 5 )
	--EP1a_ProgTxt:SetWrap( true )
	EP1a_ProgTxt:SetAutoStretchVertical( true )
	
	local EP1ach_panel = vgui.Create("DPanel", Stat_panelEP1)
	EP1ach_panel:Dock(FILL)
	EP1ach_panel:DockMargin(0,60,0,10)
	EP1ach_panel:SetBackgroundColor(Color(0,0,0))
	EP1ach_panel:SizeToContents() 
	
	local EP1ach_DScrollPanel = vgui.Create( "DScrollPanel", EP1ach_panel )
	-- EP1ach_DScrollPanel:SetSize( 280, 330 )
	-- EP1ach_DScrollPanel:SetPos( 0, 0 )
	EP1ach_DScrollPanel:Dock(FILL)
	
	local EP1ach_grid = vgui.Create( "DGrid", EP1ach_DScrollPanel )
	EP1ach_grid:SetPos( 1, 1 )
	EP1ach_grid:SetCols( 1 )
	EP1ach_grid:SetColWide( 437 )
	EP1ach_grid:SetRowHeight(71)
		
	for k, v in pairs(EP1_ACH_LIST) do
		if v == "ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONEBULLET" then
		
		else
		local EP1achlist_panel = vgui.Create("DPanel")
		EP1achlist_panel:SetSize( 463, 70 )
		EP1achlist_panel:SizeToContents() 
		EP1achlist_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", EP1achlist_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", EP1achlist_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local EP1cachelist_locktxt = vgui.Create( "DLabel", EP1achlist_panel )
		EP1cachelist_locktxt:SetPos( 80, 10 )
		EP1cachelist_locktxt:SetAutoStretchVertical( false )
		EP1cachelist_locktxt:SetContentAlignment( 7 )
		EP1cachelist_locktxt:SetSize( 180,60 )
		EP1cachelist_locktxt:SetWrap( true )
		EP1cachelist_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			EP1cachelist_locktxt:SetText( EP1_ACH_LIST_TITLE[v] )
		else
			EP1cachelist_locktxt:SetText( EP1_ACH_LIST_TITLE[v] )
			EP1achlist_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( EP1_ACH_LIST_MAT[v] )	-- Path to material VMT
			
		end
		EP1cachelist_locktxt:SetAutoStretchVertical( true )
		
		local EP1cachelist_detailtxt = vgui.Create( "DLabel", EP1achlist_panel )
		EP1cachelist_detailtxt:SetPos( 80, 30 )
		EP1cachelist_detailtxt:SetTextColor( Color(255,255,255) )
		EP1cachelist_detailtxt:SetText( EP1_ACH_LIST_TEXT[v] )
		EP1cachelist_detailtxt:SetAutoStretchVertical( false )
		EP1cachelist_detailtxt:SetContentAlignment( 7 )
		EP1cachelist_detailtxt:SetSize( 180,60 )
		EP1cachelist_detailtxt:SetWrap( true )
		
		EP1ach_grid:AddItem( EP1achlist_panel )
		
		end
	end
	
	for i=1, 1 do
		
		
	end
	
	----------------------
	-- EP2 Achievements --
	----------------------
	local tab = vgui.Create( "DPanel", Stat_sheet )
	tab.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "EP2 Achievements", tab )
	
	local panel = vgui.Create("DPanel", tab)
	-- panel:SetSize( 280, 330 )
	-- panel:SetPos( 10, 80 )
	panel:Dock(FILL)
	panel:DockMargin(0,60,0,10)
	panel:SetBackgroundColor(Color(0,0,0))
	panel:SizeToContents() 
	
	local scroll = vgui.Create( "DScrollPanel", panel )
	scroll:Dock( FILL )
	-- scroll:SetSize( 280, 330 )
	-- scroll:SetPos( 0, 0 )
	
	local grid = vgui.Create( "DGrid", scroll )
	grid:SetPos( 1, 1 )
	grid:SetCols( 1 )
	grid:SetColWide( 437 )
	grid:SetRowHeight(71)
	
	for i=1,#Hl2c.EP2_ACH_LIST do
		local v = Hl2c.EP2_ACH_LIST[i]
		if (false) then
		elseif v == "ACHIEVEMENT_EVENT_EP2_BEAT_RACEWITHDOG" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_PUT_ITEMINROCKET" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_KILL_ENEMY_WITHHOPPERMINE" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHPHYSICS" then
		
		else
		
		local ep2_panel = vgui.Create("DPanel")
		ep2_panel:SetSize( 463, 70 )
		ep2_panel:SizeToContents() 
		ep2_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", ep2_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", ep2_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local lock = vgui.Create( "DLabel", ep2_panel )
		lock:SetPos( 80, 10 )
		lock:SetAutoStretchVertical( false )
		lock:SetContentAlignment( 7 )
		lock:SetSize( 180,60 )
		lock:SetWrap( true )
		lock:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			lock:SetText( EP2_ACH_LIST_TITLE[v] )
		else
			lock:SetText( EP2_ACH_LIST_TITLE[v] )
			ep2_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( EP2_ACH_LIST_MAT[v] )	-- Path to material VMT
			
		end
		lock:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", ep2_panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		text:SetText( EP2_ACH_LIST_TEXT[v] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		grid:AddItem( ep2_panel )
		end
	end
	

	for i=1, 1 do
		
		local EP2a_ProgPanel = vgui.Create("DPanel", tab)
		-- EP2a_ProgPanel:SetSize( 252, 45 )
		-- EP2a_ProgPanel:SetPos( 20, 10 ) EP2a_ProgPanel:SetSize( 252, 45 )
		EP2a_ProgPanel:Dock( FILL) 
		EP2a_ProgPanel:DockMargin( 0,0,0,285) 
		EP2a_ProgPanel:SetBackgroundColor(Color(0,0,0))
	
		local EP2a_DProgress = vgui.Create( "DProgress", EP2a_ProgPanel )
		-- EP2a_DProgress:SetPos( 1, 19 )
		-- EP2a_DProgress:SetSize( 250, 25 )
		EP2a_DProgress:Dock( FILL )
		EP2a_DProgress:DockMargin( 1,20,1,1 )
		if EP2AllAchExpr(aimtarget) > 1 then
		EP2a_DProgress:SetFraction( 1 )
		elseif EP2AllAchExpr(aimtarget) < 0 then
		EP2a_DProgress:SetFraction( 0 )
		elseif EP2AllAchExpr(aimtarget) == nil then
		EP2a_DProgress:SetFraction( 0 )
		else
		EP2a_DProgress:SetFraction( EP2AllAchExpr(aimtarget) )
		end
		
		local EP2a_ProgTxt = vgui.Create( "DLabel", EP2a_ProgPanel )
		EP2a_ProgTxt:Dock(FILL)
		EP2a_ProgTxt:DockMargin(0,3,0,0)
		EP2a_ProgTxt:SetTextColor( Color(255,255,255) )
		EP2a_ProgTxt:SetText( "Progress: ("..EP2PlyAchSum(aimtarget).."/"..EP2AllAchSum()..") ".. EP2AllAchExprPercent(aimtarget) .."%" )
		EP2a_ProgTxt:SetAutoStretchVertical( false )
		EP2a_ProgTxt:SetContentAlignment( 5 )
		--EP2a_ProgTxt:SetWrap( true )
		EP2a_ProgTxt:SetAutoStretchVertical( true )
	end
	
	--------------------------
	-- General Achievements --
	--------------------------
	local tab = vgui.Create( "DPanel", Stat_sheet )
	tab.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "General Achievements", tab )
	
	local panel = vgui.Create("DPanel", tab)
	-- panel:SetSize( 280, 330 )
	-- panel:SetPos( 10, 80 ) 
	panel:Dock(FILL)
	panel:DockMargin(0,60,0,10)
	panel:SetBackgroundColor(Color(0,0,0))
	panel:SizeToContents() 
	
	local scroll = vgui.Create( "DScrollPanel", panel )
	-- scroll:SetSize( 280, 330 )
	-- scroll:SetPos( 0, 0 )
	scroll:Dock(FILL)
	
	local grid = vgui.Create( "DGrid", scroll )
	grid:SetPos( 1, 1 )
	grid:SetCols( 1 )
	grid:SetColWide( 437 )
	grid:SetRowHeight(71)
	
	for i=1,#Hl2c.GEN_ACH_LIST do
		local v = Hl2c.GEN_ACH_LIST[i]
		if (v == "ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN" and
		aimtarget:GetNWInt(v) == 1) or v != "ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN"
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize( 463, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			--local hl2cach_but = vgui.Create( "DButton", panel )
			--hl2cach_but:SetText( i )
			--hl2cach_but:SetSize( 30, 20 )
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local text_title = vgui.Create( "DLabel", panel )
			text_title:SetPos( 80, 10 )
			text_title:SetAutoStretchVertical( false )
			text_title:SetContentAlignment( 7 )
			text_title:SetSize( 180,60 )
			text_title:SetWrap( true )
			text_title:SetTextColor( Color(255,255,255) )
			if aimtarget:GetNWInt(v) == 0  then
				text_title:SetText( GEN_ACH_LIST_TITLE[v] )
				--mat:SetMaterial( GEN_ACH_LIST_MAT[v] )	-- Path to material VMT
				
			else
				text_title:SetText( GEN_ACH_LIST_TITLE[v] )
				panel:SetBackgroundColor( Color(200,200,200) )
				mat:SetMaterial( GEN_ACH_LIST_MAT[v] )	-- Path to material VMT
				
			end
			text_title:SetAutoStretchVertical( true )
			
			local text_detail = vgui.Create( "DLabel", panel )
			text_detail:SetPos( 80, 30 )
			text_detail:SetTextColor( Color(255,255,255) )
			text_detail:SetText( GEN_ACH_LIST_TEXT[v] )
			text_detail:SetAutoStretchVertical( false )
			text_detail:SetContentAlignment( 7 )
			text_detail:SetSize( 180,60 )
			text_detail:SetWrap( true )
			
			grid:AddItem( panel )
		
		end
	end
	
	for i=1,1 do
		local v = "customsetup_3"
		if (aimtarget:GetNWInt(v) == 1)
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize(463, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local title = vgui.Create( "DLabel", panel )
			title:SetPos( 80, 10 )
			title:SetAutoStretchVertical( false )
			title:SetContentAlignment( 7 )
			title:SetSize( 180,60 )
			title:SetWrap( true )
			title:SetTextColor( Color(255,255,255) )
			title:SetText( SECRET_ACHIEVEMENT_MASK1_TITLE )
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( SECRET_ACHIEVEMENT_MASK1_MATERIAL )	-- Path to material VMT
			
			title:SetAutoStretchVertical( true )
			
			local detail = vgui.Create( "DLabel", panel )
			detail:SetPos( 80, 30 )
			detail:SetTextColor( Color(255,255,255) )
			detail:SetText( SECRET_ACHIEVEMENT_MASK1_DETAIL )
			detail:SetAutoStretchVertical( false )
			detail:SetContentAlignment( 7 )
			detail:SetSize( 180,60 )
			detail:SetWrap( true )
			
			grid:AddItem( panel )
		
		end
	end
	
	
	for i=1, 1 do
		
		local panel = vgui.Create("DPanel", tab)
		-- panel:SetSize( 252, 45 )
		-- panel:SetPos( 20, 10 ) 
		panel:Dock(FILL)
		panel:DockMargin(0,0,0,285)
		panel:SetBackgroundColor(Color(0,0,0))
	
		local progress = vgui.Create( "DProgress", panel )
		-- progress:SetPos( 1, 19 )
		-- progress:SetSize( 250, 25 )
		progress:Dock(FILL)
		progress:DockMargin(1,20,1,1)
		if AllGenExpr(aimtarget) > 1 then
		progress:SetFraction( 1 )
		elseif AllGenExpr(aimtarget) < 0 then
		progress:SetFraction( 0 )
		elseif AllGenExpr(aimtarget) == nil then
		progress:SetFraction( 0 )
		else
		progress:SetFraction( AllGenExpr(aimtarget) )
		end
		
		
		
		local txt = vgui.Create( "DLabel", panel )
		-- txt:SetPos( 0, 5 )
		txt:Dock(FILL)
		txt:DockMargin(0,3,0,0)
		txt:SetTextColor( Color(255,255,255) )
		txt:SetText( "Progress: (".. PlyGenSum(aimtarget) .."/".. AllGenSum() ..") ".. AllGenExprPercent(aimtarget) .."%" )
		txt:SetAutoStretchVertical( false )
		txt:SetContentAlignment( 5 )
		-- txt:SetSize( 180,60 )
		--txt:SetWrap( true )
		txt:SetAutoStretchVertical( true )
	end
	
	-------------------------
	-- Vortex Achievements --
	-------------------------
	local Stat_panelVortex = vgui.Create( "DPanel", Stat_sheet )
	Stat_panelVortex.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "Vortex List", Stat_panelVortex )
		
	local progpanel = vgui.Create("DPanel", Stat_panelVortex)
	progpanel:SetSize( 450, 45 )
	progpanel:SetPos( 0, 0 )
	-- progpanel:Dock( FILL )
	-- progpanel:Dock(0,0,0,285)
	-- progpanel:SizeToContents()
	progpanel:SetBackgroundColor(Color(0,0,0))

	local Vortex_DProgress = vgui.Create( "DProgress", progpanel )
	Vortex_DProgress:Dock( FILL )
	Vortex_DProgress:DockMargin( 1,20,1,1 )
	-- Vortex_DProgress:SetPos( 1, 19 )
	-- Vortex_DProgress:SetSize( 250, 25 )
	if AllVortexExpr(aimtarget) > 1 then
	Vortex_DProgress:SetFraction( 1 )
	elseif AllVortexExpr(aimtarget) < 0 then
	Vortex_DProgress:SetFraction( 0 )
	elseif AllVortexExpr(aimtarget) == nil then
	Vortex_DProgress:SetFraction( 0 )
	else
	Vortex_DProgress:SetFraction( AllVortexExpr(aimtarget) )
	end
	
	local Vortex_ProgTxt = vgui.Create( "DLabel", progpanel )
	Vortex_ProgTxt:Dock( FILL )
	Vortex_ProgTxt:DockMargin( 0,3,0,0 )
	-- Vortex_ProgTxt:SetPos( 0, 5 )
	Vortex_ProgTxt:SetTextColor( Color(255,255,255) )
	Vortex_ProgTxt:SetText( "Progress: (".. PlyVortexSum(aimtarget) .."/".. AllVortexSum() ..") ".. AllVortexExprPercent(aimtarget) .."%" )
	Vortex_ProgTxt:SetAutoStretchVertical( false )
	Vortex_ProgTxt:SetContentAlignment( 5 )
	-- Vortex_ProgTxt:SetSize( 180,60 )
	--Vortex_ProgTxt:SetWrap( true )
	Vortex_ProgTxt:SetAutoStretchVertical( true )

	local Vortex_panel = vgui.Create("DPanel", Stat_panelVortex)
	-- Vortex_panel:SetSize( 280, 330 )
	-- Vortex_panel:SetPos( 10, 80 )
	Vortex_panel:Dock(FILL)
	Vortex_panel:DockMargin(0,60,0,10)
	Vortex_panel:SetBackgroundColor(Color(0,0,0))
	-- Vortex_panel:SizeToContents() 
	
	local scroll = vgui.Create( "DScrollPanel", Vortex_panel )
	-- scroll:SetSize( 280, 330 )
	-- scroll:SetPos( 0, 0 )
	scroll:Dock(FILL)
	
	local Vortex_grid = vgui.Create( "DGrid", scroll )
	Vortex_grid:SetPos( 1, 1 )
	Vortex_grid:SetCols( 1 )
	Vortex_grid:SetColWide( 437 )
	Vortex_grid:SetRowHeight(71)
	
	for k, v in pairs(VORTEX_LIST_HL2_NAME) do
	
		local Vortex_list_panel = vgui.Create("DPanel")
		Vortex_list_panel:SetSize( 463, 70 )
		Vortex_list_panel:SizeToContents() 
		Vortex_list_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", Vortex_list_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local Vortex_locktxt = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_locktxt:SetPos( 80, 10 )
		Vortex_locktxt:SetAutoStretchVertical( false )
		Vortex_locktxt:SetContentAlignment( 7 )
		Vortex_locktxt:SetSize( 180,60 )
		Vortex_locktxt:SetWrap( true )
		Vortex_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			Vortex_locktxt:SetText( VORTEX_LIST_HL2_TITLE[v] )
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
			Vortex_locktxt:SetText( VORTEX_LIST_HL2_TITLE[v] )
			Vortex_list_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		end
		Vortex_locktxt:SetAutoStretchVertical( true )
		
		local Vortex_text = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_text:SetPos( 80, 30 )
		Vortex_text:SetTextColor( Color(255,255,255) )
		Vortex_text:SetText( VORTEX_LIST_HL2_DESC[v] )
		Vortex_text:SetAutoStretchVertical( false )
		Vortex_text:SetContentAlignment( 7 )
		Vortex_text:SetSize( 180,60 )
		Vortex_text:SetWrap( true )
		
		Vortex_grid:AddItem( Vortex_list_panel )
	end
	
	for k, v in pairs(VORTEX_LIST_EP1_NAME) do
	
		local Vortex_list_panel = vgui.Create("DPanel")
		Vortex_list_panel:SetSize( 463, 70 )
		Vortex_list_panel:SizeToContents() 
		Vortex_list_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", Vortex_list_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local Vortex_locktxt = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_locktxt:SetPos( 80, 10 )
		Vortex_locktxt:SetAutoStretchVertical( false )
		Vortex_locktxt:SetContentAlignment( 7 )
		Vortex_locktxt:SetSize( 180,60 )
		Vortex_locktxt:SetWrap( true )
		Vortex_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			Vortex_locktxt:SetText( VORTEX_LIST_EP1_TITLE[v] )
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
			Vortex_locktxt:SetText( VORTEX_LIST_EP1_TITLE[v] )
			Vortex_list_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( VORTEX_LIST_EP1_MAT[v] )	-- Path to material VMT
			
		end
		Vortex_locktxt:SetAutoStretchVertical( true )
		
		local Vortex_text = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_text:SetPos( 80, 30 )
		Vortex_text:SetTextColor( Color(255,255,255) )
		Vortex_text:SetText( VORTEX_LIST_EP1_DESC[v] )
		Vortex_text:SetAutoStretchVertical( false )
		Vortex_text:SetContentAlignment( 7 )
		Vortex_text:SetSize( 180,60 )
		Vortex_text:SetWrap( true )
		
		Vortex_grid:AddItem( Vortex_list_panel )
	end
	
	for k, v in pairs(VORTEX_LIST_EP2_NAME) do
	
		local Vortex_list_panel = vgui.Create("DPanel")
		Vortex_list_panel:SetSize( 463, 70 )
		Vortex_list_panel:SizeToContents() 
		Vortex_list_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", Vortex_list_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local Vortex_locktxt = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_locktxt:SetPos( 80, 10 )
		Vortex_locktxt:SetAutoStretchVertical( false )
		Vortex_locktxt:SetContentAlignment( 7 )
		Vortex_locktxt:SetSize( 180,60 )
		Vortex_locktxt:SetWrap( true )
		Vortex_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			Vortex_locktxt:SetText( VORTEX_LIST_EP2_TITLE[v] )
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
			Vortex_locktxt:SetText( VORTEX_LIST_EP2_TITLE[v] )
			Vortex_list_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( VORTEX_LIST_EP2_MAT[v] )	-- Path to material VMT
			
		end
		Vortex_locktxt:SetAutoStretchVertical( true )
		
		local Vortex_text = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_text:SetPos( 80, 30 )
		Vortex_text:SetTextColor( Color(255,255,255) )
		Vortex_text:SetText( VORTEX_LIST_EP2_DESC[v] )
		Vortex_text:SetAutoStretchVertical( false )
		Vortex_text:SetContentAlignment( 7 )
		Vortex_text:SetSize( 180,60 )
		Vortex_text:SetWrap( true )
		
		Vortex_grid:AddItem( Vortex_list_panel )
	end
	
	for i=1,#Hl2c.VORTEX_CD_LIST do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 463, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "CD Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_CD_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_CD_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	for i=1,#Hl2c.VORTEX_EP3_LIST do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 463, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "Episode Three Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_EP3_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_EP3_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	for i=1,#Hl2c.VORTEX_META_LIST do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 463, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "Metastasis: Minerva Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_META_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_META_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	for i=1,1 do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 463, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "LostCoast Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_LT_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_LT_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	
	

end
usermessage.Hook("ShowHelp",Show_Help)

local string = string
local table = table
local error = error
local Material = Material
local baseclass = baseclass

local hl2c_stat = {
	StatWindow = StatWindow,
	Stat_sheet = Stat_sheet,
	Stat_panel1 = Stat_panel1,
	hl2c_props = hl2c_props,
	XRow1 = XRow1,
	XRow2 = XRow2,
	XRow3 = XRow3,
	GRow1 = GRow1,
	GRow2 = GRow2,
	GRow3 = GRow3,
	GRow4 = GRow4,
	mPanel = mPanel,
	hl2c_micon = hl2c_micon
	
}
/*
hl2c_stat.StatWindow = {}
hl2c_stat.StatWindow = StatWindow
hl2c_stat.Stat_sheet = {}
hl2c_stat.StatWindow = StatWindow
hl2c_stat.Stat_panel1 = {}
hl2c_stat.Stat_panel1 = Stat_panel1
hl2c_stat.hl2c_props = {}
hl2c_stat.hl2c_props = hl2c_props
hl2c_stat.XRow1 = {}
hl2c_stat.XRow1 = XRow1
hl2c_stat.XRow2 = {}
hl2c_stat.XRow2 = XRow2
hl2c_stat.XRow3 = {}
hl2c_stat.XRow3 = XRow3
hl2c_stat.GRow1 = {}
hl2c_stat.GRow1 = GRow1
hl2c_stat.GRow2 = {}
hl2c_stat.GRow2 = GRow2
hl2c_stat.GRow3 = {}
hl2c_stat.GRow3 = GRow3
hl2c_stat.GRow4 = {}
hl2c_stat.GRow4 = GRow4
*/
--hl2c_stat.GRow1 = {}

--
-- Functions for Achievements.
--

--
-- Vortexes All
--

function PlyVortexSum(data)
	if IsValid(data) and
	data:IsPlayer() 
	then
	else
		return 0
	end
	
	local vortex = 0
	
	for k, v in pairs(VORTEX_LIST_HL2_NAME) do
		--hl2cache = hl2cache + 1
		
		if data:GetNWInt(v) == 1  then
			vortex = vortex + 1
			--print(hl2asum)
		else
			
		end
	end
	for k, v in pairs(VORTEX_LIST_EP1_NAME) do
		--hl2cache = hl2cache + 1
		
		if data:GetNWInt(v) == 1  then
			vortex = vortex + 1
			--print(hl2asum)
		else
			
		end
	end
	for k, v in pairs(VORTEX_LIST_EP2_NAME) do
		--hl2cache = hl2cache + 1
		
		if data:GetNWInt(v) == 1  then
			vortex = vortex + 1
			--print(hl2asum)
		else
			
		end
	end
	
	for i=1,#Hl2c.VORTEX_CD_LIST do
		--hl2cache = hl2cache + 1
		
		if data:GetNWInt(Hl2c.VORTEX_CD_LIST[i]) == 1  then
			vortex = vortex + 1
			--print(hl2asum)
		else
			
		end
	end
	
	for i=1,#Hl2c.VORTEX_EP3_LIST do
		--hl2cache = hl2cache + 1
		
		if data:GetNWInt(Hl2c.VORTEX_EP3_LIST[i]) == 1  then
			vortex = vortex + 1
			--print(hl2asum)
		else
			
		end
	end
	for i=1,#Hl2c.VORTEX_META_LIST do
		--hl2cache = hl2cache + 1
		
		if data:GetNWInt(Hl2c.VORTEX_META_LIST[i]) == 1  then
			vortex = vortex + 1
			--print(hl2asum)
		else
			
		end
	end
	--print("YOUR ALL VORTEX = "..vortex)
	
	return tonumber(vortex)
end

function AllVortexSum()
	local vortex = 0
	
	for k, v in pairs(VORTEX_LIST_HL2_NAME) do
		vortex = vortex + 1
	end
	for k, v in pairs(VORTEX_LIST_EP1_NAME) do
		vortex = vortex + 1
	end
	for k, v in pairs(VORTEX_LIST_EP2_NAME) do
		vortex = vortex + 1
	end
	for k, v in pairs(Hl2c.VORTEX_CD_LIST) do
		vortex = vortex + 1
	end
	for k, v in pairs(Hl2c.VORTEX_EP3_LIST) do
		vortex = vortex + 1
	end
	for k, v in pairs(Hl2c.VORTEX_LT_LIST) do
		vortex = vortex + 1
	end
	for k, v in pairs(Hl2c.VORTEX_META_LIST) do
		vortex = vortex + 1
	end
	
	--print("ALL VORTEX = "..vortex)
	return tonumber(vortex)
end

function AllVortexExpr(data)
	if IsValid(data) and
	data:IsPlayer() 
	then
	else
		return 0
	end
	p_expr = 0
	all_expr = 0
	p_expr = PlyVortexSum(data)
	all_expr = AllVortexSum()
	if p_expr != nil && p_expr > 0 then
		expr_v = p_expr/all_expr
		
		--expr_hl2percent = math.Round(expr_hl2 * 100)
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("Vortex Achievements:",expr_v)
		--print("Vortex Achievements in percent:",exprhl2percent.." %")
		--print("-------------------------------------------")
	end
	if isnumber(expr_v) then else return 0 end
	return tonumber(expr_v)
end
function AllVortexExprPercent(data)
	if IsValid(data) and
	data:IsPlayer() 
	then
	else
		return 0
	end
	p_expr = 0
	all_expr = 0
	p_expr = PlyVortexSum(data)
	all_expr = AllVortexSum()
	if p_expr != nil && p_expr > 0 then
		expr_v = p_expr/all_expr
		expr_vpercent = math.Round(expr_v * 100)
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("Vortex Achievements:",exprhl2)
		--print("Vortex Achievements in percent:",expr_vpercent.." %")
		--print("-------------------------------------------")
	end
	if isnumber(expr_vpercent) then else return 0 end
	return tonumber(expr_vpercent)
end

function PlyGenSum(data)
	if IsValid(data) and
	data:IsPlayer() 
	then
	else
		return 0
	end
	
	local vortex = 0
	
	
	for i=1,#Hl2c.GEN_ACH_LIST do
		if data:GetNWInt(Hl2c.GEN_ACH_LIST[i]) == 1 then
			vortex = vortex + 1
		end
	end
	
	return tonumber(vortex)
end

function AllGenSum()
	local vortex = 0
	
	for i=1,#Hl2c.GEN_ACH_LIST do
		vortex = vortex + 1
	end
	
	--print("ALL VORTEX = "..vortex)
	return tonumber(vortex)
end

function AllGenExpr(data)
	if IsValid(data) and
	data:IsPlayer() 
	then
	else
		return 0
	end
	p_expr = 0
	all_expr = 0
	p_expr = PlyGenSum(data)
	all_expr = AllGenSum()
	if p_expr != nil && p_expr > 0 then
		expr_v = p_expr/all_expr
		
		--expr_hl2percent = math.Round(expr_hl2 * 100)
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("Vortex Achievements:",expr_v)
		--print("Vortex Achievements in percent:",exprhl2percent.." %")
		--print("-------------------------------------------")
	end
	if isnumber(expr_v) then else return 0 end
	return tonumber(expr_v)
end
function AllGenExprPercent(data)
	if IsValid(data) and
	data:IsPlayer() 
	then
	else
		return 0
	end
	p_expr = 0
	all_expr = 0
	p_expr = PlyGenSum(data)
	all_expr = AllGenSum()
	if p_expr != nil && p_expr > 0 then
		expr_v = p_expr/all_expr
		expr_vpercent = math.Round(expr_v * 100)
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("Vortex Achievements:",exprhl2)
		--print("Vortex Achievements in percent:",expr_vpercent.." %")
		--print("-------------------------------------------")
	end
	if isnumber(expr_vpercent) then else return 0 end
	return tonumber(expr_vpercent)
end

--
-- HL2
--
function Hl2PlyCacheSum(data)
	if IsValid(data) and
	data:IsPlayer() 
	then
	else
		return 0
	end
	local hl2cache = 0
	
	for k, v in pairs(HL2_LAMDACACHE) do
		--hl2cache = hl2cache + 1
		
		if data:GetNWInt(v) == 1  then
			hl2cache = hl2cache + 1
			--print(hl2asum)
		else
			
		end
	end
	
	return tonumber(hl2cache)
end

function Hl2AllCacheSum()
	local hl2cache = 0
	
	for k, v in pairs(HL2_LAMDACACHE) do
		hl2cache = hl2cache + 1
	end
	
	return tonumber(hl2cache)
end

function Hl2AllAchSum()

	local allhl2cache = 0
	local allhl2ach = 0
	allhl2cache = Hl2AllCacheSum()
	
	--for k, v in pairs(HL2_LAMDACACHE) do
		--allhl2cache = allhl2cache + 1
	--end
	
	for i=1,#Hl2c.HL2_ACH_LIST do
		allhl2ach = allhl2ach + 1
	end
	
	
	
	
	return tonumber(allhl2ach)
	
end

function Hl2PlyAchSum(data)
	if data:IsPlayer() then
	else
		return 0
	end
	local cachecounter = 0
	cachecounter = Hl2PlyCacheSum()
	local hl2asum = data:GetAllHL2Ach()

	
	
	
	
	return tonumber(hl2asum)
	
end

function Hl2AllAchExpr(data)
	if data:IsPlayer() then
	else
		return 0
	end
	local expr_hl2 = 0
	hl2asum_expr = Hl2PlyAchSum(data)
	allhl2ach_expr = Hl2AllAchSum()
	if hl2asum_expr && hl2asum_expr > 0 then
		expr_hl2 = hl2asum_expr/allhl2ach_expr
		--expr_hl2percent = math.Round(expr_hl2 * 100)
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("HL2 Achievements:",exprhl2)
		--print("HL2 Achievements in percent:",exprhl2percent.." %")
		--print("-------------------------------------------")
	end
	if !isnumber(expr_hl2) then
		expr_hl2 = 0
	end
	return tonumber(expr_hl2)
end
function Hl2AllAchExprPercent(data)
	if data:IsPlayer() then
	else
		return 0
	end
	local expr_hl2 = 0
	local expr_hl2percent = 0
	hl2asum_expr = Hl2PlyAchSum(data)
	allhl2ach_expr = Hl2AllAchSum()
	if hl2asum_expr && hl2asum_expr > 0 then
		expr_hl2 = hl2asum_expr/allhl2ach_expr
		expr_hl2percent = math.Round(expr_hl2 * 100)
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("HL2 Achievements:",exprhl2)
		--print("HL2 Achievements in percent:",exprhl2percent.." %")
		--print("-------------------------------------------")
	end
	if !isnumber(expr_hl2) then
		expr_hl2 = 0
	end
	
	if !isnumber(expr_hl2percent) then
		expr_hl2percent = 0
	end
	
	return tonumber(expr_hl2percent)
end

--
-- EP1
--
function EP1AllCacheSum()
	--local allhl2cache = 0
	
	--for k, v in pairs(HL2_LAMDACACHE) do
	--	allhl2cache = allhl2cache + 1
	--end
	
	--return tonumber(allhl2cache)
end

function EP1AllAchSum()
	--local allhl2cache = 0
	local allep1ach = 0
	
	--for k, v in pairs(HL2_LAMDACACHE) do
	--	allhl2cache = allep1cache + 1
	--end
	
	for k, v in pairs(EP1_ACH_LIST) do
		allep1ach = allep1ach + 1
	end
	--if allep1cache > 0 then
		--allep1ach = allep1ach + 1
		--print(hl2asum)
	--end
	if allep1ach >= 12 then
		allep1ach = allep1ach - 1
	end
	return tonumber(allep1ach)
	
end

function EP1PlyAchSum(data)
	if data:IsPlayer() then
	else
		return 0
	end
	--local cachecounter = 0
	local ep1asum = 0
	for k, v in pairs(EP1_ACH_LIST) do
	
		if data:GetNWInt(v) == 1  then
			ep1asum = ep1asum + 1
			--print(hl2asum)
		else
			
		end
	end
	
	if cachecounter == 47 then
		--ep1asum = ep1asum + 1
		--print(hl2asum)
	end
	
	return tonumber(ep1asum)
	
end

function EP1AllAchExpr(data)
	if data:IsPlayer() then
	else
		return 0
	end

	local expr_ep1 = 0
	ep1asum_expr = EP1PlyAchSum(data)
	allep1ach_expr = EP1AllAchSum()
	if ep1asum_expr != nil && ep1asum_expr > 0 then
		expr_ep1 = ep1asum_expr/allep1ach_expr
		
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("EP1 Achievements:",expr_ep1)
		--print("HL2 Achievements in percent:",exprhl2percent.." %")
		--print("-------------------------------------------")
		
	end
	
	if !isnumber(expr_ep1) then
		expr_ep1 = 0
	end
	
	return tonumber(expr_ep1)
end
function EP1AllAchExprPercent(data)
	if data:IsPlayer() then
	else
		return 0
	end
	
	local expr_ep1 = 0
	local expr_ep1percent = 0
	ep1asum_expr = EP1PlyAchSum(data)
	allep1ach_expr = EP1AllAchSum()
	if ep1asum_expr != nil && ep1asum_expr > 0 then
		expr_ep1 = ep1asum_expr/allep1ach_expr
		expr_ep1percent = math.Round(expr_ep1 * 100)
		
		--exprhl2 = allhl2ach/allhl2ach
		--exprhl2 = 1/allhl2ach
		--print("-------------------------------------------")
		--print("HL2 Achievements:",exprhl2)
		--print("HL2 Achievements in percent:",expr_ep1percent.." %")
		--print("-------------------------------------------")
		
	end
	if !isnumber(expr_ep1) then
		expr_ep1 = 0
	end
	if !isnumber(expr_ep1percent) then
		expr_ep1percent = 0
	end
	return tonumber(expr_ep1percent)
end

--
-- EP2
--
function EP2AllCacheSum()
	--local allhl2cache = 0
	
	--for k, v in pairs(HL2_LAMDACACHE) do
	--	allhl2cache = allhl2cache + 1
	--end
	
	--return tonumber(allhl2cache)
end

function EP2AllAchSum()
	--local allhl2cache = 0
	local allep2ach = #Hl2c.EP2_ACH_LIST - 1
	
	
	return tonumber(allep2ach)
	
end

function EP2PlyAchSum(data)
	if data:IsPlayer() then
	else
		return 0
	end
	
	--local cachecounter = 0
	local ep2asum = data:GetAllEP2Ach()
	
	
	if ep2asum == nil then
		ep2asum = 0
	end
	
	return tonumber(ep2asum)
	
end

function EP2AllAchExpr(data)
	if data:IsPlayer() then
	else
		return 0
	end
	
	
	ep2asum_expr = EP2PlyAchSum(data)
	allep2ach_expr = EP2AllAchSum()
	if ep2asum_expr != nil && ep2asum_expr > 0 then
		expr_ep2 = ep2asum_expr/allep2ach_expr
		
		
		
	end
	if expr_ep2 == nil then 
		expr_ep2 = 0
	end
	return tonumber(expr_ep2)
end
function EP2AllAchExprPercent(data)
	if data:IsPlayer() then
	else
		return 0
	end
	
	ep2asum_expr = EP2PlyAchSum(data)
	allep2ach_expr = EP2AllAchSum()
	if ep2asum_expr != nil && ep2asum_expr > 0 then
		expr_ep2 = ep2asum_expr/allep2ach_expr
		expr_ep2percent = math.Round(expr_ep2 * 100)
		
		
		
	end
	if expr_ep2percent == nil then
		expr_ep2percent = 0
	end
	return tonumber(expr_ep2percent)
end

function OpenStatWindow(inspect)
	if LocalPlayer() == inspect
	then 
		--print("HAPPENED")
		aimtarget = LocalPlayer()
	
	elseif IsValid(inspect) and 
	aim_stat_menu and
	inspect:IsPlayer() and
	inspect != LocalPlayer()
	then
		aimtarget = inspect
		
	elseif aimtarget == nil
	then
		--print("[hl2c] SOMETHING WENT WRONG WITH !STAT")
		--print("[hl2c] inspect:",inspect)
		--print("[hl2c] aimtarget:",aimtarget)
		return
	end
	--LocalPlayer():PrintMessage(HUD_PRINTTALK, "Opened Window")
	StatWindow = vgui.Create( "DFrame" )
	--StatWindow:SetPos( 100, 100 )
	StatWindow:SetSize( 330, 500 )
	StatWindow:SetTitle( "Stat Window" )
	StatWindow:SetDraggable( true )
	StatWindow:Center()
	StatWindow:MakePopup()	

	Stat_sheet = vgui.Create( "DPropertySheet", StatWindow )
	Stat_sheet:Dock( FILL )

	Stat_panel1 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255, 0 ) ) end
	Stat_sheet:AddSheet( "Player Stat", Stat_panel1 )
	/*
	local Stat_DLabel = vgui.Create( "DLabel", Stat_panel1 )
	Stat_DLabel:SetPos( 0, 0-60 )
	Stat_DLabel:SetSize( 300, 200 )
	Stat_DLabel:SetFont("arial16")
	Stat_DLabel:SetTextColor(Color(255,255,255,255))
	Stat_DLabel:SetText( "Player Name: "..LocalPlayer():Nick().."\nCurrent Xp: "..LocalPlayer():GetXP().."\nYour level is: "..LocalPlayer():GetCLevel().."\nFor level "..(LocalPlayer():GetCLevel() + 1)..": "..LevelCurve[LocalPlayer():GetCLevel() +1] - LocalPlayer():GetXP().." Xp left" )
	*/
	hl2c_props = vgui.Create( "DProperties", Stat_panel1 )
	hl2c_props:Dock( FILL )
	XRow1 = hl2c_props:CreateRow( "Xp Stats", "Level:" )
	XRow1:Setup( "Generic" )
	XRow1:SetValue( aimtarget:GetCLevel() )
	XRow2 = hl2c_props:CreateRow( "Xp Stats", "Total Xp:" )
	XRow2:Setup( "Generic" )
	if IsValid(aimtarget) then
		if aimtarget:GetCLevel() == 150 then
			XRow2:SetValue( "MAXIMUM" )
		else
			XRow2:SetValue( aimtarget:GetXP() )
		end
	else
		if aimtarget:GetCLevel() == 150 then
			XRow2:SetValue( "MAXIMUM" )
		else
			XRow2:SetValue( LocalPlayer():GetXP() )
		end
	end
	XRow3 = hl2c_props:CreateRow( "Xp Stats", "Xp for Next Level:" )
	XRow3:Setup( "Generic" )
	if aimtarget:GetCLevel() == 150 then
		XRow3:SetValue( "NOTHING" )
	else
	--XRow3:SetValue( "NOTHING" )
		XRow3:SetValue( LevelCurve[aimtarget:GetCLevel() +1] - aimtarget:GetXP() )
	end
	
	GRow1 = hl2c_props:CreateRow( "General", "Name:" )
	GRow1:Setup( "Generic" )
	GRow1:SetValue( aimtarget:Nick() )
	GRow2 = hl2c_props:CreateRow( "General", "Deaths:" )
	GRow2:Setup( "Generic" )
	GRow2:SetValue( "Under Development o_O" )
	GRow3 = hl2c_props:CreateRow( "General", "Map Rusher:" )
	GRow3:Setup( "Generic" )
	GRow3:SetValue( "Under Development o_O" )
	GRow4 = hl2c_props:CreateRow( "General", "Perma: " )
	GRow4:Setup( "Generic" )
	GRow4:SetValue( aimtarget:GetPerma() )
	GRow5 = hl2c_props:CreateRow( "General", "Antlion Kills: " )
	GRow5:Setup( "Generic" )
	GRow5:SetValue( aimtarget:GetNWInt("COUNT_KILLS_ANTLIONS") )
	GRow6 = hl2c_props:CreateRow( "General", "Zombie Kills: " )
	GRow6:Setup( "Generic" )
	GRow6:SetValue( aimtarget:GetNWInt("COUNT_KILLS_ZOMBIES") )
	GRow7 = hl2c_props:CreateRow( "General", "Combine Kills: " )
	GRow7:Setup( "Generic" )
	GRow7:SetValue( aimtarget:GetNWInt("COUNT_KILLS_COMBINES") )
	GRow8 = hl2c_props:CreateRow( "General", "Rebel Kills: " )
	GRow8:Setup( "Generic" )
	GRow8:SetValue( aimtarget:GetNWInt("COUNT_KILLS_REBELS") )
	GRow9 = hl2c_props:CreateRow( "General", "Vortigaunt Kills: " )
	GRow9:Setup( "Generic" )
	GRow9:SetValue( aimtarget:GetNWInt("COUNT_KILLS_VORTIGAUNTS") )
	GRow10 = hl2c_props:CreateRow( "General", "Headcrab Kills: " )
	GRow10:Setup( "Generic" )
	GRow10:SetValue( aimtarget:GetNWInt("COUNT_KILLS_HEADCRABS") )
	
	
	mPanel = vgui.Create( "DPanel", Stat_panel1)
	mPanel:SetPos( 220, 320 )
	--mPanel:Dock(BOTTOM)
	mPanel:SetSize( 75, 100 )
	//function mPanel:Paint(self, w, h)
	//draw.RoundedBox( 4, 0, 0, 200, 200, Color( 255, 128, 0, 100 ) )
	//surface.SetDrawColor( 255, 255, 255, 255 )
	//surface.DrawOutlinedRect( 0, 0, 100, 200 )
	//end
	hl2c_micon = vgui.Create( "DModelPanel", mPanel )
	hl2c_micon:Dock(FILL)
	hl2c_micon:SetSize( 115, 185 )
	--hl2c_micon:SetPos( 0,275 )
	hl2c_micon:SetModel( aimtarget:GetModel() )


	function hl2c_micon:LayoutEntity( ent )
	-- do nothing
	end
	
	local eyepos = hl2c_micon.Entity:GetBonePosition( hl2c_micon.Entity:LookupBone( "ValveBiped.Bip01_Head1" ) )

	eyepos:Add( Vector( 0, 0, 2.3 ) )	-- Move up slightly

	hl2c_micon:SetLookAt( eyepos )

	hl2c_micon:SetCamPos( eyepos-Vector( -13.3, 0, 0 ) )	-- Move cam in front of eyes

	hl2c_micon.Entity:SetEyeTarget( eyepos-Vector( -13.3, 0, 0 ) )
	
	--[[
	local PRow1 = hl2c_props:CreateRow( "Pet", "Name:" )
	PRow1:Setup( "Generic" )
	PRow1:SetValue( "Under Development o_O" )
	]]--
	
	
	
	
	
	
	
	local Stat_panel2 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panel2.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "HL2 Achievements", Stat_panel2 )
	
	
	local hl2ach_panel = vgui.Create("DPanel", Stat_panel2)
	hl2ach_panel:SetSize( 280, 330 )
	hl2ach_panel:SetPos( 10, 80 ) 
	hl2ach_panel:SetBackgroundColor(Color(0,0,0))
	hl2ach_panel:SizeToContents() 
	--hl2ach_panel:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one
	
	local hl2ach_DScrollPanel = vgui.Create( "DScrollPanel", hl2ach_panel )
	hl2ach_DScrollPanel:SetSize( 280, 330 )
	hl2ach_DScrollPanel:SetPos( 0, 0 )
	
	local hl2ach_grid = vgui.Create( "DGrid", hl2ach_DScrollPanel )
	hl2ach_grid:SetPos( 1, 1 )
	hl2ach_grid:SetCols( 1 )
	hl2ach_grid:SetColWide( 437 )
	hl2ach_grid:SetRowHeight(71)
	
	for i=1,#Hl2c.HL2_ACH_LIST do
		local v = Hl2c.HL2_ACH_LIST[i]
		if (v == "ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS" and aimtarget:GetNWInt(v) == 1) or (v != "ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS") then
			local hl2achlist_panel = vgui.Create("DPanel")
			hl2achlist_panel:SetSize( 263, 70 )
			hl2achlist_panel:SizeToContents() 
			hl2achlist_panel:SetBackgroundColor( Color(150,150,150) )
			--local hl2cach_but = vgui.Create( "DButton", hl2achlist_panel )
			--hl2cach_but:SetText( i )
			--hl2cach_but:SetSize( 30, 20 )
			local mat = vgui.Create( "Material", hl2achlist_panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local hl2cachelist_locktxt = vgui.Create( "DLabel", hl2achlist_panel )
			hl2cachelist_locktxt:SetPos( 80, 10 )
			hl2cachelist_locktxt:SetAutoStretchVertical( false )
			hl2cachelist_locktxt:SetContentAlignment( 7 )
			hl2cachelist_locktxt:SetSize( 180,60 )
			hl2cachelist_locktxt:SetWrap( true )
			hl2cachelist_locktxt:SetTextColor( Color(255,255,255) )
			if aimtarget:GetNWInt(v) == 0  then
				hl2cachelist_locktxt:SetText( HL2_ACH_LIST_TITLE[v] )
			else
				hl2cachelist_locktxt:SetText( HL2_ACH_LIST_TITLE[v] )
				hl2achlist_panel:SetBackgroundColor( Color(200,200,200) )
				mat:SetMaterial( HL2_ACH_LIST_MAT[v] )	-- Path to material VMT
				
			end
			hl2cachelist_locktxt:SetAutoStretchVertical( true )
			
			local hl2cachelist_detailtxt = vgui.Create( "DLabel", hl2achlist_panel )
			hl2cachelist_detailtxt:SetPos( 80, 30 )
			hl2cachelist_detailtxt:SetTextColor( Color(255,255,255) )
			hl2cachelist_detailtxt:SetText( HL2_ACH_LIST_TEXT[v] )
			hl2cachelist_detailtxt:SetAutoStretchVertical( false )
			hl2cachelist_detailtxt:SetContentAlignment( 7 )
			hl2cachelist_detailtxt:SetSize( 180,60 )
			hl2cachelist_detailtxt:SetWrap( true )
			
			hl2ach_grid:AddItem( hl2achlist_panel )
		end
	end
	
		
		
	for i=1,1 do
		local v = "customsetup_1"
		if (aimtarget:GetNWInt(v) == 1)
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize( 263, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local title = vgui.Create( "DLabel", panel )
			title:SetPos( 80, 10 )
			title:SetAutoStretchVertical( false )
			title:SetContentAlignment( 7 )
			title:SetSize( 180,60 )
			title:SetWrap( true )
			title:SetTextColor( Color(255,255,255) )
			title:SetText( SECRET_ACHIEVEMENT_HL2_TITLE )
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( SECRET_ACHIEVEMENT_HL2_MATERIAL )	-- Path to material VMT
			
			title:SetAutoStretchVertical( true )
			
			local detail = vgui.Create( "DLabel", panel )
			detail:SetPos( 80, 30 )
			detail:SetTextColor( Color(255,255,255) )
			detail:SetText( SECRET_ACHIEVEMENT_HL2_DETAIL )
			detail:SetAutoStretchVertical( false )
			detail:SetContentAlignment( 7 )
			detail:SetSize( 180,60 )
			detail:SetWrap( true )
			
			hl2ach_grid:AddItem( panel )
		
		end
	end
	for i=1,1 do
		local v = "customsetup_2"
		if (aimtarget:GetNWInt(v) == 1)
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize( 263, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local title = vgui.Create( "DLabel", panel )
			title:SetPos( 80, 10 )
			title:SetAutoStretchVertical( false )
			title:SetContentAlignment( 7 )
			title:SetSize( 180,60 )
			title:SetWrap( true )
			title:SetTextColor( Color(255,255,255) )
			title:SetText( SECRET_ACHIEVEMENT_LT_TITLE )
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( SECRET_ACHIEVEMENT_LT_MATERIAL )	-- Path to material VMT
			
			title:SetAutoStretchVertical( true )
			
			local detail = vgui.Create( "DLabel", panel )
			detail:SetPos( 80, 30 )
			detail:SetTextColor( Color(255,255,255) )
			detail:SetText( SECRET_ACHIEVEMENT_LT_DETAIL )
			detail:SetAutoStretchVertical( false )
			detail:SetContentAlignment( 7 )
			detail:SetSize( 180,60 )
			detail:SetWrap( true )
			
			hl2ach_grid:AddItem( panel )
		
		end
	end
	for i=1, 1 do
		if aimtarget:GetNWInt("ACHIEVEMENT_EVENT_HL2_FIND_ALLLAMBDAS") != 0 then
		else
		local hl2achlist_panel = vgui.Create("DPanel")
		hl2achlist_panel:SetSize( 263, 70 )
		hl2achlist_panel:SizeToContents() 
		hl2achlist_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", hl2achlist_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", hl2achlist_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local hl2cachelist_locktxt = vgui.Create( "DLabel", hl2achlist_panel )
		hl2cachelist_locktxt:SetPos( 80, 10 )
		hl2cachelist_locktxt:SetTextColor( Color(255,255,255) )
		hl2cachelist_locktxt:SetAutoStretchVertical( false )
		hl2cachelist_locktxt:SetContentAlignment( 7 )
		hl2cachelist_locktxt:SetSize( 180,60 )
		hl2cachelist_locktxt:SetWrap( true )
		local counter = 0
		for k, v in pairs(HL2_LAMDACACHE) do
			if aimtarget:GetNWInt(v) == 1 then
				counter = counter + 1
				if aimtarget:GetNWInt(v) != 47  then
					--hl2cachelist_locktxt:SetText( "Locked" )
				else
					--hl2cachelist_locktxt:SetText( "Unlocked" )
					hl2achlist_panel:SetBackgroundColor( Color(200,200,200) )
					mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
				
				end
				
			end
			hl2cachelist_locktxt:SetText( "Lambda Locator 47 / ".. counter .."" )
		end
		
		hl2cachelist_locktxt:SetAutoStretchVertical( true )
		
		local hl2cachelist_detailtxt = vgui.Create( "DLabel", hl2achlist_panel )
		hl2cachelist_detailtxt:SetPos( 80, 30 )
		hl2cachelist_detailtxt:SetTextColor( Color(255,255,255) )
		hl2cachelist_detailtxt:SetText( "Find all lambda caches in Half-Life 2." )
		hl2cachelist_detailtxt:SetAutoStretchVertical( false )
		hl2cachelist_detailtxt:SetContentAlignment( 7 )
		hl2cachelist_detailtxt:SetSize( 180,60 )
		hl2cachelist_detailtxt:SetWrap( true )
		
		hl2ach_grid:AddItem( hl2achlist_panel )
		end
		
		local hl2a_ProgPanel = vgui.Create("DPanel", Stat_panel2)
		hl2a_ProgPanel:SetSize( 252, 45 )
		hl2a_ProgPanel:SetPos( 20, 10 ) 
		hl2a_ProgPanel:SetBackgroundColor(Color(0,0,0))
	
		local hl2a_DProgress = vgui.Create( "DProgress", hl2a_ProgPanel )
		hl2a_DProgress:SetPos( 1, 19 )
		hl2a_DProgress:SetSize( 250, 25 )
		--if exprhl2 > 1 then
		if Hl2AllAchExpr(aimtarget) > 1 then
		hl2a_DProgress:SetFraction( 1 )
		--elseif exprhl2 < 0 then
		elseif Hl2AllAchExpr(aimtarget) < 0 then
		hl2a_DProgress:SetFraction( 0 )
		--elseif exprhl2 == nil then
		elseif Hl2AllAchExpr(aimtarget) == nil then
		hl2a_DProgress:SetFraction( 0 )
		else
		--hl2a_DProgress:SetFraction( exprhl2 )
		hl2a_DProgress:SetFraction( Hl2AllAchExpr(aimtarget) )
		end
		
		local hl2a_ProgTxt = vgui.Create( "DLabel", hl2a_ProgPanel )
		hl2a_ProgTxt:SetPos( 0, 5 )
		hl2a_ProgTxt:SetTextColor( Color(255,255,255) )
		--hl2a_ProgTxt:SetText( "Progress: ("..hl2asum.."/"..allhl2ach..") "..exprhl2percent.."%" )
		hl2a_ProgTxt:SetText( "Progress: ("..Hl2PlyAchSum(aimtarget).."/"..Hl2AllAchSum()..") "..Hl2AllAchExprPercent(aimtarget).."%" )
		hl2a_ProgTxt:SetAutoStretchVertical( false )
		hl2a_ProgTxt:SetContentAlignment( 6 )
		hl2a_ProgTxt:SetSize( 180,60 )
		--hl2a_ProgTxt:SetWrap( true )
		hl2a_ProgTxt:SetAutoStretchVertical( true )
	
	end
	
	
	// vgui/hud/icon_locked
	
	//////////////////////////////////////////////////////////////////////////////
	// HL2 LamdaCache Panel //////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	local Stat_panel3 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panel3.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "HL2 LamdaCache", Stat_panel3 )
	
	local hl2cache_panel = vgui.Create("DPanel", Stat_panel3)
	hl2cache_panel:SetSize( 280, 400 )
	hl2cache_panel:SetPos( 10, 10 ) 
	hl2cache_panel:SetBackgroundColor(Color(0,0,0))
	hl2cache_panel:SizeToContents() 
	--hl2cache_panel:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one
	
	local hl2cache_DScrollPanel = vgui.Create( "DScrollPanel", hl2cache_panel )
	hl2cache_DScrollPanel:SetSize( 280, 400 )
	hl2cache_DScrollPanel:SetPos( 0, 0 )
	
	local hl2cache_grid = vgui.Create( "DGrid", hl2cache_DScrollPanel )
	hl2cache_grid:SetPos( 1, 1 )
	hl2cache_grid:SetCols( 1 )
	hl2cache_grid:SetColWide( 437 )
	hl2cache_grid:SetRowHeight(71)
	
	for k, v in pairs(HL2_LAMDACACHE) do

		local hl2cache_ach_panel = vgui.Create("DPanel")
		hl2cache_ach_panel:SetSize( 263, 70 )
		hl2cache_ach_panel:SetPos( 4, 5 )
		hl2cache_ach_panel:SizeToContents() 
		hl2cache_ach_panel:SetBackgroundColor( Color(150,150,150) )
		local hl2cachelist_locktxt = vgui.Create( "DLabel", hl2cache_ach_panel )
		hl2cachelist_locktxt:SetPos( 80, 10 )
		hl2cachelist_locktxt:SetTextColor( Color(255,255,255) )
		local mat = vgui.Create( "Material", hl2cache_ach_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
		hl2cache_grid:AddItem( hl2cache_ach_panel )
		if aimtarget:GetNWInt(v) == 1 then
			hl2cachelist_locktxt:SetText( "Unlocked" )
			hl2cache_ach_panel:SetBackgroundColor( Color(200,200,200) )
			
		else
			hl2cachelist_locktxt:SetText( "Locked" )
			mat:SetMaterial("vgui/hud/icon_locked")
		end
		hl2cachelist_locktxt:SetAutoStretchVertical( true )
		local hl2cachelist_detailtxt = vgui.Create( "DLabel", hl2cache_ach_panel )
		hl2cachelist_detailtxt:SetPos( 80, 30 )
		hl2cachelist_detailtxt:SetTextColor( Color(255,255,255) )
		hl2cachelist_detailtxt:SetText( HL2_LAMDACACHE_TEXT[v] )
		hl2cachelist_detailtxt:SetAutoStretchVertical( false )
		hl2cachelist_detailtxt:SetContentAlignment( 7 )
		hl2cachelist_detailtxt:SetSize( 180,60 )
		hl2cachelist_detailtxt:SetWrap( true )
		
		
		/*
		local hl2cache_but = vgui.Create( "DButton", hl2cache_ach_panel )
		hl2cache_but:SetText( i )
		hl2cache_but:SetSize( 30, 20 )
		*/
	end
	
	//////////////////////////////////////////////////////////////////////////////
	// HL2 LamdaCache Panel //////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////
	
	local tab = vgui.Create( "DPanel", Stat_sheet )
	tab.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "EP2 LamdaCache", tab )
	
	local panel = vgui.Create("DPanel", tab)
	panel:SetSize( 280, 400 )
	panel:SetPos( 10, 10 ) 
	panel:SetBackgroundColor(Color(0,0,0))
	panel:SizeToContents() 
	--panel:SetDark( 1 ) -- Set the colour of the text inside the label to a darker one
	
	local scroll = vgui.Create( "DScrollPanel", panel )
	scroll:SetSize( 280, 400 )
	scroll:SetPos( 0, 0 )
	
	local grid = vgui.Create( "DGrid", scroll )
	grid:SetPos( 1, 1 )
	grid:SetCols( 1 )
	grid:SetColWide( 437 )
	grid:SetRowHeight(71)
	
	for i=1,#Hl2c.EP2_WEBCACHE_LIST do
		local v = Hl2c.EP2_WEBCACHE_LIST[i]
		local ach_panel = vgui.Create("DPanel")
		ach_panel:SetSize( 263, 70 )
		ach_panel:SetPos( 4, 5 )
		ach_panel:SizeToContents() 
		ach_panel:SetBackgroundColor( Color(150,150,150) )
		local text_lock = vgui.Create( "DLabel", ach_panel )
		text_lock:SetPos( 80, 10 )
		text_lock:SetTextColor( Color(255,255,255) )
		local mat = vgui.Create( "Material", ach_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
		grid:AddItem( ach_panel )
		if aimtarget:GetNWInt(v) == 1 then
			text_lock:SetText( "Unlocked" )
			ach_panel:SetBackgroundColor( Color(200,200,200) )
			
		else
			text_lock:SetText( "Locked" )
			mat:SetMaterial("vgui/hud/icon_locked")
		end
		text_lock:SetAutoStretchVertical( true )
		local detail = vgui.Create( "DLabel", ach_panel )
		detail:SetPos( 80, 30 )
		detail:SetTextColor( Color(255,255,255) )
		detail:SetText( Hl2c.EP2_WEBCACHE_TEXT[i] )
		detail:SetAutoStretchVertical( false )
		detail:SetContentAlignment( 7 )
		detail:SetSize( 180,60 )
		detail:SetWrap( true )
		
	end
	for i=1,#Hl2c.EP2_RADARCACHE_LIST do
		local v = Hl2c.EP2_RADARCACHE_LIST[i]
		local ach_panel = vgui.Create("DPanel")
		ach_panel:SetSize( 263, 70 )
		ach_panel:SetPos( 4, 5 )
		ach_panel:SizeToContents() 
		ach_panel:SetBackgroundColor( Color(150,150,150) )
		local text_lock = vgui.Create( "DLabel", ach_panel )
		text_lock:SetPos( 80, 10 )
		text_lock:SetTextColor( Color(255,255,255) )
		local mat = vgui.Create( "Material", ach_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/achievements/hl2_find_alllambdas" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
		grid:AddItem( ach_panel )
		if aimtarget:GetNWInt(v) == 1 then
			text_lock:SetText( "Unlocked" )
			ach_panel:SetBackgroundColor( Color(200,200,200) )
			
		else
			text_lock:SetText( "Locked" )
			mat:SetMaterial("vgui/hud/icon_locked")
		end
		text_lock:SetAutoStretchVertical( true )
		local detail = vgui.Create( "DLabel", ach_panel )
		detail:SetPos( 80, 30 )
		detail:SetTextColor( Color(255,255,255) )
		detail:SetText( Hl2c.EP2_RADARCACHE_TEXT[i] )
		detail:SetAutoStretchVertical( false )
		detail:SetContentAlignment( 7 )
		detail:SetSize( 180,60 )
		detail:SetWrap( true )
		
	end
	
	
	----------------------
	-- EP1 Achievements --
	----------------------
	local Stat_panelEP1 = vgui.Create( "DPanel", Stat_sheet )
	Stat_panelEP1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "EP1 Achievements", Stat_panelEP1 )
	
	local EP1ach_panel = vgui.Create("DPanel", Stat_panelEP1)
	EP1ach_panel:SetSize( 280, 330 )
	EP1ach_panel:SetPos( 10, 80 ) 
	EP1ach_panel:SetBackgroundColor(Color(0,0,0))
	EP1ach_panel:SizeToContents() 
	
	local EP1ach_DScrollPanel = vgui.Create( "DScrollPanel", EP1ach_panel )
	EP1ach_DScrollPanel:SetSize( 280, 330 )
	EP1ach_DScrollPanel:SetPos( 0, 0 )
	
	local EP1ach_grid = vgui.Create( "DGrid", EP1ach_DScrollPanel )
	EP1ach_grid:SetPos( 1, 1 )
	EP1ach_grid:SetCols( 1 )
	EP1ach_grid:SetColWide( 437 )
	EP1ach_grid:SetRowHeight(71)
		
	for k, v in pairs(EP1_ACH_LIST) do
		if v == "ACHIEVEMENT_EVENT_EP1_BEAT_GAME_ONEBULLET" then
		
		else
		local EP1achlist_panel = vgui.Create("DPanel")
		EP1achlist_panel:SetSize( 263, 70 )
		EP1achlist_panel:SizeToContents() 
		EP1achlist_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", EP1achlist_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", EP1achlist_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local EP1cachelist_locktxt = vgui.Create( "DLabel", EP1achlist_panel )
		EP1cachelist_locktxt:SetPos( 80, 10 )
		EP1cachelist_locktxt:SetAutoStretchVertical( false )
		EP1cachelist_locktxt:SetContentAlignment( 7 )
		EP1cachelist_locktxt:SetSize( 180,60 )
		EP1cachelist_locktxt:SetWrap( true )
		EP1cachelist_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			EP1cachelist_locktxt:SetText( EP1_ACH_LIST_TITLE[v] )
		else
			EP1cachelist_locktxt:SetText( EP1_ACH_LIST_TITLE[v] )
			EP1achlist_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( EP1_ACH_LIST_MAT[v] )	-- Path to material VMT
			
		end
		EP1cachelist_locktxt:SetAutoStretchVertical( true )
		
		local EP1cachelist_detailtxt = vgui.Create( "DLabel", EP1achlist_panel )
		EP1cachelist_detailtxt:SetPos( 80, 30 )
		EP1cachelist_detailtxt:SetTextColor( Color(255,255,255) )
		EP1cachelist_detailtxt:SetText( EP1_ACH_LIST_TEXT[v] )
		EP1cachelist_detailtxt:SetAutoStretchVertical( false )
		EP1cachelist_detailtxt:SetContentAlignment( 7 )
		EP1cachelist_detailtxt:SetSize( 180,60 )
		EP1cachelist_detailtxt:SetWrap( true )
		
		EP1ach_grid:AddItem( EP1achlist_panel )
		
		end
	end
	
	for i=1, 1 do
		
		local EP1a_ProgPanel = vgui.Create("DPanel", Stat_panelEP1)
		EP1a_ProgPanel:SetSize( 252, 45 )
		EP1a_ProgPanel:SetPos( 20, 10 ) 
		EP1a_ProgPanel:SetBackgroundColor(Color(0,0,0))
	
		local EP1a_DProgress = vgui.Create( "DProgress", EP1a_ProgPanel )
		EP1a_DProgress:SetPos( 1, 19 )
		EP1a_DProgress:SetSize( 250, 25 )
		if EP1AllAchExpr(aimtarget) > 1 then
		EP1a_DProgress:SetFraction( 1 )
		elseif EP1AllAchExpr(aimtarget) < 0 then
		EP1a_DProgress:SetFraction( 0 )
		elseif EP1AllAchExpr(aimtarget) == nil then
		EP1a_DProgress:SetFraction( 0 )
		else
		EP1a_DProgress:SetFraction( EP1AllAchExpr(aimtarget) )
		end
		
		local EP1a_ProgTxt = vgui.Create( "DLabel", EP1a_ProgPanel )
		EP1a_ProgTxt:SetPos( 0, 5 )
		EP1a_ProgTxt:SetTextColor( Color(255,255,255) )
		EP1a_ProgTxt:SetText( "Progress: ("..EP1PlyAchSum(aimtarget).."/"..EP1AllAchSum()..") "..EP1AllAchExprPercent(aimtarget).."%" )
		EP1a_ProgTxt:SetAutoStretchVertical( false )
		EP1a_ProgTxt:SetContentAlignment( 6 )
		EP1a_ProgTxt:SetSize( 180,60 )
		--EP1a_ProgTxt:SetWrap( true )
		EP1a_ProgTxt:SetAutoStretchVertical( true )
	end
	
	----------------------
	-- EP2 Achievements --
	----------------------
	local tab = vgui.Create( "DPanel", Stat_sheet )
	tab.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "EP2 Achievements", tab )
	
	local panel = vgui.Create("DPanel", tab)
	panel:SetSize( 280, 330 )
	panel:SetPos( 10, 80 ) 
	panel:SetBackgroundColor(Color(0,0,0))
	panel:SizeToContents() 
	
	local scroll = vgui.Create( "DScrollPanel", panel )
	scroll:SetSize( 280, 330 )
	scroll:SetPos( 0, 0 )
	
	local grid = vgui.Create( "DGrid", scroll )
	grid:SetPos( 1, 1 )
	grid:SetCols( 1 )
	grid:SetColWide( 437 )
	grid:SetRowHeight(71)
	
	for i=1,#Hl2c.EP2_ACH_LIST do
		local v = Hl2c.EP2_ACH_LIST[i]
		if (false) then
		elseif v == "ACHIEVEMENT_EVENT_EP2_BEAT_RACEWITHDOG" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_PUT_ITEMINROCKET" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHCAR" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_KILL_ENEMY_WITHHOPPERMINE" then
		-- elseif v == "ACHIEVEMENT_EVENT_EP2_KILL_ENEMIES_WITHPHYSICS" then
		
		else
		
		local ep2_panel = vgui.Create("DPanel")
		ep2_panel:SetSize( 263, 70 )
		ep2_panel:SizeToContents() 
		ep2_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", ep2_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", ep2_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local lock = vgui.Create( "DLabel", ep2_panel )
		lock:SetPos( 80, 10 )
		lock:SetAutoStretchVertical( false )
		lock:SetContentAlignment( 7 )
		lock:SetSize( 180,60 )
		lock:SetWrap( true )
		lock:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			lock:SetText( EP2_ACH_LIST_TITLE[v] )
		else
			lock:SetText( EP2_ACH_LIST_TITLE[v] )
			ep2_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( EP2_ACH_LIST_MAT[v] )	-- Path to material VMT
			
		end
		lock:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", ep2_panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		text:SetText( EP2_ACH_LIST_TEXT[v] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		grid:AddItem( ep2_panel )
		end
	end
	

	for i=1, 1 do
		
		local EP2a_ProgPanel = vgui.Create("DPanel", tab)
		EP2a_ProgPanel:SetSize( 252, 45 )
		EP2a_ProgPanel:SetPos( 20, 10 ) 
		EP2a_ProgPanel:SetBackgroundColor(Color(0,0,0))
	
		local EP2a_DProgress = vgui.Create( "DProgress", EP2a_ProgPanel )
		EP2a_DProgress:SetPos( 1, 19 )
		EP2a_DProgress:SetSize( 250, 25 )
		if EP2AllAchExpr(aimtarget) > 1 then
		EP2a_DProgress:SetFraction( 1 )
		elseif EP2AllAchExpr(aimtarget) < 0 then
		EP2a_DProgress:SetFraction( 0 )
		elseif EP2AllAchExpr(aimtarget) == nil then
		EP2a_DProgress:SetFraction( 0 )
		else
		EP2a_DProgress:SetFraction( EP2AllAchExpr(aimtarget) )
		end
		
		local EP2a_ProgTxt = vgui.Create( "DLabel", EP2a_ProgPanel )
		EP2a_ProgTxt:SetPos( 0, 5 )
		EP2a_ProgTxt:SetTextColor( Color(255,255,255) )
		EP2a_ProgTxt:SetText( "Progress: ("..EP2PlyAchSum(aimtarget).."/"..EP2AllAchSum()..") ".. EP2AllAchExprPercent(aimtarget) .."%" )
		EP2a_ProgTxt:SetAutoStretchVertical( false )
		EP2a_ProgTxt:SetContentAlignment( 6 )
		EP2a_ProgTxt:SetSize( 180,60 )
		--EP2a_ProgTxt:SetWrap( true )
		EP2a_ProgTxt:SetAutoStretchVertical( true )
	end
	
	--------------------------
	-- General Achievements --
	--------------------------
	local tab = vgui.Create( "DPanel", Stat_sheet )
	tab.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "General Achievements", tab )
	
	local panel = vgui.Create("DPanel", tab)
	panel:SetSize( 280, 330 )
	panel:SetPos( 10, 80 ) 
	panel:SetBackgroundColor(Color(0,0,0))
	panel:SizeToContents() 
	
	local scroll = vgui.Create( "DScrollPanel", panel )
	scroll:SetSize( 280, 330 )
	scroll:SetPos( 0, 0 )
	
	local grid = vgui.Create( "DGrid", scroll )
	grid:SetPos( 1, 1 )
	grid:SetCols( 1 )
	grid:SetColWide( 437 )
	grid:SetRowHeight(71)
	
	for i=1,#Hl2c.GEN_ACH_LIST do
		local v = Hl2c.GEN_ACH_LIST[i]
		if (v == "ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN" and
		aimtarget:GetNWInt(v) == 1) or v != "ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN"
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize( 263, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			--local hl2cach_but = vgui.Create( "DButton", panel )
			--hl2cach_but:SetText( i )
			--hl2cach_but:SetSize( 30, 20 )
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local text_title = vgui.Create( "DLabel", panel )
			text_title:SetPos( 80, 10 )
			text_title:SetAutoStretchVertical( false )
			text_title:SetContentAlignment( 7 )
			text_title:SetSize( 180,60 )
			text_title:SetWrap( true )
			text_title:SetTextColor( Color(255,255,255) )
			if aimtarget:GetNWInt(v) == 0  then
				text_title:SetText( GEN_ACH_LIST_TITLE[v] )
				--mat:SetMaterial( GEN_ACH_LIST_MAT[v] )	-- Path to material VMT
				
			else
				text_title:SetText( GEN_ACH_LIST_TITLE[v] )
				panel:SetBackgroundColor( Color(200,200,200) )
				mat:SetMaterial( GEN_ACH_LIST_MAT[v] )	-- Path to material VMT
				
			end
			text_title:SetAutoStretchVertical( true )
			
			local text_detail = vgui.Create( "DLabel", panel )
			text_detail:SetPos( 80, 30 )
			text_detail:SetTextColor( Color(255,255,255) )
			text_detail:SetText( GEN_ACH_LIST_TEXT[v] )
			text_detail:SetAutoStretchVertical( false )
			text_detail:SetContentAlignment( 7 )
			text_detail:SetSize( 180,60 )
			text_detail:SetWrap( true )
			
			grid:AddItem( panel )
		
		end
	end
	
	for i=1,1 do
		local v = "customsetup_3"
		if (aimtarget:GetNWInt(v) == 1)
		then
			
			local panel = vgui.Create("DPanel")
			panel:SetSize( 263, 70 )
			panel:SizeToContents() 
			panel:SetBackgroundColor( Color(150,150,150) )
			
			local mat = vgui.Create( "Material", panel )
			mat:SetPos( 2, 2 )
			mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
			mat:SetSize( 10, 10 )
					
			local title = vgui.Create( "DLabel", panel )
			title:SetPos( 80, 10 )
			title:SetAutoStretchVertical( false )
			title:SetContentAlignment( 7 )
			title:SetSize( 180,60 )
			title:SetWrap( true )
			title:SetTextColor( Color(255,255,255) )
			title:SetText( SECRET_ACHIEVEMENT_MASK1_TITLE )
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( SECRET_ACHIEVEMENT_MASK1_MATERIAL )	-- Path to material VMT
			
			title:SetAutoStretchVertical( true )
			
			local detail = vgui.Create( "DLabel", panel )
			detail:SetPos( 80, 30 )
			detail:SetTextColor( Color(255,255,255) )
			detail:SetText( SECRET_ACHIEVEMENT_MASK1_DETAIL )
			detail:SetAutoStretchVertical( false )
			detail:SetContentAlignment( 7 )
			detail:SetSize( 180,60 )
			detail:SetWrap( true )
			
			grid:AddItem( panel )
		
		end
	end
	
	
	for i=1, 1 do
		
		local panel = vgui.Create("DPanel", tab)
		panel:SetSize( 252, 45 )
		panel:SetPos( 20, 10 ) 
		panel:SetBackgroundColor(Color(0,0,0))
	
		local progress = vgui.Create( "DProgress", panel )
		progress:SetPos( 1, 19 )
		progress:SetSize( 250, 25 )
		if AllGenExpr(aimtarget) > 1 then
		progress:SetFraction( 1 )
		elseif AllGenExpr(aimtarget) < 0 then
		progress:SetFraction( 0 )
		elseif AllGenExpr(aimtarget) == nil then
		progress:SetFraction( 0 )
		else
		progress:SetFraction( AllGenExpr(aimtarget) )
		end
		
		
		
		local txt = vgui.Create( "DLabel", panel )
		txt:SetPos( 0, 5 )
		txt:SetTextColor( Color(255,255,255) )
		txt:SetText( "Progress: (".. PlyGenSum(aimtarget) .."/".. AllGenSum() ..") ".. AllGenExprPercent(aimtarget) .."%" )
		txt:SetAutoStretchVertical( false )
		txt:SetContentAlignment( 6 )
		txt:SetSize( 180,60 )
		--txt:SetWrap( true )
		txt:SetAutoStretchVertical( true )
	end
	
	-------------------------
	-- Vortex Achievements --
	-------------------------
	local Stat_panelVortex = vgui.Create( "DPanel", Stat_sheet )
	Stat_panelVortex.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	Stat_sheet:AddSheet( "Vortex List", Stat_panelVortex )
	
	local Vortex_panel = vgui.Create("DPanel", Stat_panelVortex)
	Vortex_panel:SetSize( 280, 330 )
	Vortex_panel:SetPos( 10, 80 ) 
	Vortex_panel:SetBackgroundColor(Color(0,0,0))
	Vortex_panel:SizeToContents() 
	
	local scroll = vgui.Create( "DScrollPanel", Vortex_panel )
	scroll:SetSize( 280, 330 )
	scroll:SetPos( 0, 0 )
	
	local Vortex_grid = vgui.Create( "DGrid", scroll )
	Vortex_grid:SetPos( 1, 1 )
	Vortex_grid:SetCols( 1 )
	Vortex_grid:SetColWide( 437 )
	Vortex_grid:SetRowHeight(71)
	
	for k, v in pairs(VORTEX_LIST_HL2_NAME) do
	
		local Vortex_list_panel = vgui.Create("DPanel")
		Vortex_list_panel:SetSize( 263, 70 )
		Vortex_list_panel:SizeToContents() 
		Vortex_list_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", Vortex_list_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local Vortex_locktxt = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_locktxt:SetPos( 80, 10 )
		Vortex_locktxt:SetAutoStretchVertical( false )
		Vortex_locktxt:SetContentAlignment( 7 )
		Vortex_locktxt:SetSize( 180,60 )
		Vortex_locktxt:SetWrap( true )
		Vortex_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			Vortex_locktxt:SetText( VORTEX_LIST_HL2_TITLE[v] )
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
			Vortex_locktxt:SetText( VORTEX_LIST_HL2_TITLE[v] )
			Vortex_list_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		end
		Vortex_locktxt:SetAutoStretchVertical( true )
		
		local Vortex_text = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_text:SetPos( 80, 30 )
		Vortex_text:SetTextColor( Color(255,255,255) )
		Vortex_text:SetText( VORTEX_LIST_HL2_DESC[v] )
		Vortex_text:SetAutoStretchVertical( false )
		Vortex_text:SetContentAlignment( 7 )
		Vortex_text:SetSize( 180,60 )
		Vortex_text:SetWrap( true )
		
		Vortex_grid:AddItem( Vortex_list_panel )
	end
	
	for k, v in pairs(VORTEX_LIST_EP1_NAME) do
	
		local Vortex_list_panel = vgui.Create("DPanel")
		Vortex_list_panel:SetSize( 263, 70 )
		Vortex_list_panel:SizeToContents() 
		Vortex_list_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", Vortex_list_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local Vortex_locktxt = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_locktxt:SetPos( 80, 10 )
		Vortex_locktxt:SetAutoStretchVertical( false )
		Vortex_locktxt:SetContentAlignment( 7 )
		Vortex_locktxt:SetSize( 180,60 )
		Vortex_locktxt:SetWrap( true )
		Vortex_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			Vortex_locktxt:SetText( VORTEX_LIST_EP1_TITLE[v] )
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
			Vortex_locktxt:SetText( VORTEX_LIST_EP1_TITLE[v] )
			Vortex_list_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( VORTEX_LIST_EP1_MAT[v] )	-- Path to material VMT
			
		end
		Vortex_locktxt:SetAutoStretchVertical( true )
		
		local Vortex_text = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_text:SetPos( 80, 30 )
		Vortex_text:SetTextColor( Color(255,255,255) )
		Vortex_text:SetText( VORTEX_LIST_EP1_DESC[v] )
		Vortex_text:SetAutoStretchVertical( false )
		Vortex_text:SetContentAlignment( 7 )
		Vortex_text:SetSize( 180,60 )
		Vortex_text:SetWrap( true )
		
		Vortex_grid:AddItem( Vortex_list_panel )
	end
	
	for k, v in pairs(VORTEX_LIST_EP2_NAME) do
	
		local Vortex_list_panel = vgui.Create("DPanel")
		Vortex_list_panel:SetSize( 263, 70 )
		Vortex_list_panel:SizeToContents() 
		Vortex_list_panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", Vortex_list_panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local Vortex_locktxt = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_locktxt:SetPos( 80, 10 )
		Vortex_locktxt:SetAutoStretchVertical( false )
		Vortex_locktxt:SetContentAlignment( 7 )
		Vortex_locktxt:SetSize( 180,60 )
		Vortex_locktxt:SetWrap( true )
		Vortex_locktxt:SetTextColor( Color(255,255,255) )
		if aimtarget:GetNWInt(v) == 0  then
			Vortex_locktxt:SetText( VORTEX_LIST_EP2_TITLE[v] )
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
			Vortex_locktxt:SetText( VORTEX_LIST_EP2_TITLE[v] )
			Vortex_list_panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( VORTEX_LIST_EP2_MAT[v] )	-- Path to material VMT
			
		end
		Vortex_locktxt:SetAutoStretchVertical( true )
		
		local Vortex_text = vgui.Create( "DLabel", Vortex_list_panel )
		Vortex_text:SetPos( 80, 30 )
		Vortex_text:SetTextColor( Color(255,255,255) )
		Vortex_text:SetText( VORTEX_LIST_EP2_DESC[v] )
		Vortex_text:SetAutoStretchVertical( false )
		Vortex_text:SetContentAlignment( 7 )
		Vortex_text:SetSize( 180,60 )
		Vortex_text:SetWrap( true )
		
		Vortex_grid:AddItem( Vortex_list_panel )
	end
	
	for i=1,#Hl2c.VORTEX_CD_LIST do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 263, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "CD Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_CD_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_CD_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	for i=1,#Hl2c.VORTEX_EP3_LIST do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 263, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "Episode Three Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_EP3_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_EP3_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	for i=1,#Hl2c.VORTEX_META_LIST do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 263, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "Metastasis: Minerva Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_META_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_META_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	for i=1,1 do
	
		local panel = vgui.Create("DPanel")
		panel:SetSize( 263, 70 )
		panel:SizeToContents() 
		panel:SetBackgroundColor( Color(150,150,150) )
		--local hl2cach_but = vgui.Create( "DButton", Vortex_panel )
		--hl2cach_but:SetText( i )
		--hl2cach_but:SetSize( 30, 20 )
		local mat = vgui.Create( "Material", panel )
		mat:SetPos( 2, 2 )
		mat:SetMaterial( "vgui/hud/icon_locked" )	-- Path to material VMT
		mat:SetSize( 10, 10 )
				
		local title = vgui.Create( "DLabel", panel )
		title:SetPos( 80, 10 )
		title:SetAutoStretchVertical( false )
		title:SetContentAlignment( 7 )
		title:SetSize( 180,60 )
		title:SetWrap( true )
		title:SetTextColor( Color(255,255,255) )
		title:SetText( "LostCoast Vortex" )
		if aimtarget:GetNWInt(Hl2c.VORTEX_LT_LIST[i]) == 0  then
			
			--mat:SetMaterial( VORTEX_LIST_HL2_MAT[v] )	-- Path to material VMT
			
		else
		
			panel:SetBackgroundColor( Color(200,200,200) )
			mat:SetMaterial( "vgui/achievements/hl2_beat_game" )	-- Path to material VMT
			
		end
		title:SetAutoStretchVertical( true )
		
		local text = vgui.Create( "DLabel", panel )
		text:SetPos( 80, 30 )
		text:SetTextColor( Color(255,255,255) )
		local explode = string.Explode("v_",Hl2c.VORTEX_LT_LIST[i])
		text:SetText( explode[2] )
		text:SetAutoStretchVertical( false )
		text:SetContentAlignment( 7 )
		text:SetSize( 180,60 )
		text:SetWrap( true )
		
		Vortex_grid:AddItem( panel )
	end
	
	
	for i=1, 1 do
		
		local Vortex_ProgPanel = vgui.Create("DPanel", Stat_panelVortex)
		Vortex_ProgPanel:SetSize( 252, 45 )
		Vortex_ProgPanel:SetPos( 20, 10 ) 
		Vortex_ProgPanel:SetBackgroundColor(Color(0,0,0))
	
		local Vortex_DProgress = vgui.Create( "DProgress", Vortex_ProgPanel )
		Vortex_DProgress:SetPos( 1, 19 )
		Vortex_DProgress:SetSize( 250, 25 )
		if AllVortexExpr(aimtarget) > 1 then
		Vortex_DProgress:SetFraction( 1 )
		elseif AllVortexExpr(aimtarget) < 0 then
		Vortex_DProgress:SetFraction( 0 )
		elseif AllVortexExpr(aimtarget) == nil then
		Vortex_DProgress:SetFraction( 0 )
		else
		Vortex_DProgress:SetFraction( AllVortexExpr(aimtarget) )
		end
		
		local Vortex_ProgTxt = vgui.Create( "DLabel", Vortex_ProgPanel )
		Vortex_ProgTxt:SetPos( 0, 5 )
		Vortex_ProgTxt:SetTextColor( Color(255,255,255) )
		Vortex_ProgTxt:SetText( "Progress: (".. PlyVortexSum(aimtarget) .."/".. AllVortexSum() ..") ".. AllVortexExprPercent(aimtarget) .."%" )
		Vortex_ProgTxt:SetAutoStretchVertical( false )
		Vortex_ProgTxt:SetContentAlignment( 6 )
		Vortex_ProgTxt:SetSize( 180,60 )
		--Vortex_ProgTxt:SetWrap( true )
		Vortex_ProgTxt:SetAutoStretchVertical( true )
	end
	
	--local Stat_panel2 = vgui.Create( "DPanel", Stat_sheet )
	--Stat_panel2.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 255, 128, 0, 0 ) ) end
	--Stat_sheet:AddSheet( "Pet info", Stat_panel2 )
	--print(inspect:Nick())
	aim_stat_menu = false
	--aimtarget = NULL
end

net.Receive("StatWindow", function(len, ply)
	if IsValid(ply) and
	isstring(ply:Nick())
	then
		--print(ply:Nick())
	end
	--print(len)
	--print(ply)
	-- OpenStatWindow( LocalPlayer() )
	
	
end)
/*	
		pl:ChatPrint( "--------------------------------" )
		if pl:GetXP() != nil then
		pl:ChatPrint( "Your xp is: " .. pl:GetXP() )	
		end
		if pl:GetCLevel() != nil then
		pl:ChatPrint( "Your level is: " .. pl:GetCLevel() )
		end
		if (pl:GetCLevel() + 1) != nil then
		pl:ChatPrint( "For level "..(pl:GetCLevel() + 1)..": "..LevelCurve[pl:GetCLevel() +1] - pl:GetXP().." xp left" )
		end
		pl:ChatPrint( "--------------------------------" )
*/

//////////////////////////////////////
--
--	AIM INSPECT Player
--	SHOW STAT
--
//////////////////////////////////////


function FINDCHAT_STAT()
	-- local tr = util.GetPlayerTrace( LocalPlayer() )
	-- local trace = util.TraceLine( tr )
	-- local inspect = trace.Entity
	local inspect = net.ReadEntity()
	--local inspect = LocalPlayer()
	-- print("Hi")
	aim_stat_menu = true
	if (
	IsValid(inspect) and 
	inspect:IsPlayer() and 
	inspect:Team() == TEAM_ALIVE
	) then
		aim_stat_menu = true
		OpenStatWindow(inspect)
	else
		LocalPlayer():ChatPrint("You need to aim a player!")
	end
end
function Select_OpenStatWindow(item)
	if IsValid(item) and
	item:IsPlayer() and
	item:Team() == TEAM_ALIVE
	then
		OpenStatWindow(item)
	end
end
concommand.Add( "inspect_hl2c", function( ply, cmd, args )
	--ply:Kill()
	--print("CALLED INSPECT")
	if IsValid(ply) then
		ply.inspect_hl2c = true
	end
	
	if ply.inspect_hl2c == true and args and args[1] then
		Inspect_Hl2c(args[1])
	end
	ply.inspect_hl2c = false
	-- if isstring(args) and IsValid(ply) then
		--print( "[hl2c]: ".. ply:Nick() .." inspected someone ".. args )
	-- else
		--print( "[hl2c]: You need to select someone who lives." )
	-- end
end )
function Inspect_Hl2c(arg)
	for k, v in pairs(player.GetAll()) do
		if v and v:Team() == TEAM_ALIVE then
			-- print("Working")
			if string.find(string.lower(v:Nick()),string.lower(tostring(arg))) then
				-- print(v:Nick())
				aim_stat_menu = true
				Select_OpenStatWindow(v)
				LocalPlayer().inspect_hl2c = false
			end
		end
	end
end



net.Receive("AIM_StatWindow", FINDCHAT_STAT )