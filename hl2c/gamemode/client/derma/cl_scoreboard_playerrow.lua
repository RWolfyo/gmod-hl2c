// Start our new vgui element
local PANEL = {}
local FRIEND_INDICATOR = surface.GetTextureID("VGUI/ico_friend_indicator_scoreboard")


// Apply the scheme of things
function PANEL:ApplySchemeSettings()
	self.nameLabel:SetFont("arial16Bold")
	
	self.permaLabel:SetFont("arial16Bold")
	
	self.levelLabel:SetFont("arial16Bold")
	self.levelLabel:SetFont("arial16Bold")
	
	self.scoreLabel:SetFont("arial16Bold")
	
	self.deathsLabel:SetFont("arial16Bold")
	
	self.pingLabel:SetFont("arial16Bold")
	self.threatLabel:SetFont("arial16Bold")
end


// Figures out where to place itself
function PANEL:HigherOrLower(row)
	if !self.pl:IsValid() || self.pl:Team() == TEAM_CONNECTING then return false end
	if !row.pl:IsValid() || row.pl:Team() == TEAM_CONNECTING then return true end
	
	if self.pl:Frags() == row.pl:Frags() then
		return self.pl:Deaths() < row.pl:Deaths()
	end

	return self.pl:Frags() > row.pl:Frags()
end


// Called when our vgui element is created
function PANEL:Init()
	self.pl = 0
	
	//self.avatarImage = vgui.Create("AvatarImage", self)
	
	self.nameLabel = vgui.Create("DLabel", self)
	self.nameLabel.display=0
	self.nameLabel.text=0
	self.nameLabel:SetTextColor(Color(255,255,255,0))
	
	self.permaLabel = vgui.Create("DLabel", self)
	self.permaLabel.display=0
	self.permaLabel.text=0
	self.permaLabel:SetTextColor(Color(255,255,255,0))
	
	self.scoreLabel = vgui.Create("DLabel", self)
	self.scoreLabel.display=0
	self.scoreLabel.text=0
	self.scoreLabel:SetTextColor(Color(255,255,255,0))
	
	self.levelLabel = vgui.Create("DLabel", self)
	self.levelLabel.display=0
	self.levelLabel.text=0
	self.levelLabel:SetTextColor(Color(255,255,255,0))
	
	self.deathsLabel = vgui.Create("DLabel", self)
	self.deathsLabel.display=0
	self.deathsLabel.text=0
	self.deathsLabel:SetTextColor(Color(255,255,255,0))
	
	self.pingLabel = vgui.Create("DLabel", self)
	self.pingLabel.display=0
	self.pingLabel.text=0
	self.pingLabel:SetTextColor(Color(255,255,255,0))
	
	self.threatLabel = vgui.Create("DLabel", self)
	self.threatLabel.display=0
	self.threatLabel.text=0
	self.threatLabel:SetTextColor(Color(255,255,255,0))
	
	self.permaLabel:SetContentAlignment(6)
	
	self.scoreLabel:SetContentAlignment(6)
	
	self.levelLabel:SetContentAlignment(6)
	
	self.deathsLabel:SetContentAlignment(6)
	
	self.pingLabel:SetContentAlignment(6)
    self.display_rate=4
end


