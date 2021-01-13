POWERSTAT = POWERSTAT or {}
POWERSTAT.ID = {}
POWERSTAT.ID["LFG"] = #POWERSTAT.ID + 1
POWERSTAT.ID["HP"] = #POWERSTAT.ID + 1
POWERSTAT.ID["LUCK"] = #POWERSTAT.ID + 1
POWERSTAT.STAT = {
[1] = 0, -- LFG
[2] = 0, -- HP
[3] = 0, -- LUCK
--LFG = 0,
}
POWERSTAT.TEXT = {}
POWERSTAT.TEXT[1] = "LifeRegen:"
POWERSTAT.TEXT[2] = "Health:"
POWERSTAT.TEXT[3] = "Luck:"
POWERSTAT.TEXTENTRY = POWERSTAT.TEXTENTRY or {}
POWERSTAT.BONUSTEXT = {}
POWERSTAT.CALCTEXT = {}
POWERSTAT.CALCTEXT[1] = 1
POWERSTAT.CALCTEXT[2] = 15
POWERSTAT.CALCTEXT[3] = 0.1
POWERSTAT.BONUSTEXT[1] = " /sec"
POWERSTAT.BONUSTEXT[2] = " HP"
POWERSTAT.BONUSTEXT[3] = " %"


function POWERSTAT:UpdatePointsText()
	self.pointstext:SetText( "Points: "..self.maxvalue.."/"..self.pointsleft )
end

function POWERSTAT:PointsLeftCount(id)
	local number = 0
	-- PrintTable(self.STAT)
	for i=1, #self.STAT do
		-- print(i,self.STAT[i])
		number = number + self.STAT[i]
	
	end
	self.pointsleft = self.maxvalue - number
	POWERSTAT:UpdatePointsText()
	-- self.hpcanuse = self.
end
function POWERSTAT:TextEntryChange(id)
	self.TEXTENTRY[id]:SetText( tostring(self.CALCTEXT[id] * self.STAT[id]).. self.BONUSTEXT[id] )
	POWERSTAT:PointsLeftCount(id)
end
function POWERSTAT:AllPointsSpent()
	local number = 0
	for i=1, #self.STAT do
		number = number + self.STAT[i]
	end
	return number
end

function POWERSTAT:Increase(id,num)
	local count = 1
	if num and isnumber(num) and num >= 10 then
		count = num
	end
	if self:AllPointsSpent() + count > self.maxvalue then
		local count = (-self:AllPointsSpent() + self.maxvalue)
		-- print(self:AllPointsSpent(),self.maxvalue,count)
		-- count = self.STAT[id]
		self.STAT[id] = count + self.STAT[id]
	else
		
		self.STAT[id] = self.STAT[id] + count
		if self.STAT[1] > 100 then
			self.STAT[1] = 100
		end
		if self.STAT[3] > 100 then
			self.STAT[3] = 100
		end
	end
	POWERSTAT:TextEntryChange(id)
	
end
function POWERSTAT:Decrease(id,num)
	local count = 1
	if num and isnumber(num) and num >= 10 then
		count = num
	end
	if self.STAT[id] - count <= 0 then
		self.STAT[id] = 0
	else
	self.STAT[id] = self.STAT[id] - count
	end
	POWERSTAT:TextEntryChange(id)
end



