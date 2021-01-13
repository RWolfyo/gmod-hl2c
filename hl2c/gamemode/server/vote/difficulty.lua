local oldPrint = print
local function print(...)
	-- oldPrint(...)
end

--util.AddNetworkString("Diff.Vote")
local last_diff = -1
--local selected_diff = -1
Hl2c.Diff_Selected = Hl2c.Diff_Selected or -1
Hl2c.VoteStarted = Hl2c.VoteStarted or false
Hl2c.CAN_VOTE = 0
Hl2c.ALREADY_VOTED = Hl2c.ALREADY_VOTED or false
Hl2c.Diff_Voted_players = {}
Hl2c.Diff_WantStart_players = Hl2c.Diff_WantStart_players or {}

Hl2c.Diff_Voted_List = {}
Hl2c.Diff_Voted_List[0] = 0 -- easy
Hl2c.Diff_Voted_List[1] = 0 -- normal
Hl2c.Diff_Voted_List[2] = 0 -- hard
-- Hl2c.Diff_Voted_List[3] = 0 -- insane
-- Hl2c.Diff_Voted_List[4] = 0 -- nightmare
-- Hl2c.Diff_Voted_List[5] = 0 -- inferno
-- Hl2c.Diff_Voted_List[6] = 0 -- ml1
-- Hl2c.Diff_Voted_List[7] = 0 -- ml2
-- Hl2c.Diff_Voted_List[8] = 0 -- ml3
-- Hl2c.Diff_Voted_List[9] = 0 -- ml4
-- Hl2c.Diff_Voted_List[10] = 0 -- ml5
-- Hl2c.Diff_Voted_List[11] = 0 -- ml6

function Hl2c.Diff_TableReset()
	Hl2c.Diff_Voted_players = {}
	Hl2c.Diff_Voted_List[0] = 0 -- easy
	Hl2c.Diff_Voted_List[1] = 0 -- normal
	Hl2c.Diff_Voted_List[2] = 0 -- hard
	-- Hl2c.Diff_Voted_List[3] = 0 -- insane
	-- Hl2c.Diff_Voted_List[4] = 0 -- nightmare
	-- Hl2c.Diff_Voted_List[5] = 0 -- inferno
	-- Hl2c.Diff_Voted_List[6] = 0 -- ml1
	-- Hl2c.Diff_Voted_List[7] = 0 -- ml2
	-- Hl2c.Diff_Voted_List[8] = 0 -- ml3
	
	-- Hl2c.Diff_Voted_List[9] = 0 -- ml4
	-- Hl2c.Diff_Voted_List[10] = 0 -- ml5
	-- Hl2c.Diff_Voted_List[11] = 0 -- ml6
	-- Hl2c.Diff_Voted_List[12] = 0 -- ml7
	-- Hl2c.Diff_Voted_List[13] = 0 -- ml8
	-- Hl2c.Diff_Voted_List[14] = 0 -- ml9

end

function Hl2c.Diff_Select(value)

	for k, v in pairs(Hl2c.Diff_Voted_List) do
		if value == k then
		Hl2c.Diff_Voted_List[k] = Hl2c.Diff_Voted_List[k] + 1
		end
	end
	-- if value == 0 then
		-- Hl2c.Diff_Voted_List[0] = Hl2c.Diff_Voted_List[0] + 1
	-- elseif value == 1 then
		-- Hl2c.Diff_Voted_List[1] = Hl2c.Diff_Voted_List[1] + 1
	-- elseif value == 2 then
		-- Hl2c.Diff_Voted_List[2] = Hl2c.Diff_Voted_List[2] + 1
	-- elseif value == 3 then
		-- Hl2c.Diff_Voted_List[3] = Hl2c.Diff_Voted_List[3] + 1
	-- elseif value == 4 then
		-- Hl2c.Diff_Voted_List[4] = Hl2c.Diff_Voted_List[4] + 1
	-- elseif value == 5 then
		-- Hl2c.Diff_Voted_List[5] = Hl2c.Diff_Voted_List[5] + 1
	-- else
		
	-- end
end

