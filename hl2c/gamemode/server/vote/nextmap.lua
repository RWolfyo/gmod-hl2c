NEXTMAP = NEXTMAP or {}

NEXTMAP.ChatCommands = {
	
	"!nextmap",
	"/nextmap"

}

NEXTMAP.TotalVotes = 0

NEXTMAP.Wait = 60 -- This is how long a player has to wait before voting when the map changes. 

NEXTMAP._ActualWait = CurTime() + NEXTMAP.Wait

NEXTMAP.PlayerCount = 1 

if !ConVarExists("hl2c_nextmap_waittime") then
	CreateConVar("hl2c_nextmap_waittime", NEXTMAP.Wait, FCVAR_SERVER_CAN_EXECUTE)
end

function NEXTMAP.Countppl()
	
	return 1 < player.GetCount()
end

function NEXTMAP.ShouldChange()
		
	if math.Round(player.GetCount()*1 ) >= NEXTMAP.PlayerCount then
		return NEXTMAP.TotalVotes >= (player.GetCount()*0.66)
	end
	
end

function NEXTMAP.RemoveVote()
	NEXTMAP.TotalVotes = math.Clamp( NEXTMAP.TotalVotes - 1, 0, math.huge )
end

function NEXTMAP.Start()
			
			-- PrintMessage( HUD_PRINTTALK, "Vote Succes next map change soon")
			Hl2c.DefaultChatPrint("Vote Succes next map change soon")
			timer.Simple(1, function()
				GAMEMODE:NextMap()
			end)

end


function NEXTMAP.AddVote( ply )

	if NEXTMAP.CanVote( ply ) then
		NEXTMAP.TotalVotes = NEXTMAP.TotalVotes + 1
		ply.NEXTMAPVoted = true
		MsgN( ply:Nick().." has voted to Next map." )
		-- PrintMessage( HUD_PRINTTALK, ply:Nick().." has voted to Next map. ["..NEXTMAP.TotalVotes.."/"..math.Round(player.GetCount()*1).."]" )
		local text = ply:Nick().." has voted to Next map. ["..NEXTMAP.TotalVotes.."/"..math.Round(player.GetCount()*1).."]"
		Hl2c.DefaultChatPrint(tostring(text))
		if NEXTMAP.ShouldChange() then
			NEXTMAP.Start()
		end
	end

end

hook.Add( "PlayerDisconnected", "Remove NEXTMAP", function( ply )

	if ply.NEXTMAPVoted then
		NEXTMAP.RemoveVote()
	end

	timer.Simple( 0.1, function()

		if NEXTMAP.ShouldChange() then
			NEXTMAP.Start()
		end

	end )

end )

function NEXTMAP.CanVote( ply )
	local plyCount = table.Count(player.GetAll())
	
	if NEXTMAP._ActualWait >= CurTime() then
		print(NEXTMAP._ActualWait)
		return false, "You must wait a bit before voting!"
	end

	/*if GetGlobalBool( "In_Voting" ) then
		return false, "There is currently a vote in progress!"
	end*/

	if ply.NEXTMAPVoted then
		return false, "You have already voted for Next map!"
	end

	/*if NEXTMAP.ChangingMaps then
		return false, "There has already been a vote, the map is going to change!"
	end*/
	if plyCount < NEXTMAP.PlayerCount then
        return false, "You need more players before you can vote for next map!"
    end

	return true

end

function NEXTMAP.NEXTMAPVoted( ply )

	local can, err = NEXTMAP.CanVote(ply)

	if not can then
		-- ply:PrintMessage( HUD_PRINTTALK, err )
		Hl2c.PersonDefaultChatPrint(tostring(err),ply)
		return
	end

	NEXTMAP.AddVote( ply )

end

concommand.Add( "NEXTMAP_start", NEXTMAP.NEXTMAPVoted )

hook.Add( "PlayerSay", "NEXTMAP Chat Commands", function( ply, text )

	if table.HasValue( NEXTMAP.ChatCommands, string.lower(text) ) then
		NEXTMAP.NEXTMAPVoted( ply )
		return ""
	end

end )