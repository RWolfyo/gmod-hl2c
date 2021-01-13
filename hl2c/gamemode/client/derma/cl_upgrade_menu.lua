--net.Receive("ShowTeam", function()
function Upgrade_Menu()
	
	--if showNav then
		--showNav = false
	--else
		--showNav = true
	--end
	local jatekos = LocalPlayer()
	local admin = LocalPlayer():IsAdmin()
--[[
	local Upgrade = Upgrade or {}
	
	Upgrade.Frame = {}
	
	Upgrade.Frame.PanelColor = Color(255, 20, 50)
	Upgrade.Frame.SizeX = 600
	Upgrade.Frame.SizeY = 400
	
	Upgrade.Menu = vgui.Create("DFrame")
	Upgrade.Menu:SetSize(self.FrameSizeX, self.FrameSizeY)
	
]]--	
	--LeifTiger Upgrade Menu Copy
	// Colors -- Color(191, 151, 85) -- Color(216, 182, 124) -- Color(198, 180, 151)
	local DarkC = Color(191, 151, 85)
	local LightC = Color(216, 182, 124)
	local LighterC = Color(198, 180, 151)
	local LightestC = Color(227, 221, 189)
	
	local IceBestLightC = Color(170, 221, 246)
	local IceLightestC = Color(182, 226, 243)
	local IceLighterC = Color(149, 205, 227)
	local IceLightC = Color(96, 170, 202)
	local IceDarkC = Color(55, 123, 152)
	
	local DWhiteC = Color(255,255,255)
	--local Size = 600, 400
	local w = 450
	local h = 550
	local UpgradeMenu = vgui.Create("DFrame")
	UpgradeMenu:SetSize(w, h)
	UpgradeMenu:SetTitle("Upgrade")
	UpgradeMenu:Center()
	--UpgradeMenu.Paint = function(self, w, h) draw.RoundedBox(8, 115, 0, w, h, Color(208, 166, 0) ) end
	--function UpgradeMenu:Paint(w, h)
	--draw.RoundedBox(8, 0, 0, w, h, Color(255, 255, 255) )
	--draw.RoundedBox(8, 0.55, 0.55, w-1.8, h-1.8, IceBestLightC )
	--draw.RoundedBox(8, 2, 1, w-4, h-375, IceLightestC )
	--draw.RoundedBox(8, 0, 0, w, h, IceBestLightC )
	--end
	UpgradeMenu:MakePopup()
	
	local UpgradeSheet = vgui.Create( "DPropertySheet", UpgradeMenu )
	UpgradeSheet:Dock( FILL )
	
	local Inventory = vgui.Create( "DPanel", UpgradeSheet )
	--panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) ) end
	UpgradeSheet:AddSheet( "Inventory", Inventory, "icon16/user.png" )
	local TU_txt = vgui.Create( "DLabel", Inventory )
	TU_txt:SetPos( 10, 10 )
	TU_txt:SetSize( 120, 20 )
	TU_txt:SetTextColor(Color (0, 0, 0))
	TU_txt:SetText( "Temporary Upgrades" )
	local TU_scroll = vgui.Create( "DScrollPanel", Inventory ) //Create the TU_scroll panel
	TU_scroll:SetSize( 220-50, 200-50 )
	TU_scroll:SetPos( 10, 30 )
	function TU_scroll:Paint ( w, h )
	draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
	end
	local TU_list = vgui.Create( "DIconLayout", TU_scroll )
	TU_list:SetSize( 210-50, 190-50 )
	TU_list:SetPos( 5, 5 )
	TU_list:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	TU_list:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
	
	TU_01 = vgui.Create( "SpawnIcon" )
	TU_01:SetSize(64, 64)
	TU_01:SetModel( "spawnicons/models/ammo/ammo_axis.png" )
	TU_01:SetTooltip( "Under Development" )
	TU_01.DoClick = function()
	Msg( "You clicked the image!\n" )
	end
	TU_list:Add( TU_01 )
	
	-- Rewards
	local PI_txt = vgui.Create( "DLabel", Inventory )
	PI_txt:SetPos( 20, 200 )
	PI_txt:SetSize( 120, 20 )
	PI_txt:SetTextColor(Color (0, 0, 0))
	PI_txt:SetText( "Weapon Rewards" )
	local PI_scroll = vgui.Create( "DScrollPanel", Inventory ) //Create the PI_scroll panel
	PI_scroll:SetSize( 220-50, 200-50 )
	PI_scroll:SetPos( 10, 220 )
	function PI_scroll:Paint ( w, h )
	draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
	end
	local PI_list = vgui.Create( "DIconLayout", PI_scroll )
	PI_list:SetSize( 210-50, 190-50 )
	PI_list:SetPos( 5, 5 )
	PI_list:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	PI_list:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
	
	
	
	for k, v in pairs(Hl2c.Inventory.List.Perma.Weapon) do
		if Hl2c.Item_CheckReq(LocalPlayer(),v["Name"]) then 
			local item = vgui.Create( "SpawnIcon" )
			item:SetModel( tostring( v["Model"] ) )
			item:SetTooltip( "Reward: ".. tostring( v["Name"] ) .."" )
			item.DoClick = function()
			--net.Start( "select_ion" )
			--net.SendToServer()
			RunConsoleCommand( "hl2c_inventory_select", v["Name"] )
			--Msg( "You clicked the image!\n" )
			end
			PI_list:Add( item )
		end
	end
	
	
	/*------------------
	Permanent Upgrades Inventory
	---------------------*/
	if ( IsValid( LocalPlayer() ) ) then
		local title = vgui.Create( "DLabel", Inventory )
		title:SetPos( 210, 10 )
		title:SetSize( 120, 20 )
		title:SetTextColor(Color (0, 0, 0))
		title:SetText( "Permanent Upgrades" )
		local scroll = vgui.Create( "DScrollPanel", Inventory ) //Create the TU_scroll panel
		scroll:SetSize( 220-50, 200-50 )
		scroll:SetPos( 210, 30 )
		function scroll:Paint ( w, h )
		draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
		end
		local ilist = vgui.Create( "DIconLayout", scroll )
		ilist:SetSize( 210-50, 190-50 )
		ilist:SetPos( 10, 10 )
		ilist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
		ilist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
		
		for k, v in pairs(Hl2c.Inventory.List.Perma.Powerup) do
			if v["Name"] == "hp_regen_rank1" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 1 then
			elseif v["Name"] == "hp_regen_rank2" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 2 then
			elseif v["Name"] == "hp_regen_rank3" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 3 then
			elseif v["Name"] == "hp_regen_rank4" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 4 then
			elseif v["Name"] == "hp_regen_rank5" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 5 then
			elseif v["Name"] == "hp_regen_rank6" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 6 then
			elseif v["Name"] == "hp_regen_rank7" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 7 then
			elseif v["Name"] == "hp_regen_rank8" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 8 then
			else
			local item = vgui.Create( "SpawnIcon" )
			item:SetModel( tostring( v["Model"] ) )
			item:SetTooltip( v["Tip"] )
			-- item.DoClick = function()
			-- RunConsoleCommand("hl2c_buy_upgrade", tostring(v["Name"]))
			-- if v["Name"] == "hp_regen_rank1" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") > 0 then
				-- item:Remove()
			-- end
			-- end
			ilist:Add( item )
			end
		end
	end
	
	/*------------------
	Suits Inventory
	---------------------*/
	if ( IsValid( LocalPlayer() ) ) 
	then
		local title = vgui.Create( "DLabel", Inventory )
		title:SetPos( 220, 200 )
		title:SetSize( 120, 20 )
		title:SetTextColor(Color (0, 0, 0))
		title:SetText( "Suits/Accesories" )
		local scroll = vgui.Create( "DScrollPanel", Inventory ) //Create the TU_scroll panel
		scroll:SetSize( 220-50, 200-50 )
		scroll:SetPos( 210, 220 )
		function scroll:Paint ( w, h )
		draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
		end
		local ilist = vgui.Create( "DIconLayout", scroll )
		ilist:SetSize( 210-50, 190-50 )
		ilist:SetPos( 10, 10 )
		ilist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
		ilist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
		
		
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/player/group01/male_01.mdl" ) )
		item:SetTooltip( "Citizen Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", "models/player/group01/male_01.mdl","jelszo" )
		end
		ilist:Add( item )
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_004") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/player/group03/male_01.mdl" ) )
		item:SetTooltip( "Rebel Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", "models/player/group03/male_01.mdl","jelszo" )
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_005") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/player/police.mdl" ) )
		item:SetTooltip( "MetroCop Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", "models/player/police.mdl","jelszo" )
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_006") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/player/combine_soldier.mdl" ) )
		item:SetTooltip( "Combine Soldier Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", "models/player/combine_soldier.mdl","jelszo" )
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_007") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/shotgun_soldier.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Combine Shotgunner Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", mdl,"jelszo" )
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_008") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/player/combine_soldier_prisonguard.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Combine Prisonguard Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", mdl,"jelszo" )
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_009") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/player/combine_super_soldier.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Combine Elite Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", mdl,"jelszo" )
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_001") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/items/hevsuit.mdl" ) )
		item:SetTooltip( "Hev Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", "models/player/gordon_hev.mdl","jelszo" )
		
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("customsetup_1") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/player/breen.mdl" ) )
		item:SetTooltip( "Breen Suit" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_suit", "models/player/breen.mdl","jelszo" )
		
		end
		ilist:Add( item )
		end
		
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_010") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/props_lab/monitor01a.mdl" ) )
		item:SetTooltip( "Monitor Hat" )
		item.DoClick = function()
		if LocalPlayer():GetNWString("hl2c_hat") == "hat_monitor" then
			-- print("Working?")
			RunConsoleCommand( "hl2c_hat", '" "',"jelszo" )
		else
		RunConsoleCommand( "hl2c_hat", "hat_monitor","jelszo" )
		end
		
		end
		ilist:Add( item )
		end
			
		if LocalPlayer():GetNWInt("customsetup_3") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/BarneyHelmet_faceplate.mdl" ) )
		item:SetTooltip( "Police Mask" )
		item.DoClick = function()
		if LocalPlayer():GetNWString("hl2c_hat") == "hat_mask1" then
			RunConsoleCommand( "hl2c_hat", '" "',"jelszo" )
		else
			RunConsoleCommand( "hl2c_hat", "hat_mask1","jelszo" )
		end
		
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_011") == 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/props_junk/watermelon01.mdl" ) )
		item:SetTooltip( "Melon Head" )
		item.DoClick = function()
		if LocalPlayer():GetNWString("hl2c_hat") == "hat_melon" then
			RunConsoleCommand( "hl2c_hat", '" "',"jelszo" )
		else
			RunConsoleCommand( "hl2c_hat", "hat_melon","jelszo" )
		end
		
		end
		ilist:Add( item )
		end
			
		
		for k, v in pairs(Hl2c.Items) do
			if v["Reward"] and Hl2c.Item_CheckReq(LocalPlayer(),v["Name"]) then
				local item = vgui.Create( "SpawnIcon" )
				item:SetModel( tostring( v["Model"] ) )
				item:SetTooltip( v["Tip"] )
				item.DoClick = function()
				if LocalPlayer():GetNWString("hl2c_hat") == v["Name"] then
					RunConsoleCommand( "hl2c_hat", '" "',"jelszo" )
				else
					RunConsoleCommand( "hl2c_hat", v["Name"],"jelszo" )
				end
				
				end
				ilist:Add( item )
			end
		end
		-- if LocalPlayer():GetNWInt("customsetup_4") == 1 then
		-- local item = vgui.Create( "SpawnIcon" )
		-- item:SetModel( tostring( "models/combine/elite_helmet.mdl" ) )
		-- item:SetTooltip( "Elit Mask" )
		-- item.DoClick = function()
		-- if LocalPlayer():GetNWString("hl2c_hat") == "hat_mask3" then
			-- RunConsoleCommand( "hl2c_hat", '" "',"jelszo" )
		-- else
			-- RunConsoleCommand( "hl2c_hat", "hat_mask3","jelszo" )
		-- end
		
		-- end
		-- ilist:Add( item )
		-- end
		
		-- if LocalPlayer():GetNWInt("ACHIEVEMENT_EVENT_GEN_KILL_1000COMBINES") == 1 then
		-- local item = vgui.Create( "SpawnIcon" )
		-- item:SetModel( tostring( "models/combine/soldier_helmet.mdl" ) )
		-- item:SetTooltip( "Combine Default Mask" )
		-- item.DoClick = function()
		-- if LocalPlayer():GetNWString("hl2c_hat") == "hat_mask2" then
			-- RunConsoleCommand( "hl2c_hat", '" "',"jelszo" )
		-- else
			-- RunConsoleCommand( "hl2c_hat", "hat_mask2","jelszo" )
		-- end
		
		-- end
		-- ilist:Add( item )
		-- end
	end
	
	
	-- Weapon Shop
	local Shop = vgui.Create( "DPanel", UpgradeSheet )
	--panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) ) end
	UpgradeSheet:AddSheet( "Shop", Shop, "icon16/application_view_tile.png" )
	
	local SHOP_TU_txt = vgui.Create( "DLabel", Shop )
	SHOP_TU_txt:SetPos( 20, 0+10 )
	SHOP_TU_txt:SetSize( 120, 20 )
	SHOP_TU_txt:SetTextColor(Color (0, 0, 0))
	SHOP_TU_txt:SetText( "Weapons" )
	local SHOP_TU_scroll = vgui.Create( "DScrollPanel", Shop ) //Create the TU_scroll panel
	SHOP_TU_scroll:SetSize( 220-50, 200-50 )
	SHOP_TU_scroll:SetPos( 10, 30 )
	function SHOP_TU_scroll:Paint ( w, h )
	draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
	end
	local SHOP_TU_list = vgui.Create( "DIconLayout", SHOP_TU_scroll )
	SHOP_TU_list:SetSize( 210-50, 190-50 )
	SHOP_TU_list:SetPos( 5, 5 )
	SHOP_TU_list:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	SHOP_TU_list:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
	
	for k, v in pairs(Hl2c.Shops.List.Temp.Weapon) do
		if Hl2c.BlockedItems[v["Name"]] then
		else
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( v["Model"] )
		item:SetTooltip( "Buy ".. v["Name"] ..".\nCost ".. tostring(v["Cost"]) .." score." )
		item.DoClick = function()
		RunConsoleCommand("hl2c_buy", v["Name"])
		--Msg( "You clicked the image!\n" )
		end
		SHOP_TU_list:Add( item )
		end
		/*print(" ")
		print("--------------")
		print("Type","=",v["Type"])
		print("Name","=",v["Name"])
		print("Cost","=",v["Cost"])
		print("Model","=",v["Model"])
		print("Tip","=",v["Tip"])
		print("---------------")
		print(" ")*/
	end
	
	
	-- Ammo Shop
	local SHOP_IU_txt = vgui.Create( "DLabel", Shop )
	SHOP_IU_txt:SetPos( 20+200, 0+10 )
	SHOP_IU_txt:SetSize( 120, 20 )
	SHOP_IU_txt:SetTextColor(Color (0, 0, 0))
	SHOP_IU_txt:SetText( "Items/Ammos" )
	local SHOP_IU_scroll = vgui.Create( "DScrollPanel", Shop ) //Create the TU_scroll panel
	SHOP_IU_scroll:SetSize( 220-50, 200-50 )
	SHOP_IU_scroll:SetPos( 10+200, 30 )
	function SHOP_IU_scroll:Paint ( w, h )
	draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
	end
	local SHOP_IU_list = vgui.Create( "DIconLayout", SHOP_IU_scroll )
	SHOP_IU_list:SetSize( 210-50, 190-50 )
	SHOP_IU_list:SetPos( 5, 5 )
	SHOP_IU_list:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	SHOP_IU_list:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
	
	
	for k, v in pairs(Hl2c.Shops.List.Temp.Ammo) do
		
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( v["Model"] )
		item:SetTooltip( "Buy ".. v["Name"] ..".\nCost ".. tostring(v["Cost"]) .." score." )
		item.DoClick = function()
		RunConsoleCommand("hl2c_buy", v["Name"])
		end
		SHOP_IU_list:Add( item )
	end
	
	
	/*------------------
	Pet Shop
	---------------------*/
	if ( 
	IsValid( LocalPlayer() ) 
	) then
		local title = vgui.Create( "DLabel", Shop )
		title:SetPos( 20, 200 )
		title:SetSize( 120, 20 )
		title:SetTextColor(Color (0, 0, 0))
		title:SetText( "Pets" )
		local scroll = vgui.Create( "DScrollPanel", Shop ) //Create the TU_scroll panel
		scroll:SetSize( 220-50, 200-50 )
		scroll:SetPos( 10, 220 )
		function scroll:Paint ( w, h )
		draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
		end
		local ilist = vgui.Create( "DIconLayout", scroll )
		ilist:SetSize( 210-50, 190-50 )
		ilist:SetPos( 10, 10 )
		ilist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
		ilist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
		
		--[[ item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/hunter.mdl" )
		if LocalPlayer():GetNWInt("ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN") == 1 then
		item:SetTooltip("Buy Hunter Pet\nCost FREE.\nLevel: 10")
		else
		item:SetTooltip( "Buy Hunter Pet\nCost 100.000 PERMA.\nLevel: 10" )
		end
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		net.Start("buy_pet_hunter")
		net.SendToServer()
		Msg( "You clicked the image!\n" )
		end
		ilist:Add( item ) ]]
		
		item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/combine_soldier.mdl" )
		item:SetTooltip( "Buy Combine Soldier Pet\nCost 400 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		net.Start("buy_pet_combine_s")
		net.SendToServer()
		end
		ilist:Add( item )
		
		item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/antlion.mdl" )
		item:SetTooltip( "Buy Antlion Pet\nCost 400 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		net.Start("buy_pet_antlion")
		net.SendToServer()
		end
		ilist:Add( item )
		
		item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/headcrabclassic.mdl" )
		item:SetTooltip( "Buy Headcrab Pet\nCost 400 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		net.Start("buy_pet_headcrab")
		net.SendToServer()
		end
		ilist:Add( item )
		
		item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/roller.mdl" )
		item:SetTooltip( "Buy Rollermine Pet\nCost 400 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		net.Start("buy_pet_rollermine")
		net.SendToServer()
		end
		ilist:Add( item )
		
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/fassassin.mdl" )
		item:SetTooltip( "Buy Female Assassin Pet\nCost 500 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		net.Start("buy_pet_fassassin")
		net.SendToServer()
		end
		ilist:Add( item )
		
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/headcrab.mdl" )
		item:SetTooltip( "Buy Headcrab Fast Pet\nCost 400 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		net.Start("buy_pet_headcrab_fast")
		net.SendToServer()
		end
		ilist:Add( item )
		
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/headcrabblack.mdl" )
		item:SetTooltip( "Buy Headcrab Black Pet\nCost 400 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		net.Start("buy_pet_headcrab_black")
		net.SendToServer()
		end
		ilist:Add( item )
	end
	
	
	/*------------------
	Upgrade Shop
	---------------------*/
	if ( 
	IsValid( LocalPlayer() ) 
	) then
		local title = vgui.Create( "DLabel", Shop )
		title:SetPos( 220, 200 )
		title:SetSize( 120, 20 )
		title:SetTextColor(Color (0, 0, 0))
		title:SetText( "Upgrades" )
		local scroll = vgui.Create( "DScrollPanel", Shop ) //Create the TU_scroll panel
		scroll:SetSize( 220-50, 200-50 )
		scroll:SetPos( 210, 220 )
		function scroll:Paint ( w, h )
		draw.RoundedBox(8, 0, 0, 220-50, 200-50, Color(200,200,200) )
		end
		local ilist = vgui.Create( "DIconLayout", scroll )
		ilist:SetSize( 210-50, 190-50 )
		ilist:SetPos( 10, 10 )
		ilist:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
		ilist:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_001") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/items/hevsuit.mdl" ) )
		item:SetTooltip( "HEV Suit\nPERMA: 2.000\nGet True One Freeman from HL2" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", "models/player/gordon_hev.mdl" )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_001") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_004") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/player/group03/male_01.mdl" ) )
		item:SetTooltip( "Rebel Suit\nPERMA: 500" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", "models/player/group03/male_01.mdl" )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_004") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_005") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		item:SetModel( tostring( "models/player/police.mdl" ) )
		item:SetTooltip( "Cop Suit\nPERMA: 600" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", "models/player/police.mdl" )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_005") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_006") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/player/combine_soldier.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Combine Soldier Suit\nPERMA: 700" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", mdl )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_006") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_007") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/shotgun_soldier.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Combine Soldier Suit\nPERMA: 800" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", mdl )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_007") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_008") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/player/combine_soldier_prisonguard.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Combine Prisonguard Suit\nPERMA: 900" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", mdl )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_008") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_009") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/player/combine_super_soldier.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Combine Elite Suit\nPERMA: 1000" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", mdl )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_009") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_010") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/props_lab/monitor01a.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Monitor Hat\nPERMA: 400" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", "hat_monitor" )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_010") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_011") != 1 then
		local item = vgui.Create( "SpawnIcon" )
		local mdl = "models/props_junk/watermelon01.mdl"
		item:SetModel( tostring( mdl ) )
		item:SetTooltip( "Monitor Hat\nPERMA: 400" )
		item.DoClick = function()
		RunConsoleCommand( "hl2c_buy_upgrade", "hat_melon" )
		if LocalPlayer():GetNWInt("SHOP_UPGRADE_011") == 1 then
			item:Remove()
		end
		end
		ilist:Add( item )
		end
		
		-- for k, v in pairs(Hl2c.Inventory.List.Perma.Powerup) do
			-- if v["Name"] == "hp_regen_rank1" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 0 then
			-- elseif v["Name"] == "hp_regen_rank2" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 1 then
			-- elseif v["Name"] == "hp_regen_rank3" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 2 then
			-- elseif v["Name"] == "hp_regen_rank4" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 3 then
			-- elseif v["Name"] == "hp_regen_rank5" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 4 then
			-- elseif v["Name"] == "hp_regen_rank6" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 5 then
			-- elseif v["Name"] == "hp_regen_rank7" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 7 then
			-- elseif v["Name"] == "hp_regen_rank8" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") != 7 then
			-- else
			-- local item = vgui.Create( "SpawnIcon" )
			-- item:SetModel( tostring( v["Model"] ) )
			-- item:SetTooltip( v["Tip"] )
			-- item.DoClick = function()
			-- RunConsoleCommand("hl2c_buy_upgrade", tostring(v["Name"]))
			-- if v["Name"] == "hp_regen_rank1" and LocalPlayer():GetNWInt("SHOP_UPGRADE_003") > 0 then
				-- item:Remove()
			-- end
			-- end
			-- ilist:Add( item )
			-- end
		-- end
		/*
		item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/hunter.mdl" )
		if LocalPlayer():GetNWInt("ACHIEVEMENT_EVENT_GEN_EVENT_EP2_OPEN") == 1 then
		item:SetTooltip("Buy Hunter Pet\nCost FREE.")
		else
		item:SetTooltip( "Buy Hunter Pet\nCost 100.000 PERMA.\nLevel: 10" )
		end
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		end
		ilist:Add( item )
		
		item = vgui.Create( "SpawnIcon" )
		item:SetModel( "models/combine_soldier.mdl" )
		item:SetTooltip( "Buy Hunter Pet\nCost 20.000 PERMA.\nLevel: 10" )
		item.DoClick = function()
		--RunConsoleCommand("hl2c_buy_ammo_bp_sniper", "hl2c_buy_ammo_bp_sniper")
		Msg( "You clicked the image!\n" )
		end
		ilist:Add( item )
		*/
	end
	
	///////////////////////////////
	/*
	local buy_suitrecharger = vgui.Create("DButton", Shop)
	buy_suitrecharger:SetSize(75, 20)
	buy_suitrecharger:SetPos(10, 195+50)
	buy_suitrecharger:SetText("Suit Recharge") --Set the name of the button
	buy_suitrecharger.DoClick = function() RunConsoleCommand("hl2c_buy_suitrecharger", "hl2c_buy_suitrecharger") end
	
	local buy_hprecharger = vgui.Create("DButton", Shop)
	buy_hprecharger:SetSize(75, 20)
	buy_hprecharger:SetPos(100, 195+50)
	buy_hprecharger:SetText("HP Recharge") --Set the name of the button
	buy_hprecharger.DoClick = function() RunConsoleCommand("hl2c_buy_hprecharger", "hl2c_buy_hprecharger") end
	
	local buy_invincibility = vgui.Create("DButton", Shop)
	buy_invincibility:SetSize(75, 20)
	buy_invincibility:SetPos(190, 195+50)
	buy_invincibility:SetText("Invincibility") --Set the name of the button
	buy_invincibility.DoClick = function() RunConsoleCommand("hl2c_buy_invincibility", "hl2c_buy_invincibility") end

	
	local buy_ammo_pistol = vgui.Create("DButton", Shop)
	buy_ammo_pistol:SetSize(85, 20)
	buy_ammo_pistol:SetPos(10, 270+50)
	buy_ammo_pistol:SetText("Pistol Ammo") --Set the name of the button
	buy_ammo_pistol.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_pistol", "hl2c_buy_ammo_pistol") end
	
	local buy_ammo_357 = vgui.Create("DButton", Shop)
	buy_ammo_357:SetSize(85, 20)
	buy_ammo_357:SetPos(10, 300+50)
	buy_ammo_357:SetText("357 Ammo") --Set the name of the button
	buy_ammo_357.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_357", "hl2c_buy_ammo_357") end
	
	local buy_ammo_smg = vgui.Create("DButton", Shop)
	buy_ammo_smg:SetSize(85, 20)
	buy_ammo_smg:SetPos(100, 270+50)
	buy_ammo_smg:SetText("Smg Ammo") --Set the name of the button
	buy_ammo_smg.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_smg", "hl2c_buy_ammo_smg") end
	
	local buy_ammo_ar2 = vgui.Create("DButton", Shop)
	buy_ammo_ar2:SetSize(85, 20)
	buy_ammo_ar2:SetPos(100, 300+50)
	buy_ammo_ar2:SetText("Ar2 Ammo") --Set the name of the button
	buy_ammo_ar2.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_ar2", "hl2c_buy_ammo_ar2") end
	
	local buy_ammo_buckshot = vgui.Create("DButton", Shop)
	buy_ammo_buckshot:SetSize(85, 20)
	buy_ammo_buckshot:SetPos(190, 270+50)
	buy_ammo_buckshot:SetText("Shotgun Ammo") --Set the name of the button
	buy_ammo_buckshot.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_buckshot", "hl2c_buy_ammo_buckshot") end
	
	local buy_ammo_xbowbolt = vgui.Create("DButton", Shop)
	buy_ammo_xbowbolt:SetSize(85, 20)
	buy_ammo_xbowbolt:SetPos(190, 300+50)
	buy_ammo_xbowbolt:SetText("Crossbow Ammo") --Set the name of the button
	buy_ammo_xbowbolt.DoClick = function() RunConsoleCommand("hl2c_buy_ammo_xbowbolt", "hl2c_buy_ammo_xbowbolt") end
	--hl2c_buy_ammo_xbowbolt
	*/
	
	local Appereance = vgui.Create( "DPanel", UpgradeSheet )
	--panel1.Paint = function( self, w, h ) draw.RoundedBox( 4, 0, 0, w, h, Color( 0, 128, 255 ) ) end
	UpgradeSheet:AddSheet( "Appereance", Appereance, "icon16/palette.png" )
	
	local AP_scroll = vgui.Create( "DScrollPanel", Appereance ) //Create the AP_scroll panel
	AP_scroll:SetSize( w, h )
	AP_scroll:SetPos( 2, 2 )
	function AP_scroll:Paint ( w, h )
	draw.RoundedBox(4, 0, 0, w-30, h-75, Color(200,200,200) )
	end
	/*local AP_list = vgui.Create( "DIconLayout", AP_scroll )
	AP_list:SetSize( w-10, h-10 )
	AP_list:SetPos( 5, 5 )
	AP_list:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	AP_list:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5*/
	local IconList = vgui.Create( "DPanelList", AP_scroll ) 
	IconList:EnableVerticalScrollbar( true ) 
 	IconList:EnableHorizontal( true ) 
 	IconList:SetPadding( 4 ) 
	IconList:SetPos(5,5)
	IconList:SetSize(w-30, h-75)
	
	-- if HL2C_HEV_SUIT and HL2C_HEV_SUIT_LIST and HL2C_HEV_SUIT_LIST[1] != nil and HL2C_HEV_SUIT[HL2C_HEV_SUIT_LIST[1]] then else return end

	for k,v in pairs(HL2C_REBEL_HEAD) do
		-- if k != "models/player/gordon_citizen.mdl" then
		local icon = vgui.Create( "SpawnIcon", IconList ) 
		icon:SetModel( k )
		IconList:AddItem( icon )
		icon.DoClick = function( icon ) 
		surface.PlaySound( "ui/buttonclickrelease.wav" )
		RunConsoleCommand("hl2c_head", k) 
		-- LocalPlayer():PrintMessage(HUD_PRINTTALK, "Clicked")
		end
		-- end

	end 
	
	if ( LocalPlayer():IsAdmin() ) and HL2C_GORDON_HEAD["models/player/gordon_citizen.mdl"] then
		local icon = vgui.Create( "SpawnIcon", IconList ) 
		//icon:SetModel( "models/romsn/gordon_player.mdl" )
		icon:SetModel( "models/player/gordon_citizen.mdl" )
		IconList:AddItem( icon )
		icon.DoClick = function( icon ) 
		surface.PlaySound( "ui/buttonclickrelease.wav" )
		RunConsoleCommand("hl2c_head", "models/player/gordon_citizen.mdl" )
		end 
	end
	-- end
	
--end)
end
usermessage.Hook("ShowTeam", Upgrade_Menu)

concommand.Add( "hl2c_player_menu", function( ply, cmd, args )
	Upgrade_Menu()
end )
/*
util.AddNetworkString("select_mp7")
util.AddNetworkString("select_oicw")
util.AddNetworkString("select_annabelle")
util.AddNetworkString("select_sniper")

util.AddNetworkString("select_combinemelee")
util.AddNetworkString("select_plasmapistol")
util.AddNetworkString("select_pulsesmg")
util.AddNetworkString("select_combineshotgun")
*/