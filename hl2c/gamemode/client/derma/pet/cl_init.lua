// Pet Window
local Pets = {}
Pets.WindowSizeX = 300
Pets.WindowSizeY = 300
Pets.Title = "Pets"


function Hl2c.Pet_Menu()
	selected_value = ""
	data = net.ReadTable()
	-- PrintTable(data)
	Pets.Derma = vgui.Create("DFrame")
	Pets.Derma:SetSize(Pets.WindowSizeX,Pets.WindowSizeY)
	Pets.Derma:SetPos( 100, 100 )
	Pets.Derma:SetTitle( Pets.Title )
	Pets.Derma:SetDraggable( true )
	Pets.Derma:MakePopup()
	Pets.List = {}
	
	local txt_id = vgui.Create( "DLabel", Pets.Derma )
	txt_id:SetPos( 130, 40 )
	txt_id:SetSize( 90, 20 )
	txt_id:SetText( "Hello, world!" )
	
	local txt_level = vgui.Create( "DLabel", Pets.Derma )
	txt_level:SetPos( 130, 60 )
	txt_level:SetSize( 90, 20 )
	txt_level:SetText( "Hello, world!" )
	
	local txt_xp = vgui.Create( "DLabel", Pets.Derma )
	txt_xp:SetPos( 130, 80 )
	txt_xp:SetSize( 90, 20 )
	txt_xp:SetText( "Hello, world!" )
	
	local txt_name = vgui.Create( "DLabel", Pets.Derma )
	txt_name:SetPos( 130, 100 )
	txt_name:SetSize( 90, 20 )
	txt_name:SetText( "Hello, world!" )
	
	local txt_hp = vgui.Create( "DLabel", Pets.Derma )
	txt_hp:SetPos( 130, 120 )
	txt_hp:SetSize( 90, 20 )
	txt_hp:SetText( "Hello, world!" )
	
	local DComboBox = vgui.Create( "DComboBox",Pets.Derma )
	DComboBox:SetPos( 5, 50 )
	DComboBox:SetSize( 100, 20 )
	DComboBox:SetValue( "Your Pets" )
	for k, v in ipairs(data["list"]) do
		if v["pet_id"] == "PET_000" then
			-- DComboBox:AddChoice( "npc_hunter" )
		end
		if v["pet_id"] == "PET_001" then
			DComboBox:AddChoice( "npc_combine_s" )
		end
		if v["pet_id"] == "PET_002" then
			DComboBox:AddChoice( "npc_antlion" )
		end
		if v["pet_id"] == "PET_003" then
			DComboBox:AddChoice( "npc_headcrab" )
		end
		
		if v["pet_id"] == "PET_004" then
			DComboBox:AddChoice( "npc_rollermine" )
		end
		
		if v["pet_id"] == "PET_005" then
			DComboBox:AddChoice( "npc_fassassin" )
		end
		
		if v["pet_id"] == "PET_006" then
			DComboBox:AddChoice( "npc_headcrab_fast" )
		end
		
		if v["pet_id"] == "PET_007" then
			DComboBox:AddChoice( "npc_headcrab_black" )
		end
	end
	get_id = "0000"
	
	txt_id:SetText( "ID: " )
	txt_level:SetText( "LEVEL: " )
	txt_xp:SetText( "XP: " )
	txt_name:SetText( "NAME: " )
	txt_hp:SetText( "HP: " )
	--DComboBox:AddChoice( "option A" )
	--DComboBox:AddChoice( "option B" )
	--DComboBox:AddChoice( "option C" )
	DComboBox.OnSelect = function( panel, index, value )
		--print( index.." ".. value .." was selected!" )
		--get_id
		if value == nil then
		elseif value == "npc_hunter" then
			--print("HAPPENED")
			-- get_id = "PET_000"
		elseif value == "npc_combine_s" then
			--print("HAPPENED")
			get_id = "PET_001"
		elseif value == "npc_headcrab" then
			--print("HAPPENED")
			get_id = "PET_003"
		elseif value == "npc_antlion" then
			--print("HAPPENED")
			get_id = "PET_002"
		elseif value == "npc_rollermine" then
			--print("HAPPENED")
			get_id = "PET_004"
		elseif value == "npc_fassassin" then
			--print("HAPPENED")
			get_id = "PET_005"
		elseif value == "npc_headcrab_fast" then
			--print("HAPPENED")
			get_id = "PET_006"
		elseif value == "npc_headcrab_black" then
			--print("HAPPENED")
			get_id = "PET_007"
		end
		--print(get_id)
		for k, v in ipairs(data["list"]) do
		--print(v["PET_ID"])
		if v["pet_id"] == get_id then 
		--print("YES")
		txt_id:SetText( "ID: "..v["pet_id"] )
		txt_level:SetText( "LEVEL: "..v["pet_level"] )
		txt_xp:SetText( "XP: "..v["pet_xp"] )
		txt_name:SetText( "NAME: "..v["pet_name"] )
		txt_hp:SetText( "HP: "..v["pet_hp"] )
		end
		
		end
		selected_value = value
	end
	
	
	
	local DButton = vgui.Create( "DButton",Pets.Derma )
	DButton:SetPos( 5, 80 )
	DButton:SetText( "Set As Main Pet" )
	DButton:SetSize( 100, 25 )
	DButton.DoClick = function()
		if selected_value == nil then
		elseif selected_value == "npc_hunter" then
			--print("HAPPENED")
			-- net.Start( "ReceiveMainPetSwitch" )
				-- net.WriteString( "PET_000" )
			-- net.SendToServer(pl)
		elseif selected_value == "npc_combine_s" then
			--print("HAPPENED")
			net.Start( "ReceiveMainPetSwitch" )
				net.WriteString( "PET_001" )
			net.SendToServer(pl)
		elseif selected_value == "npc_headcrab" then
			--print("HAPPENED")
			net.Start( "ReceiveMainPetSwitch" )
				net.WriteString( "PET_003" )
			net.SendToServer(pl)
		elseif selected_value == "npc_antlion" then
			--print("HAPPENED")
			net.Start( "ReceiveMainPetSwitch" )
				net.WriteString( "PET_002" )
			net.SendToServer(pl)
		elseif selected_value == "npc_rollermine" then
			--print("HAPPENED")
			net.Start( "ReceiveMainPetSwitch" )
				net.WriteString( "PET_004" )
			net.SendToServer(pl)
		elseif selected_value == "npc_fassassin" then
			--print("HAPPENED")
			net.Start( "ReceiveMainPetSwitch" )
				net.WriteString( "PET_005" )
			net.SendToServer(pl)
		elseif selected_value == "npc_headcrab_fast" then
			--print("HAPPENED")
			net.Start( "ReceiveMainPetSwitch" )
				net.WriteString( "PET_006" )
			net.SendToServer(pl)
		elseif selected_value == "npc_headcrab_black" then
			--print("HAPPENED")
			net.Start( "ReceiveMainPetSwitch" )
				net.WriteString( "PET_007" )
			net.SendToServer(pl)
		end
	end
end

net.Receive("OpenPetWindow", Hl2c.Pet_Menu)