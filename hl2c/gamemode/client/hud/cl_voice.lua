local Voice = {}
Voice.Speakers = {}

function Hl2c.GetVoiceSpace()
	return 70, 6+(68*#Voice.Speakers)
end

function Voice.PlayerStartVoice(pl)
	local b = true
	-- print("Happen?")
	if (not pl.GetName) then return true end -- we have probably not initialized fully yet
	
	local name = pl:GetName()
	
	if (true) then -- otherwise morbus' will be broken
		-- if GetRoundState() == ROUND_ACTIVE then
			-- name = pl:GetFName()
		-- end
		if LocalPlayer() == pl then
			-- if LocalPlayer():IsActiveAlien() then
				-- if (not LocalPlayer():KeyDown(IN_ZOOM)) and (not LocalPlayer():KeyDownLast(IN_ZOOM)) then
					-- LocalPlayer().alien_voice = true
					-- RunConsoleCommand("morbus_alien_voice", "1")
				-- else
					-- LocalPlayer().alien_voice = false
					-- RunConsoleCommand("morbus_alien_voice", "0")
				-- end
			-- end
			-- if ((LocalPlayer():GetNWBool("alienform",false) == true) && LocalPlayer():IsActiveAlien()) || LocalPlayer():IsActiveSwarm() then
				-- LocalPlayer().alien_voice = false
				-- RunConsoleCommand("morbus_alien_voice", "0")
			-- end
		end
		pl.PlayerColor = nil
		if (true) --LocalPlayer():IsActiveAlien() 
		then
			if pl == LocalPlayer() then
				if not LocalPlayer().alien_voice then
					pl.PlayerColor = {210, 0, 0}
				end
			-- elseif pl:IsActiveAlien() then
				-- if not pl.alien_voice then
					-- pl.PlayerColor = {200, 0, 0}
				-- end
			-- elseif pl:IsSwarm() then
				-- pl.PlayerColor = {200,0,0}
			end
		end
	end
   
	for k,v in pairs(Voice.Speakers) do
		if (v.Player && v.Player:IsValid() && v.Player == pl) then
			b = false
			v.FadeAway = nil
			v.Name = name
			break
		end
	end
	if (b) then
		local lines = {}
		local width = 160
		for i=1,width do
			table.insert(lines, 0)
		end
		table.insert(Voice.Speakers, {Player = pl, Lines = lines, NewLine = 0, Width = width, Alpha = 0, PosY = 6+(68*#Voice.Speakers), Name = name})
	end
	return true -- Block everything else
end

function Voice.PlayerEndVoice(pl)
	for k,v in pairs(Voice.Speakers) do
		if (v.Player && v.Player:IsValid() && v.Player == pl) then
			v.FadeAway = CurTime() + 1
			break
		end
	end
end

function Voice.PlayerID(um)
	local e = um:ReadEntity()
	local b = um:ReadBool()
	e.Mutable = b
end
usermessage.Hook("Administrator.Voice.IsMutable", Voice.PlayerID)

function Voice.MutePlayer(um)
	local e = um:ReadEntity()
	e:SetMuted(not e:IsMuted())
end
usermessage.Hook("Administrator.Voice.SetMuted", Voice.MutePlayer)

function Voice.PostRenderVGUI()
	local rem = -1
	local xPos = 70 -- ScrW()-166 Right Corner 70 Left Corner
	for k,v in pairs(Voice.Speakers) do
		if !v.FadeAway && !(v.Player && v.Player:IsValid()) then
			v.FadeAway = CurTime() + 2
		end
		if (!v.SteamAvatar) then
			if (false)--(GetRoundState && GetRoundState() == ROUND_ACTIVE) 
			then
				v.SteamAvatar = vgui.Create("SpawnIcon")
				v.SteamAvatar:SetSize(64, 64)
				v.SteamAvatar:SetModel(v.Player:GetModel())
			else
				v.SteamAvatar = vgui.Create("AvatarImage")
				v.SteamAvatar:SetSize(64, 64)
				v.SteamAvatar:SetPlayer(v.Player, 64)
			end
		end
		if (v.FadeAway && v.FadeAway < CurTime()) then
			v.Alpha = v.Alpha + ((000-v.Alpha) * 5 * FrameTime())
			if (math.floor(v.Alpha) == 0) then
				rem = k
				v.SteamAvatar:Remove()
				v.SteamAvatar = nil
			end
		else
			v.Alpha = v.Alpha + ((192-v.Alpha) * 5 * FrameTime())
		end
		v.PosY = v.PosY + (((6+(68*(k-1))-v.PosY)) * 5 * FrameTime())
		if (v.SteamAvatar) then
			v.SteamAvatar:SetPos(xPos-64, v.PosY)
			v.SteamAvatar:SetAlpha(v.Alpha)
		end
		local extra = 0
		-- if (v.Player && v.Player:IsValid() && v.Player.Mutable) then
		if (v.Player && v.Player:IsValid() ) then
			extra = 64
		end
		draw.RoundedBox(4, xPos-64, v.PosY, v.Width+64+extra, 64, Color(0, 0, 0, v.Alpha))
		if (v.Player && v.Player:IsValid()) then
			if (true)--(v.Player.Mutable) 
			then
				draw.DrawText("!p ".."Lmute", "TargetIDSmall", xPos+v.Width+34, v.PosY+16, Color(255, 255, 255, v.Alpha), TEXT_ALIGN_CENTER)
				-- draw.DrawText("#".."Lmute", "TargetIDSmall", xPos+v.Width+34, v.PosY+16, Color(255, 255, 255, v.Alpha), TEXT_ALIGN_CENTER)
				draw.DrawText("#"..v.Player:UserID(), "TargetIDSmall", xPos+v.Width+34, v.PosY+32, Color(255, 255, 255, v.Alpha), TEXT_ALIGN_CENTER)
			elseif (!v.Player.IDRequested) then
				-- net.Start("Administrator.Voice.RequestMutable")
				-- net.WriteUInt(v.Player:UserID(), 32)
				-- net.SendToServer()
				-- v.Player.IDRequested = true
			end
		end
		render.SetScissorRect(xPos, v.PosY, xPos+v.Width, v.PosY+64, true)
		draw.DrawText(v.Name, "HudHintTextLarge", xPos+2, v.PosY, Color(255, 255, 255, v.Alpha), TEXT_ALIGN_LEFT)
		render.SetScissorRect(xPos, v.PosY, xPos+v.Width, v.PosY+64, false)
		local color = Color(33, 174, 209, v.Alpha)
		if (v.Player && v.Player:IsValid() && v.Player.PlayerColor) then
			color = Color(v.Player.PlayerColor[1], v.Player.PlayerColor[2], v.Player.PlayerColor[3], v.Alpha)
		end
		surface.SetDrawColor(color)
		surface.DrawLine(xPos+v.Width-1, v.PosY+1, xPos+v.Width-1, v.PosY+62)
		for k2=1,#v.Lines-1 do
			local v2 = v.Lines[k2]
			local v3 = v.Lines[k2+1]
			surface.DrawLine(xPos+(k2-1), v.PosY+(64-(v2*48))-2, xPos+k2, v.PosY+(64-(v3*48))-2)
		end
		if (v.NewLine >= 1) then
			for i=1,math.floor(v.NewLine) do
				if (v.Player && v.Player:IsValid()) then
					table.insert(v.Lines, v.Player:VoiceVolume())
				else
					table.insert(v.Lines, 0)
				end
				if #v.Lines > v.Width then
					table.remove(v.Lines, 1)
				end
				v.NewLine = v.NewLine - 1
			end
		end
		v.NewLine = v.NewLine + (100*FrameTime())
	end
	if (rem ~= -1) then table.remove(Voice.Speakers, rem) end
end

hook.Add("PlayerStartVoice", "Voice.PlayerStartVoice", Voice.PlayerStartVoice)
hook.Add("PlayerEndVoice", "Voice.PlayerEndVoice", Voice.PlayerEndVoice)
hook.Add("PostRenderVGUI", "Voice.PostRenderVGUI", Voice.PostRenderVGUI)