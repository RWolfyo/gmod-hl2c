// Called when a player disconnects
function GM:PlayerDisconnected(pl)
	if pl and IsValid(pl) then else return end
	pl:databaseDisconnect()
	Hl2c.PlayerDisconnected(pl)
	
	Hl2c.IsServerEmpty_RestartMap()
end

function Hl2c.PlayerDisconnected(pl)
	if file.Exists("hl2c_userid_info/hl2c_userid_info_"..pl:UniqueID()..".txt", "DATA") then
		file.Delete("hl2c_userid_info/hl2c_userid_info_"..pl:UniqueID()..".txt")
	end
	--pl:ChatPrint("Player "..pl:Nick().." has disconnected from the server")
	--PrintMessage(HUD_PRINTTALK, "Player "..pl:Nick().." has disconnected from the server")
	if HL2MP_IS_COOP_MAP then return end
	pl:FailFreeman()
	pl:RemoveVehicle()
	
end