--AddCSluaFile()

ENT.Type = "point"

-- Most functions are server-based
function ENT:Initialize()

	print("Initialized game_end")
end

if ( SERVER ) then

	function ENT:AcceptInput( name, activator, caller, data )

		if string.lower(name) == "endgame" then
		
			GAMEMODE:NextMap()
		
		end

	end

end