function POWERSTAT:SetUpPanels(id,num)
	local id = id or -1
	if id < 1 then return end
	local text = vgui.Create( "DLabel", self.frame )
	text:SetPos( 10, 75 + num)
	text:SetText( self.TEXT[id] )
	text:SetSize(100,30)
	
	
	self.TEXTENTRY[id] = vgui.Create( "DTextEntry", self.frame ) -- create the form as a child of frame
	self.TEXTENTRY[id]:SetPos(70, 75 + num)
	self.TEXTENTRY[id]:SetSize( 62, 30 )
	self.TEXTENTRY[id]:SetText( tostring(self.CALCTEXT[id] * self.STAT[id]).. self.BONUSTEXT[id] )
	self.TEXTENTRY[id].AllowInput = function( self, stringValue )
		return true
	end

	local DermaButton = vgui.Create( "DButton", self.frame )
	DermaButton:SetText( "+" )
	DermaButton:SetPos( 140, 75 + num )
	DermaButton:SetSize( 30, 30 )
	function DermaButton:DoClick()
		POWERSTAT:Increase(id)
	end
	
	local DermaButton = vgui.Create( "DButton", self.frame )
	DermaButton:SetText( "+10" )
	DermaButton:SetPos( 175, 75+ num )
	DermaButton:SetSize( 30, 30 )
	function DermaButton:DoClick()
		POWERSTAT:Increase(id,10)
	end
	
	local DermaButton = vgui.Create( "DButton", self.frame )
	DermaButton:SetText( "+100" )
	DermaButton:SetPos( 210, 75+ num )
	DermaButton:SetSize( 30, 30 )
	function DermaButton:DoClick()
		POWERSTAT:Increase(id,100)
	end
	
	local DermaButton = vgui.Create( "DButton", self.frame )
	DermaButton:SetText( "-" )
	DermaButton:SetPos( 245, 75+ num )
	DermaButton:SetSize( 30, 30 )
	function DermaButton:DoClick()
		POWERSTAT:Decrease(id)
	end
	
	local DermaButton = vgui.Create( "DButton", self.frame )
	DermaButton:SetText( "-10" )
	DermaButton:SetPos( 280, 75+ num )
	DermaButton:SetSize( 30, 30 )
	function DermaButton:DoClick()
		POWERSTAT:Decrease(id,10)
	end
	
	local DermaButton = vgui.Create( "DButton", self.frame )
	DermaButton:SetText( "-100" )
	DermaButton:SetPos( 315, 75+ num )
	DermaButton:SetSize( 30, 30 )
	function DermaButton:DoClick()
		POWERSTAT:Decrease(id,100)
	end
end

function POWERSTAT:SendData()
	net.Start("HL2C.POWERSTAT.RECEIVE.DATA")
		net.WriteTable(self.STAT)
	net.SendToServer()
end

function POWERSTAT:SetUpPoints()
	self.maxvalue = LocalPlayer():GetPLevel()
	self.STAT[1] = LocalPlayer():GetNWInt("PSTAT_"..tostring(1))
	self.STAT[2] = LocalPlayer():GetNWInt("PSTAT_"..tostring(2))
	self.STAT[3] = LocalPlayer():GetNWInt("PSTAT_"..tostring(3))
	
	self.max_lfg = 100
	self.max_luck = 100
	if self.STAT[1] > 100 then
		self.STAT[1] = 100
	end
	if self.STAT[3] > 100 then
		self.STAT[3] = 100
	end
	self.pointsleft = self.maxvalue - self:AllPointsSpent()
	-- self.lfgcanuse = self.maxvalue
	-- self.hpcanuse = self.maxvalue
end

function POWERSTAT:Init()
	
	self:SetUpPoints()
	
	
	self.frame = vgui.Create( 'DFrame' ) // Create a panel to parent it to
	self.frame:SetSize( 400, 300 ) // Set the size
	self.frame:Center() // Center it
	self.frame:MakePopup() // Make it a popup
	self.frame:SetTitle("Power Stat")

	self.pointstext = vgui.Create( "DLabel", self.frame )
	self.pointstext:SetPos( 20, 40 )
	self.pointstext:SetText( "Points: "..self.maxvalue.."/"..self.pointsleft	)
	self.pointstext:SetSize(100,30)
	
	self:SetUpPanels(1,0)
	self:SetUpPanels(2,30)
	self:SetUpPanels(3,60)
	
	local button = vgui.Create( "DButton", self.frame )
	button:SetText( "Save" )
	button:SetPos( self.frame:GetWide()-70, 30 )
	button:SetSize( 60, 30 )
	function button:DoClick()
		POWERSTAT:SendData()
	end
end


concommand.Add("hl2c_powerstat", function()
	if LocalPlayer():GetCLevel() >= 100 then
		POWERSTAT:Init()
	end
end)