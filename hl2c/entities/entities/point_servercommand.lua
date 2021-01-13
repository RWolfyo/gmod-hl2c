--AddCSluaFile()

ENT.Type = "point"

-- Most functions are server-based
if ( SERVER ) then

function ENT:AcceptInput( name, activator, caller, data )

	if ( name == "Command" ) then
	
		game.ConsoleCommand( tostring( data ).."\n" )
	
	end

end

end