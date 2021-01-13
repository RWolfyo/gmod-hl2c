function Hl2c.CombineLoyal()
	HL2C_COMBINE_EVENT = true
	-- PrintMessage(HUD_PRINTTALK, "[Combine] Be loyal! ( !combine )")
	Hl2c.DefaultChatPrint("[Combine] Be loyal! ( !combine )")
end
function Hl2c.CombineLoyalOver()
	HL2C_COMBINE_EVENT = false
	for k, v in pairs(player.GetAll()) do
		
		if IsValid(v) and v:Team() == TEAM_COMBINE then
			v:SetTeam(TEAM_ALIVE)
			v:KillSilent()
			v:Spawn()
		end
		if IsValid(v) and v:Team() == TEAM_COMBINE_DEAD then
			v:SetTeam(TEAM_DEAD)
		end
		
	end
	-- PrintMessage(HUD_PRINTTALK, "[Combine] Combine threat over")
	Hl2c.DefaultChatPrint("[Combine] Combine threat over")
end
function Hl2c.AddCombineLoyalSpawn(vector)
	if isvector(vector) then else return end
	local ent = ents.Create("info_player_combine")
	ent:SetPos( vector )
	ent:Spawn()
	ent:Activate()

end
function Hl2c.RemoveCombineLoyalSpawns()
	for k, v in pairs(ents.FindByClass("info_player_combine")) do
	v:Remove()
	end

end

function Hl2c.ChatSend_MapEndTouch(name,time,count,max,score,died)
	local message = ""
	if died then
		message = tostring(name).." completed the map (".. tostring(time) ..") ["..tostring(count).." of "..tostring(max).."] (+No Death)"
	else
		message = tostring(name).." completed the map (".. tostring(time) ..") ["..tostring(count).." of "..tostring(max).."] "
	end
	-- print(message)
	-- message = tostring(name).." completed the map (".. tostring(time) ..") ["..tostring(count).." of "..tostring(max).."]"
	net.Start( "MapEndTouchPrintChat" )
		net.WriteString( message )
	net.Broadcast()
	-- umsg.Start("Hl2c.MapEndTouch.Chat.Print")
		-- umsg.String(message)
	-- umsg.End()
end

function Hl2c.DefaultChatPrint(text)
	local message = tostring(text)
	-- print(message)
	net.Start( "DefaultChatPrint_Net" )
		net.WriteString( message )
	net.Broadcast()
	-- umsg.Start("Hl2c.MapEndTouch.Chat.Print")
		-- umsg.String(message)
	-- umsg.End()
end

function Hl2c.PersonDefaultChatPrint(text,pl)
	local message = tostring(text)
	-- print(message)
	net.Start( "Person_DefaultChatPrint_Net" )
		net.WriteString( message )
	net.Send(pl)
	-- umsg.Start("Hl2c.MapEndTouch.Chat.Print")
		-- umsg.String(message)
	-- umsg.End()
end

