// Include the required lua files


//include("../shared/sh_init.lua")
//include("../shared/sh_config.lua")
//include("../shared/sh_player.lua")
include("zones/cl_zones.lua") 
include("items/cl_init.lua")
include("hud/cl_hud.lua")
include("hud/cl_voice.lua")
include("hud/cl_pet.lua")
include("hud/cl_targetbar.lua")
include("derma/cl_scoreboard.lua")
include("target/cl_targetid.lua")
include("derma/cl_helpmenu.lua")
include("derma/cl_spawnmenu.lua")
include("derma/tools/contenticon.lua")
include("chat/cl_chat.lua")
include("ads/cl_ads.lua")

include("chat/cl_leifchat.lua") // Should Include
if Administrator.Chat then else
include("chat/cl_leifchat.lua")
end
include("chat/cl_chat_color.lua")
include("derma/cl_upgrade_menu.lua")
//include("cl_hud.lua")
include("derma/cl_stat.lua")
include("derma/pet/cl_init.lua")
include("derma/report/cl_init.lua")

include("derma/admin/cl_init.lua")
include("achievement/cl_achi_event.lua")
include("derma/top/cl_init.lua")

include("inventory/cl_database.lua")
include("derma/cl_powerstat.lua")






function Hl2c.Diff_Vote()
	local frame = vgui.Create("DFrame")
	frame:SetPos(ScrW()/2, ScrH()/2 )
	frame:SetSize(200,300)
	frame:MakePopup()
	
	local button = vgui.Create("DButton",frame)
	button:Dock( TOP )
	button:DockMargin( 4, 0, 0, 0 )
	button:SetText("Easy")
	button.DoClick = function()
		net.Start("Hl2c.Diff.Vote.Send")
			net.WriteInt(0,16)
		net.SendToServer()
		frame:Close()
	end
	local button = vgui.Create("DButton",frame)
	button:Dock( TOP )
	button:DockMargin( 4, 0, 0, 0 )
	button:SetText("Normal")
	button.DoClick = function()
		net.Start("Hl2c.Diff.Vote.Send")
			net.WriteInt(1,16)
		net.SendToServer()
		frame:Close()
	end
	local button = vgui.Create("DButton",frame)
	button:Dock( TOP )
	button:DockMargin( 4, 0, 0, 0 )
	button:SetText("Hard")
	button.DoClick = function()
		net.Start("Hl2c.Diff.Vote.Send")
			net.WriteInt(2,16)
		net.SendToServer()
		frame:Close()
	end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Insane")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(3,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Nightmare")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(4,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Inferno")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(5,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Monster Level 1")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(6,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Monster Level 2")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(7,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Monster Level 3")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(8,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Monster Level 4")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(9,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Monster Level 5")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(10,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
	-- local button = vgui.Create("DButton",frame)
	-- button:Dock( TOP )
	-- button:DockMargin( 4, 0, 0, 0 )
	-- button:SetText("Monster Level 6")
	-- button.DoClick = function()
		-- net.Start("Hl2c.Diff.Vote.Send")
			-- net.WriteInt(11,16)
		-- net.SendToServer()
		-- frame:Close()
	-- end
end

netstream.Hook("Push_Diff_Vote", function(data)
	Hl2c.Diff_Vote()
end)


// Client only constants
DROWNING_SOUNDS = {
	"player/pl_drown1.wav",
	"player/pl_drown2.wav",
	"player/pl_drown3.wav"
}


// Called by ShowScoreboard
squad = nil
function GM:CreateScoreboard()
	if scoreboard then
		scoreboard:Remove()
		scoreboard = nil
	end
	scoreboard = vgui.Create("scoreboard")
end
-- function GM:CreateSquad()

	-- if squad then
		-- squad:Remove()
		-- squad = nil
	-- end
	-- squad = vgui.Create("squadhud")
-- end


// This creates the drowning effect
function DrowningEffect(um)
	surface.PlaySound(DROWNING_SOUNDS[math.random(1, #DROWNING_SOUNDS)])
	deAlpha = 100
	deAlphaUpdate = 0
end
usermessage.Hook("DrowningEffect", DrowningEffect)

net.Receive("DrowningEffect", function(len)
	surface.PlaySound(DROWNING_SOUNDS[math.random(1, #DROWNING_SOUNDS)])
	deAlpha = 100
	deAlphaUpdate = 0
end)


// Do not want!
function GM:HUDDrawScoreBoard()
end



function SQUADLIST_CHECK()
	for i=1,4 do
		if Hl2c.SquadList[i] != nil and squad != nil then
			squad:Active()
		end
	end
	local test=0
	for i=1,4 do
		if Hl2c.SquadList[i] == nil and squad != nil then
			test=test+1
		end
	end
	if test==4 and squad != nil then squad:InActive() end
end
// Called every frame to draw the hud
function GM:HUDPaint()
	if squad == nil then
		squad = vgui.Create("squadhud")
		squad.active=false
		timer.Create("hl2c_squadhud_check", 0.5, 0, function() SQUADLIST_CHECK() end)
	end
	if self.ShowScoreboard && LocalPlayer() && LocalPlayer():Team() != TEAM_DEAD then
		return
	end
	
	self:HUDDrawTargetID()
	self:HUDDrawPickupHistory()
	surface.SetDrawColor(0, 0, 0, 0)
	
	w = ScrW()
	h = ScrH()
	centerX = w / 2
	centerY = h / 2
	
	// Draw nav marker/point
	if !isvector(checkpointPosition) && LocalPlayer():Team() == TEAM_ALIVE then
		--print("Not Vector checkpointPositions[1]") 
	--end
	elseif isvector(checkpointPosition) && LocalPlayer():Team() == TEAM_ALIVE then
		
		local checkpointDistance = math.Round(LocalPlayer():GetPos():Distance(checkpointPosition) / 39)
		local checkpointPositionScreen = checkpointPosition:ToScreen()
		
		surface.SetDrawColor(255, 255, 255, 255)
		
		if checkpointPositionScreen.x > 32 && checkpointPositionScreen.x < w - 43 && checkpointPositionScreen.y > 32 && checkpointPositionScreen.y < h - 38 then
			surface.SetTexture(surface.GetTextureID("hl2c/hl2c_nav_marker"))
			surface.DrawTexturedRect(checkpointPositionScreen.x - 14, checkpointPositionScreen.y - 14, 28, 28)
			draw.DrawText(tostring(checkpointDistance).." m", "arial16", checkpointPositionScreen.x, checkpointPositionScreen.y + 15, Color(255, 220, 0, 255), 1)
		else
			local r = math.Round(centerX / 2)
			local checkpointPositionRad = math.atan2(checkpointPositionScreen.y - centerY, checkpointPositionScreen.x - centerX)
			local checkpointPositionDeg = 0 - math.Round(math.deg(checkpointPositionRad))
			surface.SetTexture(surface.GetTextureID("hl2c/hl2c_nav_pointer"))
			surface.DrawTexturedRectRotated(math.cos(checkpointPositionRad) * r + centerX, math.sin(checkpointPositionRad) * r + centerY, 32, 32, checkpointPositionDeg + 90)
		end
		
	end
	
	// Draw warning marker
	if playerWarningPosition && LocalPlayer():Team() == TEAM_ALIVE then
		local warningDistance = math.Round(LocalPlayer():GetPos():Distance(playerWarningPosition) / 39)
		local playerWarningPositionScreen = playerWarningPosition:ToScreen()
		
		surface.SetDrawColor(255, 255, 255, 255)
		
		if playerWarningPositionScreen.x > 32 && playerWarningPositionScreen.x < w - 43 && playerWarningPositionScreen.y > 32 && playerWarningPositionScreen.y < h - 38 then
			surface.SetTexture(surface.GetTextureID("hl2c/hl2c_warning_marker"))
			surface.DrawTexturedRect(playerWarningPositionScreen.x - 14, playerWarningPositionScreen.y - 14, 28, 28)
			draw.DrawText(tostring(warningDistance).." m", "arial16", playerWarningPositionScreen.x, playerWarningPositionScreen.y + 15, Color(255, 225, 255, 200), 1)
		else
			local r = math.Round(centerX / 2)
			local playerWarningPositionRad = math.atan2(playerWarningPositionScreen.y - centerY, playerWarningPositionScreen.x - centerX)
			local playerWarningPositionDeg = 0 - math.Round(math.deg(playerWarningPositionRad))
			surface.SetTexture(surface.GetTextureID("hl2c/hl2c_warning_marker"))
			surface.DrawTexturedRect(math.cos(playerWarningPositionRad) * r + centerX, math.sin(playerWarningPositionRad) * r + centerY, 32, 32, playerWarningPositionDeg + 90)
		end
	end
	
	if LocalPlayer():Team() == 3 or LocalPlayer():Team() == TEAM_COMBINE_DEAD or LocalPlayer():Team() == TEAM_COMPLETED_MAP then	-- If dead, then draw spectator letterbox
		
	else
		// Drowning Effect
		if deAlpha && deAlpha > 0 then
			if CurTime() >= deAlphaUpdate + 0.01 then
				deAlpha = deAlpha - 1
				deAlphaUpdate = CurTime()
			end
			
			surface.SetDrawColor(0, 0, 255, deAlpha)
			surface.DrawRect(0, 0, w, h)
		end
		local ceil = math.ceil
		local sw = ceil( ScrW() * 0.007 )
		local sh = ceil( ScrW() * 0.004 )
		// Aux bar
		if energy < 100 then
		
			draw.RoundedBox(8, (ScrH() - h * 0.132) / 27.75, ScrH() - h * 0.162, h * 0.026 * 8.2, h * 0.056, Color(0, 0, 0, 75))
			surface.SetDrawColor(GetConVarNumber("hl2c_hud03_r"), GetConVarNumber("hl2c_hud03_g"), GetConVarNumber("hl2c_hud03_b"), 150)
			
			--surface.DrawRect((ScrH() - h * 0.126) / 22.3, ScrH() - h * 0.126, (energy / 100) * (h * 0.015 * 12.75), h * 0.015)
		if energy > 39 then
		surface.SetDrawColor( 255, 255, 0, 100 )
		elseif energy > 15 and energy < 40 then
		surface.SetDrawColor( 255, 100, 0, 100 )
		elseif energy < 16 then
		surface.SetDrawColor( 255, 0, 0, 100 )
		end
		
		for i = 0, 9 do
		surface.DrawRect( ceil( ScrW() * 0.029 ) + ceil( ScrW() * 0.012 * (i/1.2) ), ceil( ScrH() * 0.8723 ), sw, sh )
		end
		
		if energy > 39 then
		surface.SetDrawColor( 255, 255, 0, 200 )
		elseif energy > 15 and energy < 40 then
		surface.SetDrawColor( 255, 100, 0, 200 )
		elseif energy < 16 then
		surface.SetDrawColor( 255, 0, 0, 200 )
		end
		for i = 0, 9 do
			--surface.DrawRect( ceil( ScrW() * 0.029 ) + ceil( ScrW() * 0.012 * i ), ceil( ScrH() * 0.8723 ), sw, sh )
			if i == 0 and energy > 1 then
				--surface.SetDrawColor( 255, 255, 0, 200 )
				surface.DrawRect( ceil( ScrW() * 0.029 ), ceil( ScrH() * 0.8723 ), sw, sh )
				--surface.SetDrawColor( 255, 255, 0, 150 )
			elseif i != 0 and energy > 100 * ( 0.1 * i ) then
				--surface.SetDrawColor( 255, 255, 0, 200 )
				surface.DrawRect( ceil( ScrW() * 0.029 ) + ceil( ScrW() * 0.012 * (i/1.2) ), ceil( ScrH() * 0.8723 ), sw, sh )
				--surface.SetDrawColor( 255, 255, 0, 150 )
			end
			
		end
		if energy > 39 then
			draw.SimpleText( "AUX POWER", "CoolVetica", ceil( ScrW() * 0.038 ), ceil( ScrH() * 0.845 ), Color( 255, 255, 0, 200 ) )
		elseif energy > 15 and energy < 40 then
			draw.SimpleText( "AUX POWER", "CoolVetica", ceil( ScrW() * 0.038 ), ceil( ScrH() * 0.845 ), Color( 255, 100, 0, 200 ) )
		elseif energy < 16 then
			draw.SimpleText( "AUX POWER", "CoolVetica", ceil( ScrW() * 0.038 ), ceil( ScrH() * 0.845 ), Color( 255, 0, 0, 200 ) )
		end
		end
		
		// Crosshair
		if !LocalPlayer():InVehicle() && LocalPlayer():GetActiveWeapon() && LocalPlayer():GetActiveWeapon():IsValid() then	
			-- surface.SetDrawColor(255, 255, 255, 255)
			-- surface.DrawRect(centerX - 1, centerY - 1, 1, 1)
			-- surface.DrawRect(centerX - 11, centerY - 1, 1, 1)
			-- surface.DrawRect(centerX + 9, centerY - 1, 1, 1)
			-- surface.DrawRect(centerX - 1, centerY + 7, 1, 1)
			-- surface.DrawRect(centerX - 1, centerY - 9, 1, 1)
			
			if !LocalPlayer():KeyDown(IN_ZOOM) then
				if GetConVarNumber("cl_drawhud") != 0 then
					draw.SimpleText("(", "crosshair44", centerX - 15, centerY, Color(GetConVarNumber("hl2c_hud02_r"), GetConVarNumber("hl2c_hud02_g"), GetConVarNumber("hl2c_hud02_b"), 150), 2, 1)
					draw.SimpleText(")", "crosshair44", centerX + 15, centerY, Color(GetConVarNumber("hl2c_hud02_r"), GetConVarNumber("hl2c_hud02_g"), GetConVarNumber("hl2c_hud02_b"), 150), 0, 1)
				end
			end
		end
		
	end
	
	// Fancy up the death text.
	if !classicMode then
		if LocalPlayer():Team() == TEAM_DEAD then
			-- draw.SimpleText("YOU ARE DEAD. PLEASE WAIT UNTIL NEXT MAP OR WHEN A CHECKPOINT IS REACHED!", "calibri24", centerX, centerY * 0.075, Color(255, 0, 0, 200), 1)
		end
	end
	
	// Are we going to the next map?
	if nextMapCountdownStart then
		local nextMapCountdownLeft = math.Round(nextMapCountdownStart + NEXT_MAP_TIME - CurTime())
		if nextMapCountdownLeft > 0 then
			draw.DrawText("Next Map in "..tostring(nextMapCountdownLeft), "impact32", centerX, h - h * 0.075, Color(255, 255, 255, 200), 1)
		else
			draw.DrawText("Switching Maps!", "impact32", centerX, h - h * 0.075, Color(255, 255, 255, 200), 1)
		end
	end
	
	// Are we restarting the map?
	if restartMapCountdownStart then
		local restartMapCountdownLeft = math.Round(restartMapCountdownStart + RESTART_MAP_TIME - CurTime())
		if restartMapCountdownLeft > 0 then
			draw.DrawText("Restarting Map in "..tostring(restartMapCountdownLeft), "impact32", centerX, h - h * 0.075, Color(255, 255, 255, 200), 1)
		else
			draw.DrawText("Restarting Map!", "impact32", centerX, h - h * 0.075, Color(255, 255, 255, 200), 1)
		end
	end
	
	// On top of it all
	-- self:DrawDeathNotice(0.85, 0.04)
end

// Called every frame
function GM:HUDShouldDraw(name)
	if LocalPlayer() && LocalPlayer():IsValid() then
		if !LocalPlayer():Alive() || (self.ShowScoreboard && LocalPlayer() && LocalPlayer():Team() != TEAM_DEAD) then
			return false
		end
		
		--if GetConVarNumber("hl2c_custom_hud") >= 1 && !classicMode then
		--	if (name == "CHudHealth" || name == "CHudBattery") then return false end
		--end
		
		local wep = LocalPlayer():GetActiveWeapon()
		
 		if wep && wep:IsValid() && wep.HUDShouldDraw != nil then
			return wep.HUDShouldDraw(wep, name)
		end
 	end
	
 	return true
end

function GM:CreateClientsideRagdoll( entity, ragdoll )
	-- print(ragdoll)
	-- if ragdoll and (ragdoll:GetModel() != "models/alyx.mdl" or ragdoll:GetModel() != "models/alyx_ep2.mdl")  then
		-- if game.GetMap() == "d2_coast_11" and ragdoll:GetModel() == "models/antlion_guard.mdl" then
		-- else
		if ragdoll:GetSaveTable().m_bImportant == true then else
		ragdoll:SetSaveValue("m_bFadingOut",true)
		end
		-- end
	-- end
	-- ragdoll:Fire( "FadeAndRemove", "", 3)
	-- SafeRemoveEntityDelayed( ragdoll, 3 )
end

// Called when we initialize
function GM:Initialize()
	/*for k, v in pairs( engine.GetGames() ) do
		if v.title == "hl2" then
			RunConsoleCommand( "gamemounted", v.title, v.mounted and 1 or 0 )
		end
		
		if v.title == "episodic" then
			RunConsoleCommand( "gamemounted", v.title, v.mounted and 1 or 0 )
		end
		
		if v.title == "ep2" then
			RunConsoleCommand( "gamemounted", v.title, v.mounted and 1 or 0 )
		end
	end*/

	// Initial variables for client
	energy = 100
	flashenergy = 100
	self.ShowScoreboard = false
	classicMode = false
	showNav = true
	scoreboard = nil
	delayVoiceLine = false
	sandboxMode = false
	
	// Create a Client ConVar to control stuff
	CreateClientConVar("hl2c_player_halo", "1", true, false)
	CreateClientConVar("hl2c_vital_npc_halo", "1", true, false)
	CreateClientConVar("hl2c_citizen_npc_halo", "1", true, false)
	CreateClientConVar("hl2c_combine_npc_halo", "1", true, false)
	CreateClientConVar("hl2c_custom_targetid", "1", true, false)
	CreateClientConVar("hl2c_custom_hud", "0", true, false)
	--CreateClientConVar("icesize", "0.1", true, false)
	
	// Create Client ConVars to control custom hud color_black
	--CreateClientConVar("hl2c_hud01_r", "255", true, false)
	--CreateClientConVar("hl2c_hud01_g", "208", true, false)
	--CreateClientConVar("hl2c_hud01_b", "64", true, false)
	
	CreateClientConVar("hl2c_hud01_r", "236", true, false)
	CreateClientConVar("hl2c_hud01_g", "210", true, false)
	CreateClientConVar("hl2c_hud01_b", "37", true, false)
	
	CreateClientConVar("hl2c_hud02_r", "255", true, false)
	CreateClientConVar("hl2c_hud02_g", "250", true, false)
	CreateClientConVar("hl2c_hud02_b", "0", true, false)
	
	CreateClientConVar("hl2c_hud03_r", "236", true, false)
	CreateClientConVar("hl2c_hud03_g", "210", true, false)
	CreateClientConVar("hl2c_hud03_b", "37", true, false)
	
	// When No Ammuntion or Low Health/Armor 
	CreateClientConVar("hl2c_hudred_r", "255", true, false)
	CreateClientConVar("hl2c_hudred_g", "48", true, false)
	CreateClientConVar("hl2c_hudred_b", "0", true, false)
	
	// Create ConCommands down here
	concommand.Add("hl2c_hud_reset", function()
		--RunConsoleCommand("hl2c_hud01_r", "255")
		--RunConsoleCommand("hl2c_hud01_g", "208")
		--RunConsoleCommand("hl2c_hud01_b", "64")
		
		
		RunConsoleCommand("hl2c_hud01_r", "236")
		RunConsoleCommand("hl2c_hud01_g", "210")
		RunConsoleCommand("hl2c_hud01_b", "37")
		
		
		RunConsoleCommand("hl2c_hud02_r", "255")
		RunConsoleCommand("hl2c_hud02_g", "250")
		RunConsoleCommand("hl2c_hud02_b", "0")
		
		RunConsoleCommand("hl2c_hud03_r", "236")
		RunConsoleCommand("hl2c_hud03_g", "210")
		RunConsoleCommand("hl2c_hud03_b", "37")
		
		RunConsoleCommand("hl2c_hudred_r", "255")
		RunConsoleCommand("hl2c_hudred_g", "48")
		RunConsoleCommand("hl2c_hudred_b", "0")
	end)
	
	// Fonts we will need later
	surface.CreateFont("arial16", {
		font = "Arial",
		size = 16,
		weight = 400
	})
	
	surface.CreateFont("arial16Bold", {
		font = "Arial",
		size = 16,
		weight = 700
	})
	surface.CreateFont("arial12Bold", {
		font = "Arial",
		size = 14,
		weight = 700
	})
	
	surface.CreateFont("arial32", {
		font = "Arial",
		size = 32,
		weight = 400
	})
	
	surface.CreateFont("arial32Bold", {
		font = "Arial",
		size = 32,
		weight = 700
	})
	
	surface.CreateFont("coolvetica72", {
		font = "coolvetica",
		size = 72,
		weight = 500
	})
	surface.CreateFont( "CoolVetica", {
			
			font = "Coolvetica",
			size = ScreenScale( 7.5 ),
			weight = 500,
			
	} )
	
	surface.CreateFont("crosshair44", {
		font = "HL2Cross",
		size = 44,
		weight = 430
	})
	
	surface.CreateFont("impact32", {
		font = "Impact",
		size = 32,
		weight = 400
	})
	
	surface.CreateFont("hl2cimpactxp", {
		font = "Impact",
		size = 22,
		weight = 300
	})
	
	surface.CreateFont("hl2cchatads", {
		font = "Impact",
		size = ScreenScale( 14 ),
		weight = 300
	})
	
	surface.CreateFont("calibri24", {
		font = "Calibri",
		size = 24,
		weight = 400
	})
	
	surface.CreateFont("verdana32", {
		font = "Verdana",
		size = 32,
		weight = 400
	})
	
	surface.CreateFont("halflifetwo46", {
		font = "HALFLIFE2",
		size = 46,
		weight = 400
	})
	
	surface.CreateFont("custom_hl2mp", {
		font = "HL2MPTypeDeath",
		size = 46,
		weight = 400
	})
	
	surface.CreateFont("impactnot01", {
		font = "Impact",
		size = 32,
		weight = 400
	})
	
	language.Add("worldspawn", "World")
	language.Add("func_door_rotating", "Door")
	language.Add("func_door", "Door")
	language.Add("phys_magnet", "Magnet")
	language.Add("trigger_hurt", "Trigger Hurt")
	language.Add("entityflame", "Fire")
	language.Add("env_explosion", "Explosion")
	language.Add("env_fire", "Fire")
	language.Add("func_tracktrain", "Train")
	language.Add("npc_launcher", "Headcrab Pod")
	language.Add("func_tank", "Mounted Turret")
	language.Add("npc_helicopter", "Helicopter")
	language.Add("npc_bullseye", "Turret")
	language.Add("prop_vehicle_apc", "APC")
	language.Add("item_healthvial", "Health Vial")
	language.Add("combine_mine", "Mine")
	language.Add("npc_combinegunship", "Combine Gunship")
	language.Add("npc_helicopter", "Helicopter")
	language.Add("npc_sniper", "Sniper")
	language.Add("npc_barnacle", "Barnacle")
	language.Add("npc_grenade_frag", "Grenade")
	
	/*timer.Simple(30, function()
	// People without Half-Life 2 will be disconnected
	if string.find(game.GetMap(), "d1_") || string.find(game.GetMap(), "d2_") || string.find(game.GetMap(), "d3_") then
		if !IsMounted("hl2") then
			--RunConsoleCommand("disconnect")
			--if LocalPlayer():IsValid() then
			--LocalPlayer():PrintMessage( HUD_PRINTTALK, "I don't have Half-Life 2" )
			--end
			chat.AddText(Color(255, 255, 255), "Hello, you don't have Half-Life 2")
			RunConsoleCommand( "gamemounted hl2 0" )
		end
	end
	
	// People without Half-Life 2 Episode One will be disconnected
	if string.find(game.GetMap(), "ep1_") then
		if !IsMounted("episodic") then
			--if LocalPlayer():IsValid() then
			--RunConsoleCommand("disconnect")
			--LocalPlayer():PrintMessage( HUD_PRINTTALK, "I don't have Half-Life 2 Episode One" )
			--end
			chat.AddText(Color(255, 255, 255), "Hello, you don't have Half-Life 2 Episode One")
			RunConsoleCommand( "gamemounted episodic 0" )
		end
	end
	
	// People without Half-Life 2 Episode Two will be disconnected
	if string.find(game.GetMap(), "ep2_outland_") then
		if !IsMounted("ep2") then
			--if LocalPlayer():IsValid() then
			--RunConsoleCommand("disconnect")
			--LocalPlayer():PrintMessage( HUD_PRINTTALK, "I don't have Half-Life 2 Episode Two" )
			--end
			chat.AddText(Color(255, 255, 255), "Hello, you don't have Half-Life 2 Episode Two")
			RunConsoleCommand( "gamemounted ep2 0" )
		end
	end
	end)*/
end

--------------------------------------------------------------------------------
--The function which overwrite all of the functions under predrawhalos OMFG I hope we did everything pretty damnn good
--------------------------------------------------------------------------------
--[[
function GM:PreDrawHalos()
	local entpl = ents.FindByClass("player")
	if GetConVarNumber("hl2c_player_halo") >= 1 then
		halo.Add(entpl, Color(255, 127, 0), 1, 1, 6, true, true)
	end
	

	--Making NPC Drawhalo around them :D iMBA
	local entvnpc1 = ents.FindByClass("npc_alyx")
	local entvnpc2 = ents.FindByClass("npc_barney")
	local entvnpc3 =ents.FindByClass("npc_dog")
	--local entvnpc4 =ents.FindByClass("npc_eli")
	--local entvnpc5 =ents.FindByClass("npc_mossman")
	--local entvnpc6 =ents.FindByClass("npc_kleiner")
	if GetConVarNumber("hl2c_vital_npc_halo") >= 1 then
		halo.Add(entvnpc1, Color(0, 255, 0), 0.5, 0.5, 1, true, true)
		halo.Add(entvnpc2, Color(0, 255, 0), 0.5, 0.5, 1, true, true)
		halo.Add(entvnpc3, Color(0, 255, 0), 0.5, 0.5, 1, true, true)
		--halo.Add(entvnpc4, Color(0, 255, 0), 0.5, 0.5, 1, true, true)
		--halo.Add(entvnpc5, Color(0, 255, 0), 0.5, 0.5, 1, true, true)
		--halo.Add(entvnpc6, Color(0, 255, 0), 0.5, 0.5, 1, true, true)
	end
	
	local entcnpc1 = ents.FindByClass("npc_citizen")
	if GetConVarNumber("hl2c_citizen_npc_halo") >= 1 then
		halo.Add(entcnpc1, Color(0, 255, 0), 0.5, 0.5, 1, true, false)
	end
	--My custom Function OMFG for COMBINE
	local entcsnpc1 = ents.FindByClass("npc_combine_s")
	local entcsnpc2 = ents.FindByClass("npc_metropolice")
	local entcsnpc3 = ents.FindByClass("npc_stalker")
	local entcsnpc4 = ents.FindByClass("npc_rollermine")
	local entcsnpc5 = ents.FindByClass("npc_combinegunship")
	local entcsnpc6 = ents.FindByClass("npc_helicopter")
	local entcsnpc7 = ents.FindByClass("npc_strider")
	local entcsnpc8 = ents.FindByClass("npc_hunter")
	if GetConVarNumber("hl2c_combine_npc_halo") >=1 then
		halo.Add(entcsnpc1, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
		halo.Add(entcsnpc2, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
		halo.Add(entcsnpc3, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
		halo.Add(entcsnpc4, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
		halo.Add(entcsnpc5, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
		halo.Add(entcsnpc6, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
		halo.Add(entcsnpc7, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
		halo.Add(entcsnpc8, Color(255, 0, 0), 0.5, 0.5, 1, true, false)
	end
end
]]--
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function GM:PostDrawViewModel( vm, pl, weapon )
	if weapon != nil then
	if ( weapon.UseHands || !weapon:IsScripted() ) then

		local hands = LocalPlayer():GetHands()
		if ( IsValid( hands ) ) then hands:DrawModel() end

	end
	end

end


// Called when going to the next map
-- function NextMap(um)
	-- if #SUCCESS_SOUNDS > 1 then
		-- surface.PlaySound(SUCCESS_SOUNDS[math.random(1, #SUCCESS_SOUNDS)])
	-- elseif #SUCCESS_SOUNDS > 0 then
		-- surface.PlaySound(SUCCESS_SOUNDS[1])
	-- end
	
	-- nextMapCountdownStart = um:ReadLong()
	
--	if LocalPlayer():Team() != TEAM_ALIVE then
		--RunConsoleCommand("+score")
--	end
-- end
-- usermessage.Hook("NextMap", NextMap)


// Called when player spawns for the first time
function PlayerInitialSpawn(um)
--	if !file.Exists("shown_hl2c_help.txt", "DATA") then
--		ShowHelp()
--		file.Write("shown_hl2c_help.txt", "You've viewed the help menu in Half-Life 2 Campaign.")
--	end
	checkpointPosition = um:ReadVector()
end
usermessage.Hook("PlayerInitialSpawn", PlayerInitialSpawn)

net.Receive("PlayerInitialSpawn", function(len)
	--if !file.Exists("shown_hl2c_help.txt", "DATA") then
--		ShowHelp()
--		file.Write("shown_hl2c_help.txt", "You've viewed the help menu in Half-Life 2 Campaign.")
--	end
	checkpointPosition = net.ReadVector()
	LocalPlayer().usingchat = false
end)


// Player has yelled a warning, get position info.
net.Receive("PlayerWarningPositions", function(len)
	playerWarningPosition = net.ReadVector()
end)

net.Receive("PlayerWarningPositionsDisable", function(len)
	playerWarningPosition = false
end)


// Called when restarting maps
function RestartMap(um)
	if #FAILURE_SOUNDS > 1 then
		surface.PlaySound(FAILURE_SOUNDS[math.random(1, #FAILURE_SOUNDS)])
	elseif #FAILURE_SOUNDS > 0 then
		surface.PlaySound(FAILURE_SOUNDS[1])
	end
	
	restartMapCountdownStart = um:ReadLong()
	
	--RunConsoleCommand("+score")
end
usermessage.Hook("RestartMap", RestartMap)


-- Old Place of the help menu function


-- Old Net Receive help menu place :D


// Called by client pressing -score
function GM:ScoreboardHide()
	XP_BAR_HIDE()
	self.ShowScoreboard = false
	
	if scoreboard then
		
		gui.EnableScreenClicker( false )
		scoreboard:SetVisible(false)
		scoreboard.playerList.nameLabel.display=0
		scoreboard.playerList.permaLabel.display=0
		scoreboard.playerList.levelLabel.display=0
		scoreboard.playerList.scoreLabel.display=0
		scoreboard.playerList.deathsLabel.display=0
		scoreboard.playerList.pingLabel.display=0
		scoreboard.playerList.threatLabel.display=0

		scoreboard.playerList.nameLabel_r.text=0
		scoreboard.playerList.permaLabel.text=0
		scoreboard.playerList.levelLabel.text=0
		scoreboard.playerList.scoreLabel.text=0
		scoreboard.playerList.deathsLabel.text=0
		scoreboard.playerList.pingLabel.text=0
		scoreboard.playerList.threatLabel.text=0
		scoreboard.playerList.nameLabel_r:SetTextColor( Color( 255, 255, 255, 0 ) )
		scoreboard.playerList.permaLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
		scoreboard.playerList.levelLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
		scoreboard.playerList.scoreLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
		scoreboard.playerList.deathsLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
		scoreboard.playerList.pingLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
		scoreboard.playerList.threatLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
		local row=scoreboard.playerList.playerRows
		for i = 1,game.MaxPlayers()
		do 
			if player.GetByID(i):IsValid() and row[player.GetByID(i)] then
				row[player.GetByID(i)].nameLabel.display=0
				row[player.GetByID(i)].permaLabel.display=0
				row[player.GetByID(i)].levelLabel.display=0
				row[player.GetByID(i)].scoreLabel.display=0
				row[player.GetByID(i)].deathsLabel.display=0
				row[player.GetByID(i)].pingLabel.display=0
				row[player.GetByID(i)].threatLabel.display=0
				
				
				-- row[player.GetByID(i)].nameLabel.show=true
				-- row[player.GetByID(i)].permaLabel.show=true
				-- row[player.GetByID(i)].levelLabel.show=true
				-- row[player.GetByID(i)].scoreLabel.show=true
				-- row[player.GetByID(i)].deathsLabel.show=true
				-- row[player.GetByID(i)].pingLabel.show=true
				-- row[player.GetByID(i)].threatLabel.show=true

				row[player.GetByID(i)].nameLabel.text=0
				row[player.GetByID(i)].permaLabel.text=0
				row[player.GetByID(i)].levelLabel.text=0
				row[player.GetByID(i)].scoreLabel.text=0
				row[player.GetByID(i)].deathsLabel.text=0
				row[player.GetByID(i)].pingLabel.text=0
				row[player.GetByID(i)].threatLabel.text=0
				
				row[player.GetByID(i)].nameLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
				row[player.GetByID(i)].permaLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
				row[player.GetByID(i)].levelLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
				row[player.GetByID(i)].scoreLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
				row[player.GetByID(i)].deathsLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
				row[player.GetByID(i)].pingLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
				row[player.GetByID(i)].threatLabel:SetTextColor( Color( 255, 255, 255, 0 ) )
			end
		end
	end
	
	-- if squad then
		
		
		-- squad:SetVisible(false)
	-- end
end


// Called by client pressing +score
function GM:ScoreboardShow()
	XP_BAR_SHOW()
	self.ShowScoreboard = false
	
	if !scoreboard then
		self:CreateScoreboard()
	end
	-- if !squad then
		-- self:CreateSquad()
	-- end
	gui.EnableScreenClicker(true)
	scoreboard:SetVisible(true)
	
	scoreboard:UpdateScoreboard(true)
	-- squad:SetVisible(true)
	return true
end

local MyGreen = Color(102,255,102)
// Called when a player joins
function PlayerJoinMessage(um)
	-- chat.AddText(Color(0, 255, 0), "Player ", Color(0, 255, 0), um:ReadString(), Color(0, 255, 0), " has joined the game")
	chat.AddText(MyGreen, um:ReadString() .." has joined the game")
end
usermessage.Hook("PlayerJoinMessage", PlayerJoinMessage)

// Called when a player leave
function PlayerLeaveMessage(um)
	-- chat.AddText(Color(0, 255, 0), "Player ", Color(0, 255, 0), um:ReadString(), Color(0, 255, 0), " has joined the game")
	chat.AddText(MyGreen, um:ReadString() .." has left the game reason: (".. um:ReadString() ..")")
end
usermessage.Hook("PlayerLeaveMessage", PlayerLeaveMessage)

-- net.Receive("PlayerJoinMessage", function(len)	
	-- //-- chat.AddText(Color(0, 255, 0), "Player ", Color(0, 255, 0), net.ReadString(), Color(0, 255, 0), " has joined the game")
	-- chat.AddText(MyGreen, "Player ".. net.ReadString() .." has joined the game")
-- end)

function Hl2c.MapEndTouch_Print(um)
	local text = um:ReadString()
	-- print("Working?(".. text .."")
	chat.AddText(Color(240,240,170),text )
end
usermessage.Hook("Hl2c.MapEndTouch.Chat.Print", Hl2c.MapEndTouch_Print)

net.Receive( "MapEndTouchPrintChat", function(len) 
	local text = net.ReadString()
	-- print("Working?(".. text .."")
	chat.AddText(Color(220,200,100),text )
end)

net.Receive( "DefaultChatPrint_Net", function(len) 
	local text = net.ReadString()
	-- print("Working?(".. text .."")
	chat.AddText(Color(220,200,100),text )
end)
net.Receive( "Person_DefaultChatPrint_Net", function(len) 
	local text = net.ReadString()
	-- print("Working?(".. text .."")
	chat.AddText(Color(220,200,100),text )
end)

// Called every time the server changes level or starts
function ClassicMode()
	classicMode = true
end
usermessage.Hook("ClassicMode", ClassicMode)

net.Receive("ClassicMode", function(len)
	classicMode = true
end)


/*net.Receive("ShowTeam", function(len)
	if showNav then
		showNav = false
	else
		showNav = true
	end
end)*/


// Called by server
function SetCheckpointPosition(um)
	checkpointPosition = um:ReadVector()
end
usermessage.Hook("SetCheckpointPosition", SetCheckpointPosition)

net.Receive("SetCheckpointPosition", function(len)
	checkpointPosition = net.ReadVector()
	
	if checkpointPosition == LocalPlayer():GetLastCP() then
	else
		net.Start("RequestCPAgain")
		net.SendToServer(LocalPlayer())
	end
end)


// Called by server Think()
function UpdateEnergy(um)
	energy = um:ReadShort()
end
usermessage.Hook("UpdateEnergy", UpdateEnergy)

// Ability has been bought
net.Receive("AbilityBought", function(len)
	chat.AddText(Color(255, 255, 100), BOT_NAMES[math.random(1, #BOT_NAMES)], Color(255, 255, 255), ": You bought: ", Color(255, 0, 0), net.ReadString())
end)


// New binds
function GM:PlayerBindPress(pl, bind, pressed)
	if !sandboxMode then
	
		-- Random voice lines (For fun)
		if (bind == "+menu_context") && !game.SinglePlayer() then
			VoiceMenu(pl)
		end
		
		-- Lastinv is now binded to +menu
		if (bind == "+menu") then
			RunConsoleCommand("lastinv")
		end
	
	end
end


function VoiceMenu(pl)
	local voiceMenu = vgui.Create("DFrame")
	local voiceButton01 = vgui.Create("DButton")
	local voiceButton02 = vgui.Create("DButton")
	local voiceButton03 = vgui.Create("DButton")
	
	voiceButton01:SetText("Question")
	voiceButton01:SetParent(voiceMenu)
	voiceButton01:SetPos(25, 30)
	voiceButton01:SetSize(125, 30)
	voiceButton01.DoClick = function()
		if !delayVoiceLine then
			delayVoiceLine = true
			net.Start("PlayerCalledVoiceLine")
			net.SendToServer()
			timer.Simple(2, function() delayVoiceLine = false end)
		end
	end
	
	voiceButton02:SetText("Warning")
	voiceButton02:SetParent(voiceMenu)
	voiceButton02:SetPos(25, 65)
	voiceButton02:SetSize(125, 30)
	voiceButton02.DoClick = function()
		if !delayVoiceLine then
			delayVoiceLine = true
			net.Start("PlayerCalledWarning")
			net.SendToServer()
			timer.Simple(2, function() delayVoiceLine = false end)
		end
	end
	local _x, _y = voiceButton02:GetSize()
	
	voiceButton03:SetText("Cheers!")
	voiceButton03:SetParent(voiceMenu)
	voiceButton03:SetPos(25, 65+_y+5)
	voiceButton03:SetSize(125, 30)
	voiceButton03.DoClick = function()
		if !delayVoiceLine then
			delayVoiceLine = true
			net.Start("PlayerCalledCheer")
			net.SendToServer()
			timer.Simple(2, function() delayVoiceLine = false end)
		end
	end
	
	voiceMenu:SetSize(175, 250)
	
	voiceMenu:SetTitle("Voice Menu")
	voiceMenu:Center()
	voiceMenu:MakePopup()
end


local w, h = ScrW(), ScrH()
local text = {}
local math_clamp = math.Clamp
local math_round = math.Round
local math_sin = math.sin

PLACEMENT_MATERIAL = CreateMaterial("placement_mat", "VertexlitGeneric",
{
	["$basetexture"] = "Models/Debug/debugwhite",
	["$model"] = 1,
})

surface.CreateFont("MoneyFont", {
	font = "calibri24",
	size = ScreenScale(11),
	weight = 800,
	shadow = true,
})

surface.CreateFont("HealthFont", {
	font = "calibri24",
	size = ScreenScale(30),
	weight = 800,
	shadow = true,
})

surface.CreateFont("TimerTitleFont", {
	font = "calibri24",
	size = ScreenScale(10),
	weight = 800,
	shadow = true,
})

surface.CreateFont("TimerFont", {
	font = "calibri24",
	size = ScreenScale(20),
	weight = 800,
	shadow = true,
})

surface.CreateFont("SubFont", {
	font = "calibri24",
	size = ScreenScale(15),
	weight = 800,
	shadow = true,
})

surface.CreateFont("MessageFont", {
	font = "calibri24",
	size = 22,
	weight = 800,
	shadow = true,
})

surface.CreateFont("ObjectiveFont", {
	font = "calibri24",
	size = 44,
	weight = 800,
	shadow = true,
})

surface.CreateFont("PointmsgFont", {
	font = "calibri24",
	size = 20,
	weight = 800,
	shadow = true,
})

surface.CreateFont("WaypointFont", {
	font = "calibri24",
	size = 19,
	weight = 800,
	shadow = true,
})

surface.CreateFont("WaypointMeterFont", {
	font = "calibri24",
	size = 15,
	weight = 400,
	shadow = true,
})

oc.waypoints = oc.waypoints or {}
oc.pointmsgs = oc.pointmsgs or {}

netstream.Hook("ClearClientTables", function(data)
	for k, v in pairs(oc.waypoints) do
		v.curobj = false
	end
end)

netstream.Hook("oc.Waypoints", function(data)
	oc.waypoints = data
end)

netstream.Hook("oc.Pointmsgs", function(data)
	oc.pointmsgs = data
end)

netstream.Hook("oc.WaypointToggle", function(data)
	if !oc.waypoints[data[1]] then
		Error('Pointmsg Error: '..data[1]..' Objective Not Found.')
		return
	end
	oc.waypoints[data[1]].curobj = data[2]
end)

netstream.Hook("oc.PointmsgToggle", function(data)
	if !oc.pointmsgs[data] then
		Error('Objective Error: '..data..' Pointmsg Not Found.')
		return
	end
	oc.pointmsgs[data].nodisp = true
end)

netstream.Hook("SendNotify", function(data)
	AddNotice( data[1], data[2] )
end)

netstream.Hook("SendObjective", function(data)
	DisplayObjective( data[1], data[2] )
end)


netstream.Hook("SendPlaySound", function(data)
	surface.PlaySound(data)
end)

/*
netstream.Hook("MedicStationDisable", function(data)
	local ent, disable = data[1], data[2]
	
	ent.disable = disable
end)
*/
/*
netstream.Hook("GameLostMusic", function(data)
	local musictimer = data or 10
	local musicsound = CreateSound(LocalPlayer(), "music/radio1.mp3")
	musicsound:Play()
	timer.Simple(musictimer, function()
		musicsound:ChangeVolume(0, .1)
	end)
end)
*/
function CL_FT()
	return math.Clamp(FrameTime(), 1/(60*4), 1)
end

function AddNotice( str, t )
	surface.SetFont("MessageFont")
	local tw, th = surface.GetTextSize(str)
	surface.PlaySound("common/talk.wav")
	table.insert( text, {string=str, time=CurTime()+t, x=w/2-tw/2, y=h/4*3, alpha=0} )
end

local objstring = "Activate the button."
local objalpha = 0
local objtime = 0
function DisplayObjective( str, t )
	objstring = str
	objalpha = 0
	objtime = CurTime() + t
	surface.PlaySound("HL1/fvox/blip.wav")
end

local function textdisplay(ply)
	for k, v in ipairs(text) do
		
		if v.time < CurTime() then
			v.alpha = math_clamp(Lerp(CL_FT()*4, v.alpha, 0), 0, 255)	
			if v.alpha < 1 then
				table.remove( text, k )	
			end
		else
			v.alpha = math_clamp(Lerp(CL_FT()*3, v.alpha, 255), 0, 255)	
		end
		
		surface.SetFont("MessageFont")
		surface.SetTextColor(Color(255, 255, 255, v.alpha))
		local tw, th = surface.GetTextSize(v.string)
		
		v.x = Lerp(CL_FT()*5, v.x, w/2-tw/2)
		v.y = Lerp(CL_FT()*5, v.y, h/4*3-th/2 + k*th*1.2)
		surface.SetTextPos(math_round(v.x), math_round(v.y))
		
		surface.DrawText(v.string)
	end
end

local function objectivedisplay(ply)
	if objtime < CurTime() then
		objalpha = math_clamp(Lerp(CL_FT()*4, objalpha, 0), 0, 255)	
	else
		objalpha = math_clamp(Lerp(CL_FT()*3, objalpha, 255), 0, 255)	
	end
		
	surface.SetFont("ObjectiveFont")
	surface.SetTextColor(Color(255, 255, 255, objalpha))
	local tw, th = surface.GetTextSize(objstring)
	surface.SetTextPos(math_round(w/2-tw/2), math_round(h/3*1-th/2))
	surface.DrawText(objstring)
end

local icons = {
	[1] = surface.GetTextureID("vgui/notices/error"),
	[2] = surface.GetTextureID("vgui/notices/generic"),
	[3] = surface.GetTextureID("vgui/notices/hint"),
	[4] = surface.GetTextureID("vgui/notices/undo"),
	[5] = surface.GetTextureID("vgui/notices/cleanup"),
}

local function checkpointdisplay(ply)
	for k, v in pairs(oc.waypoints) do
		local sx, sy, visible = v.origin:ToScreen().x, v.origin:ToScreen().y,  v.origin:ToScreen().visible
		sx = math_clamp(sx, h*.1, w - h*.1)
		sy = math_clamp(sy, h*.1, h - h*.1)
		if v.curobj then
			surface.SetFont("WaypointFont")
			surface.SetTextColor(Color(255, 255, 255, 255))
			local tw, th = surface.GetTextSize(v.text or "")
			surface.SetTextPos(math_round(sx-tw/2), math_round(sy-th/2))
			surface.DrawText(v.text or "")


			surface.SetDrawColor(255, 255, 255, 200)
			surface.SetTexture(icons[v.image] or icons[2])
			surface.DrawTexturedRect(math_round(sx-16), math_round(sy-16) - th*1.4, 32, 32)

			surface.SetFont("WaypointMeterFont")
			local text = math_round(v.origin:Distance(ply:GetPos())/16) .. ' m'
			local tw, th = surface.GetTextSize(text)
			surface.SetTextPos(math_round(sx-tw/2), math_round(sy-th/2 + th*1.1))
			surface.DrawText(text)
		end
	end
end

local function pointmsgdisplay(ply)
	for k, v in pairs(oc.pointmsgs) do
		local sx, sy, visible = v.origin:ToScreen().x, v.origin:ToScreen().y,  v.origin:ToScreen().visible
		if visible and !v.nodisp then
			local col = v.textcolor or Color(255, 255, 255)
			col.a = math_clamp(v.radius + 255 - ply:GetPos():Distance(v.origin), 0, 255)

			surface.SetFont("PointmsgFont")
			surface.SetTextColor(col)
			local tw, th = surface.GetTextSize(v.message or "")
			surface.SetTextPos(math_round(sx-tw/2), math_round(sy-th/2))
			surface.DrawText(v.message or "")
		end
	end
end
/*
local function drawdot( pos, size, col )
	pos[1] = math_round( pos[1] )
	pos[2] = math_round( pos[2] )
	draw.RoundedBox( 0, pos[1] - size/2, pos[2] - size/2 , size, size, col[1] )
	size = size-2
	draw.RoundedBox( 0, pos[1] - size/2, pos[2] - size/2, size, size, col[2] )
end

local gap = 10
local oldhealth = 0
local oldmoney = 0
local moneytimer = CurTime()
local ticktimer = CurTime()
local moneypos = -20
local moneyalpha = 0
local tarhcol = {255, 255, 255}
local curhcol = {255, 255, 255}

local function playerhud(ply)

	if !ply:IsValid() then 
		return 
	end
	
	if ply:Alive() then

		if ply:Team() == TEAM_DEAD then
			surface.SetDrawColor(0, 0, 0)
			surface.DrawRect(0, 0, w, h*.08)

			surface.SetDrawColor(0, 0, 0)
			surface.DrawRect(0, h - h*.08 + 1, w, h*.08)

			surface.SetFont("TimerFont")
			surface.SetTextColor(Color(255, 255, 255, 255))
			local tw, th = surface.GetTextSize("Spectating")
			surface.SetTextPos(math_round(w*.03), math_round(h-th*1.15))
			surface.DrawText("Spectating")
		else
			local health = math_clamp(ply:Health(), 0, 100)

			if health < 30 then
				for i = 2, 3 do
					tarhcol[i] = 50 + math.abs(math.sin(RealTime()*10)*205)
				end	
			else
				tarhcol = {255, 255, 255}
			end

			if health ~= oldhealth then
				local diff = health - oldhealth
				if diff > 0 then
					curhcol[1] = 99
					curhcol[3] = 99
				else
					curhcol[2] = 0
					curhcol[3] = 0
				end
			end

			for i = 1, 3 do
				curhcol[i] = Lerp(CL_FT()*10, curhcol[i], tarhcol[i])	
			end

			surface.SetFont("HealthFont")
			surface.SetTextColor(Color(curhcol[1], curhcol[2], curhcol[3], 255))
			local tw, th = surface.GetTextSize(health)
			surface.SetTextPos(math_round(w*.03), math_round(h-th*1.1))
			surface.DrawText(health)

			oldhealth = health

			if ( ply.money or 0 ) ~= oldmoney then
				moneytimer = CurTime() + 3
				
				if ticktimer < CurTime() then
					surface.PlaySound("common/talk.wav")
					ticktimer = CurTime() + .05
				end
				
			end


			surface.SetFont("MoneyFont")
			local tw, th = surface.GetTextSize(oldmoney .. "$")

			if moneytimer > CurTime() then
				moneypos = Lerp(CL_FT()*2, moneypos, w*.02)
				moneyalpha = Lerp(CL_FT()*3, moneyalpha, 255)
			else
				moneyalpha = Lerp(CL_FT()*3, moneyalpha, 0)
				moneypos = Lerp(CL_FT()*3, moneypos, -tw)
			end

			oldmoney = math.ceil(math.Approach(oldmoney, ply:GetMoney() or 0, math.Clamp( CL_FT()*ply:GetMoney()/5, 10, math.huge )))

			surface.SetTextColor(Color(255, 255, 255, moneyalpha))
			surface.SetTextPos(math_round(moneypos), math_round(h/2-th/2))
			surface.DrawText(oldmoney .. "$")
		end
	end

	local wep = ply:GetActiveWeapon()
	if wep and wep:IsValid() then
		if wep:GetPrimaryAmmoType() ~= -1 then
			local ammo = wep:Clip1()
			if ammo > -1 then
				local reserves = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
				surface.SetFont("SubFont")
				surface.SetTextColor(Color(255, 255, 255, 255))
				local tw2, th2 = surface.GetTextSize(reserves)
				surface.SetTextPos(math_round(w - w*.02-tw2*1.2), math_round(h-th2*1.4))
				surface.DrawText(reserves)

				surface.SetFont("HealthFont")
				surface.SetTextColor(Color(255, 255, 255, 255))
				local tw, th = surface.GetTextSize(ammo)
				surface.SetTextPos(math_round(w - w*.02-tw2*1.6-tw), math_round(h-th*1.1))
				surface.DrawText(ammo)
			else
				local reserves = ply:GetAmmoCount(wep:GetPrimaryAmmoType())
				surface.SetFont("HealthFont")
				surface.SetTextColor(Color(255, 255, 255, 255))
				local tw, th = surface.GetTextSize(reserves)
				surface.SetTextPos(math_round(w - w*.02-tw*1.1), math_round(h-th*1.1))
				surface.DrawText(reserves)
			end
		end
	end

	local t = util.QuickTrace( ply:GetShootPos(), ply:GetAimVector() * 15000, ply )
	local pos = t.HitPos:ToScreen()
	local col = { color_black, color_white }

	if !wep.dt or wep.KeepCrosshair or !wep.dt.Aiming then
		drawdot( {pos.x, pos.y},4, col )
		drawdot( {pos.x + gap, pos.y},4, col )
		drawdot( {pos.x - gap, pos.y},4, col ) 
		drawdot( {pos.x, pos.y + gap * .8},4, col ) 
		drawdot( {pos.x, pos.y - gap * .8},4, col ) 
	end

end

local down_gradient = surface.GetTextureID("gui/gradient_down")
local mindist = 100
local function playerdisp(ply)
	for k, v in ipairs(player.GetAll()) do
		if v == ply then
			if !v:ShouldDrawLocalPlayer() then
				continue
			end
		end

		if v:Team() == TEAM_DEAD then
			continue
		end

		if ply:GetPos():Distance(v:GetPos()) > mindist * 10 then
			continue	
		end

		local bone, bpos
		local rag = v:GetRagdollEntity() or NULL
		if rag:IsValid() then
			bone = rag:LookupBone("ValveBiped.Bip01_Head1")
			bpos = bone and rag:GetBonePosition(bone)
		else
			bone = v:LookupBone("ValveBiped.Bip01_Head1")
			bpos = bone and v:GetBonePosition(bone)
		end

		bpos = bpos + Vector(0,0,15)
		local x, y, visible = bpos:ToScreen().x, bpos:ToScreen().y, bpos:ToScreen().visible
		local fov = 75/(ply:GetFOV())
		local scale = mindist/ply:EyePos():Distance(bpos)*fov
		local mx = Matrix()

		surface.SetFont("ObjectiveFont")
		local tx, ty = surface.GetTextSize(v:Name())

		mx:Translate(Vector(x - tx/2*scale, y, 1))
		mx:Scale(Vector(scale, scale, 1))

		cam.PushModelMatrix(mx)
			surface.SetTextPos(2, 2)
			surface.SetTextColor(color_black)
			surface.DrawText(v:Name())

			surface.SetTextPos(0, 0)
			surface.SetTextColor(color_white)
			surface.DrawText(v:Name())


			surface.SetDrawColor(150, 50, 50)
			surface.DrawRect(0, ty*.95, tx, 8)
			surface.SetDrawColor(222, 99, 99)
			surface.SetTexture(down_gradient)
			surface.DrawTexturedRect(0, ty*.95, tx, 8)

			local healthmul = math_clamp(v:Health(), 0, 100)/100
			surface.SetDrawColor(50, 150, 50)
			surface.DrawRect(0, ty*.95, tx*healthmul, 8)
			surface.SetDrawColor(99, 222, 99)
			surface.SetTexture(down_gradient)
			surface.DrawTexturedRect(0, ty*.95, tx*healthmul, 8)
		cam.PopModelMatrix()
	end
end
*/
local timertime = CurTime()
local timertitle = "Time Remaining"
local center_gradient = surface.GetTextureID("gui/center_gradient")
local ding = false
local tarcol = {255,255,255}
local curcol = {255,255,255}
local timeralpha = 0
local noshit = 0

function PushTimer(time, title)
	timertime = CurTime() + time
	tarcol = {255,255,255}
	curcol = {255,255,255}
	ding = false
	timeralpha = 0
	if title then
		timertitle = title
	else
		timertitle = "Time Remaining"
	end
end

netstream.Hook("PushTimer", function(data)
	PushTimer( data[1], data[2] )
end)

netstream.Hook("StopTimer", function(data)
	timertime = CurTime()
end)

local function drawtimer()
	local time = math_clamp(timertime - CurTime(), 0, math.huge)

	if time == 0 then
		if !ding then
			for i = 2, 3 do
				curcol[i] = 0
			end
			ding = true
		else
			noshit = 0
			for i = 1, 3 do
				if curcol[i] < 250 then
					continue
				else
					noshit = noshit + 1
				end
				if noshit == 3 then
					timeralpha = Lerp(CL_FT()*4,timeralpha,0)
				end
			end
		end	

		for i = 1, 3 do
			curcol[i] = Lerp(CL_FT()*5, curcol[i], tarcol[i])
		end
	else
		timeralpha = Lerp(CL_FT()*4,timeralpha,255)
	end

	surface.SetDrawColor(155, 155, 150, timeralpha)
	surface.SetTexture(center_gradient)
	surface.DrawTexturedRect(w/2-w*.2*.5, h*.005, w*.2, h*.09)

	local text = timertitle
	surface.SetFont("TimerTitleFont")
	surface.SetTextColor(Color(curcol[1], curcol[2], curcol[3], timeralpha))
	local tw, th = surface.GetTextSize(text)
	surface.SetTextPos(math_round(w/2-tw/2), math_round(h*.015))
	surface.DrawText(text)
	
	text = string.ToMinutesSecondsMilliseconds(time)
	surface.SetFont("TimerFont")
	surface.SetTextColor(Color(curcol[1], curcol[2], curcol[3], timeralpha))
	local tw2, th2 = surface.GetTextSize(text)
	surface.SetTextPos(math_round(w/2-tw2/2), math_round(h*.01+th))
	surface.DrawText(text)
end
/*
local down_gradient = surface.GetTextureID("gui/gradient_down")
local mindist = 100
local maxdist = 500
local function stuffdisp(ply)
	for k, v in ipairs(ents.GetAll()) do
		local stuffdat = MAP_ENTITY_TEXTS[v:GetClass()]

		if !stuffdat then 
			continue
		end
		
		if ply:GetPos():Distance(v:GetPos()) > mindist * 10 then
			continue	
		end

		local nametext = stuffdat.name
		bpos = stuffdat.pos and stuffdat.pos(v) or v:GetPos()

		local x, y, visible = bpos:ToScreen().x, bpos:ToScreen().y, bpos:ToScreen().visible
		local fov = 90/ply:GetFOV()
		local scale = mindist/ply:EyePos():Distance(bpos)*fov
		local alpha = math_clamp( 255 + maxdist - ply:EyePos():Distance(bpos), 0, 255 )
		local mx = Matrix()

		if alpha == 0 then
			continue
		end

		surface.SetFont("ObjectiveFont")
		local tx, ty = surface.GetTextSize(nametext)

		mx:Translate(Vector(x - tx/2*scale, y, 1))
		mx:Scale(Vector(scale, scale, 1))

		cam.PushModelMatrix(mx)
			surface.SetTextPos(2, 2)
			surface.SetTextColor(Color(0,0,0,alpha))
			surface.DrawText(nametext)

			surface.SetTextPos(0, 0)
			surface.SetTextColor(Color(255,255,255,alpha))
			surface.DrawText(nametext)
		cam.PopModelMatrix()
	end
end

local screenalpha = 0
local screencol = {255,255,255}
local fadespeed = 3

netstream.Hook("PushFlash", function(data)
	local alpha, sccolor, fs = data[1], data[2], data[3]

	if alpha and sccolor then
		screenalpha = 255
		screencol[1] = sccolor.r; screencol[2] = sccolor.g; screencol[3] = sccolor.b;
		fadespeed = fs or 5
	end
end)

local function screenflash()

	if screenalpha > 0 then
		screenalpha = Lerp(math_clamp(CL_FT(), 1/120, 1)*fadespeed, screenalpha, 0)

		surface.SetDrawColor(screencol[1], screencol[2], screencol[3], screenalpha)
		surface.DrawRect(0, 0, w, h)
	end
end
*/
/*
function GM:HUDShouldDraw(element)
	if (element == "CHudHealth" or element == "CHudBattery" or element == "CHudAmmo" or element == "CHudSecondaryAmmo") then
		return false
	end
	
	if (element == "CHudCrosshair") then
		return false
	end

	return true
end

function GM:HUDAmmoPickedUp( name, amount )
	AddNotice( Format(lang.ammopickup, amount, name), 2.5 )
end

function GM:HUDWeaponPickedUp()
end
*/
hook.Add("HUDPaint", "coopHUDPaint", function()
	local ply = LocalPlayer()
	textdisplay(ply)
	objectivedisplay(ply)
	checkpointdisplay(ply)
	pointmsgdisplay(ply)
	--playerhud(ply)
	--playerdisp(ply)
	--stuffdisp(ply)
	--screenflash()
	drawtimer()
end)
AdminMenu= nil
net.Receive("Admin_Menu_Open", function()
	if ( !AdminMenu ) then
		
		AdminMenu = vgui.Create("hl2c_admin_menu")
		AdminMenu:SetVisible(true)
		-- gui.EnableScreenClicker(false)
	elseif(AdminMenu:IsVisible()) then
		-- AdminMenu:Remove()
		-- AdminMenu=nil
		AdminMenu:SetVisible(false)
		-- gui.EnableScreenClicker(true)
	else
		AdminMenu:SetVisible(true)
		-- gui.EnableScreenClicker(false)
	end
	
end)



surface.CreateFont( "BuyFont",
	{
		font      = "Coolvetica",
		size      = 36,
		weight    = 400
	}
	)
hook.Add("HUDPaint", "customHUDPaint", function()
	local tbl_ = {
	{ x = 0 - ScreenScale(45), y = ScrH() - ScreenScale(45)},
	{ x = ScrW() , y = ScrH() - ScreenScale(45)},
	{ x = ScrW(), y = ScrH() },
	{ x = 0, y = ScrH() },
	}
	/*
	local ply = LocalPlayer()
	
	surface.SetDrawColor( 0, 0, 0, 150 )
	draw.NoTexture()
	surface.DrawPoly( tbl_ )
	*/
	
	--surface.SetDrawColor( Color( 255, 255, 255, 255 ) )
	--surface.DrawOutlinedRect( 0, 0, 100, 100 )
	
	
	
	
	/*
	tex = surface.GetTextureID( "vgui/white" )
	
	surface.SetDrawColor( 133, 0, 0, 255 )
	tbl = { {}, {}, {}, {} }
	tbl[1]["x"] = 130 
	tbl[1]["y"] = 110
	tbl[2]["x"] = 230
	tbl[2]["y"] = 110
	tbl[3]["x"] = 230
	tbl[3]["y"] = 150
	tbl[4]["x"] = 110
	tbl[4]["y"] = 150
	surface.SetTexture( tex )
	surface.DrawPoly( tbl )
	draw.SimpleText( "BUY", "BuyFont", 145, 115, Color(255,255,255,255) )
*/
end)

-- Viewmodel View
local BOBTIME = 0
local LAST_BOBTIME = CurTime()
local HL2_BOB_CYCLE_MAX = 0.40
local HL2_BOB_UP = 0.5
local MAX_SPEED = 320
local PI = math.pi
local PLAYER_SPEED = 0

local host_timescale = GetConVar("host_timescale")
local function GetTimeScale()
	if host_timescale:GetFloat() ~= 1 then
		return host_timescale:GetFloat()
	end
	return game.GetTimeScale()
end

function GM:CalcViewModelBob( wep, vm, oldPos, oldAng, pos, ang )

	local ply = LocalPlayer()

	local dt = SysTime() - (self.LastViewBob or SysTime())
	self.LastViewBob = SysTime()

	if dt >= 1/60 then
		dt = 1/60
	end

	dt = dt * GetTimeScale()

	local speed = Lerp(dt * 10, PLAYER_SPEED, ply:GetVelocity():Length2D())
	PLAYER_SPEED = speed

	speed = math.Clamp(speed, -MAX_SPEED, MAX_SPEED)

	-- NOTE: Using 0.0 instead of 0.1 causes weird behavior, hl2 uses 0.0 but lets not make it uglier than required.
	local bob_offset = math.Remap(speed, 0, MAX_SPEED, 0.0, 1.0)

	BOBTIME = BOBTIME + (dt * 1.3) * bob_offset
	LAST_BOBTIME = BOBTIME

	local cycle = BOBTIME - math.Round(BOBTIME / HL2_BOB_CYCLE_MAX, 0) * HL2_BOB_CYCLE_MAX
	cycle = cycle / HL2_BOB_CYCLE_MAX

	if cycle < HL2_BOB_UP then
		cycle = PI * (cycle / HL2_BOB_UP)
	else
		cycle = PI + PI * ((cycle - HL2_BOB_UP) / (1.0 - HL2_BOB_UP))
	end

	local vertBob = speed * 0.005
	vertBob = vertBob * 0.3 + vertBob * 0.7 * math.sin(cycle)
	vertBob = math.Clamp(vertBob, -7.0, 4.0)

	cycle = BOBTIME - math.Round(BOBTIME / HL2_BOB_CYCLE_MAX * 2, 0) * HL2_BOB_CYCLE_MAX * 2
	cycle = cycle / (HL2_BOB_CYCLE_MAX * 2)

	if cycle < HL2_BOB_UP then
		cycle = PI * (cycle / HL2_BOB_UP)
	else
		cycle = PI + PI * (cycle - HL2_BOB_UP) / (1.0 - HL2_BOB_UP)
	end

	local lateralBob = speed * 0.005
	lateralBob = lateralBob * 0.3 + lateralBob * 0.7 * math.sin(cycle)
	lateralBob = math.Clamp(lateralBob, -7.0, 4.0)

	local fwd = oldAng:Forward()
	local right = oldAng:Right()

	local newPos = oldPos + (fwd * (vertBob * 0.1))
	newPos.z = newPos.z + (vertBob * 0.1)

	local newAng = oldAng
	newAng.roll = newAng.roll + (vertBob * 0.5)
	newAng.pitch = newAng.pitch - (vertBob * 0.4)
	newAng.yaw = newAng.yaw - (lateralBob * 0.3)

	newPos = newPos + (right * (lateralBob * 0.8))

	return newPos, newAng

end

local LastFacing = Vector(0, 0, 0)
local MaxViewModelLag = 0.4

function GM:CalcViewModelLag( wep, vm, oldPos, oldAng, pos, ang )

	local fwd = oldAng:Forward()

	local newPos = oldPos
	local newAng = oldAng

	local dt = SysTime() - (self.LastViewLag or SysTime())
	self.LastViewLag = SysTime()

	if dt >= 1/60 then
		dt = 1/60
	end

	dt = dt * GetTimeScale()

	local frameTime = dt
	if frameTime ~= 0.0 then

		local diff = fwd - LastFacing
		local speed = 0.8

		local len = diff:Length()
		if len > MaxViewModelLag and MaxViewModelLag > 0.0 then
			local scale = len / MaxViewModelLag
			speed = speed * scale
		end

		LastFacing = LastFacing + (diff * (speed * frameTime))

		LastFacing:Normalize()

		newPos = oldPos + (diff * -1.3 * speed)

	end

	local up = oldAng:Up()
	local right = oldAng:Right()

	local pitch = oldAng.pitch
	if pitch > 180 then
		pitch = pitch - 360
	elseif pitch < -180 then
		pitch = pitch + 360
	end

	newPos = newPos + (fwd * (-pitch * 0.035))
	newPos = newPos + (right * (-pitch * 0.03))
	newPos = newPos + (up * (-pitch * 0.03))

	return newPos, newAng

end

local HEAD_POS
local HEAD_POS_DELTA = Vector(0, 0, 0)

function GM:CalcViewModelView( wep, vm, oldPos, oldAng, pos, ang )

	if not IsValid( wep ) then
		 return
	 end

	local vm_origin, vm_angles = pos, ang
	local modified = false

	-- Controls the position of all viewmodels
	local func = wep.GetViewModelPosition
	if ( func ) then
		local pos, ang = func(wep, pos * 1, ang * 1)
		vm_origin = pos or vm_origin
		vm_angles = ang or vm_angles
		modified = true
	end

	-- Controls the position of individual viewmodels
	func = wep.CalcViewModelView
	if ( func ) then
		local pos, ang = func(wep, ViewModel, oldPos * 1, oldAng * 1, pos * 1, ang * 1)
		vm_origin = pos or vm_origin
		vm_angles = ang or vm_angles
		modified = true
	end

	-- Lets not mess with custom stuff
	if modified then
		return vm_origin, vm_angles
	end

	local newPos = oldPos
	newPos = newPos + HEAD_POS_DELTA
	local newAng = oldAng

	newPos, newAng = self:CalcViewModelBob(wep, vm, newPos, newAng, pos, ang)
	newPos, newAng = self:CalcViewModelLag(wep, vm, newPos, newAng, pos, ang)

	return newPos, newAng

end

function GM:CalcView(ply, pos, ang, fov, nearZ, farZ)

	local view = {}
	view.origin = pos --+ Vector(0,-10,5)
	view.ang = ang
	view.fov = fov
	view.angles = ang
	if ply:Team() == TEAM_ALIVE or ply:Team() == TEAM_COMBINE then
	local headBone = ply:LookupBone("ValveBiped.Bip01_Head1")
	local headPos
	if headBone ~= nil then
		-- print(true)
		if LocalPlayer():InVehicle() then
	 	headPos = ply:GetBonePosition(headBone) --+ Vector(0,0,300)
		-- print(headPos)
		else
	 	headPos = ply:GetBonePosition(headBone)
		end
		-- print(headPos)
	else
		headPos = ply:EyePos()
	end

	local t = RealFrameTime() * 15

	HEAD_POS = LerpVector(t, HEAD_POS or headPos, headPos)

	local deltaX = (HEAD_POS.x - view.origin.x) * 0.09
	local deltaY = (HEAD_POS.y - view.origin.y) * 0.05
	local deltaZ = (HEAD_POS.z - view.origin.z) * 0.16
	

	if ply:Team() != 1 then
		HEAD_POS_DELTA = Vector(deltaX, deltaY, deltaZ)
	else
		HEAD_POS_DELTA = Vector(0, 0, 0)
	end
	end
	view.origin = view.origin + HEAD_POS_DELTA

	return view

end

function GM:ShouldDrawLocalPlayer(ply)

	local vehicle = ply:GetVehicle()
	if vehicle ~= nil and IsValid(vehicle) then
		local class = vehicle:GetClass()
		if class == "prop_vehicle_jeep" or class == "prop_vehicle_airboat" then
			ply.VehicleSteeringView = true
			if ply.myhead then ply.myhead:SetNoDraw(true) end
			return false
		end
	else
		ply.VehicleSteeringView = false
	end
end

function GM:RenderSprintEffect(ply)
	
	self.TargetMotionBlur = self.TargetMotionBlur or 0.0
	
	local vel = Vector(0, 0, 0)
	if ply:InVehicle() then
		local veh = ply:GetVehicle()
		if IsValid(veh) then
			vel = veh:GetVelocity()
		end
	else
		vel = ply:GetVelocity()
 	end
	
	local len = vel:Length2DSqr()
	local amount = 0
	if len > 1 then
		amount = math.log(len * len)
	end
	
	self.TargetMotionBlur = math.Approach(self.TargetMotionBlur, 8 + amount, RealFrameTime() * 15)
	
	DrawToyTown( 1, self.TargetMotionBlur * 8 )
	
end

function GM:RenderScreenspaceEffects()

	local ply = LocalPlayer()
	if not IsValid(ply) then
		return
	end

	-- if lambda_postprocess:GetBool() == false then
		-- return
	-- end

	-- self:RenderRadiationEffects(ply)
	self:RenderSprintEffect(ply)

end

/*
hook.Add( "HUDPaint", "PolyTest", function( )
	local myMat = Material( "vgui/white" );
	local _h = ScrH( ) - 50
	local _w = ScrW( ) / 2
	local _poly = {
		{ x = 0, y = _h, u = 0, v = 0 },					// This is 1
		{ x = _w / 2, y = _h, u = 0, v = 0 },				// 2
		{ x = _w / 2 + 15, y = _h+15, u = 0, v = 0 },		// 3
		{ x = _w - 15, y = _h+15, u = 0, v = 0 },			// 4
		{ x = _w, y = _h+15+15, u = 0, v = 0 },			// 5
		{ x = _w, y = _h + 50, u = 0, v = 0 },			// 6
		{ x = 0, y = _h + 50, u = 0, v = 0 },				// 7
	};
	surface.SetTexture( tex )
	surface.SetDrawColor( Color( 255, 255, 255, 100 ) )
	surface.DrawPoly( _poly )
	
end)
*/
/*
function draw.Circle( x, y, radius, seg )
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is need for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )
end

hook.Add( "HUDPaint", "PolygonCircleTest", function()

	surface.SetDrawColor( 0, 0, 0, 200 )
	draw.NoTexture()
	draw.Circle( ScrW() / 2, ScrH() / 2, 200, math.sin( CurTime() ) * 20 + 25 )

	--Usage:
	--draw.Circle( x, y, radius, segments )

end )

*/


include("db/cl_init.lua")
-- Database()