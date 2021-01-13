LOBBY = LOBBY or {}

LOBBY.ChatCommands = {
	
	"!lobby",
	"/lobby"

}

LOBBY.TotalVotes = 0

LOBBY.Wait = 100 -- This is how long a player has to wait before voting when the map changes. 

LOBBY._ActualWait = CurTime() + LOBBY.Wait

--if LOBBY._ActualWait < 0 then
--return LOBBY._ActualWait == 0 end

LOBBY.PlayerCount = 1 

if !ConVarExists("hl2c_lobby_waittime") then
	CreateConVar("hl2c_lobby_waittime", LOBBY.Wait, FCVAR_SERVER_CAN_EXECUTE)
end

function LOBBY.Countppl()
	
	return 1 < player.GetCount()
end

function LOBBY.ShouldChange()

	if math.Round(player.GetCount()*1)  >= LOBBY.PlayerCount then
		return LOBBY.TotalVotes >= (player.GetCount()*0.66)
	end
	
	 
end

function LOBBY.RemoveVote()
	LOBBY.TotalVotes = math.Clamp( LOBBY.TotalVotes - 1, 0, math.huge )
end

function LOBBY.Start()
			Hl2c.DefaultChatPrint("Vote Succes soon map change to Lobby")
			-- PrintMessage( HUD_PRINTTALK, "Vote Succes soon map change to Lobby")
			timer.Simple(3, function()
				game.ConsoleCommand("hl2c_changelevel winter_lobby_2012\n")
				-- game.ConsoleCommand("hl2c_changelevel keyfox_lobby_summer\n")
			end)

end


function LOBBY.AddVote( ply )

	if LOBBY.CanVote( ply ) then
		LOBBY.TotalVotes = LOBBY.TotalVotes + 1
		ply.LOBBYVoted = true
		MsgN( ply:Nick().." has voted to Next map." )
		-- PrintMessage( HUD_PRINTTALK, ply:Nick().." has voted to go back to Lobby. ["..LOBBY.TotalVotes.."/"..math.Round(player.GetCount()*1).."]" )
		local text = tostring( ply:Nick().." has voted to go back to Lobby. ["..LOBBY.TotalVotes.."/"..math.Round(player.GetCount()*1).."]" )
		Hl2c.DefaultChatPrint(text)
		
		if LOBBY.ShouldChange() then
			LOBBY.Start()
		end
	end

end

hook.Add( "PlayerDisconnected", "Remove LOBBY", function( ply )

	if ply.LOBBYVoted then
		LOBBY.RemoveVote()
	end

	timer.Simple( 0.1, function()

		if LOBBY.ShouldChange() then
			LOBBY.Start()
		end

	end )

end )

function LOBBY.CanVote( ply )
	local plyCount = table.Count(player.GetAll())
	
	if LOBBY._ActualWait >= CurTime() then
		print(LOBBY._ActualWait)
		return false, "You must wait a bit before voting! " --..LOBBY._ActualWait.." sec"
	end

	/*if GetGlobalBool( "In_Voting" ) then
		return false, "There is currently a vote in progress!"
	end*/

	if ply.LOBBYVoted then
		return false, "You have already voted for Lobby!"
	end

	/*if LOBBY.ChangingMaps then
		return false, "There has already been a vote, the map is going to change!"
	end*/
	if plyCount < LOBBY.PlayerCount then
        return false, "You need more players before you can vote for Lobby!"
    end

	return true

end

function LOBBY.LOBBYVoted( ply )

	local can, err = LOBBY.CanVote(ply)

	if not can then
		Hl2c.PersonDefaultChatPrint(tostring(err),ply)
		-- ply:PrintMessage( HUD_PRINTTALK, err )
		return
	end

	LOBBY.AddVote( ply )

end

concommand.Add( "LOBBY_start", LOBBY.LOBBYVoted )

hook.Add( "PlayerSay", "LOBBY Chat Commands", function( ply, text )

	if table.HasValue( LOBBY.ChatCommands, string.lower(text) ) then
		LOBBY.LOBBYVoted( ply )
		return ""
	end

end )