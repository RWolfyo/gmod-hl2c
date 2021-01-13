SQUAD = SQUAD or {}
SQUAD.LIST = SQUAD.LIST or {
-- SQUAD.LIST = {
[1] = NULL,
[2] = NULL,
[3] = NULL,
[4] = NULL,
[5] = NULL,
[6] = NULL,
[7] = NULL,
[8] = NULL,
[9] = NULL,
[10] = NULL,
}
function SQUAD:SquadJoin(joiner, partylead)
	local partylead = tonumber(partylead)
	-- print(partylead)
	if IsValid(joiner) and 
	joiner:IsPlayer() and 
	joiner:Team() == TEAM_ALIVE and
	joiner.setup_achi == true
	then
		for i=1,#SQUAD.LIST do
			if i == partylead and SQUAD.LIST[i] != NULL  then
				local id = i
				SQUAD:SquadSet(joiner, id)
				Hl2c.DefaultChatPrint("[SQUAD] ( ".. tostring(joiner:Nick()) .." ) Joined Squad ID(".. tostring(joiner:GetNWInt("SQUAD_ID")) ..")")
				return
			end
		end
	end
	Hl2c.PersonDefaultChatPrint("[SQUAD]: ERROR!",joiner)
end

function SQUAD:SquadSet(pl, id)
	pl:SetNWInt("SQUAD_ID",id)
end

function SQUAD:IsLeadHasSquad(leader)
	for k, v in pairs(SQUAD.LIST) do
		if v == leader then
			return true
		end
	end
	return false
end
function SQUAD:GetSquadByLead(leader)
	for k, v in pairs(SQUAD.LIST) do
		if v == leader then
			return k
		end
	end
	return 0
end
function SQUAD:GetLeadById(id)
	for k, v in pairs(SQUAD.LIST) do
		if k == id then
			return v
		end
	end
	return NULL
end

function SQUAD:GetSquad(pl)
	if pl:GetNWInt("SQUAD_ID") >= 1 then return pl:GetNWInt("SQUAD_ID") end
	return 0
end

function SQUAD:IsInSquad(pl)
	if pl:GetNWInt("SQUAD_ID") == 0 then return end
	for i=1,#SQUAD.LIST do
		
		if SQUAD.LIST[i] != NULL and i == pl:GetNWInt("SQUAD_ID") then
			return true
		end
	end
	return false
end

function SQUAD:SquadCreate(leader)
	if DEV_MODE then print(SQUAD:IsInSquad(leader) ) end
	if SQUAD:IsInSquad(leader) != true then
		for k, v in pairs(SQUAD.LIST) do
			if v == NULL then
				SQUAD.LIST[k] = leader
				leader:SetNWBool("SQUAD_LEAD",true)
				SQUAD:SquadSet(leader, k)
				Hl2c.PersonDefaultChatPrint("[SQUAD] Create Squad ID(".. tostring(k) ..")",leader)
				return
			end
		end
	end
	Hl2c.PersonDefaultChatPrint("[SQUAD] Squad already exist!",leader)
end

function SQUAD:SquadLeave(pl)
	if SQUAD:IsInSquad(pl) then
		
		if SQUAD:IsLeadHasSquad(pl) then
			pl:SetNWBool("SQUAD_LEAD",false)
			SQUAD:SquadDisband(pl)
		end
		Hl2c.DefaultChatPrint("[SQUAD] ( ".. tostring(pl:Nick()) .." ) Left Squad ID(".. tostring(pl:GetNWInt("SQUAD_ID")) ..")")
		pl:SetNWInt("SQUAD_ID",0)
		
	end
end

function SQUAD:SetUp(ply,id)
	local counter=0
	for _, pl in pairs(player.GetAll()) do
		if pl then
			if SQUAD.LIST[id]==NULL and ply==pl then
				SQUAD.LIST[id]=ply
				ply:SetNWInt("SQUAD_ID",id)
				ply:SetNWBool("SQUAD_LEAD",true)
				return
			elseif SQUAD.LIST[id]!=NULL and ply!=pl and pl:GetNWInt("SQUAD_ID")==id then
				counter=counter+1
			end
		end
	end
	if counter < 4 then
		ply:SetNWInt("SQUAD_ID",id)
	else
		ply.database["stat"]["squad"] = 0
	end
end

function SQUAD:SquadDisband(leader)
	if SQUAD:IsInSquad(leader) then
		local done=false
		for _, pl in pairs(player.GetAll()) do
			if pl.setup_achi and leader != pl and SQUAD:GetSquad(pl) == SQUAD:GetSquadByLead(leader) then
				-- SQUAD:SquadLeave(pl)
				SQUAD.LIST[SQUAD:GetSquad(leader)]=pl
				pl:SetNWBool("SQUAD_LEAD",true)
				done=true
			end
		end
		-- Hl2c.DefaultChatPrint("[SQUAD] Squad Disbanded by Lead ID(".. tostring(SQUAD:GetSquad(leader)) ..")")
		if done== false then
			SQUAD.LIST[SQUAD:GetSquad(leader)] = NULL
		end
	end
end

function SQUAD:SetLead(leader,name)
	if SQUAD:IsLeadHasSquad(leader) and SQUAD:GetSquad(leader) > 0 then
		for _, pl in pairs(player.GetAll()) do
			if pl.setup_achi and string.find(pl:Nick(),name) and !SQUAD:IsLeadHasSquad(pl) and SQUAD:GetSquad(pl) == SQUAD:GetSquad(leader) then
				local id = SQUAD:GetSquadByLead(leader)
				SQUAD.LIST[id] = pl
				pl:SetNWBool("SQUAD_LEAD",true)
				Hl2c.PersonDefaultChatPrint("[SQUAD] Squad Leader set to: "..tostring(pl:Nick()),leader)
				return
			end
		end
	end
end

function SQUAD:GetSquadMembers(id)
	local group = {}
	local num = 0
	for _, pl in pairs(player.GetAll()) do
		if pl.setup_achi and SQUAD:IsInSquad(pl) and SQUAD:GetSquad(pl) == id then
			num = num + 1
			group[num] = pl
		end
	end
	
	return group
end

function SQUAD:GetSquadMembersNOTARGET(lead,id)
	local group = {}
	local num = 0
	for _, pl in pairs(player.GetAll()) do
		if pl.setup_achi and SQUAD:IsInSquad(pl) and SQUAD:GetSquad(pl) == id and pl != lead then
			num = num + 1
			group[num] = pl
		end
	end
	
	return group
end

function SQUAD:ErrorNoSquad(pl)
	Hl2c.PersonDefaultChatPrint("[SQUAD] You are not in any Squad!",pl)
end

function SQUAD:ListSquads(pl)
	local db = 0
	for i=1,#SQUAD.LIST do
		if SQUAD.LIST[i] != NULL then
			Hl2c.PersonDefaultChatPrint("[SQUAD] ID:(".. tostring(i) ..") Leader:( ".. tostring(SQUAD.LIST[i]:Nick()) .." ) ",pl)
			db = db + 1
		end
	end
	if db == 0 then
		Hl2c.PersonDefaultChatPrint("[SQUAD] All Squads are empty!",pl)
	end
end

SQUAD.COMMANDS = {}
SQUAD.COMMANDS.LIST = {}
SQUAD.COMMANDS.LIST["!squad create"] = true
SQUAD.COMMANDS.LIST["!squad get"] = true
SQUAD.COMMANDS.LIST["!squad list"] = true
SQUAD.COMMANDS.LIST["!squad join"] = true
SQUAD.COMMANDS.LIST["!squad leave"] = true
SQUAD.COMMANDS.LIST["!squad info"] = true

SQUAD.COMMANDS.FUNCTION = {}
SQUAD.COMMANDS.FUNCTION["!squad create"] = function(pl) 

	SQUAD:SquadCreate(pl)
	if DEV_MODE then print(pl)	end
 end
SQUAD.COMMANDS.FUNCTION["!squad get"] = function(pl) 
	if SQUAD:IsInSquad(pl) then
	Hl2c.PersonDefaultChatPrint("[SQUAD] Your Squad ID: ".. tostring(SQUAD:GetSquad(pl)),pl)
	else
		SQUAD:ErrorNoSquad(pl)
	end
	
	if DEV_MODE then print(pl)	end
 end
SQUAD.COMMANDS.FUNCTION["!squad list"] = function(pl) 
	SQUAD:ListSquads(pl)
	
	if DEV_MODE then print(pl)	end
 end
SQUAD.COMMANDS.FUNCTION["!squad join"] = function(pl,name) 
	SQUAD:SquadJoin(pl,name)
	-- print(name)
	if DEV_MODE then print(pl)	end
 end
SQUAD.COMMANDS.FUNCTION["!squad leave"] = function(pl) 
	SQUAD:SquadLeave(pl)
	-- print(name)
	if DEV_MODE then print(pl)	end
 end
SQUAD.COMMANDS.FUNCTION["!squad info"] = function(pl) 
	if SQUAD:IsInSquad(pl) then
		Hl2c.PersonDefaultChatPrint("*************************",pl)
		for k, v in pairs(SQUAD:GetSquadMembers( SQUAD:GetSquad(pl) )) do
			Hl2c.PersonDefaultChatPrint("[SQUAD] Member( ".. tostring(v:Nick()) .." )",pl)
		end
		Hl2c.PersonDefaultChatPrint("*************************",pl)
	end
	-- print(name)
	if DEV_MODE then print(pl)	end
 end


hook.Remove("PlayerSay", "SQUAD.SAY")
hook.Add( "PlayerSay", "SQUAD.SAY", function(pl,say)
	if SQUAD and SQUAD.COMMANDS and SQUAD.COMMANDS.LIST and pl and pl:Team() == TEAM_ALIVE then
		local pl = pl
		local say = say
		local text = string.Explode(" ",say)
		if text[1] and text[2] then
			say = text[1].." "..text[2]
		end
		-- print(say)
		if SQUAD.COMMANDS.LIST[say] then
			if say == "!squad create" --and text[3] != nil 
			then
				-- local number = tonumber(text[3])
				-- if isnumber(text[3]) and text[3]>0 and text[3]<11 then
					SQUAD.COMMANDS.FUNCTION[say](pl,number)
					pl.database["stat"]["squad"]=pl:GetNWInt("SQUAD_ID")
					return
				-- end
			end
			if say == "!squad get" then
				SQUAD.COMMANDS.FUNCTION[say](pl)
				return
			end
			if say == "!squad list" then
				SQUAD.COMMANDS.FUNCTION[say](pl)
			end
			if say == "!squad join" then
				SQUAD.COMMANDS.FUNCTION[say](pl,tostring(text[3]))
				pl.database["stat"]["squad"]=pl:GetNWInt("SQUAD_ID")
			end
			if say == "!squad leave" then
				SQUAD.COMMANDS.FUNCTION[say](pl)
				pl.database["stat"]["squad"]=0
			end
			if say == "!squad info" then
				SQUAD.COMMANDS.FUNCTION[say](pl)
			end
		end
	end
end)