// Include the required lua files
include("cl_scoreboard_playerrow.lua")


// Start our new vgui element
local PANEL = {}


// Apply the scheme of things
function PANEL:ApplySchemeSettings()
	self.nameLabel_r:SetFont("arial12Bold")
	
	self.permaLabel:SetFont("arial12Bold")
	
	self.scoreLabel:SetFont("arial12Bold")
	
	self.deathsLabel:SetFont("arial12Bold")
	
	self.pingLabel:SetFont("arial12Bold")
	
	self.threatLabel:SetFont("arial12Bold")
	
	self.levelLabel:SetFont("arial12Bold")
end


// Called when our vgui element is created
function PANEL:Init()
	self.playerRows = {}
	
	self.nameLabel = vgui.Create("DPanel", self)
	self.nameLabel.display=0
	
	
	self.nameLabel_r = vgui.Create("DLabel", self.nameLabel)
	self.nameLabel_r:SetContentAlignment(4)
	self.nameLabel_r:SetText(GetGlobalString("ServerName"))
	self.nameLabel_r.display=0
	self.nameLabel_r.text=0
	self.nameLabel_r:SetTextColor( Color( 255, 255, 255, 0 ) )
	-- print(self.nameLabel_r:GetTextColor())
	
	self.permaLabel = vgui.Create("DLabel", self)
	self.permaLabel:SetContentAlignment(4)
	self.permaLabel:SetText(" Perma")
	self.permaLabel.display=0
	self.permaLabel.text=0
	self.permaLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
	
	self.levelLabel = vgui.Create("DLabel", self)
	self.levelLabel:SetContentAlignment(4)
	self.levelLabel:SetText(" Levl.")
	self.levelLabel.display=0
	self.levelLabel.text=0
	self.levelLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
	
	self.scoreLabel = vgui.Create("DLabel", self)
	self.scoreLabel:SetContentAlignment(4)
	self.scoreLabel:SetText(" Pts.")
	self.scoreLabel.display=0
	self.scoreLabel.text=0
	self.scoreLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
	
	self.deathsLabel = vgui.Create("DLabel", self)
	self.deathsLabel:SetContentAlignment(4)
	self.deathsLabel:SetText(" #*?!")
	self.deathsLabel.display=0
	self.deathsLabel.text=0
	self.deathsLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
	
	self.pingLabel = vgui.Create("DLabel", self)
	self.pingLabel:SetContentAlignment(4)
	self.pingLabel:SetText(" Ping")
	self.pingLabel.display=0
	self.pingLabel.text=0
	self.pingLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
	
	self.threatLabel = vgui.Create("DLabel", self)
	self.threatLabel:SetContentAlignment(4)
	self.threatLabel:SetText(" Threat Level")
	self.threatLabel.display=0
	self.threatLabel.text=0
	self.threatLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
    self.display_rate=4
end


