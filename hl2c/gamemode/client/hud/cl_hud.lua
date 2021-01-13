surface.CreateFont( "HL2C_HUDFONT_HL2", {
	font = "HalfLife2",
	extended = false,
	size = 67,
	weight = 10,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

usermessage.Hook("Updateflashenergy",function(um)
	flashenergy = um:ReadShort()
end)
function CustomIceHud()
	if LocalPlayer() != nil and LocalPlayer() != NULL and LocalPlayer():IsSuitEquipped() != true then return end
	-- local flashenergy = 100
	local ceil = math.ceil
	local i = 0
	local limit = 15
	
	local move_y_offset = ScreenScale(5)
	if move_y_offset > 10 then 
		move_y_offset = 10
	end
	-- print(move_y_offset)
	surface.SetFont( "HL2C_HUDFONT_HL2" )
	local x,y = surface.GetTextSize( "©" )
	local txt_pos_x, txt_pos_y = ScrW()/2+x/3.5, ScrH()-y - move_y_offset
	local box_x,box_y = ScrW()/2-(ScreenScale(12)/2), ScrH() -y/1.5 - move_y_offset
	local move_x_dots = ScreenScale(5)
	-- local ceil_x, ceil_y = ceil( ScrW() * ScreenScale(0.175) ) + ceil( ScrW() *  ScreenScale(0.0022) * (i/ ScreenScale(0.5)) ), ceil( ScrH() *  ScreenScale(0.479))
	-- surface.SetTextColor( 255, 208, 64, 255 )
	-- surface.SetTextColor( 220, 190, 0, 160 )
	draw.RoundedBox( 4, box_x,box_y, 80+ScreenScale(12), 40, Color(0,0,0,70) )
	
	
	-- print(ScrW(),ScrH())
	-- print(textpos)
	-- surface.SetDrawColor( 255, 230, 0, 255 )
	if LocalPlayer():FlashlightIsOn() then
	if flashenergy <= limit then
	surface.SetDrawColor( 220, 50, 0, 160 )
	else
	surface.SetDrawColor( 220, 190, 0, 160 )
	end
	for i = 0, 11 do
		local ceil_x, ceil_y = ceil( ScrW()/2 +x/move_x_dots) + ceil( ScrW() *  ScreenScale(0.0022) * (i/ ScreenScale(0.5)) ), ceil( ScrH() -y/4) - move_y_offset
		surface.DrawRect( ceil_x, ceil_y , 4, 4 )
	end
	if flashenergy <= limit then 
	surface.SetDrawColor( 255, 50, 0, 255 )
	else
	surface.SetDrawColor( 255, 230, 0, 255 )
	end
	if flashenergy < 100 then
		for i = 0, 11 do
			--surface.DrawRect( ceil( ScrW() * 0.029 ) + ceil( ScrW() * 0.012 * i ), ceil( ScrH() * 0.8723 ), sw, sh )
			if i == 0 and flashenergy > 2 then
				--surface.SetDrawColor( 255, 255, 0, 200 )
				local ceil_x, ceil_y = ceil( ScrW()/2 +x/move_x_dots) + ceil( ScrW() *  ScreenScale(0.0022) * (i/ ScreenScale(0.5)) ), ceil( ScrH() -y/4) - move_y_offset
				-- surface.DrawRect( ceil( ScrW() * 0.029 ), ceil( ScrH() * 0.8723 ), sw, sh )
				surface.DrawRect( ceil_x, ceil_y , 4, 4 )
			elseif i != 0 and flashenergy > 100 * ( 0.085 * i ) then
				
				local ceil_x, ceil_y = ceil( ScrW()/2 +x/ScreenScale(5)) + ceil( ScrW() *  ScreenScale(0.0022) * (i/ ScreenScale(0.5)) ), ceil( ScrH() -y/4) - move_y_offset
				surface.DrawRect( ceil_x, ceil_y, 4, 4 )
			end
			
		end
	end
	end
	if LocalPlayer():FlashlightIsOn() then
	if flashenergy <= limit then
	surface.SetTextColor( 255, 50, 0, 255 )
	else
	surface.SetTextColor( 255, 230, 0, 255 )
	end
	
	surface.SetTextPos( txt_pos_x, txt_pos_y )
	surface.DrawText( "©" )
	else
	surface.SetTextPos( txt_pos_x, txt_pos_y )
	
	if flashenergy <= limit then
	surface.SetTextColor( 220, 50, 0, 160 )
	else
	surface.SetTextColor( 220, 190, 0, 160 )
	end
	surface.DrawText( "®" )
	end


end

hook.Add("HUDPaint", "CustomIceHud", CustomIceHud)

function XP_BAR_SHOW()
	LocalPlayer().showxpbar = true
end
function XP_BAR_HIDE()
	LocalPlayer().showxpbar = false
end
hook.Remove( "HUDPaint", "HUDPaint_DrawABox" )
function Hl2c.DrawXPBar()
	if LocalPlayer():GetXP() == nil then return end
	if LocalPlayer():GetCLevel() == nil then return end

	if (LocalPlayer():GetXP()) and isnumber(LocalPlayer():GetCLevel()) and LocalPlayer().showxpbar == true then
	
		local barLength = ( (LocalPlayer():GetXP() -LevelCurve[LocalPlayer():GetCLevel()])/LevelCurve[LocalPlayer():GetCLevel() +1] ) * ScrW()
	
		draw.RoundedBox( 0, 0, 0, ScrW(), 20, Color(255,150,0,100) )
		if LocalPlayer():GetCLevel() < 30 then
		draw.RoundedBox( 0, 0, 0, barLength, 20, Color(255,150,0,200) )
		draw.DrawText( tostring(LocalPlayer():GetXP()).." / "..tostring(LevelCurve[LocalPlayer():GetCLevel() +1]), "BudgetLabel", ScrW()*0.5, 4, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		
		else
		draw.RoundedBox( 0, 0, 0, ScrW(), 20, Color(255,150,0,200) )
		draw.DrawText( "Max Level", "BudgetLabel", ScrW()*0.5, 4, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER )
		end
		-- if LocalPlayer():GetCLevel() == 150 then
			--draw.DrawText(("         Max Level  "), "hl2cimpactxp", ScrW()/14 *0.2, ScrH() *0.02, Color(255, 255, 255, 200), 0)
		-- else
			--[[ if LocalPlayer():Alive() && LocalPlayer():IsPlayer() && LocalPlayer():IsValid() && LocalPlayer():GetXP() != nil then
			--local barLength = (LocalPlayer():GetXP() / LevelCurve[LocalPlayer():GetCLevel() +1] *150 )
			
			--local barLength = ( ( LevelCurve[LocalPlayer():GetCLevel()] ) / ( LevelCurve[LocalPlayer():GetCLevel() +1] ) * 1.5 * LocalPlayer():GetXP() )
		--draw.RoundedBox( 0, ScrW()/2 - ScrH()/2, barHeight, barLength, 15, Color( 255, 255, 255, 150 ) )
		--draw.RoundedBox( 0, ScrW()/2 - ScrH()/2, barHeight, barLength * (LocalPlayer():GetXP() / (LevelCurve[LocalPlayer():GetCLevel() +1] - LocalPlayer():GetXP()) ) , 15, Color( 205, 134, 44, 255 ) )
			// OLd no optimize on resolution
			--draw.DrawText((LocalPlayer():GetXP().." xp / "..(LevelCurve[LocalPlayer():GetCLevel() +1].." xp")), "hl2cimpactxp", ScrW()/14, ScrH()/(70), Color(255, 255, 255, 200), 1)
			// New with optimize resolution
			--draw.DrawText((LocalPlayer():GetXP().." xp / "..(LevelCurve[LocalPlayer():GetCLevel() +1].." xp")), "hl2cimpactxp", 0, ScrH()-800, Color(255, 255, 255, 200), 0)
			--if ScrW() / ScrH() > 1.24 and ScrW() / ScrH() < 1.26 then
			
			//4:3
			//1.25
			--else
			if LocalPlayer():GetPXP() and LocalPlayer():GetPLevel() and LocalPlayer():GetCLevel() >= 100 then
				barLength = (LocalPlayer():GetPXP() - PowerLevelCurve[LocalPlayer():GetPLevel()]) / (PowerLevelCurve[LocalPlayer():GetPLevel() +1] - PowerLevelCurve[LocalPlayer():GetPLevel()] ) *150 
				level = LocalPlayer():GetPLevel()
				level_title = "Power Level ".. tostring(level) ..""
			end
			surface.SetFont("hl2cimpactxp")
			local title_size_x, title_size_y = surface.GetTextSize( level_title )
			draw.DrawText(level_title, "hl2cimpactxp", ScrW()/14 *0.2 + title_size_x/2 *0.2, ScrH() *0.02, Color(255, 255, 255, 200), 0)
			
			surface.SetDrawColor( 255,255,255,200 )
			// OLD
			/*
			surface.DrawRect( ScrW()/50, ScrH()/(20) , math.Clamp(barLength,0,150), 8 )
			
			surface.SetDrawColor( 255,255,255,200 )
			surface.DrawOutlinedRect( ScrW()/55, ScrH()/(20.5), 154, 12 );
			*/
			// New
			surface.DrawRect( ScrW()/50, ScrH()*0.07 , math.Clamp(barLength,0,150), 8 )
			
			surface.SetDrawColor( 255,255,255,200 )
			surface.DrawOutlinedRect( ScrW()/55, ScrH()* 0.068, 154, 12 );
			--end -- Close Resolution
			end -- Close xp not nil]]
		--end
	end
end
hook.Add( "HUDPaint", "HUDPaint_DrawABox", Hl2c.DrawXPBar)


-- CreateClientConVar("Wallhack_Material", 0, true, false)
local WallToggle = true
local Mat = ""
-- wire1 = CreateMaterial("wire2", "VertexLitGeneric", {
		-- ["$basetexture"] = "models/wireframe",
		-- ["$model"] = "models/wireframe",
		-- ["$color"] = "[ 1.00 3.00 1.00 ]"

		-- })
		
		
-- local params = {
	-- ["$basetexture"] = "hlmv/debugmrmwireframe",
	-- ["$nodecal"] = 1,
	-- ["$model"] = 1,
	-- ["$additive"] = 1,
	-- ["$nocull"] = 1,
	-- Proxies = {
		-- TextureScroll = {
			-- texturescrollvar = "$basetexturetransform",
			-- texturescrollrate = 33.3,
			-- texturescrollangle = 60,
		-- }
	-- }
-- }
-- wire1 = CreateMaterial("wire2","VertexLitGeneric",params);
-- local mat = CreateClientConVar("wire", wire1, true, false)
hook.Remove("RenderScene", "Wallhack")
hook.Add("RenderScene", "Wallhack", function()
	
	if LocalPlayer() and LocalPlayer():GetNWString("hl2c_hat") == "hat_mask1" then
		-- WallToggle = true 
		
		-- if GetConVarNumber("Wallhack_Material") == 1 then
			-- Mat = "debug/debugportals"
		-- elseif GetConVarNumber("Wallhack_Material") == 2 then
			-- Mat = "hlmv/debugmrmwireframe"
		-- end
		-- Mat = "models/wireframe"
		Mat = "hlmv/debugmrmwireframe"
		-- Mat = "debug/debugportals"
			for k,ent in pairs(ents.GetAll()) do
		
				if ent:IsNPC() and (ent:GetClass() == "npc_sniper" or ent:GetClass() == "npc_combine_s" or ent:GetClass() == "npc_metropolice") and ent:GetMaterial() != "hlmv/debugmrmwireframe" then
					
					-- ent:SetMaterial("!wire2")	
					ent:SetMaterial "hlmv/debugmrmwireframe"
					ent.originmat = ent:GetMaterial()
					ent:SetColor( Color(20, 250, 255, 255) )
					-- print("Hahaha")
		
				elseif ent:IsWeapon() then
					-- ent:SetColor(255, 255, 255, 255)
					-- ent:SetMaterial(Mat)
		
				elseif ent:GetClass() == "drug_lab" or ent:GetClass() == "money_printer" then
					-- ent:SetColor(255, 0, 100, 50)
					-- ent:SetMaterial(Mat)
				end
		
			end
	else
		for k,ent in pairs(ents.GetAll()) do
		
			if ent:IsNPC() and (ent:GetClass() == "npc_sniper" or ent:GetClass() == "npc_combine_s" or ent:GetClass() == "npc_metropolice") and ent.originmat != nil then
				-- print("?")
				-- ent:SetMaterial("!wire2")	
				ent:SetMaterial( ent.originmat )
				ent:SetColor( Color(255, 255, 255, 255) )
				-- print("Hahaha")
	
			elseif ent:IsWeapon() then
				-- ent:SetColor(255, 255, 255, 255)
				-- ent:SetMaterial(Mat)
	
			elseif ent:GetClass() == "drug_lab" or ent:GetClass() == "money_printer" then
				-- ent:SetColor(255, 0, 100, 50)
				-- ent:SetMaterial(Mat)
			end
	
		end
	end
end)
COMBINE_OVERLAY = nil
COMBINE_OVERLAY = Material("effects/combine_binocoverlay")
	
hook.Remove("HUDPaint", "introduction")
hook.Add( "HUDPaint", "introduction", function()
	if LocalPlayer() and LocalPlayer():GetNWString("hl2c_hat") == "hat_mask1" then
	COMBINE_OVERLAY:SetFloat("$alpha", "0.4")
	COMBINE_OVERLAY:Recompute()
    surface.SetDrawColor( 255, 255, 255 )
	surface.SetMaterial(  COMBINE_OVERLAY )
	surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() )
	end
end)


--[[ 	
concommand.Add("Wallhack_Toggle", function()
    if WallToggle then
		-- surface.PlaySound("buttons/button19.wav")
	   
	   
	   -- for _, ent in pairs(ents.GetAll()) do
				  
		-- ent:SetMaterial("")						
		-- ent:SetColor(255, 255, 255, 255)
		-- end		
		
		WallToggle = false
		-- LocalPlayer():ChatPrint("Wallhack is now Off!")
		
	elseif !WallToggle then	
		-- LocalPlayer():ChatPrint("Wallhack is now On!")
		Wallhack()
		WallToggle = true		
    end

end) 


*Name: Chef Hat
 Model: models/chefhat.mdl
 Feature: Nothing(?)
 How to unlock it?: You get it by the achievement "Vorticough" (HL2)
 
*Name: Civil Protection Helmet
 Model: ???
 Feature: It has a blue overlay and (maybe) wallhacks.
 How to unlock it?: S e c r e t   A c h i e v e m e n t .
 
*Name: Headcrab Hat
 Model: models/headcrabclassic.mdl
 Feature: All headcrabs are friendly to you.
 How to unlock it?: ???
 
*Name: Lamp Shade Hat
 Model: models/props_c17/lampShade001a.mdl
 Feature: Nothing(?)
 How to unlock it?: ??? (On leif's server you only get it if you bought Hl2/EP1/EP2 and didnt play with content.)
 
*Name: Rollermine Hat
 Model: models/roller.mdl
 Feature: When someone meele attacks you they take damage.
 How to unlock it?: ???
 
*Name: Melon Hat
 Model: models/props_junk/watermelon01.mdl
 Feature: You do MUCH, MUCH more damage with crowbar.
 How to unlock it?: You get it by the achievement "The One True Freeman" (HL2)
 
*Name: Traffic Road Cone Hat
 Model: models/props_junk/TrafficCone001a.mdl
 Feature: Does Nothing(?)
 How to unlock it?: You get it by the achievement "Citizen Escort" (HL2 EP1)
 
*Name: Bucket Helmet
 Model: models/props_junk/MetalBucket01a.mdl
 Feature: When you are on fire and crouch you will stop burning.
 How to unlock it?: You get it when you reach Level 15.
 
*Name: Sawblade Hat
 Model: models/props_junk/sawblade001a.mdl
 Feature: ???
 How to unlock it?: You get it by the achievement "Zombie Chopper" (HL2)
 
*Name: Scanner Hat
 Model: models/gibs/scanner_gib05.mdl
 Feature: Does Nothing.
 How to unlock it?: You get it by the achievement "Blast from the Past" (HL2 and HL2 EP2)
 
*Name: Stalker Train Mask
 Model: models/props_combine/stalkerpod_lid.mdl
 Feature: Does Nothing(?)
 How to unlock it?: You get it by the achievement "Pacifist" (HL2 EP2)
 
*Name: Dr. Magnusson Device Hat
 Model: models/magnusson_device.mdl
 Feature: Does Nothing.
 How to unlock it?: ???
 
*Name: Gnome Hat
 Model: models/props_junk/gnome.mdl
 Feature: Where ever you die you will respawn where you died.
 How to unlock it?: You get it by the achievement "Neighborhood Watch" (HL2 EP2)
]]



local PANEL = {}
Hl2c.SquadList={}
Hl2c.SquadList[1]=nil
-- Hl2c.SquadList[1]=nil
Hl2c.SquadList[2]=nil
Hl2c.SquadList[3]=nil
Hl2c.SquadList[4]=nil
// Apply the scheme of things
function PANEL:ApplySchemeSettings()
	for i=1,4 do
		self.namelist[i]:SetFont("arial12Bold")
		
	end
	self.squadname:SetFont("arial16Bold")
	self.score:SetFont("arial16Bold")
end


// Called when our vgui element is created
function PANEL:Init()
	self:SetSize(150,300)
	self:SetPos(ScrW(), (0 + self:GetTall()) / 2)
	self.namelist={}
	self.hpbar={}
	self.avatar={}
	self.panel={}
	self.hpperc={}
	self.hpperc[1]=0
	self.hpperc[2]=0
	self.hpperc[3]=0
	self.hpperc[4]=0
	self.squadname = vgui.Create("DLabel", self)
	self.squadname:SetContentAlignment(4)
	self.squadname:SetText("Squad")
	self.squadname:SetTextColor( Color(255,255,255,255) )
	self.score = vgui.Create("DLabel", self)
	self.score:SetContentAlignment(4)
	self.score:SetText(0)
	self.score:SetTextColor( Color(255,255,255,255) )
	local y = 0
	for i=1,4 do
		self.panel[i]=vgui.Create("DPanel",self)
		self.panel[i]:SetSize(self:GetWide(),40)
		
		self.panel[i]:SetPos(150,y+30)
		self.hpbar[i] = vgui.Create("DPanel", self.panel[i])
		self.namelist[i] = vgui.Create("DLabel", self.panel[i])
		self.namelist[i]:SetContentAlignment(4)
		self.namelist[i]:SetText(" "..LocalPlayer():Nick())
		self.namelist[i]:SetTextColor( Color(255,255,255,255) )
		-- self.avatar[i]= vgui.Create( "AvatarImage", self.panel[i] )
		y=y+40
	end
	
	
	self:UpdateScoreboard()
	timer.Create("hl2c_squadhud_updater", 0.5, 0, function() self:UpdateScoreboard() end)
end
	
// Called every frame
function PANEL:Paint()
	for i=1,4 do
		self.hpbar[i].Paint = function(w,h)
			
			surface.SetDrawColor(Color(150,0,0, 255))
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
			surface.SetDrawColor(Color(70,150,20, 255))
			if Hl2c.SquadList[i]!= nil and IsValid(Hl2c.SquadList[i]) and Hl2c.SquadList[i]:IsPlayer() then
				
				self.hpperc[i] = math.Clamp(self.hpperc[i] + (((Hl2c.SquadList[i]:Health()/Hl2c.SquadList[i]:GetMaxHealth())-self.hpperc[i]) * 20 * FrameTime()), 0, 4)
				surface.DrawRect(0, 0, self:GetWide()*self.hpperc[i], self:GetTall())
			end
			surface.SetDrawColor(Color(0,0,0, 255))
			surface.DrawOutlinedRect( 0, 0,  self.hpbar[1]:GetWide(),self.hpbar[1]:GetTall() )
		end
		self.panel[i].Paint = function(w,h)
			
			surface.SetDrawColor(Color(0,0,0, 0))
			surface.DrawRect(0, 0, self:GetWide(), self:GetTall())
		end
	end
end

function PANEL:Active()
	if self.x==ScrW() then
		self:MoveTo(ScrW()-self:GetWide(), self.y, 2, 0, -1, function() self.active=true end ) 
	end
end
function PANEL:InActive()
	if self.x==ScrW()-self:GetWide() and self.closing != true and self.opening != true then
		self:MoveTo(ScrW(), self.y, 2, 0, -1, function() self.active=false end )
	end
end

function PANEL:OpenPlayer(i)
	self.opening=true
	-- self.panel[i]:SetPos(150,self.panel[i].y)
	self.panel[i]:MoveTo(0, self.panel[i].y, 2, 0, -1, function()  
	self.opening=false 
	end )
end
function PANEL:ClosePlayer(i)
	self.closing=true
	-- self.panel[i]:SetPos(0,self.panel[i].y)
	self.panel[i]:MoveTo(150, self.panel[i].y, 2, 0, -1, function() 
	self.closing=false 
	end )

end
-- https://www.instagram.com/kalmanvikike
-- https://www.instagram.com/vova_bender/ fake user to get kalmanvikike
// Does the actual layout
function PANEL:PerformLayout()
	
	self.squadname:SetSize(self:GetWide()-10,20)
	self.squadname:SetPos(10, 8 )
	self.score:SetSize(self:GetWide()-10,20)
	self.score:SetPos(self:GetWide()-25, 8 )
	local y = 0
	for i=1,4 do

		
		self.hpbar[i]:SetSize(self:GetWide()-10,8)
		self.hpbar[i]:SetPos(0, 15 )
		
		self.namelist[i]:SetSize(self:GetWide(),20)
		self.namelist[i]:SetPos(20, 5 )
		
		
		
		y=y+40
	end
	
end


// Updates the scoreboard
function PANEL:UpdateScoreboard(force)
	if !force && !self:IsVisible() then return end
	-- if self.moving!= true and self.panel[1].x==0 then self:ClosePlayer(1) end
	-- if self.moving!= true and self.panel[1].x==150 then self:OpenPlayer(1) end
	
	
	self:AddPlayer()
	self:RemovePlayer()
	if LocalPlayer():GetNWInt("SQUAD_ID") == 0 then
		Hl2c.SquadList[1]=nil
		Hl2c.SquadList[2]=nil
		Hl2c.SquadList[3]=nil
		Hl2c.SquadList[4]=nil
	else
		for i=1,4 do
			if Hl2c.SquadList[i] != nil and IsValid(Hl2c.SquadList[i]) and Hl2c.SquadList[i]:IsPlayer() and self.active == true then
				if self.panel[i].x==150 then
					self.namelist[i]:SetText(Hl2c.SquadList[i]:Nick())
					
					if !ispanel(self.avatar[i]) then
						
						self.avatar[i]= vgui.Create( "AvatarImage", self.panel[i] )
						self.avatar[i]:SetSize( 16, 16 )
						self.avatar[i]:SetPos( 0, -1)
						self.avatar[i]:SetPlayer(Hl2c.SquadList[i],64)
					end
				end
			elseif ispanel(self.avatar[i]) then
				self.avatar[i]:Remove()
				self.avatar[i]=nil
				Hl2c.SquadList[i]=nil
			end
		end
	end
	local id=0
	if LocalPlayer():GetNWInt("SQUAD_ID") != 0 then id= LocalPlayer():GetNWInt("SQUAD_ID") end
	for _,pl in pairs(player.GetAll()) do
		if pl != nil and IsValid(pl) then
			if id != 0 and pl:GetNWInt("SQUAD_ID") != 0 and id == pl:GetNWInt("SQUAD_ID") then
				if Hl2c.SquadList[1] == pl then
					
				elseif Hl2c.SquadList[2] == pl then
				elseif Hl2c.SquadList[3] == pl then
				elseif Hl2c.SquadList[4] == pl then
				
				else
					for i=1,4 do
						if Hl2c.SquadList[i] == nil then
							Hl2c.SquadList[i] = pl
							
							break
						end
					end
				end
			else
				for i=1,4 do
					if Hl2c.SquadList[i] == pl then
						Hl2c.SquadList[i] = nil
						self.hpperc[i]=0
						break
					end
				end
			end
		end
	end
	self:InvalidateLayout()
end

function PANEL:AddPlayer()
	for i=1,4 do
		if Hl2c.SquadList[i] != nil and IsValid(Hl2c.SquadList[i]) and Hl2c.SquadList[i]:IsPlayer() and self.active == true then
			if self.panel[i].x==150 then
				self:OpenPlayer(i)
			end
		end
	end
end
function PANEL:RemovePlayer()
	for i=1,4 do
		if Hl2c.SquadList[i] == nil then
			if self.panel[i].x==0 then
				self:ClosePlayer(i)
			end
		end
	end
end
// Register our scoreboard element
vgui.Register("squadhud", PANEL, "Panel")

-- net.Receive("SQUAD.RECEIVE.DATA", function() 

-- end )