// Create Spawn Menu.

Hl2c.SPAWN_MENU = {}
SPAWN_MENU = Hl2c.SPAWN_MENU
SPAWN_MENU.Tabs = {}
SPAWN_MENU.Sheet = {}
SPAWN_MENU.Privileges = {}

function SPAWN_MENU:Initialize()
	self.Panel = vgui.Create("DFrame")
	self.Panel:SetSize(ScrW()-ScreenScale(200), ScrH() - ScreenScale(50))
	self.Panel:SetTitle("Spawn Menu")
	self.Panel:ShowCloseButton( false )
	self.Panel:SetPos( ScrW() * -1, 0 )
	--self.Panel:Center()
	self.Panel:MakePopup()
	self.Panel:SetKeyboardInputEnabled( false )
	/*
	local function inQuad( fraction, beginning, change )
		return change * ( fraction ^ 2 ) + beginning
	end

	local anim = Derma_Anim( "EaseInQuad", self.Panel, function( pnl, anim, delta, data )
		pnl:SetPos( inQuad( delta, -500, 600 ), 300 ) -- Change the X coordinate from 200 to 200+600
	end )
	anim:Start( 2 ) -- Animate for two seconds
	self.Panel.Think = function( self )
		if anim:Active() then
			anim:Run()
		end
	end
	*/
	self.Tree = vgui.Create( "DTree", self.Panel )

	self.Tree:SetPos( 5, 33 )
	self.Tree:SetPadding( 5 )
	self.Tree:SetSize( self.Panel:GetWide() - ScreenScale(350), self.Panel:GetTall() - 100 )
	--[[ --local node = self.Tree:AddNode( "Node One" )
	--local cnode = node:AddPanel( "Node 2.1" ) ]]
	self.Tabs[1] = self.Tree:AddNode( "General NPCS")
	self.Tabs[2] = self.Tree:AddNode( "Other NPCS")
	self.Tabs[3] = self.Tree:AddNode( "Episode Two Scripts")
	self.Tabs[4] = self.Tree:AddNode( "Episode One Scripts")
	self.Tabs[5] = self.Tree:AddNode( "Half - Life 2 Scripts")
	--[[ --local node = parent:AddNode( "Child node" )
	--parent:SetExpanded( true )
	--local CatList = vgui.Create( "DCategoryList", self.Panel )
	--CatList:SetPos( 40, 40 )
	--CatList:SetSize( 150, 500 )
	--CatList:SetExpanded( 1 )
	--local Cat = CatList:Add( "My Category" ) ]]
	self.Sheet[1] = vgui.Create("DPanel",self.Panel)
	self.Sheet[1]:SetPos( self.Tree:GetWide() + 20, 35 ) -- Set the position of the panel
	self.Sheet[1]:SetSize( self.Panel:GetWide() - ScreenScale(150), self.Panel:GetTall() - 100 ) -- Set the size of the panel
	self.Sheet[1]:SetVisible( false ) -- Set Visible false
	
	
	local Scroll = vgui.Create( "DScrollPanel", self.Sheet[1] ) //Create the Scroll panel
	Scroll:SetSize( self.Sheet[1]:GetWide(), self.Sheet[1]:GetTall() )
	Scroll:SetPos( 0, 0 )
	--[[ --cnode:AddPanel(DScrollPanel) ]]
	local List = vgui.Create( "DIconLayout", Scroll )
	List:SetSize( self.Sheet[1]:GetWide(), self.Sheet[1]:GetTall() )
	List:SetPos( 5, 0 )
	List:SetSpaceY( 5 ) //Sets the space in between the panels on the X Axis by 5
	List:SetSpaceX( 5 ) //Sets the space in between the panels on the Y Axis by 5
		
	for k, v in ipairs(Hl2c.SpawnList.Ent) do
		local button = vgui.Create( "ContentIcon" )
		button:SetMaterial( v["icon"] )		// Set the material - relative to /materials/ directory						 // OPTIONAL: Use instead of SetSize if you want to resize automatically ( without stretching )
		button:SetName( v["name"] )
		button.DoClick = function()
			RunConsoleCommand("hl2c_spawn",v["spawnid"])
		end
		List:Add( button )
	end
	
	timer.Create( "SPAWNMENU_MenuThink", 1/60, 0, function() self:Think() end )
end


