//Create in Oriented :D
local AchShow = {
	message = message,
	AchNotify = AchNotify,
	Achbg = Achbg,
	Achimg = Achimg,
	Achlbl = Achlbl
}

function AchShow()

	local message
	message = net.ReadString()
	
	if message == nil then return end;
	/*
	LocalPlayer():PrintMessage(HUD_PRINTTALK, "Earned Achievement\n"..message.."")

	-- Notification panel
	AchNotify = vgui.Create( "DNotify" )
	AchNotify:SetPos( 0, 200 )
	AchNotify:SetSize( 280, 80 )

	-- Gray background panel
	local Achbg = vgui.Create( "DPanel", AchNotify )
	Achbg:Dock( FILL )
	Achbg:SetBackgroundColor( Color( 64, 64, 64 ) )

	local function inQuad( fraction, beginning, change )
		return change * ( fraction ^ 2 ) + beginning
	end
	local anim = Derma_Anim( "EaseInQuad", AchNotify, function( pnl, anim, delta, data )
		pnl:SetPos( inQuad( delta, -200, 200 ), 300 ) -- Change the X coordinate from 200 to 200+600
	end )
	anim:Start( 2 ) -- Animate for two seconds
	AchNotify.Think = function( self )
		if anim:Active() then
			anim:Run()
		end
	end
	-- Image of Dr. Kleiner ( parented to background panel )
	local Achimg = vgui.Create( "DImage", Achbg )
	Achimg:SetPos( 11, 11 )
	Achimg:SetSize( 80, 128 )
	Achimg:SetImage( "entities/npc_kleiner.png" )

	-- A yellow label message ( parented to background panel )
	local Achlbl = vgui.Create( "DLabel", Achbg )
	--Achlbl:SetPos( 140, 11 )
	Achlbl:Dock(RIGHT)
	Achlbl:SetSize( 142, 72 )
	Achlbl:SetText( "Achieved:\n"..message.."" )
	--Achlbl:SetTextColor( Color( 255, 200, 0 ) )
	--Achlbl:SetFont( "Trebuchet18" )
	Achlbl:SetWrap( true )

	-- Add the background panel to the notification
	AchNotify:AddItem( Achbg )
*/	local counter = 0
	if table.HasValue(HL2_ACH_LIST, message) then
		if LocalPlayer():GetNWInt(message) == 0 then
			--LocalPlayer():ChatPrint("Achievement achieved: ".. HL2_ACH_LIST_TITLE[message] .." + 500 Points" )
		else
		
		end
	end
	
	if table.HasValue(EP1_ACH_LIST, message) then
		if LocalPlayer():GetNWInt(message) == 0 then
			--LocalPlayer():ChatPrint("Achievement achieved: ".. EP1_ACH_LIST_TITLE[message] .." + 700 Points" )
		else
		
		end
	end
	
	if table.HasValue(EP2_ACH_LIST, message) then
		if LocalPlayer():GetNWInt(message) == 0 then
			--LocalPlayer():ChatPrint("Achievement achieved: ".. EP2_ACH_LIST_TITLE[message] .." + 600 Points" )
		else
		
		end
	end
	
	if table.HasValue(GEN_ACH_LIST, message) then
		if LocalPlayer():GetNWInt(message) == 0 then
			--LocalPlayer():ChatPrint("Achievement achieved: ".. EP2_ACH_LIST_TITLE[message] .." + 600 Points" )
		else
		
		end
	end
	
	if table.HasValue(HL2_LAMDACACHE, message) then
		for k, v in pairs(HL2_LAMDACACHE) do
			if LocalPlayer():GetNWInt(v) == 1 then
				counter = counter + 1
				if LocalPlayer():GetNWInt(v) != 47  then

				else
					
				end
				
			end
			--hl2cachelist_locktxt:SetText( "Lambda Locator 47 / ".. counter .."" )
		end
		LocalPlayer():ChatPrint("Achievement achieved: Lambda Locator \nProgress: 47/".. counter .." + 100 Points" )
	end

end