function Hl2c.Diff_Switch(value)
	local diff = {}
	oldPrint("Difficulty Switch: "..value)
	if value == 0 then
		Hl2c.Diff_Selected = 0
		oldPrint("Difficulty Changed: Easy")
		Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Easy")
		diff.selected = 0
		
		
	elseif value == 1 then
		Hl2c.Diff_Selected = 1
		oldPrint("Difficulty Changed: Normal")
		Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Normal")
		diff.selected = 2
	elseif value == 2 then
		Hl2c.Diff_Selected = 2
		oldPrint("Difficulty Changed: Hard")
		Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Hard")
		diff.selected = 2
	-- elseif value == 3 then
		-- Hl2c.Diff_Selected = 3
		-- oldPrint("Difficulty Changed: Insane")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Insane")
		-- diff.selected = 3
	-- elseif value == 4 then
		-- Hl2c.Diff_Selected = 4
		-- oldPrint("Difficulty Changed: Nightmare")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Nightmare")
		-- diff.selected = 4
	-- elseif value == 5 then
		-- Hl2c.Diff_Selected = 5
		-- oldPrint("Difficulty Changed: Inferno")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Inferno")
		-- diff.selected = 5
	-- elseif value == 6 then
		-- Hl2c.Diff_Selected = 6
		-- oldPrint("Difficulty Changed: Monster Level 1")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Monster Level 1")
		-- diff.selected = 6
	-- elseif value == 7 then
		-- Hl2c.Diff_Selected = 7
		-- oldPrint("Difficulty Changed: Monster Level 2")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Monster Level 2")
		-- diff.selected = 7
	-- elseif value == 8 then
		-- Hl2c.Diff_Selected = 8
		-- oldPrint("Difficulty Changed: Monster Level 3")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Monster Level 3")
		-- diff.selected = 8
	-- elseif value == 9 then
		-- Hl2c.Diff_Selected = 9
		-- oldPrint("Difficulty Changed: Monster Level 4")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Monster Level 4")
		-- diff.selected =9
	-- elseif value == 10 then
		-- Hl2c.Diff_Selected = 10
		-- oldPrint("Difficulty Changed: Monster Level 5")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Monster Level 5")
		-- diff.selected = 10
	-- elseif value == 11 then
		-- Hl2c.Diff_Selected = 11
		-- oldPrint("Difficulty Changed: Monster Level 6")
		-- Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Monster Level 6")
		-- diff.selected = 11
	else
		Hl2c.Diff_Selected = 1
		print("Difficulty Changed: Default")
		Hl2c.DefaultChatPrint("[hl2c] Difficulty Changed: Default")
		diff.selected = 1
	end
	if diff.selected == -1 then
	else
		file.Delete("hl2c_data/hl2c_difficulty.txt")
		timer.Simple(1,function()
			file.Write("hl2c_data/hl2c_difficulty.txt", util.TableToKeyValues(diff))
			Hl2c.Diff_Selected = value
		end)
	end
	file.Delete("hl2c_data/hl2c_difficulty.txt")
	timer.Simple(1,function()
		file.Write("hl2c_data/hl2c_difficulty.txt", util.TableToKeyValues(diff))
		Hl2c.Diff_Selected = value
	end)
	Hl2c.ALREADY_VOTED = true
	Hl2c.Diff_TableReset()
	Hl2c.VoteStarted = false
end
util.AddNetworkString("Hl2c.Diff.Vote.Send")

net.Receive("Hl2c.Diff.Vote.Send",function(len,ply)
	local number = net.ReadInt( 16 )
	print(number)
	Hl2c.Diff_AddVote(ply,number)
end)
netstream.Hook("Hl2c.Diff.Vote.Send",function(data)
	-- for k, v in pairs(data) do
		-- print(data)
	-- end
	-- print(data)
	if data and data[1] then
		
		Hl2c.Diff_Select(data[1])
	end
end)

function Hl2c.Diff_Vote_Allow()
	-- if Hl2c.CAN_VOTE > 1 then else
		-- Hl2c.CAN_VOTE = CurTime() + 60
	-- end
	-- if Hl2c.CAN_VOTE < CurTime() and Hl2c.ALREADY_VOTED != true then
	-- return true
	-- end
	if Hl2c.ALREADY_VOTED != true then
	return true
	end
	return false

end

function Hl2c.Diff_IsHeVoted(ply)
	if table.HasValue(Hl2c.Diff_Voted_players,ply) then
	return true
	end
	
	return false
end

function Hl2c.Diff_AddVote(ply,value)
	if !IsValid(ply) then return end
	if Hl2c.VoteStarted and !Hl2c.Diff_IsHeVoted(ply) then
		table.insert(Hl2c.Diff_Voted_players,ply)
		Hl2c.Diff_Select(value)
		if value == 0 then
			Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Easy!")
		elseif value == 1 then
			Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Normal!")
		elseif value == 2 then
			Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Hard!")
		-- elseif value == 3 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Insane!")
		-- elseif value == 4 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Nightmare!")
		-- elseif value == 5 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Inferno!")
		-- elseif value == 6 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Monster Level 1!")
		-- elseif value == 7 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Monster Level 2!")
		-- elseif value == 8 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Monster Level 3!")
		-- elseif value == 9 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Monster Level 4!")
		-- elseif value == 10 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Monster Level 5!")
		-- elseif value == 11 then
			-- Hl2c.DefaultChatPrint("[Difficulty] ".. tostring(ply:Nick()) .." has voted for Monster Level 6!")
		else
		
		end
		-- Hl2c.VoteStarted = true
		return
	end
	Hl2c.PersonDefaultChatPrint("[Difficulty] You are already voted!",ply)