// Called every frame
function PANEL:Paint()
	if self.nameLabel.display != 200 and self:IsVisible() then
		self.nameLabel.display= self.nameLabel.display + self.display_rate
		self.nameLabel_r.text= self.nameLabel_r.text + self.display_rate
		self.nameLabel_r:SetTextColor( Color( 255, 255, 255, self.nameLabel_r.text ) )
	end
	if self.nameLabel.display == 200 and self.permaLabel.display != 200 and self:IsVisible() then
		self.permaLabel.display= self.permaLabel.display + self.display_rate
		self.permaLabel.text= self.permaLabel.text + self.display_rate
		self.permaLabel:SetTextColor( Color( 255, 255, 255, self.permaLabel.text ) )
	end
	if self.permaLabel.display == 200 and self.scoreLabel.display != 200 and self:IsVisible() then
		self.scoreLabel.display= self.scoreLabel.display + self.display_rate
		self.scoreLabel.text= self.scoreLabel.text + self.display_rate
		self.scoreLabel:SetTextColor( Color( 255, 255, 255, self.scoreLabel.text ) )
	end
	if self.scoreLabel.display == 200 and self.levelLabel.display != 200 and self:IsVisible() then
		self.levelLabel.display= self.levelLabel.display + self.display_rate
		self.levelLabel.text= self.levelLabel.text + self.display_rate
		self.levelLabel:SetTextColor( Color( 255, 255, 255, self.levelLabel.text ) )
	end
	if self.levelLabel.display == 200 and self.deathsLabel.display != 200 and self:IsVisible() then
		self.deathsLabel.display= self.deathsLabel.display + self.display_rate
		self.deathsLabel.text= self.deathsLabel.text + self.display_rate
		self.deathsLabel:SetTextColor( Color( 255, 255, 255, self.deathsLabel.text ) )
	end
	if self.deathsLabel.display == 200 and self.pingLabel.display != 200 and self:IsVisible() then
		self.pingLabel.display= self.pingLabel.display + self.display_rate
		self.pingLabel.text= self.pingLabel.text + self.display_rate
		self.pingLabel:SetTextColor( Color( 255, 255, 255, self.pingLabel.text ) )
	end
	if self.pingLabel.display == 200 and self.threatLabel.display != 200 and self:IsVisible() then
		self.threatLabel.display= self.threatLabel.display + self.display_rate
		self.threatLabel.text= self.threatLabel.text + self.display_rate
		self.threatLabel:SetTextColor( Color( 255, 255, 255, self.threatLabel.text ) )
	end
	-- surface.SetDrawColor(Color(121, 107, 72, 200))
	-- surface.DrawRect(0, 0, self:GetWide()-self:GetWide()*0.60	, 20)
	-- surface.DrawRect(self:GetWide()*0.41, 0, self:GetWide()-self:GetWide()*0.9	, 20)
	-- surface.DrawRect(self:GetWide()*0.50, 0, self:GetWide()-self:GetWide()*0.95	, 15)surface.DrawRect(self:GetWide()*0.52, 0, self:GetWide()-self:GetWide()*0.95	, 15)
	-- surface.DrawRect(self:GetWide()*0.58, 0, self:GetWide()-self:GetWide()*0.95	, 15)surface.DrawRect(self:GetWide()*0.52, 0, self:GetWide()-self:GetWide()*0.95	, 15)
	-- surface.DrawRect(0, 0, self:GetWide()-self:GetWide()*0.60	, 15)
	-- surface.DrawRect(0, 0, self:GetWide()-self:GetWide()*0.60	, 15)
	self.nameLabel.Paint = function(w,h)
	surface.SetDrawColor(Color(121, 107, 72, 200))
	-- surface.DrawRect(0, 0, self:GetWide()	, 30)

	draw.RoundedBoxEx( 10, 0, 0, self:GetWide(), 20, Color(121, 107, 72, self.nameLabel.display), true, false,  false,  false ) 
	-- print(self.nameLabel.display)
	end
	self.permaLabel.Paint = function(w,h)
	surface.SetDrawColor(Color(121, 107, 72, self.permaLabel.display))
	surface.DrawRect(0, 0, self:GetWide()	, 20)
	end
	self.scoreLabel.Paint = function(w,h)
	surface.SetDrawColor(Color(121, 107, 72, self.scoreLabel.display))
	surface.DrawRect(0, 0, self:GetWide()	, 20)
	end
	self.levelLabel.Paint = function(w,h)
	surface.SetDrawColor(Color(121, 107, 72, self.levelLabel.display))
	surface.DrawRect(0, 0, self:GetWide()	, 20)
	end
	self.deathsLabel.Paint = function(w,h)
	surface.SetDrawColor(Color(121, 107, 72, self.deathsLabel.display))
	surface.DrawRect(0, 0, self:GetWide()	, 20)
	end
	self.pingLabel.Paint = function(w,h)
	surface.SetDrawColor(Color(121, 107, 72, self.pingLabel.display))
	surface.DrawRect(0, 0, self:GetWide()	, 20)
	end
	self.threatLabel.Paint = function(w,h)
		surface.SetDrawColor(Color(121, 107, 72, self.threatLabel.display))
		-- surface.DrawRect(0, 0, self:GetWide()	, 20)
		surface.DrawRect( 0, 0, 150, 20) 
	end
