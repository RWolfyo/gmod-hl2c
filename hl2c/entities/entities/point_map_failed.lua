--AddCSluaFile()

ENT.Type = "point"

-- Most functions are server-based
if ( SERVER ) then

function ENT:AcceptInput( name, activator, caller, data )

	if ( name == "fail" || name == "Fail" ) then
	
		GAMEMODE:RestartMap()
	
	end

end

end