surface.CreateFont( "DermaDefault_18px", {
	font = "DermaDefault", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 17,
	weight = 300,
	blursize = 0,
	scanlines = 0,
	antialias = false,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )
Hl2c.ACHIEVEMENT =  Hl2c.ACHIEVEMENT or {}
local ACHIEVEMENT = ACHIEVEMENT or Hl2c.ACHIEVEMENT 

function ACHIEVEMENT:PopUp(len)
	
	local message = net.ReadString()
	local title = ""
	local unlock = "Achievement Unlocked!"
	local image = "entities/npc_kleiner.png"
	if HL2_ACH_LIST_TITLE[message] then
	title = HL2_ACH_LIST_TITLE[message]
	image = HL2_ACH_LIST_MAT[message]
	elseif EP1_ACH_LIST_TITLE[message] then
	title = EP1_ACH_LIST_TITLE[message]
	image = EP1_ACH_LIST_MAT[message]
	elseif EP2_ACH_LIST_TITLE[message] then
	title = EP2_ACH_LIST_TITLE[message]
	image = EP2_ACH_LIST_MAT[message]
	elseif GEN_ACH_LIST_TITLE[message] then
	title = GEN_ACH_LIST_TITLE[message]
	image = GEN_ACH_LIST_MAT[message]
	elseif message == SECRET_ACHIEVEMENT_HL2_ID then
		title = SECRET_ACHIEVEMENT_HL2_TITLE
		image = SECRET_ACHIEVEMENT_HL2_MATERIAL
	elseif message == SECRET_ACHIEVEMENT_LT_ID then
		title = SECRET_ACHIEVEMENT_LT_TITLE
		image = SECRET_ACHIEVEMENT_LT_MATERIAL
	elseif message == SECRET_ACHIEVEMENT_MASK1_ID then
		title = SECRET_ACHIEVEMENT_MASK1_TITLE
		image = SECRET_ACHIEVEMENT_MASK1_MATERIAL
	elseif string.Left(message,2) == "v_" then
		image = "vgui/achievements/hl2_beat_game"
		unlock = "Vortex Found!"
		title = string.Right(message,#message -2)
	end
	
	
	local notify = vgui.Create( "DNotify" )
	notify:SetPos( ScrW()-280, ScrH()	)
	notify:SetSize( 280, 80 )
	notify:SetLife(15)

	-- Gray background panel
	local panel = vgui.Create( "DPanel", notify )
	panel:Dock( FILL )
	panel:SetBackgroundColor( Color( 64, 64, 64 ) )
	
	local Achimg = vgui.Create( "DImage", panel )
	Achimg:SetPos( 12, 12 )
	Achimg:SetSize( 55, 55 )
	Achimg:SetImage( tostring(image) )
	
		-- A yellow label message ( parented to background panel )
	local Achlbl = vgui.Create( "DLabel", panel )
	Achlbl:SetPos( 80, 5 )
	-- Achlbl:Dock(RIGHT)
	Achlbl:SetSize( 190, 40 )
	Achlbl:SetText( tostring(unlock) )
	Achlbl:SetFont("DermaDefault_18px")
	--Achlbl:SetTextColor( Color( 255, 200, 0 ) )
	--Achlbl:SetFont( "Trebuchet18" )
	Achlbl:SetWrap( true )

	local Achlbl = vgui.Create( "DLabel", panel )
	Achlbl:SetPos( 80, 35 )
	-- Achlbl:Dock(RIGHT)
	Achlbl:SetSize( 190, 40 )
	Achlbl:SetText( tostring(title) )
	-- Achlbl:SetFont("DermaDefault")
	Achlbl:SetColor( Color(175,175,175) )
	--Achlbl:SetTextColor( Color( 255, 200, 0 ) )
	--Achlbl:SetFont( "Trebuchet18" )
	Achlbl:SetWrap( true )
	notify:AddItem( panel )
	
	notify:MoveTo( ScrW()-280, ScrH()-80, 2, 0, -1, function()
		timer.Simple(6,function()
			notify:MoveTo( ScrW()-280, ScrH(), 2, 0, -1, function() end)
		end)
	end)
	
	-- local function inQuad( fraction, beginning, change )
		-- return change * ( fraction ^ 2 ) + beginning
	-- end
	-- local anim = Derma_Anim( "EaseInQuad", notify, function( pnl, anim, delta, data )
		-- pnl:SetPos( ScrW()-280, inQuad( delta, ScrH(), -80 ) ) -- Change the X coordinate from 200 to 200+600
	-- end )
	-- anim:Start( 1 ) -- Animate for two seconds
	-- notify.Think = function( self )
		-- if anim:Active() then
			-- anim:Run()
		-- end
	-- end
	-- timer.Simple(6,function()
	
	-- local anim = Derma_Anim( "EaseInQuad", notify, function( pnl, anim, delta, data )
		-- pnl:SetPos( ScrW()-280, inQuad( delta, ScrH()-80, ScrH() ) ) -- Change the X coordinate from 200 to 200+600
	-- end )
	-- anim:Start( 3 ) -- Animate for two seconds
	-- notify.Think = function( self )
		-- if anim:Active() then
			-- anim:Run()
		-- end
	-- end
	
	-- end)
end

function ACHIEVEMENT:Init()

end

function ACHIEVEMENT:Think()
end

function ACHIEVEMENT:Receive()
end

net.Receive("Achievement_Notify_V1", function(len) ACHIEVEMENT:PopUp(len) end) 
-- net.Receive("Achievement_Event", function(len) ACHIEVEMENT:PopUp(len) end) 

-- net.Start( "Achievement_Event" ) net.Broadcast()