// Called every frame
function PANEL:Paint()
	if LocalPlayer() == self.pl then
		//surface.SetDrawColor(Color(125, 125, 125, 75))
		//surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
	end
	
	if self.pl:IsValid() then
		-- surface.SetDrawColor(Color(170,160,120, 200))
		-- surface.DrawRect(0, 0, 290, 25)
		-- surface.DrawRect(300, 0, 50, 25)
		-- surface.DrawRect(360, 0, 50, 25)
		-- surface.DrawRect(420, 0, 50, 25)
		-- surface.DrawRect(480, 0, 50, 25)
		-- surface.SetDrawColor(Color(170,160,120, 200))
		-- surface.DrawRect(0, 0, self:GetWide()-self:GetWide()*0.60	, 20)
		-- surface.DrawRect(self:GetWide()*0.41, 0, self:GetWide()-self:GetWide()*0.9	, 20)
		-- surface.DrawRect(self:GetWide()*0.50, 0, self:GetWide()-self:GetWide()*0.95	, 15)surface.DrawRect(self:GetWide()*0.52, 0, self:GetWide()-self:GetWide()*0.95	, 15)
		-- surface.DrawRect(self:GetWide()*0.58, 0, self:GetWide()-self:GetWide()*0.95	, 15)surface.DrawRect(self:GetWide()*0.52, 0, self:GetWide()-self:GetWide()*0.95	, 15)
		-- surface.DrawRect(0, 0, self:GetWide()-self:GetWide()*0.60	, 15)
		-- surface.DrawRect(0, 0, self:GetWide()-self:GetWide()*0.60	, 15)
		
			if self.nameLabel.display<200 then
				self.nameLabel.display=self.nameLabel.display + self.display_rate
				self.nameLabel.text=self.nameLabel.text+self.display_rate self.nameLabel:SetTextColor(Color(255,255,255,self.nameLabel.text))
			end
	
			if self.permaLabel.display<200 and self.nameLabel.display>=200 then self.permaLabel.display=self.permaLabel.display+self.display_rate self.permaLabel.text=self.permaLabel.text+self.display_rate self.permaLabel:SetTextColor(Color(255,255,255,self.permaLabel.text)) end
			
			if self.scoreLabel.display<200 and self.permaLabel.display>=200 then self.scoreLabel.display=self.scoreLabel.display+self.display_rate self.scoreLabel.text=self.scoreLabel.text+self.display_rate self.scoreLabel:SetTextColor(Color(255,255,255,self.scoreLabel.text)) end
			
			if self.levelLabel.display<200 and self.scoreLabel.display>=200 then self.levelLabel.display=self.levelLabel.display+self.display_rate self.levelLabel.text=self.levelLabel.text+self.display_rate self.levelLabel:SetTextColor(Color(255,255,255,self.levelLabel.text)) end
			
			if self.deathsLabel.display<200 and self.levelLabel.display>=200 then self.deathsLabel.display=self.deathsLabel.display+self.display_rate self.deathsLabel.text=self.deathsLabel.text+self.display_rate self.deathsLabel:SetTextColor(Color(255,255,255,self.deathsLabel.text)) end
			
			if self.pingLabel.display<200 and self.deathsLabel.display>=200 then self.pingLabel.display=self.pingLabel.display+self.display_rate self.pingLabel.text=self.pingLabel.text+self.display_rate self.pingLabel:SetTextColor(Color(255,255,255,self.pingLabel.text)) end
			
			if self.threatLabel.display<200 and self.pingLabel.display>=200 then self.threatLabel.display=self.threatLabel.display+self.display_rate self.threatLabel.text=self.threatLabel.text+self.display_rate self.threatLabel:SetTextColor(Color(255,255,255,self.threatLabel.text)) end
		
		-- surface.SetDrawColor(Color(80,160,80, 200)) GREEN
		-- surface.SetDrawColor(Color(150,0,0, 200)) RED
		-- surface.SetDrawColor(Color(180,120,0, 200)) ORANGE
		-- surface.SetDrawColor(Color(170,160,120, 200)) LIGHTER BROWN
		-- surface.SetDrawColor(Color(150,140,100, 200)) LIGHT BROWN
		self.nameLabel.Paint = function(w,h)
		surface.SetDrawColor(Color(150,140,100, self.nameLabel.display))
		surface.DrawRect(0, 0, self:GetWide(), 20)
		-- surface.DrawRect( 10, 0, 0, self:GetWide(), 20) 
		end
		self.permaLabel.Paint = function(w,h)
		surface.SetDrawColor(Color(150,140,100, self.permaLabel.display))
		surface.DrawRect(0, 0, self:GetWide(), 20)
		end
		self.scoreLabel.Paint = function(w,h)
		if tonumber(self.scoreLabel:GetText() ) > 999 then
			surface.SetDrawColor(Color(150,0,0, self.scoreLabel.display))
		elseif tonumber(self.scoreLabel:GetText() ) > 99 then
			surface.SetDrawColor(Color(180,120,0, self.scoreLabel.display))
		else
			surface.SetDrawColor(Color(80,160,80, self.scoreLabel.display))
		end
		surface.DrawRect(0, 0, self:GetWide(), 20)
		end
		self.levelLabel.Paint = function(w,h)
		if tonumber(self.levelLabel:GetText() ) > 19 then
			surface.SetDrawColor(Color(150,0,0, self.levelLabel.display))
		elseif tonumber(self.levelLabel:GetText() ) > 9 then
			surface.SetDrawColor(Color(180,120,0, self.levelLabel.display))
		else
			surface.SetDrawColor(Color(80,160,80, self.levelLabel.display))
		end
		surface.DrawRect(0, 0, self:GetWide(), 20)
		end
		self.deathsLabel.Paint = function(w,h)
		if tonumber(self.deathsLabel:GetText() ) > 49 then
			surface.SetDrawColor(Color(150,0,0, self.deathsLabel.display))
		elseif tonumber(self.deathsLabel:GetText() ) > 9 then
			surface.SetDrawColor(Color(180,120,0, self.deathsLabel.display))
		else
			surface.SetDrawColor(Color(80,160,80, self.deathsLabel.display))
		end
		surface.DrawRect(0, 0, self:GetWide(), 20)
		end
		self.pingLabel.Paint = function(w,h)
		if tonumber(self.pingLabel:GetText() ) > 199 then
			surface.SetDrawColor(Color(150,0,0, self.pingLabel.display))
		elseif tonumber(self.pingLabel:GetText() ) > 49 then
			surface.SetDrawColor(Color(180,120,0, self.pingLabel.display))
		else
			surface.SetDrawColor(Color(80,160,80, self.pingLabel.display))
		end
		surface.DrawRect(0, 0, self:GetWide(), 20)
		end
		self.threatLabel.Paint = function(w,h)
		-- surface.SetDrawColor(Color(121, 107, 72, 200))
		-- surface.DrawRect(0, 0, self:GetWide()	, 20)
			if self.threatLabel:GetText()==" ANTI-CITIZEN ONE" then
				surface.SetDrawColor(Color(150,0,0, self.threatLabel.display))
				surface.DrawRect(0, 0, self:GetWide(), 20)
			elseif self.threatLabel:GetText()==" DEAD" then
				surface.SetDrawColor(Color(150,0,0, self.threatLabel.display))
				surface.DrawRect(0, 0, self:GetWide(), 20)
			elseif string.find( self.threatLabel:GetText(), "C17.CCA." ) then
				surface.SetDrawColor(Color(0,0,150, self.threatLabel.display))
				surface.DrawRect(0, 0, self:GetWide(), 20)
			elseif self.threatLabel:GetText() == " COMPLETED MAP" then
				surface.SetDrawColor(Color(170,160,120, self.threatLabel.display))
				surface.DrawRect(0, 0, self:GetWide(), 20)
			else
				surface.SetDrawColor(Color(150,140,100, self.threatLabel.display))
				surface.DrawRect(0, 0, self:GetWide(), 20)
			end
		end
	end
	
	-- if self.pl:IsValid() && self.pl:GetFriendStatus() == "friend" then
		-- surface.SetTexture(FRIEND_INDICATOR)
		-- surface.DrawTexturedRect(0, 0, 64, 64) 
	-- end
	
	
	
