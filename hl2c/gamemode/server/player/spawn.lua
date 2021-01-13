function Hl2c.OnSpawnSetUpHP(pl)
	if IsValid(pl) and
	pl:Alive() and
	pl:Team() == TEAM_ALIVE and
	isnumber(pl:GetCLevel()) and
	pl:GetCLevel() > 1 
	then
		// Set HP
		
		pl:SetUpHP()
	end
end

// Called when a player spawns 
function GM:PlayerSpawn(pl)
	pl:Spawning()
end