end

function Hl2c.Stream_StartVote()
	
	for k, v in pairs(player.GetAll()) do
		
		if IsValid(v) then
			print("Vote Sent")
			
			netstream.Start(v, "Push_Diff_Vote")
			
		end
	
	end
	Hl2c.DefaultChatPrint("[Difficulty] Vote has been Started. You have 30 seconds to vote!")
end

function Hl2c.Diff_StartVote(ply)
	if !IsValid(ply) then return end
	
	if HL2MP_IS_COOP_MAP or LOBBY_MAP then
		Hl2c.PersonDefaultChatPrint("[Difficulty] Not available on this map",ply)
		return
	end
	-- print(Hl2c.Diff_Vote_Allow())
	-- Hl2c.PersonDefaultChatPrint("[Difficulty] Can vote in ".. tostring(math.Round(Hl2c.CAN_VOTE/60),2) .." minute",ply)
	-- Hl2c.PersonDefaultChatPrint("[Difficulty] Can vote in ".. tostring(math.Round(CurTime()/60),2) .." minute",ply)
	-- Hl2c.PersonDefaultChatPrint("[Difficulty] Vote Already Started",ply)
	
	if Hl2c.ALREADY_VOTED then
		Hl2c.PersonDefaultChatPrint("[Difficulty] Already changed difficulty",ply)
		return
	end
	
	if !table.HasValue(Hl2c.Diff_WantStart_players,ply) then
		table.insert(Hl2c.Diff_WantStart_players,ply)
		-- Hl2c.PersonDefaultChatPrint("[Difficulty] Vote Already Started",ply)
	end
	
	
	if Hl2c.Diff_Vote_Allow() and Hl2c.VoteStarted != true and Hl2c.ALREADY_VOTED != true then
		if #team.GetPlayers( TEAM_ALIVE ) == 1 and #Hl2c.Diff_WantStart_players == player.GetCount() then
			-- Hl2c.PersonDefaultChatPrint("[Difficulty] Vote has been Started. You have 30 seconds to vote!",ply)
			Hl2c.VoteStarted = true
			Hl2c.Stream_StartVote()
			return
		
		elseif #team.GetPlayers( TEAM_ALIVE ) == 2 and #Hl2c.Diff_WantStart_players == player.GetCount() then
			-- Hl2c.PersonDefaultChatPrint("[Difficulty] Vote has been Started. You have 30 seconds to vote!",ply)
			Hl2c.VoteStarted = true
			Hl2c.Stream_StartVote()
			return
		elseif #team.GetPlayers( TEAM_ALIVE ) > 2 and #Hl2c.Diff_WantStart_players >= (player.GetCount() * 0.6)  then
			-- Hl2c.PersonDefaultChatPrint("[Difficulty] Vote has been Started. You have 30 seconds to vote!",ply)
			Hl2c.VoteStarted = true
			Hl2c.Stream_StartVote()
			return
		
		end
		Hl2c.PersonDefaultChatPrint("[Difficulty] Need More Votes to Start",ply)
		return
	end
	if Hl2c.Diff_Vote_Allow() != true and Hl2c.VoteStarted != true and Hl2c.ALREADY_VOTED != true then
		-- Hl2c.PersonDefaultChatPrint("[Difficulty] Can vote in ".. tostring(math.Round(Hl2c.CAN_VOTE/60),2) .." minute",ply)
		-- Hl2c.PersonDefaultChatPrint("[Difficulty] Can vote in ".. tostring(math.Round((Hl2c.CAN_VOTE - CurTime())/60),2) .." minute",ply)
		Hl2c.PersonDefaultChatPrint("[Difficulty] Can vote soon ",ply)
		return
	end
	if Hl2c.VoteStarted then
		Hl2c.PersonDefaultChatPrint("[Difficulty] Vote Already Started",ply)
		return
	 
	end
	Hl2c.PersonDefaultChatPrint("[Difficulty] Already Selected Difficulty",ply)
end

