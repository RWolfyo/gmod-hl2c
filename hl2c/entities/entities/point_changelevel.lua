AddCSLuaFile()

ENT.Type = "point"

function ENT:AcceptInput(name, activator, caller, data)
	if ( string.lower(name) == "changelevel" ) then
		
		-- timer.Simple(2,function()
		-- GAMEMODE:GrabAndSwitch()
		-- end)
		-- NEXT_MAP_TIME = 5
		GAMEMODE:GrabAndSwitch()
	end
end