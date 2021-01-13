Hl2c.TargetBar = Hl2c.TargetBar or {}

TARGETBAR = TARGETBAR or Hl2c.TargetBar
TARGETBAR.List = TARGETBAR.List or {}
TARGETBAR.PANEL = TARGETBAR.PANEL or {}
TARGETBAR.HP = 0
TARGETBAR.HPMAX = 0
TARGETBAR.NAME = "NONAME"
TARGETBAR.INDEX = 0

function TARGETBAR:Think()
	self:TimerExist()
	if self and self.panel and isnumber(self.panel["hp"]) then
		-- local hp = self.panel["hp"]
		if self.panel["hp"] > 0 then
		
		self.panel["hpperc"] = math.Clamp(self.panel["hpperc"] + (((self.panel["hp"]/self.panel["maxhp"])-self.panel["hpperc"]) * 20 * FrameTime()), 0, 4)
		-- self.panel["hpperc"] = Lerp( FrameTime(), 0, self.panel["hp"]/self.panel["maxhp"]*100 )
		-- self.panel["hpperc"] = math.Clamp(self.panel["hp"], 0,self.panel:GetWide()-1 )
		end
		function self.panel:Paint(w,h)
			-- self["hpperc"]
			if LocalPlayer():Team() == TEAM_ALIVE or LocalPlayer():Team() == TEAM_COMBINE then
			surface.SetDrawColor(160, 0, 0, 175)
			surface.DrawRect(0, 0, w, h)
			surface.SetDrawColor(50, 150, 0, 175)
			-- surface.DrawRect(0, 0, self["hpperc"], h)
			surface.DrawRect(0, 0, w*self["hpperc"], h)
			surface.SetDrawColor(0, 0, 0, 255)
			surface.DrawOutlinedRect(0, 0, w, h)
			surface.SetFont("BudgetLabel")
			local w2,h2 = surface.GetTextSize(self["name"])
			surface.SetTextColor(color_white)
			surface.SetTextPos(w/2 - (w2/2),h/2 - (h2/2))
			surface.DrawText(self["name"])
			end
		end
	end
	if self.panel["index"] == 0 then
	
	elseif self.panel["cur"] + 5 - CurTime() < 0 then
		self.panel["cur"] = 0
		self.panel["index"] = 0
		-- self.panel["hp"] = 0
		-- self.panel["hpperc"] = 0
		self:Close(true)
	end
	
end
function TARGETBAR:Init()
	self.panel = vgui.Create("DPanel")
	self.panel:SetSize(200,20)
	self.panel:SetPos( ScrW(), ScrH() )
	self.panel["index"] = 0
	self.panel["name"] = "UNNAMED"
	self.panel["hp"] = 0
	self.panel["maxhp"] = 0
	self.panel["cur"] = 0
	self.panel["hpperc"] = 0
	for i=0,2 do
	
		-- print(i*30)
		
		self.PANEL[i] = vgui.Create("DPanel")
		self.PANEL[i]:SetSize(200,20 + i*30)
		self.PANEL[i]:SetPos( ScrW(), ScrH() )
		self.PANEL[i]["index"] = 0
		self.PANEL[i]["name"] = "UNNAMED"
		self.PANEL[i]["hp"] = 0
		self.PANEL[i]["maxhp"] = 0
		self.PANEL[i]["cur"] = 0
		self.PANEL[i]["hpperc"] = 0
	end
	self:TimerExist()
end

function TARGETBAR:EnoughSpace()
	if self.List and #self.List >= 3 then
		return false
	end
	
	return true
end

function TARGETBAR:IndexExist(index)
	for k, v in pairs(self.List) do
		if v["id"] == index then
			return true
		end
	end 
	return false
end

function TARGETBAR:Add(index,name,hp,hpmax)
	if self:EnoughSpace() or self:IndexExist(index) then return end 

	table.insert(self.List,self.bar)
end
function TARGETBAR:Remove(index)
	for k, v in pairs(self.List) do
		if v["id"] == index then
			table.RemoveByValue( self.List, v )
		end
	end
end

function TARGETBAR:Update(index,hp,hpmax,class)
	
	if self.panel["index"] == index then
		self.panel["index"] = index
		self.panel["hp"] = hp
		self.panel["maxhp"] = hpmax
		self.panel["name"] = class
	end
end
function TARGETBAR:Sort()

end

function TARGETBAR:Timer()
	timer.Create("TargetBar_Think_Timer", 0.1, 0, function() self:Think() end )
end
function TARGETBAR:TimerExist()
	if timer.Exists("TargetBar_Think_Timer") then 
	else
		self:Timer()
	end
end
function TARGETBAR:Load(um)
	-- print("Called TARGETBAR")
	if self.panel then else self:Init() end
end

function TARGETBAR:Called(um)
	local index = um:ReadShort()
	local hp = um:ReadShort()
	local hpmax = um:ReadShort()
	local class = um:ReadString()
	self:Update(index,name,hp,hpmax,class)
end

