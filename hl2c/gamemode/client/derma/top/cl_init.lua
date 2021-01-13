Hl2c.Theatre = Hl2c.Theatre or {}
Theatre =  Theatre or Hl2c.Theatre
Theatre.TimerStart = 0
Theatre.TimerTime = 0
Theatre.TimerLeft = 0
Theatre.TimerText = " "
Theatre.RespawnStart = 0
Theatre.RespawnLeft = 0
Theatre.RespawnTime = 0
Theatre.Spectating = NULL
Theatre.Delay = 3
Theatre.Left = 0
/*
	if nextMapCountdownStart then
		local nextMapCountdownLeft = math.Round(nextMapCountdownStart + NEXT_MAP_TIME - CurTime())
		if nextMapCountdownLeft > 0 then
			draw.DrawText("Next Map in "..tostring(nextMapCountdownLeft), "impact32", centerX, h - h * 0.075, Color(255, 255, 255, 200), 1)
		else
			draw.DrawText("Switching Maps!", "impact32", centerX, h - h * 0.075, Color(255, 255, 255, 200), 1)
		end
	end
*/
net.Receive( "Player_Spectate",function() 
	Theatre.Spectating = net.ReadEntity()
	-- print(Theatre.Spectating)
	
end)
net.Receive( "Player_Died",function() 
	Theatre.RespawnStart = net.ReadDouble()
	Theatre.RespawnTime = net.ReadFloat()
	
end)
net.Receive( "Push_MapTimer",function() 
	Theatre.TimerStart = net.ReadDouble()
	Theatre.TimerTime = net.ReadFloat()
	Theatre.TimerText = net.ReadString()
	
	if Theatre.TimerText == "Nextmap in " or Theatre.TimerText == "Restart Map in " then
		if #SUCCESS_SOUNDS > 1 then
			surface.PlaySound(SUCCESS_SOUNDS[math.random(1, #SUCCESS_SOUNDS)])
		elseif #SUCCESS_SOUNDS > 0 then
			surface.PlaySound(SUCCESS_SOUNDS[1])
		end
	end
end)

function Theatre:Initialize()
	
	
	self.Theatre01 = vgui.Create( "DPanel" )
	self.Theatre01:SetPos( 0, -ScreenScale(70) )
	self.Theatre01:SetSize( ScrW(), ScreenScale(70) )
	self.Theatre01:SetBackgroundColor( Color(0,0,0) )
	self.Theatre01:SetPaintBackground( false )
	function self.Theatre01:Paint()
		local x, y, w, h = self:GetBounds()
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, w, h)
	end
	self.Theatre01:SetPaintBackground( false )
	
	self.Theatre02 = vgui.Create( "DPanel" )
	self.Theatre02:SetPos( 0, ScrH() )
	self.Theatre02:SetSize( ScrW(), ScreenScale(70) )
	self.Theatre02:SetBackgroundColor( Color(0,0,0) )
	self.Theatre02:SetPaintBackground( false )
	function self.Theatre02:Paint()
		local x, y, w, h = self:GetBounds()
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, w, h)
	end
	self.Theatre02:SetPaintBackground( false )
	
	self.Notify = vgui.Create("DNotify")
	self.Notify:SetPos( 0, 0 )
	self.Notify:SetSize( ScrW(), ScrH() )
	self.Notify:SetLife( 10 )
	
	self.Status = vgui.Create( "DLabel" )
	self.Status:SetSize( 400, 100 )
	self.Status:SetPos( ScrW()-self.Status:GetWide()-ScreenScale(10), ScrH()-self.Status:GetTall() )
	self.Status:SetText( "" )
	self.Status:SetTextColor( Color( 255, 255, 255, 200) )
	self.Status:SetFont( "impact32" )
	self.Status:SetContentAlignment( 6 )
	
	
	self.Nick = vgui.Create( "DLabel" )
	self.Nick:SetSize( 400, 100 )
	self.Nick:SetPos( 0 + ScreenScale(10), ScrH()-self.Status:GetTall() )
	self.Nick:SetText( "" )
	self.Nick:SetTextColor( Color( 255, 255, 255, 200) )
	self.Nick:SetFont( "impact32" )
	self.Nick:SetContentAlignment( 4 )
	
	self.Chapter = vgui.Create( "DLabel" )
	self.Chapter:SetSize( 400, 100 )
	self.Chapter:SetPos( ScrW()/2 - self.Chapter:GetWide()/2, 0 + self.Status:GetTall()/2 )
	self.Chapter:SetText( "" )
	self.Chapter:SetTextColor( Color( 255, 255, 255, 200) )
	self.Chapter:SetFont( "impact32" )
	self.Chapter:SetContentAlignment( 5 )
	
	
	self.Timer = vgui.Create( "DLabel" )
	self.Timer:SetSize( 400, 100 )
	self.Timer:SetPos( ScrW()/2 - self.Chapter:GetWide()/2, ScrH()-self.Status:GetTall() )
	self.Timer:SetText( "" )
	self.Timer:SetTextColor( Color( 255, 255, 255, 200) )
	self.Timer:SetFont( "impact32" )
	self.Timer:SetContentAlignment( 5 )
	--self.Timer = nil
	
	if self:TimerExist() then else self:TimerAdd() end
	
end

function Theatre:Think()
	if self:Exist() then else self:Destroy() end
	if self:TimerExist() then else self:TimerAdd() end
	if IsValid(LocalPlayer()) and isnumber(LocalPlayer():Team()) then else return end
	if LocalPlayer():Team() == 2 or LocalPlayer():Team() == 3 or LocalPlayer():Team() == 6 then
	-- draw.DrawText("Next Map in ", "impact32", ScrW()/2, ScrH()/2, Color(255, 255, 255, 200), 1)
		if self.Delay > 0 then
			self.DelayLeft = math.Round(self.Delay - CurTime())
			if self.DelayLeft > 0 then
			else
				if LocalPlayer():Team() == 2 then
					self.Status:SetText( "COMPLETED MAP" )
				else
					if self.RespawnStart > 0 then
						self.RespawnLeft = math.Round(self.RespawnStart + self.RespawnTime - CurTime())
						if self.RespawnLeft > 0 then
							self.Status:SetText( "YOU ARE DEAD. RESPAWN IN "..tostring(self.RespawnLeft) )
						else
							self.Status:SetText( "YOU ARE SPAWNING..." )
						end
					end
				
				end
				if IsValid(self.Spectating) and self.Spectating:IsPlayer() then
					self.Nick:SetText( tostring( self.Spectating:Nick() ) )
				else
					self.Nick:SetText( tostring( NULL ) )
				end
				self.Chapter:SetText( "Chapter: " )
			end
		end
	else
	
		if ispanel(self.Status) then
		self.Status:SetText( " " )
		end
		if ispanel(self.Status) then
		self.Nick:SetText( " " )
		
		end
		if ispanel(self.Status) then
		self.Chapter:SetText( " " )
		end
	end
	
	if self.TimerStart > 0 then
		self.TimerLeft = math.Round(self.TimerStart + self.TimerTime - CurTime())
		if self.TimerLeft > 0 then
			self.Timer:SetText( tostring(self.TimerText)..tostring(self.TimerLeft) )
		else
			self.Timer:SetText( "Switiching Map..." )
		end
	end
	-- print("PRINT SHIT")
end

function Theatre:Exist()
	if ( !self.Theatre01 ) then 
		return false 
	else 
		return true
	end
end

function Theatre:TimerExist()

	if ( timer.Exists("Theatre_MenuThink") ) then 
	return true
	else
	
	return false
	end
end
function Theatre:TimerAdd()
	timer.Create( "Theatre_MenuThink", 1/60, 0, function() self:Think() end )
end
function Theatre:Destroy()
	if ( !self.Theatre01 ) then else 
	self.Theatre01:Remove()
	self.Theatre01 = nil
	end
	
	if ( !self.Theatre02 ) then else 
	self.Theatre02:Remove()
	self.Theatre02 = nil
	end
	
	if ( !self.Status ) then else 
	self.Status:Remove()
	self.Status = nil
	end
	if ( !self.Nick ) then else 
	self.Nick:Remove()
	self.Nick = nil
	end
	if ( !self.Chapter ) then else 
	self.Chapter:Remove()
	self.Chapter = nil
	end
	
	self:Initialize()
end

function Theatre:Open()
	if self:TimerExist() then else self:TimerAdd() end
	self.Delay = 3 + CurTime()
	-- self:Destroy()
	-- self:Initialize()
	local function inQuad( fraction, beginning, change )
		return change * ( fraction ^ 2 ) + beginning
	end

	local anim = Derma_Anim( "EaseInQuad", self.Theatre01, function( pnl, anim, delta, data )
		pnl:SetPos( 0, inQuad( delta, -ScreenScale(70), ScreenScale(70) ) ) -- Change the X coordinate from 200 to 200+600
	end )
	anim:Start( 2 ) -- Animate for two seconds
	self.Theatre01.Think = function( self )
		if anim:Active() then
			anim:Run()
		end
	end
	
	local anim02 = Derma_Anim( "EaseInQuad", self.Theatre02, function( pnl, anim02, delta, data )
		pnl:SetPos( 0, inQuad( delta, ScrH(), ( -ScreenScale(70) ) ) ) -- Change the X coordinate from 200 to 200+600
	end )
	anim02:Start( 2 ) -- Animate for two seconds
	self.Theatre02.Think = function( self )
		if anim02:Active() then
			anim02:Run()
		end
	end
end

function Theatre:Close()
	if self:TimerExist() then else self:TimerAdd() end
	self.Delay = 0
	-- self:Destroy()
	-- self:Initialize()
	local function inQuad( fraction, beginning, change )
		return change * ( fraction ^ 2 ) + beginning
	end

	local anim = Derma_Anim( "EaseInQuad", self.Theatre01, function( pnl, anim, delta, data )
		pnl:SetPos( 0, inQuad( delta, 0, -ScreenScale(70) ) ) -- Change the X coordinate from 200 to 200+600
	end )
	anim:Start( 2 ) -- Animate for two seconds
	self.Theatre01.Think = function( self )
		if anim:Active() then
			anim:Run()
		end
	end
	
	local anim02 = Derma_Anim( "EaseInQuad", self.Theatre02, function( pnl, anim02, delta, data )
		pnl:SetPos( 0, inQuad( delta, ScrH() -ScreenScale(70), ScrH() ) ) -- Change the X coordinate from 200 to 200+600
	end )
	anim02:Start( 2 ) -- Animate for two seconds
	self.Theatre02.Think = function( self )
		if anim02:Active() then
			anim02:Run()
		end
	end
	self.Spectating = NULL
end

function Theatre:SetUp()
	if self then else return end
	if timer.Exists("Theatre_MenuThink") then else timer.Create( "Theatre_MenuThink", 1/60, 0, function() self:Think() end ) end
	
end


net.Receive("Theatre_Open", function(len)
	
	Theatre:Open()
	
end)

net.Receive("Theatre_Close", function(len)
	
	Theatre:Close()
	
end)

net.Receive("Theatre_Init", function(len)
	
	Theatre:Initialize()
	
end)












local hl2c_top = {
	topSizeW = 250,
	topSizeH = 320,
	TopTitle = "Top 5 Players",
	toplist = {}
	--Top = nil,
	--ReportType = Hl2c.reports,
	--ReportPlayerTip = "Tip: Type what you expected what the player caused to you to report him. But do not create a report if he did nothing wrong to you. You must select Player Name and Reason then detail what happened."

}
--local ReportPlayerTip = hl2c_report.ReportPlayerTip
local topSizeW = hl2c_top.topSizeW
local topSizeH = hl2c_top.topSizeH
local TopTitle = hl2c_top.TopTitle
local toplist = hl2c_top.toplist
--local ReportPlayerTip = hl2c_report.ReportPlayerTip

function OpenTopWindow()
	hl2c_top.toplist[1] = net.ReadString()
	hl2c_top.toplist[2] = net.ReadString()
	hl2c_top.toplist[3] = net.ReadString()
	hl2c_top.toplist[4] = net.ReadString()
	hl2c_top.toplist[5] = net.ReadString()
	
	//print(hl2c_top.toplist[1])
	//print(hl2c_top.toplist[2])
	//print(hl2c_top.toplist[3])
	//print(hl2c_top.toplist[4])
	//print(hl2c_top.toplist[5])
	
	
	local Top = vgui.Create( "DFrame" )
	--StatWindow:SetPos( 100, 100 )
	Top:SetSize( topSizeW, topSizeH )
	Top:SetTitle( TopTitle )
	Top:SetDraggable( true )
	Top:Center()
	Top:MakePopup()
	
	local Toppanel = vgui.Create("DPanel", Top)
	Toppanel:SetSize( 200, 260 )
	Toppanel:SetPos( 30, 40 )
	Toppanel:SetBackgroundColor(Color(0,0,0))
	Toppanel:SizeToContents() 
	
	local TopDScrollPanel = vgui.Create( "DScrollPanel", Toppanel )
	TopDScrollPanel:SetSize( 200, 260 )
	TopDScrollPanel:SetPos( 0, 0 )
	
	local Topgrid = vgui.Create( "DGrid", TopDScrollPanel )
	Topgrid:SetPos( 1, 1 )
	Topgrid:SetCols( 1 )
	Topgrid:SetColWide( 200 )
	Topgrid:SetRowHeight(71)
	
	
	for k, v in pairs(hl2c_top.toplist) do
		local TopNamepanel = vgui.Create("DPanel")
		TopNamepanel:SetSize( 183, 70 )
		TopNamepanel:SetPos( 4, 5 )
		TopNamepanel:SizeToContents() 
		TopNamepanel:SetBackgroundColor( Color(150,150,150) )
		local TopNamepaneltxt = vgui.Create( "DLabel", TopNamepanel )
		TopNamepaneltxt:SetPos( 30, 10 )
		TopNamepaneltxt:SetTextColor( Color(255,255,255) )
		TopNamepaneltxt:SetText( hl2c_top.toplist[k] )
		TopNamepaneltxt:SetAutoStretchVertical( false )
		TopNamepaneltxt:SetContentAlignment( 7 )
		TopNamepaneltxt:SetSize( 180,60 )
		TopNamepaneltxt:SetWrap( true )
		Topgrid:AddItem( TopNamepanel )
	end
end

net.Receive("TopWindow", OpenTopWindow ) 