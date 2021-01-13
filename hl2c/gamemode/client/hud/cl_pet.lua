--[[
PET HUD FROM LEIFTIGER
]]

local sSetTextPos = surface.SetTextPos
local sDrawText = surface.DrawText
local cPushModelMatrix = cam.PushModelMatrix
local cPopModelMatrix = cam.PopModelMatrix
 
local mat = Matrix()
local matAng = Angle(0, 0, 0)
local matTrans = Vector(0, 0, 0)
local matScale = Vector(0, 0, 0)
local function drawSpecialText(txt, posX, posY, scaleX, scaleY, ang)
	matAng.y = ang
	mat:SetAngles(matAng)
	matTrans.x = posX
	matTrans.y = posY
	mat:SetTranslation(matTrans)
	matScale.x = scaleX
	matScale.y = scaleY
	mat:Scale(matScale)
	sSetTextPos(0, 0)
	cPushModelMatrix(mat)
	sDrawText(txt)
	cPopModelMatrix()
end

local PET = {}
PET.HealthPerc = 0
PET.XPPerc = 0

net.Receive("HL2C.PET.HUD.UPDATE",function()
	local tbl = net.ReadTable()
	PET.Notification = {tbl.text, tbl.cur}

	local hp, hpmax = tbl.hp, tbl.hpmax
	PET.Health = hp
	PET.MaxHealth = hpmax
	
	local xp, xpmax = tbl.xp, tbl.xpmax
	PET.XP = xp
	PET.MaxXP = xpmax
end)