function SPAWN_MENU:Think()
	if self.Tree and self.Tree:GetSelectedItem() == self.Tabs[1] then
		--[[ --self.Sheet[1]:SetDisabled(false) ]]
		--[[ --self.Sheet[1]:SetPaintBackground(true) ]]
		self.Sheet[1]:SetVisible(true)
		--[[ print("true") ]]
	else
		--[[ --self.Sheet[1]:SetDisabled(true) ]]
		self.Sheet[1]:SetVisible(false)
	end
	
	
end

function SPAWN_MENU:Destroy()
	if ( !self.Panel ) then return end
	self.Panel:Remove()
	self.Panel = nil
	self.Sheet = {}
	self.Privileges = {}
	self.Tabs = {}
end

function SPAWN_MENU:Show()
	--[[ --if ( !LocalPlayer():EV_HasPrivilege( "Menu" ) ) then return end ]]
	if ( !self.Panel ) then self:Destroy() self:Initialize() end
	
	for _, tab in ipairs( self.Tabs ) do
		if tab.Update then tab:Update() end
	end
	if self.Tree then
		--[[ print(self.Tree:GetSelectedItem()) ]]
	end
	self.Panel:SetVisible( true )
	self.Panel:SetKeyboardInputEnabled( false )
	self.Panel:SetMouseInputEnabled( true )
	
	input.SetCursorPos( 50 + self.Panel:GetWide() / 2, ScrH() / 2 )
	
	timer.Create( "Hl2c_SpawnMenuShow", 1/60, 0, function()
		self.Panel:SetPos( self.Panel:GetPos() + ( 110 - self.Panel:GetPos() ) / 7, ScrH() / 2 - self.Panel:GetTall() / 2 )
		
		if ( self.Panel:GetPos() > 50 ) then
			timer.Destroy( "Hl2c_SpawnMenuShow" )
		end
	end )
end

function SPAWN_MENU:Hide()
	if ( !self.Panel ) or !ispanel(self.Panel) then return end
	
	self.Panel:SetKeyboardInputEnabled( false )
	self.Panel:SetMouseInputEnabled( false )
	
	timer.Create( "Hl2c_SpawnMenuShow", 1/60, 0, function()
		self.Panel:SetPos( self.Panel:GetPos() - ( self.Panel:GetPos() + self.Panel:GetWide() + 10 ) / 5, ScrH() / 2 - self.Panel:GetTall() / 2 )
		
		if ( self.Panel:GetPos() < -self.Panel:GetWide() ) then
			self.Panel:SetVisible( false )
			timer.Destroy( "Hl2c_SpawnMenuShow" )
		end
	end )
end
--end)
--usermessage.Hook("OpenSpawnMenu",SpawnMenuEnabled)
--concommand.Add( "hl2c_spawnmenu", function() SpawnMenuEnabled() end )
concommand.Add( "+hl2c_spawnmenu", function() if LocalPlayer():IsAdmin() then else return end SPAWN_MENU:Show() end )
concommand.Add( "-hl2c_spawnmenu", function() if LocalPlayer():IsAdmin() then else return end SPAWN_MENU:Hide() end )

/*NPC LIST

   * combine_mine
   * npc_alyx
   * npc_antlion
   * npc_antlion_template_maker
   * npc_antlionguard
   * npc_barnacle
   * npc_barney
   * npc_breen
   * npc_citizen
   * npc_combine_camera
   * npc_combine_s
   * npc_combinedropship
   * npc_combinegunship
   * npc_crabsynth
   * npc_cranedriver
   * npc_crow
   * npc_cscanner
   * npc_dog
   * npc_eli
   * npc_fastzombie
   * npc_fisherman
   * npc_gman
   * npc_headcrab
   * npc_headcrab_black
   * npc_headcrab_fast
   * npc_helicopter
   * npc_ichthyosaur
   * npc_kleiner
   * npc_manhack
   * npc_metropolice
   * npc_monk
   * npc_mortarsynth
   * npc_mossman
   * npc_pigeon
   * npc_poisonzombie
   * npc_rollermine
   * npc_seagull
   * npc_sniper
   * npc_stalker
   * npc_strider
   * npc_turret_ceiling
   * npc_turret_floor
   * npc_turret_ground
   * npc_vortigaunt
   * npc_zombie
   * npc_zombie_torso
*/