end


// Does the actual layout
function PANEL:PerformLayout()
	//self.nameLabel:SizeToContents()
	self.nameLabel:SetSize(self:GetWide()- 380,20)
	self.nameLabel:SetPos(10, 0)
	self.nameLabel_r:SetSize(self:GetWide()- 380,20)
	self.nameLabel_r:SetPos(10, 0)
	
	-- self.permaLabel:SizeToContents()
	self.permaLabel:SetSize(70,20)
	self.permaLabel:SetPos(self:GetWide() - self.permaLabel:GetWide() - 295	, 0)
	
	-- self.scoreLabel:SizeToContents()
	self.scoreLabel:SetSize(30,20)
	self.scoreLabel:SetPos(self:GetWide() - self.scoreLabel:GetWide() - 260, 0)
	
	-- self.levelLabel:SizeToContents()
	self.levelLabel:SetSize(30,20)
	self.levelLabel:SetPos(self:GetWide() - self.levelLabel:GetWide() - 225, 0)
	
	-- self.deathsLabel:SizeToContents()
	self.deathsLabel:SetSize(30,20)
	self.deathsLabel:SetPos(self:GetWide() - self.deathsLabel:GetWide() - 190, 0)
	
	-- self.pingLabel:SizeToContents()
	self.pingLabel:SetSize(30,20)
	self.pingLabel:SetPos(self:GetWide() - self.pingLabel:GetWide() - 155, 0)
	
	-- self.threatLabel:SizeToContents()
	self.threatLabel:SetSize(150,20)
	self.threatLabel:SetPos(self:GetWide() - self.threatLabel:GetWide(), 0)
	
	-- local playerRowsSorted = {}
	-- for _, row in pairs(self.playerRows) do
		-- table.insert(playerRowsSorted, row)
	-- end
	-- table.sort(playerRowsSorted, function (a, b) return a:HigherOrLower(b) end)
	
	local y = 15
	-- for _, row in ipairs(playerRowsSorted) do
		-- row:SetPos(0, y)	
		-- row:SetSize(self:GetWide(), 35)
		-- row:UpdatePlayerRow()
		-- y = y + 25
	-- end
	for i = 1,game.MaxPlayers()
	do 
		if player.GetByID(i):IsValid() and self.playerRows[player.GetByID(i)] then
			self.playerRows[player.GetByID(i)]:SetPos(0, y)	
			self.playerRows[player.GetByID(i)]:SetSize(self:GetWide(), 35)
			self.playerRows[player.GetByID(i)]:UpdatePlayerRow()
			y = y + 25
		end
	end
end


// Updates the scoreboard
function PANEL:UpdatePlayerList()
	for pl, row in pairs(self.playerRows) do
		if !pl:IsValid() then
			row:Remove()
			self.playerRows[pl] = nil
		end
	end
	
	for i = 1,game.MaxPlayers()
	do 
		if player.GetByID(i):IsValid() and !self.playerRows[player.GetByID(i)] then
			local playerRow = vgui.Create("scoreboard_playerrow", self)
			playerRow:SetPlayer(player.GetByID(i))
			self.playerRows[player.GetByID(i)] = playerRow
		end
	end
	-- for _, pl in pairs(player.GetAll()) do
		-- if !self.playerRows[pl] then
			
		-- end
	-- end
	self.nameLabel:SetText(GetGlobalString("ServerName"))
	self:InvalidateLayout()
end


// Register our scoreboard element
vgui.Register("scoreboard_playerlist", PANEL, "Panel")