end


// Does the actual layout
function PANEL:PerformLayout()
	//self.avatarImage:SetPos(25, 1)
	//self.avatarImage:SetSize(32, 32)
	
	-- self.nameLabel:SizeToContents()
	self.nameLabel:SetPos(10, 10)
	self.nameLabel:SetSize(self:GetWide()- 380,20)
	
	-- self.permaLabel:SizeToContents()
	self.permaLabel:SetSize(70,20)
	self.permaLabel:SetPos(self:GetWide() - self.permaLabel:GetWide() - 295	, 10)
	
	-- self.scoreLabel:SizeToContents()
	self.scoreLabel:SetSize(30,20)
	self.scoreLabel:SetPos(self:GetWide() - self.scoreLabel:GetWide() - 260, 10)
	
	-- self.levelLabel:SizeToContents()
	self.levelLabel:SetSize(30,20)
	self.levelLabel:SetPos(self:GetWide() - self.levelLabel:GetWide() - 225, 10)
	
	-- self.deathsLabel:SizeToContents()
	self.deathsLabel:SetSize(30,20)
	self.deathsLabel:SetPos(self:GetWide() - self.deathsLabel:GetWide() - 190, 10)
	
	-- self.pingLabel:SizeToContents()
	self.pingLabel:SetSize(30,20)
	self.pingLabel:SetPos(self:GetWide() - self.pingLabel:GetWide() - 155, 10)
	
	-- self.threatLabel:SizeToContents()
	self.threatLabel:SetSize(150,20)
	self.threatLabel:SetPos(self:GetWide() - self.threatLabel:GetWide(), 10)
	