function Hl2c.Achievement_Notify_V1(id,pl)
	-- local message = tostring(text)
	-- print(message)
	net.Start( "Achievement_Notify_V1" )
		net.WriteString( id )
	-- net.Broadcast()
	net.Send(pl)
	-- umsg.Start("Hl2c.MapEndTouch.Chat.Print")
		-- umsg.String(message)
	-- umsg.End()
	
	local message = id
	local title = ""
	if HL2_ACH_LIST_TITLE[message] then
	title = HL2_ACH_LIST_TITLE[message]
	-- image = HL2_ACH_LIST_MAT[message]
	elseif EP1_ACH_LIST_TITLE[message] then
	title = EP1_ACH_LIST_TITLE[message]
	-- image = EP1_ACH_LIST_MAT[message]
	elseif EP2_ACH_LIST_TITLE[message] then
	title = EP2_ACH_LIST_TITLE[message]
	-- image = EP2_ACH_LIST_MAT[message]
	elseif GEN_ACH_LIST_TITLE[message] then
	title = GEN_ACH_LIST_TITLE[message]
	-- image = GEN_ACH_LIST_MAT[message]
	elseif message == SECRET_ACHIEVEMENT_HL2_ID then
		title = SECRET_ACHIEVEMENT_HL2_TITLE
		-- image = SECRET_ACHIEVEMENT_HL2_MATERIAL
	elseif message == SECRET_ACHIEVEMENT_LT_ID then
		title = SECRET_ACHIEVEMENT_LT_TITLE
		-- image = SECRET_ACHIEVEMENT_LT_MATERIAL
	elseif message == SECRET_ACHIEVEMENT_EP2_ID	then
		title=SECRET_ACHIEVEMENT_EP2_TITLE
	elseif message == SECRET_ACHIEVEMENT_MASK1_ID then
		title = SECRET_ACHIEVEMENT_MASK1_TITLE
	elseif HL2_LAMDACACHE_TEXT[message] then
		title="Hl2 Lambda Cache"
	elseif EP2_WEBCACHE_TEXT[message] then
		title="Ep2 Web Cache"
	elseif EP2_RADARCACHE_TEXT[message] then
		title="Ep2 Radar Cache"
		-- image = SECRET_ACHIEVEMENT_MASK1_MATERIAL
	elseif string.Left(message,2) == "v_" then
		-- image = "vgui/achievements/hl2_beat_game"
		-- unlock = "Vortex Found!"
		title = title .. "v_"
		title = title .. string.Right(message,#message -2)
	end
	
	if DISCORD_onPlayerAch then DISCORD_onPlayerAch(pl,title) end
end


function Hl2c.TargetBarUpdate(pl,ent)
	if IsValid(pl) and IsValid(ent) then else return end
	-- if pl:Team() != TEAM_ALIVE or pl:Team() != TEAM_COMBINE then return end
	-- umsg.Start("Hl2c.OnHit.NPC.TargetBarUpdate",pl)
		-- umsg.Short( ent:EntIndex() )
		-- umsg.Short( ent:Health() )
		-- umsg.Short( ent:GetMaxHealth() )
		-- umsg.String( ent:GetClass() )
	-- umsg.End()
	-- print(ent:EntIndex())
	-- print("Called")
	net.Start("Hl2c.UpdateTargetBar")
		net.WriteInt( ent:EntIndex(),10 )
		net.WriteInt( ent:Health(),15 )
		net.WriteInt( ent:GetMaxHealth(),15 )
		net.WriteString( ent:GetClass() )
	net.Send(pl)
end


function Hl2c.GetMapID_ByName(pl,name)
	if IsValid(pl) then else return end
	if isstring(name) then else return end
	if pl:IsSuperAdmin() or pl:IsUserGroup("Testers") or pl:IsUserGroup("Owner") or pl:IsUserGroup("Advisor") then else return end
	
	local result = 0
	pl:PrintMessage( HUD_PRINTCONSOLE, "-------------------------" )
	for k, v in pairs(ents.FindByName(name)) do
		
		pl:PrintMessage( HUD_PRINTCONSOLE, "- ".. tostring(v) ..": ".. tostring( v:MapCreationID() ) )
		result = result + 1
	end
	if result == 0 then
		pl:PrintMessage( HUD_PRINTCONSOLE, "- No Result" )
	end
	pl:PrintMessage( HUD_PRINTCONSOLE, "-------------------------" )
end

function Hl2c.FireByMapIDEnt(pl,id,inp)
	if IsValid(pl) then else return end
	if isnumber(id) then else return end
	if isstring(inp) then else return end
	if pl:IsSuperAdmin() or pl:IsUserGroup("Testers") or pl:IsUserGroup("Owner") or pl:IsUserGroup("Advisor") then else return end
	-- print("working")
	for k, v in pairs(ents.GetAll()) do
		if v:MapCreationID() == id then
			ents.GetMapCreatedEntity(id):Fire(inp,"",0)
		end
	end
end

function Hl2c.PlayerGiveCurrentAmmo(pl)
	if IsValid(pl) and 
	pl:Alive() and 
	( pl:Team() == TEAM_ALIVE or pl:Team() == TEAM_COMBINE ) and 
	IsValid(pl:GetActiveWeapon()) and 
	isnumber(pl:GetActiveWeapon():GetPrimaryAmmoType()) and
	pl:GetActiveWeapon():GetPrimaryAmmoType() > 0
	then
		pl:SetAmmo(999,pl:GetActiveWeapon():GetPrimaryAmmoType())
	end
	if IsValid(pl) and 
	pl:Alive() and 
	( pl:Team() == TEAM_ALIVE or pl:Team() == TEAM_COMBINE ) and 
	IsValid(pl:GetActiveWeapon()) and 
	isnumber(pl:GetActiveWeapon():GetSecondaryAmmoType()) and
	pl:GetActiveWeapon():GetSecondaryAmmoType() > 0
	then
		pl:SetAmmo(999,pl:GetActiveWeapon():GetSecondaryAmmoType())
	end
end

--[[---------------------------------------------------------
	A function that helps us to find entities then use input for them.
-----------------------------------------------------------]]
--ply:IsUserGroup("protected")
function Hl2c.EntityFinder(ply,tipo,name,inpt)
	if ply:IsSuperAdmin() or ply:IsUserGroup("Testers") or ply:IsUserGroup("Owner") or ply:IsUserGroup("Advisor") then else return end
	--DbgPrint("Hi")
	for k, v in pairs( ents.FindByName(name) ) do
		v:Fire(inpt)
	end
end