function PET.DrawHUD()
	
	if PET.Notification then
		if PET.Notification[2] > CurTime() then
			-- draw.DrawText(PET.Notification[1], "HUDNumber", ScrW()/2, ScrH()/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		else
			PET.Health = 0
			PET.MaxHealth = 0
			PET.XP = 0
			PET.MaxXP = 0
			PET.HealthPerc = 0
			PET.XPPerc = 0
			return
		end
	end
	
	if PET.Health && PET.MaxHealth && PET.XP && PET.MaxXP then
		PET.HealthPerc = math.Clamp(PET.HealthPerc + (((PET.Health/PET.MaxHealth)-PET.HealthPerc) * 5 * FrameTime()), 0, 4)
		PET.XPPerc = PET.XPPerc + (((PET.XP/PET.MaxXP)-PET.XPPerc) * 5 * FrameTime())
		local h = ScrH()/5
		surface.SetDrawColor(160, 0, 0, 175)
		surface.DrawRect(ScrW()*0.01, (ScrH()/2)-(h/2), 20, (h*(1-PET.HealthPerc)))
		surface.SetDrawColor(50, 220, 0, 175)
		surface.DrawRect(ScrW()*0.01, (ScrH()/2)-(h/2)+(h*(1-PET.HealthPerc)), 20, h*PET.HealthPerc)
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawOutlinedRect(ScrW()*0.01, (ScrH()/2)-(h/2), 20, h)
		
		
		surface.SetFont("BudgetLabel")
		local w,h2 = surface.GetTextSize(PET.Health.." / "..PET.MaxHealth)
		surface.SetTextColor(color_white)
		drawSpecialText(PET.Health.." / "..PET.MaxHealth, (ScrW()*0.01)+2, (ScrH()/2)+(w/2), 1, 1, -90)
		
		if PET.MaxXP != 0 and PET.MaxXP > 0 then -- somehow it got sent anyway!
			if PET.XPPerc >= 1 then
				local f = 0.5+(0.5*math.sin(math.pi*2*CurTime()*0.5)) -- 0.5+(0.5*math.sin(math.pi*2*CurTime()*fades_per_second))
				local c1 = Color(70, 200, 233, 175)
				local c2 = Color(177, 232, 246, 200)
				local color = Color((c1.r*f) + (c2.r*(1-f)), (c1.g*f) + (c2.g*(1-f)), (c1.b*f) + (c2.b*(1-f)), (c1.a*f) + (c2.a*(1-f)))
				
				surface.SetDrawColor(color)
				surface.DrawRect((ScrW()*0.01)+25, (ScrH()/2)-(h/2), 20, h)
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawOutlinedRect((ScrW()*0.01)+25, (ScrH()/2)-(h/2), 20, h)
			else
				surface.SetDrawColor(7, 147, 182, 175)
				surface.DrawRect((ScrW()*0.01)+25, (ScrH()/2)-(h/2), 20, (h*(1-PET.XPPerc)))
				surface.SetDrawColor(70, 220, 233, 175)
				surface.DrawRect((ScrW()*0.01)+25, (ScrH()/2)-(h/2)+(h*(1-PET.XPPerc)), 20, h*PET.XPPerc)
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawOutlinedRect((ScrW()*0.01)+25, (ScrH()/2)-(h/2), 20, h)
			end
			surface.SetFont("BudgetLabel")
			local w,h2 = surface.GetTextSize(math.Clamp(PET.XP, 0, PET.MaxXP).." / "..PET.MaxXP)
			surface.SetTextColor(color_white)
			drawSpecialText(math.Clamp(PET.XP, 0, PET.MaxXP).." / "..PET.MaxXP, (ScrW()*0.01)+27, (ScrH()/2)+(w/2), 1, 1, -90)
		end
		
		if PET.Duel then
			for k,v in pairs(PET.Duel) do
				PET.Duel[k][5] = v[5] + (((v[2]/v[3])-v[5]) * 5 * FrameTime())
				local w = ScrW()/5
				surface.SetDrawColor(160, 0, 0, 175)
				surface.DrawRect(ScrW()*0.01+((k-1)*(w+10)), ScrH()*0.05, w*(1-v[5]), 15)
				surface.SetDrawColor(50, 150, 0, 175)
				surface.DrawRect(ScrW()*0.01+((k-1)*(w+10))+(w*(1-v[5])), ScrH()*0.05, w*v[5], 15)
				surface.SetDrawColor(0, 0, 0, 255)
				surface.DrawOutlinedRect(ScrW()*0.01+((k-1)*(w+10)), ScrH()*0.05, w, 15)
				draw.DrawText(v[1], "TargetIDSmall", ScrW()*0.01+((k-1)*(w)+10), (ScrH()*0.05)-15, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT)
			end
			for k,v in pairs(PET.Duel) do
				if v[2] < 1 then
					table.remove(PET.Duel, k)
					break
				end
			end
		end
		if PET.DuelReady then
			if PET.DuelReady > CurTime() then
				draw.DrawText("Get Ready!", "HUDNumbers", ScrW()/2, ScrH()/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
			else
				draw.DrawText("FIGHT", "HUDNumbers", ScrW()/2, ScrH()/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
				if CurTime() > PET.DuelReady+1 then
					PET.DuelReady = nil
				end
			end
		end
	end
	if PET.Notification then
		if PET.Notification[2] > CurTime() then
			-- draw.DrawText(PET.Notification[1], "HUDNumbers", ScrW()/2, ScrH()/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER)
		end
	end
end
hook.Add("HUDPaint", "PET.DrawHUD", PET.DrawHUD)

function PET.Note(um)
	PET.Notification = {um:ReadString(), um:ReadLong()}
end
usermessage.Hook("LA.PET.Notification", PET.Note)

function PET.HealthUpdate(um)
	local hp, hpmax = um:ReadShort(), um:ReadShort()
	PET.Health = hp
	PET.MaxHealth = hpmax
end
usermessage.Hook("LA.PET.HealthUpdate", PET.HealthUpdate)

function PET.XPUpdate(um)
	local xp, xpmax = um:ReadLong(), um:ReadLong()
	PET.XP = xp
	PET.MaxXP = xpmax
end
usermessage.Hook("LA.PET.XPUpdate", PET.XPUpdate)

function PET.DuelUpdate(um)
	if !PET.Duel then PET.Duel = {} end
	local b = false
	local entindex = um:ReadShort()
	local health = um:ReadShort()
	local maxhealth = um:ReadShort()
	for k,v in pairs(PET.Duel) do
		if v[4] == entindex then
			b = k
		end
	end
	if b then
		PET.Duel[b][2] = health
		PET.Duel[b][3] = maxhealth
		if health < 0 then
			table.remove(PET.Duel, b)
		end
	else
		local name = NPC_CUSTOM_NAMES[entindex] or "UNKNOWN DUELIST"
		table.insert(PET.Duel, {name, health, maxhealth, entindex, 0})
	end
end
usermessage.Hook("LA.PET.DuelUpdate", PET.DuelUpdate)

function PET.DuelStart(um)
	PET.DuelReady = um:ReadLong()
end
usermessage.Hook("LA.PET.DuelStart", PET.DuelStart)