function Hl2c.VoteEnds()
	
	if #Hl2c.Diff_Voted_players == 0 then
	Hl2c.VoteStarted = false
	print("Nobody voted for Difficulty!")
	Hl2c.Diff_TableReset()
	return
	end
	local max = Hl2c.Diff_Voted_List[0]
	local index = 0
	oldPrint("[hl2c] Vote Has Ended")
	-- PrintTable(Hl2c.Diff_Voted_List)
	for i=0,#Hl2c.Diff_Voted_List do
		if Hl2c.Diff_Voted_List[i] > max then
			max = Hl2c.Diff_Voted_List[i]
			index = i
		end
		
	end
	local all = 0
	for i=0, #Hl2c.Diff_Voted_List do
		all = all + Hl2c.Diff_Voted_List[i]
	end
	if all == 0 then
		Hl2c.VoteStarted = false
		Hl2c.Diff_TableReset()
		oldPrint("Nobody voted for Difficulty!")
		return
	end
	-- if (Hl2c.Diff_Voted_List[0] > Hl2c.Diff_Voted_List[1] and 
	-- Hl2c.Diff_Voted_List[0] > Hl2c.Diff_Voted_List[2] and
	-- Hl2c.Diff_Voted_List[0] > Hl2c.Diff_Voted_List[3] and
	-- Hl2c.Diff_Voted_List[0] > Hl2c.Diff_Voted_List[4]) then
		-- Hl2c.Diff_Switch(0)
	-- elseif (Hl2c.Diff_Voted_List[1] > Hl2c.Diff_Voted_List[0] and 
	-- Hl2c.Diff_Voted_List[1] > Hl2c.Diff_Voted_List[2] and
	-- Hl2c.Diff_Voted_List[1] > Hl2c.Diff_Voted_List[3] and
	-- Hl2c.Diff_Voted_List[1] > Hl2c.Diff_Voted_List[4]) then
		-- Hl2c.Diff_Switch(1)
	-- elseif (Hl2c.Diff_Voted_List[2] > Hl2c.Diff_Voted_List[0] and 
	-- Hl2c.Diff_Voted_List[2] > Hl2c.Diff_Voted_List[1] and
	-- Hl2c.Diff_Voted_List[2] > Hl2c.Diff_Voted_List[3] and
	-- Hl2c.Diff_Voted_List[2] > Hl2c.Diff_Voted_List[4]) then
		-- Hl2c.Diff_Switch(2)
	-- elseif (Hl2c.Diff_Voted_List[3] > Hl2c.Diff_Voted_List[0] and 
	-- Hl2c.Diff_Voted_List[3] > Hl2c.Diff_Voted_List[1] and
	-- Hl2c.Diff_Voted_List[3] > Hl2c.Diff_Voted_List[2] and
	-- Hl2c.Diff_Voted_List[3] > Hl2c.Diff_Voted_List[4]) then
		-- Hl2c.Diff_Switch(3)
	-- elseif (Hl2c.Diff_Voted_List[4] > Hl2c.Diff_Voted_List[0] and 
	-- Hl2c.Diff_Voted_List[4] > Hl2c.Diff_Voted_List[1] and
	-- Hl2c.Diff_Voted_List[4] > Hl2c.Diff_Voted_List[2] and
	-- Hl2c.Diff_Voted_List[4] > Hl2c.Diff_Voted_List[3]) then
		-- Hl2c.Diff_Switch(4)
	-- else
		-- Hl2c.Diff_Switch(-1)
	-- end
	Hl2c.Diff_Switch(index)
	Hl2c.VoteStarted = false
	Hl2c.ALREADY_VOTED = true
	Hl2c.Diff_TableReset()
	
end
Hl2c.Vote = Hl2c.Vote or {}
Hl2c.Vote.Difficulty = {}
Hl2c.Vote.Difficulty.Delay = 30
Hl2c.Vote.Difficulty.Curtime = 0
hook.Remove("Think","Diff.Think")
hook.Add("Think","Diff.Think",function()
	if Hl2c.VoteStarted then
		if Hl2c.Vote.Difficulty.Delay <= 0 then
			
			Hl2c.VoteEnds()
			Hl2c.Vote.Difficulty.Curtime = 0
			Hl2c.Vote.Difficulty.Delay = 30
			return
		elseif CurTime() > Hl2c.Vote.Difficulty.Curtime + 1 then
			-- print("Called?",delay)
			Hl2c.Vote.Difficulty.Delay = Hl2c.Vote.Difficulty.Delay - 1
			Hl2c.Vote.Difficulty.Curtime = CurTime() + 1
			return
		end
		
	end
end)
