function GM:PlayerAuthed( ply, steamid, uniqueid )
	if file.Exists("hl2c_data/hl2c_bans.txt","DATA") then 
		local db = file.Read("hl2c_data/hl2c_bans.txt")
		db = util.KeyValuesToTable(db)
		if table.HasValue(db,steamid) then ply:Kick("You are still banned!!!")
		else
		timer.Destroy( "LetsGoLobby" )
		timer.Destroy( "RestartNoPl" )
	
		net.Start( "inventory.database" )
			net.WriteString("client.side")
			net.WriteTable({})
		net.Send( ply )
		 end
	end	

	
end
net.Receive("Client.Database",function(len,ply)
	if ply then
		print("[".. ply:SteamID() .."]: ".. ply:Nick() .." - Reading DB" )
		ply:databaseCheck()
	end

end)
local function BANLIST_READ()
	if file.Exists("hl2c_data/hl2c_bans.txt","DATA") then
		local db = file.Read("hl2c_data/hl2c_bans.txt")
		db = util.KeyValuesToTable(db)
		-- print(db)
		return db
	else return nil
	end
	
end
function Hl2c.BanListCast(pl)
	pl.banlist_time = pl.banlist_time or (CurTime()+5)
	local db =BANLIST_READ()
	if CurTime() > pl.banlist_time and db != nil then
		-- print("Called")
		net.Start("hl2c.banlist")
			net.WriteTable(db)
		net.Send(pl)
		pl.banlist_time=CurTime()+5
	end
end