end


// Sets the player in question
function PANEL:SetPlayer(pl)
	self.pl = pl
	//self.avatarImage:SetPlayer(pl)
end

NUMBER_TO_STRING={}
NUMBER_TO_STRING[1]="ONE"
NUMBER_TO_STRING[2]="TWO"
NUMBER_TO_STRING[3]="THREE"
NUMBER_TO_STRING[4]="FOUR"
NUMBER_TO_STRING[5]="FIVE"
NUMBER_TO_STRING[6]="SIX"
NUMBER_TO_STRING[7]="SEVEN"
NUMBER_TO_STRING[8]="EIGHT"
NUMBER_TO_STRING[9]="NINE"
NUMBER_TO_STRING[10]="TEN"
NUMBER_TO_STRING[11]="ELEVEN"
NUMBER_TO_STRING[12]="TWELVE"
NUMBER_TO_STRING[13]="THIRTHTEEN"
NUMBER_TO_STRING[14]="FOURTEEN"
NUMBER_TO_STRING[15]="FIFTHTEEN"
NUMBER_TO_STRING[16]="SIXTEEN"
// Updates the scoreboard
function PANEL:UpdatePlayerRow()
	self.nameLabel:SetText(" "..self.pl:Name())
	if !game.SinglePlayer() && table.HasValue(BETA_TESTERS, self.pl:SteamID()) then
		-- self.nameLabel:SetColor(Color(200, 0, 255))
	end
	
	if self.pl:Team() != TEAM_ALIVE then
		-- self.statusLabel:SetText(team.GetName(self.pl:Team()))
	else
		-- self.statusLabel:SetText("")
	end
	
	if (self.pl:Team() == TEAM_ALIVE || self.pl:Team() == TEAM_COMPLETED_MAP) then
		//self.healthLabel:SetText(self.pl:GetCLevel())
	else
		//self.healthLabel:SetText("N/A")
	end
	
	self.scoreLabel:SetText(" "..self.pl:Frags())
	self.levelLabel:SetText(" "..self.pl:GetCLevel())
	self.permaLabel:SetText(" "..self.pl:GetPerma())
	
	self.deathsLabel:SetText(" "..self.pl:Deaths())
	
	self.pingLabel:SetText(" "..self.pl:Ping())
	for i = 1,game.MaxPlayers()
	do 
		if player.GetByID(i) then
			if player.GetByID(i) == self.pl then
				if self.pl:Team()==2 then
					self.threatLabel:SetText(" COMPLETED MAP")
				elseif self.pl:Team()==3 or self.pl:Team()==6 then
					self.threatLabel:SetText(" DEAD")
				elseif self.pl:Team()==5 and !string.find( self.threatLabel:GetText(), "C17.CCA." ) then
					self.threatLabel:SetText(" C17.CCA.".. tostring(math.random(1001,9999)))
				elseif self.pl:Team() == 1 then
					self.threatLabel:SetText(" ANTI-CITIZEN "..NUMBER_TO_STRING[i])
				end
				
			end
		end
	end
	
	
	self:InvalidateLayout()
end


// Register our scoreboard element
vgui.Register("scoreboard_playerrow", PANEL, "Panel")