function TARGETBAR:Open(um)
	-- print("Called TARGETBAR")
	if self.panel then else self:Load() end
	local index = um:ReadShort()
	local hp = um:ReadShort()
	local hpmax = um:ReadShort()
	local class = um:ReadString()
	local cur = um:ReadLong()
	-- print(self.closing)
	if self.closing == true then return end
	-- print(index,hp,hpmax,class,cur,self.panel["index"])
	self.closing = false
	
	if self.panel["index"] == index then
		self.panel["index"] = index
		self.panel["hp"] = hp
		self.panel["maxhp"] = hpmax
		self.panel["name"] = class
		self.panel["cur"] = cur
	elseif self.panel["index"] == 0 then
		self.panel["index"] = index
		self.panel["hp"] = hp
		self.panel["maxhp"] = hpmax
		self.panel["name"] = class
		self.panel["cur"] = cur
		
		self.Delay = 7 + CurTime()
		-- self:Destroy()
		-- self:Initialize()
		local function inQuad( fraction, beginning, change )
			return change * ( fraction ^ 2 ) + beginning
		end

		local anim = Derma_Anim( "EaseInQuad", self.panel, function( pnl, anim, delta, data )
			pnl:SetPos( inQuad( delta, ScrW(), -(self.panel:GetWide() + 50) ),ScrH()/2  ) -- Change the X coordinate from 200 to 200+600
		end )
		anim:Start( 1 ) -- Animate for two seconds
		self.panel.Think = function( self )
			if anim:Active() then
				anim:Run()
			end
		end
	end
end

function TARGETBAR:Open_Net(index,hp,hpmax,class,cur)
	-- print("Called TARGETBAR")
	if self.panel then else self:Load() end
	local index = index
	local hp = hp
	local hpmax = hpmax
	local class = class
	local cur = cur
	-- print(cur)
	-- print(self.closing)
	if self.closing == true then return end
	-- print(index,hp,hpmax,class,cur,self.panel["index"])
	self.closing = false
	
	if self.panel["index"] == index then
		self.panel["index"] = index
		self.panel["hp"] = hp
		self.panel["maxhp"] = hpmax
		self.panel["name"] = class
		self.panel["cur"] = cur
	elseif self.panel["index"] == 0 then
		self.panel["index"] = index
		self.panel["hp"] = hp
		self.panel["maxhp"] = hpmax
		self.panel["name"] = class
		self.panel["cur"] = cur
		
		self.Delay = 7 + CurTime()
		-- self:Destroy()
		-- self:Initialize()
		local function inQuad( fraction, beginning, change )
			return change * ( fraction ^ 2 ) + beginning
		end

		local anim = Derma_Anim( "EaseInQuad", self.panel, function( pnl, anim, delta, data )
			pnl:SetPos( inQuad( delta, ScrW(), -(self.panel:GetWide() + 50) ),ScrH()/2  ) -- Change the X coordinate from 200 to 200+600
		end )
		anim:Start( 1 ) -- Animate for two seconds
		self.panel.Think = function( self )
			if anim:Active() then
				anim:Run()
			end
		end
	end
end

function TARGETBAR:Close(um)
	-- print("Called TARGETBAR")
	if self.panel then else self:Load() end
	self.Delay = 7 + CurTime()
	if um != true then
	local index = um:ReadShort()
	end
	
	-- self:Destroy()
	-- self:Initialize()
	if isnumber(index) and index == self.panel["index"] then
	elseif um == true then
	elseif self.panel["index"] == 0 then
		return
	end
	self.panel["index"] = 0
	if self.closing == true then return end
	self.closing = true 
	timer.Simple(1.1,function() self.closing = false end)
	local function inQuad( fraction, beginning, change )
		return change * ( fraction ^ 2 ) + beginning
	end

	local anim = Derma_Anim( "EaseInQuad", self.panel, function( pnl, anim, delta, data )
		pnl:SetPos( inQuad( delta, ScrW()-self.panel:GetWide() - 50, self.panel:GetWide() + 50 ),ScrH()/2 ) -- Change the X coordinate from 200 to 200+600
	end )
	anim:Start( 1 ) -- Animate for two seconds

	self.panel.Think = function( self )
		if anim:Active() then
			anim:Run()
		end
	end
end

net.Receive("Hl2c.UpdateTargetBar",function(len)  
	local index = net.ReadInt( 10 )
	local hp = net.ReadInt( 15 )
	local hpmax = net.ReadInt( 15 )
	local class = net.ReadString()
	-- print(index,hp,hpmax,class)
	TARGETBAR:Update(index,hp,hpmax,class)
end)
net.Receive("Hl2c.TargetBar.OnHit",function(len)  
	local index = net.ReadInt( 10 )
	local hp = net.ReadInt( 15 )
	local hpmax = net.ReadInt( 15 )
	local class = net.ReadString()
	local cur = net.ReadDouble()
	-- print(index,hp,hpmax,class,cur)
	TARGETBAR:Open_Net(index,hp,hpmax,class,cur)
end)

usermessage.Hook("Hl2c.OnHit.NPC.UpdateBar", function(um) TARGETBAR:Load(um) end)
usermessage.Hook("Hl2c.OnHit.NPC.TargetBarUpdate", function(um) TARGETBAR:Called(um) end)

-- usermessage.Hook("Hl2c.OnHit.NPC.Open", function(um) TARGETBAR:Open(um) end)
usermessage.Hook("Hl2c.OnHit.NPC.Close", function(um) TARGETBAR:Close(um) end)