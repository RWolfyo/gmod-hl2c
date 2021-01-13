IA = IA or {};
IA.ItemsList = {}
IA.ItemsEquip = {}
IA.ItemsMats = {}
IA.Items = IA.Items or {};
IA.Equip = IA.Equip or {};


-- hook.Add("Initialize", "ia_createFont", function()
	-- surface.CreateFont("coolvetica", 24, 500, true, false, "ia_itemFont");
-- end);

local color_black = Color(0, 0, 0, 255);
IA.InventoryOpen = IA.InventoryOpen or false;
IA.InventoryFrame = IA.InventoryFrame or nil;
local Inventory = {};

local function ToggleMenu()

	if (!IA.InventoryFrame or !IA.InventoryFrame:IsValid()) then
		IA.InventoryFrame = vgui.Create("ia_inventory");
		IA.InventoryOpen = true
		IA.InventoryFrame:SetVisible(true);
		-- gui.EnableScreenClicker(true);
	else
		IA.InventoryFrame:Remove()
		-- gui.EnableScreenClicker(false);
		IA.InventoryOpen = false
	end;
	
	
	
end;

function IA:Init()
	self:SetSize(500, 400);
	self:Center();
	self:SetTitle("Inventory - ?/?");
	self:ShowCloseButton(true);
	self:MakePopup()
	function self:OnClose()
		-- gui.EnableScreenClicker(false);
		IA.InventoryOpen = false
	end

	local sheet = vgui.Create("DPropertySheet")
	sheet:SetParent(self)
	sheet:SetPos(0,25)
	sheet:DockMargin( 2, 0, 2, 2 )
	sheet:DockPadding( 2, 0, 2, 2 )
	sheet:Dock(FILL)
	
	local panel1 = vgui.Create("DPanel")
	panel1:SetPos(0, 0);
	panel1:Dock(FILL)
	function panel1:Paint(w,h)
		-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0,0 ) )
	end
	local Scroll = vgui.Create( "DScrollPanel", panel1 )
	Scroll:SetPos(0, 0);
	Scroll:Dock(FILL)
	function Scroll:Paint(w,h)
		draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0 ) )
	end
	
	ItemsList = vgui.Create("DIconLayout",Scroll)
	ItemsList:SetPos(0, 0);
	ItemsList:Dock(FILL)
	ItemsList:SetSpaceY(3);
	ItemsList:SetSpaceX(3);
	function ItemsList:Paint(w,h)
		-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0 ) )
	end
	
	--[[ local panel2 = vgui.Create("DPanel")
	panel2:SetPos(0, 0);
	panel2:Dock(FILL)
	function panel2:Paint(w,h)
		-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0,0 ) )
	end
	local Scroll = vgui.Create( "DScrollPanel", panel2 )
	Scroll:SetPos(0, 0);
	Scroll:Dock(FILL)
	function Scroll:Paint(w,h)
		draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0 ) )
	end
	
	
	
	local ItemsEquip = vgui.Create("DIconLayout",Scroll)
	ItemsEquip:SetPos(0, 0);
	ItemsEquip:Dock(FILL)
	ItemsEquip:SetSpaceY(3);
	ItemsEquip:SetSpaceX(3);
	function ItemsEquip:Paint(w,h)
		-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0 ) )
	end ]]
	
	local panel3 = vgui.Create("DPanel")
	panel3:SetPos(0, 0);
	panel3:Dock(FILL)
	function panel3:Paint(w,h)
		-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0,0 ) )
	end
	local Scroll = vgui.Create( "DScrollPanel", panel3 )
	Scroll:SetPos(0, 0);
	Scroll:DockMargin( 2, 2, 2, 2 )
	Scroll:DockPadding( 2, 2, 2, 2 )
	Scroll:Dock(FILL)
	function Scroll:Paint(w,h)
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0 ) )
	end
	
	
	ItemsMats = vgui.Create("DIconLayout",Scroll)
	ItemsMats:SetPos(0, 0);
	ItemsMats:DockMargin( 2, 2, 2, 2 )
	ItemsMats:DockPadding( 2, 2, 2, 2 )
	ItemsMats:Dock(FILL)
	ItemsMats:SetSpaceY(3);
	ItemsMats:SetSpaceX(3);
	function ItemsMats:Paint(w,h)
		-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0 ) )
	end
	
	
	
	 --[[ -- EQUIP --
	local info = databaseGetInventoryEquip() or {}
	-- print(info)
	for i=1,#info do
		if info[i].item != "false" then
			local color = Color(150,150,150)
			if info[i]["item_data"].rarity == "rare" then
				color = Color(0,0,200)
			elseif info[i]["item_data"].rarity == "epic" then
				color = Color(200,0,200)
			elseif info[i]["item_data"].rarity == "legendary" then
				color = Color(200,100,0)
			end
			local disc = ""
			if info[i]["item_data"]["gear"] == "true" then
				-- print("Doe?")
				for k,v in pairs(info[i]["item_data"].stat) do
					if k == "luck" then
						disc = disc .. "Luck - ".. tostring(v) .. "% : "
					end
					if k == "hp" then
						disc = disc .. "Health - ".. tostring(v) .. " : "
					end
					if k == "absorb" then
						disc = disc .. "Absorb - ".. tostring(v) .. "% : "
					end
					if k == "lfg" then
						disc = disc .. "Liferegen - ".. tostring(v) .. "/s : "
					end
					if k == "dmg" then
						disc = disc .. "Damage - ".. tostring(v) .. "% : "
					end
				end
			end
			
			local DPanel1 = vgui.Create('DPanel')
			DPanel1:SetSize(480, 74)
			
			
			
			local icon = vgui.Create("SpawnIcon", DPanel1)
			icon:SetModel(info[i]["item_data"].model)
			icon:SetPos(5,5)
			icon:SetMouseInputEnabled(false)
			
			local name = vgui.Create("DLabel", DPanel1)
			name:SetText(info[i]["item_data"].name)
			name:SizeToContents()
			name:SetPos(89, 5)
			
			local desc = vgui.Create("DLabel", DPanel1)
			desc:SetText(tostring(disc))
			desc:SizeToContents()
			desc:SetPos(89, 20)
			
			local amt = vgui.Create("DLabel", DPanel1)
			amt:SetText("Amount: " .. "1")
			amt:SizeToContents()
			amt:SetPos(89, 54)
			
			-- local drop = vgui.Create("DButton", DPanel1)
			-- drop:SetSize(45, 15)
			-- drop:SetPos(310, 54)
			-- drop:SetText("Drop")
			-- drop.DoClick = function()
				-- RunConsoleCommand("inv_dropitem",i)
				-- gui.EnableScreenClicker(false);
				-- self:Remove()
			-- end
			
			-- if !info[i]["item_data"].gear then
				-- local use = vgui.Create("DButton", DPanel1)
				-- use:SetSize(45, 15)
				-- use:SetPos(360, 54)
				-- use:SetText("Use")
				-- use.DoClick = function()
					-- RunConsoleCommand("inv_useitem")
					-- gui.EnableScreenClicker(false);
				-- self:Remove()
				-- end
			-- end
			if info[i]["item_data"].gear then
				local use = vgui.Create("DButton", DPanel1)
				use:SetSize(45, 15)
				use:SetPos(360, 54)
				use:SetText("UnEquip")
				use.DoClick = function()
					RunConsoleCommand("inv_unequipitem",i)
					-- gui.EnableScreenClicker(false);
					self:Remove()
					-- IA:Equip(info[i])
					-- DPanel1:Remove()
				end
			end
			function DPanel1:Paint( w, h )
				draw.RoundedBox( 8, 0, 0, w, h, color )
			end	
			ItemsEquip:Add(DPanel1)
		end
	end ]]
	
	-- ITEMS --
	local info = databaseGetInventorySlot() or {}
	-- print(info)
	for i=1,#info do
		if info[i].item != "false" then
			local color = Color(150,150,150)
			if info[i]["item_data"].rarity == "rare" then
				color = Color(0,0,200)
			elseif info[i]["item_data"].rarity == "epic" then
				color = Color(200,0,200)
			elseif info[i]["item_data"].rarity == "legendary" then
				color = Color(200,100,0)
			end
			local disc = ""
			if info[i]["item_data"]["gear"] == "true" then
				-- print("Doe?")
				for k,v in pairs(info[i]["item_data"].stat) do
					if k == "luck" then
						disc = disc .. "Luck - ".. tostring(v) .. "% : "
					end
					if k == "hp" then
						disc = disc .. "Health - ".. tostring(v) .. " : "
					end
					if k == "absorb" then
						disc = disc .. "Absorb - ".. tostring(v) .. "% : "
					end
					if k == "lfg" then
						disc = disc .. "Liferegen - ".. tostring(v) .. "/s : "
					end
					if k == "dmg" then
						disc = disc .. "Damage - ".. tostring(v) .. "% : "
					end
				end
			end
			
			local DPanel1 = vgui.Create('DPanel')
			DPanel1:SetSize(480, 74)
			
			
			
			local icon = vgui.Create("SpawnIcon", DPanel1)
			icon:SetModel(info[i]["item_data"].model)
			icon:SetPos(5,5)
			icon:SetMouseInputEnabled(false)
			
			local name = vgui.Create("DLabel", DPanel1)
			name:SetText(info[i]["item_data"].name)
			name:SizeToContents()
			name:SetPos(89, 5)
			
			local desc = vgui.Create("DLabel", DPanel1)
			desc:SetText(tostring(disc))
			desc:SizeToContents()
			desc:SetPos(89, 20)
			
			local amt = vgui.Create("DLabel", DPanel1)
			amt:SetText("Amount: " .. "1")
			amt:SizeToContents()
			amt:SetPos(89, 54)
			
			if !info[i]["item_data"].gear then
				local drop = vgui.Create("DButton", DPanel1)
				drop:SetSize(45, 15)
				drop:SetPos(310, 54)
				drop:SetText("Drop")
				drop.DoClick = function()
					RunConsoleCommand("inv_dropitem",i)
					-- gui.EnableScreenClicker(false);
					DPanel1:Remove()
				end
			end
			
			if info[i]["item_data"].gear then
				local salvage = vgui.Create("DButton", DPanel1)
				salvage:SetSize(45, 15)
				salvage:SetPos(310, 54)
				salvage:SetText("Salvage")
				salvage.DoClick = function()
					RunConsoleCommand("inv_salvage", i , info[i]["item_data"].rarity)
					-- print("CALLED")
					-- gui.EnableScreenClicker(false);
					DPanel1:Remove()
				end
			end
			
			if !info[i]["item_data"].gear then
				local use = vgui.Create("DButton", DPanel1)
				use:SetSize(45, 15)
				use:SetPos(360, 54)
				use:SetText("Use")
				use.DoClick = function()
					RunConsoleCommand("inv_useitem",i,info[i]["item_data"].name)
					-- gui.EnableScreenClicker(false);
					DPanel1:Remove()
				end
			end
			
			if info[i]["item_data"].gear then
				local use = vgui.Create("DButton", DPanel1)
				use:SetSize(45, 15)
				use:SetPos(360, 54)
				use:SetText("Equip")
				use.DoClick = function()
					RunConsoleCommand("inv_equipitem",i)
					-- gui.EnableScreenClicker(false);
					self:Remove()
					-- IA:Equip(info[i])
					-- DPanel1:Remove()
				end
			end
			function DPanel1:Paint( w, h )
				draw.RoundedBox( 8, 0, 0, w, h, color )
			end	
			ItemsList:Add(DPanel1)
		end
	end
	local mats = {}
	mats[1] = {}
	mats[1].name = "(Common) Scrap"
	mats[1].desc = ""
	mats[1].model = "models/props_debris/wood_chunk04c.mdl"
	mats[1].color = Color(150,150,150)
	mats[1].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_1")
	
	mats[2] = {}
	mats[2].name = "(Rare) Scrap"
	mats[2].desc = ""
	mats[2].model = "models/gibs/scanner_gib04.mdl"
	mats[2].color = Color(0,0,200)
	mats[2].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_2")
	
	mats[3] = {}
	mats[3].name = "(Epic) Scrap"
	mats[3].desc = ""
	mats[3].model = "models/props_junk/ibeam01a_cluster01.mdl"
	mats[3].color = Color(200,0,200)
	mats[3].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_3")
	
	mats[4] = {}
	mats[4].name = "(Legendary) Scrap"
	mats[4].desc = ""
	mats[4].model = "models/props_combine/tprotato2.mdl"
	mats[4].color = Color(200,100,0)
	mats[4].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_4")
	
	mats[5] = {}
	mats[5].name = "(Common) Food"
	mats[5].desc = ""
	mats[5].model = "models/props_outland/pumpkin01_explosive.mdl"
	mats[5].color = Color(150,150,150)
	mats[5].amount = LocalPlayer():GetNWInt("ITEM_FOOD_1")
	
	mats[6] = {}
	mats[6].name = "(Rare) Food"
	mats[6].desc = ""
	mats[6].model = "models/gibs/antlion_gib_small_2.mdl"
	mats[6].color = Color(0,0,200)
	mats[6].amount = LocalPlayer():GetNWInt("ITEM_FOOD_2")
	
	mats[7] = {}
	mats[7].name = "(Epic) Food"
	mats[7].desc = ""
	mats[7].model = "models/props_junk/garbage_metalcan001a.mdl"
	mats[7].color = Color(200,0,200)
	mats[7].amount = LocalPlayer():GetNWInt("ITEM_FOOD_3")
	
	mats[8] = {}
	mats[8].name = "(Legendary) Food"
	mats[8].desc = ""
	mats[8].model = "models/props_junk/garbage_milkcarton002a.mdl"
	mats[8].color = Color(200,100,0)
	mats[8].amount = LocalPlayer():GetNWInt("ITEM_FOOD_4")
	
	for i=1,#mats do
		local DPanel1 = vgui.Create('DPanel')
		DPanel1:SetSize(480, 74)
				
		local icon = vgui.Create("SpawnIcon", DPanel1)
		icon:SetModel(mats[i].model)
		icon:SetPos(5,5)
		icon:SetMouseInputEnabled(false)
		
		local name = vgui.Create("DLabel", DPanel1)
		name:SetText(mats[i].name)
		name:SizeToContents()
		name:SetPos(89, 5)
		
		local desc = vgui.Create("DLabel", DPanel1)
		desc:SetText(mats[i].desc)
		desc:SizeToContents()
		desc:SetPos(89, 20)
		
		local amt = vgui.Create("DLabel", DPanel1)
		amt:SetText("Amount: " .. tostring( mats[i].amount or 0 ) )
		amt:SizeToContents()
		amt:SetPos(89, 54)
		function amt:Think()
			if mats[i].amount and i < 5 and LocalPlayer():GetNWInt("ITEM_SCRAP_"..tostring(i)) != mats[i].amount then
				mats[i].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_"..tostring(i))
				
				amt:SetText("Amount: " .. tostring( mats[i].amount or 0 ) )
			end
			
			if mats[i].amount and i > 4 and LocalPlayer():GetNWInt("ITEM_FOOD_"..tostring(i-4)) != mats[i].amount then
				mats[i].amount = LocalPlayer():GetNWInt("ITEM_FOOD_"..tostring(i))
				
				amt:SetText("Amount: " .. tostring( mats[i-4].amount or 0 ) )
			end
		end
		function DPanel1:Paint( w, h )
			draw.RoundedBox( 8, 0, 0, w, h, mats[i].color )
		end
		ItemsMats:Add(DPanel1)
	end
	
	
	--[[ /* Crafting */
	local panel4 = vgui.Create("DPanel")
	panel4:SetPos(0, 0);
	panel4:Dock(FILL)
	function panel4:Paint(w,h)
		-- draw.RoundedBox( 8, 0, 0, w, h, Color( 0, 0, 0,0 ) )
	end
	local req_panel = vgui.Create( "DPanel", panel4 )
	req_panel:SetPos(360, 10);
	req_panel:SetSize(120, 300);
	
	local Scroll = vgui.Create( "DScrollPanel", req_panel )
	Scroll:SetPos(0, 0);
	Scroll:SetSize(120, 300);
	
	function Scroll:Paint(w,h)
		-- draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0 ) )
	end
	
	
	
	
	
	local button = vgui.Create("DButton", panel4)
	button:SetPos(150,118)
	button:SetSize(80,80)
	button:SetText("")
	
	
	
	local plan_req = {}
	plan_req[1] = {}
	plan_req[1].name = "(Common) Scrap"
	plan_req[1].desc = ""
	plan_req[1].model = "models/props_debris/wood_chunk04c.mdl"
	plan_req[1].color = Color(150,150,150)
	plan_req[1].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_1")
	
	plan_req[2] = {}
	plan_req[2].name = "(Rare) Scrap"
	plan_req[2].desc = ""
	plan_req[2].model = "models/gibs/scanner_gib04.mdl"
	plan_req[2].color = Color(0,0,200)
	plan_req[2].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_2")
	
	plan_req[3] = {}
	plan_req[3].name = "(Epic) Scrap"
	plan_req[3].desc = ""
	plan_req[3].model = "models/props_junk/ibeam01a_cluster01.mdl"
	plan_req[3].color = Color(200,0,200)
	plan_req[3].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_3")
	
	plan_req[4] = {}
	plan_req[4].name = "(Legendary) Scrap"
	plan_req[4].desc = ""
	plan_req[4].model = "models/props_combine/tprotato2.mdl"
	plan_req[4].color = Color(200,100,0)
	plan_req[4].amount = LocalPlayer():GetNWInt("ITEM_SCRAP_4")
	-- plan_req[5] = {}
	-- plan_req[5].color = Color(200,200,200)
	-- plan_req[6] = {}
	-- plan_req[6].color = Color(200,200,200)
	-- plan_req[7] = {}
	-- plan_req[7].color = Color(200,200,200)
	-- plan_req[8] = {}
	-- plan_req[8].color = Color(200,200,200)
	-- plan_req[9] = {}
	-- plan_req[9].color = Color(200,200,200)
	-- plan_req[10] = {}
	-- plan_req[10].color = Color(200,200,200)
	
	-- for i=1,4 do
		-- local move = 110
		-- move = move * (i-1)
		-- print(move,i,move*i)
		-- local btn = vgui.Create("DButton", Scroll)
		-- btn:SetPos(1,2 + move)
		-- btn:SetSize(108,108)
		-- btn:SetText("")
		-- function btn:Paint(w,h)
			-- draw.RoundedBox( 2, 0, 0, w, h, plan_req[i].color )
		-- end
		
		-- local lbl = vgui.Create("DLabel", btn)
		-- lbl:SetPos(2,2)
		-- lbl:SetText("1x")
		-- if i == 1 then
		-- lbl:SetText("50x")
		-- end
		-- if i == 2 then
		-- lbl:SetText("25x")
		-- end
		-- if i == 3 then
		-- lbl:SetText("5x")
		-- end
		-- if i == 4 then
		-- lbl:SetText("1x")
		-- end
		
		-- local icon = vgui.Create("SpawnIcon", Scroll)
		-- icon:SetPos(1,2 + move)
		-- icon:SetSize(108,108)
		-- icon:SetText("")
		-- icon:SetModel( tostring(plan_req[i].model) )
		-- icon:SetMouseInputEnabled(false)
		
		-- if i > 4 then
			-- icon:SetVisible(false)
		-- end
	-- end
	local craft_req_1 = vgui.Create("DButton",Scroll)
	local craft_req_2 = vgui.Create("DButton",Scroll)
	local craft_req_3 = vgui.Create("DButton",Scroll)
	local craft_req_4 = vgui.Create("DButton",Scroll)
	
	craft_req_1:SetPos(1,2)
	craft_req_1:SetSize(108,108)
	craft_req_1:SetText("")
	function craft_req_1:Paint(w,h)
		draw.RoundedBox( 2, 0, 0, w, h, plan_req[1].color )
	end
	
	
	craft_req_2:SetPos(1,112)
	craft_req_2:SetSize(108,108)
	craft_req_2:SetText("")
	function craft_req_2:Paint(w,h)
		draw.RoundedBox( 2, 0, 0, w, h, plan_req[2].color )
	end
	
	craft_req_3:SetPos(1,222)
	craft_req_3:SetSize(108,108)
	craft_req_3:SetText("")
	function craft_req_3:Paint(w,h)
		draw.RoundedBox( 2, 0, 0, w, h, plan_req[3].color )
	end
	
	craft_req_4:SetPos(1,332)
	craft_req_4:SetSize(108,108)
	craft_req_4:SetText("")
	function craft_req_4:Paint(w,h)
		draw.RoundedBox( 2, 0, 0, w, h, plan_req[4].color )
	end
	
	
	local craft_lb_1 = vgui.Create("DLabel", craft_req_1)
	local craft_lb_2 = vgui.Create("DLabel", craft_req_2)
	local craft_lb_3 = vgui.Create("DLabel", craft_req_3)
	local craft_lb_4 = vgui.Create("DLabel", craft_req_4)
	
	craft_lb_1:SetPos(2,2)
	craft_lb_1:SetText("50x")
	
	
	craft_lb_2:SetPos(2,2)
	craft_lb_2:SetText("25x")
	
	
	craft_lb_3:SetPos(2,2)
	craft_lb_3:SetText("10x")
	
	
	craft_lb_4:SetPos(2,2)
	craft_lb_4:SetText("1x")
	
	
	local craft_ico_1 = vgui.Create("SpawnIcon", Scroll)
	local craft_ico_2 = vgui.Create("SpawnIcon", Scroll)
	local craft_ico_3 = vgui.Create("SpawnIcon", Scroll)
	local craft_ico_4 = vgui.Create("SpawnIcon", Scroll)
	
	craft_ico_1:SetPos(1,2 )
	craft_ico_1:SetSize(108,108)
	craft_ico_1:SetText("")
	craft_ico_1:SetModel( tostring(plan_req[1].model) )
	craft_ico_1:SetMouseInputEnabled(false)
	
	craft_ico_2:SetPos(1,112 )
	craft_ico_2:SetSize(108,108)
	craft_ico_2:SetText("")
	craft_ico_2:SetModel( tostring(plan_req[2].model) )
	craft_ico_2:SetMouseInputEnabled(false)
	
	craft_ico_3:SetPos(1,222 )
	craft_ico_3:SetSize(108,108)
	craft_ico_3:SetText("")
	craft_ico_3:SetModel( tostring(plan_req[3].model) )
	craft_ico_3:SetMouseInputEnabled(false)
	
	craft_ico_4:SetPos(1,332 )
	craft_ico_4:SetSize(108,108)
	craft_ico_4:SetText("")
	craft_ico_4:SetModel( tostring(plan_req[4].model) )
	craft_ico_4:SetMouseInputEnabled(false)
	
	
	local result_btn = vgui.Create("DButton", panel4)
	result_btn:SetPos(250,150)
	result_btn:SetText("=")
	
	local plan = vgui.Create( "DComboBox",panel4 )
	plan:SetPos( 20, 20 )
	plan:SetSize( 180, 40 )
	plan:SetValue( "CRAFT: Random Gear" )
	plan:AddChoice( "CRAFT: Random Gear" )
	if LocalPlayer():GetPlan(1) == 1 then plan:AddChoice("CRAFT: Legendary Suit") end
	if LocalPlayer():GetPlan(2) == 1 then plan:AddChoice("CRAFT: Legendary Mask") end
	if LocalPlayer():GetPlan(3) == 1 then plan:AddChoice("CRAFT: Legendary Boots") end
	if LocalPlayer():GetPlan(4) == 1 then plan:AddChoice("CRAFT: Legendary Weapon") end
	plan.OnSelect = function( panel, index, value )
		if plan:GetValue() == "CRAFT: Random Gear" then
		
			craft_ico_1:SetModel(tostring(tostring(plan_req[1].model)) )
			craft_lb_1:SetText("50x")
			function craft_req_1:Paint(w,h)
				draw.RoundedBox( 2, 0, 0, w, h, plan_req[1].color )
			end
			
			craft_req_2:SetVisible(true)
			craft_req_3:SetVisible(true)
			craft_req_4:SetVisible(true)
			
			craft_lb_2:SetVisible(true)
			craft_lb_3:SetVisible(true)
			craft_lb_4:SetVisible(true)
			
			craft_ico_2:SetVisible(true)
			craft_ico_3:SetVisible(true)
			craft_ico_4:SetVisible(true)
		elseif (plan:GetValue() == "CRAFT: Legendary Suit" or 
		plan:GetValue() == "CRAFT: Legendary Mask" or 
		plan:GetValue() == "CRAFT: Legendary Boots" or 
		plan:GetValue() == "CRAFT: Legendary Weapon" ) then
		
			craft_ico_1:SetModel(tostring(tostring(plan_req[4].model)) )
			craft_lb_1:SetText("5x")
			function craft_req_1:Paint(w,h)
				draw.RoundedBox( 2, 0, 0, w, h, plan_req[4].color )
			end
			
			craft_req_2:SetVisible(false)
			craft_req_3:SetVisible(false)
			craft_req_4:SetVisible(false)
			
			craft_lb_2:SetVisible(false)
			craft_lb_3:SetVisible(false)
			craft_lb_4:SetVisible(false)
			
			craft_ico_2:SetVisible(false)
			craft_ico_3:SetVisible(false)
			craft_ico_4:SetVisible(false)
		elseif (false) then
		elseif (false) then
		end
	end
	
	local craft = vgui.Create("DButton", panel4)
	craft:SetPos(200,270)
	craft:SetSize(80,30)
	craft:SetText("Craft!")
	function craft:DoClick()
		if plan:GetValue() == "CRAFT: Random Gear" then
		RunConsoleCommand("inv_craft",0) end
		if plan:GetValue() == "CRAFT: Legendary Suit" then
		RunConsoleCommand("inv_craft",1) end
		if plan:GetValue() == "CRAFT: Legendary Mask" then
		RunConsoleCommand("inv_craft",2) end
		if plan:GetValue() == "CRAFT: Legendary Boots" then
		RunConsoleCommand("inv_craft",3) end
		if plan:GetValue() == "CRAFT: Legendary Weapon" then
		RunConsoleCommand("inv_craft",4) end
		if (false) then end
	end ]]
	
	
	
	sheet:AddSheet( "Items", panel1, "icon16/user.png", false, false, "General Items" )
	-- sheet:AddSheet( "Equips", panel2, "icon16/user.png", false, false, "General Items" )
	sheet:AddSheet( "Materials", panel3, "icon16/user.png", false, false, "General Items" )
	-- sheet:AddSheet( "Crafting", panel4, "icon16/user.png", false, false, "General Items" )
	-- PrintTable(info)
	-- print(self.ItemsEquip)
end;

vgui.Register("ia_inventory", IA, "DFrame");
-- vgui.Register("ia_itemslist", IA.ItemsList, "DIconLayout");
-- vgui.Register("ia_itemsequip", IA.ItemsEquip, "DIconLayout");
-- vgui.Register("ia_itemsmats", IA.ItemsMats, "DIconLayout");


concommand.Add("hl2c_inventory", function( um )
	if LocalPlayer():Team() != TEAM_COMPLETED_MAP then
	ToggleMenu();
	end
	
end);
hook.Remove("Move","hl2c.cl.think.inv")
hook.Add("Move","hl2c.cl.think.inv", function()
	if input.WasKeyReleased( KEY_I ) and LocalPlayer().usingchat != true and LocalPlayer():Team() != TEAM_COMPLETED_MAP then
		-- LocalPlayer():ConCommand("hl2c_inventory")
	end
end)

include("cl_drpinv.lua")