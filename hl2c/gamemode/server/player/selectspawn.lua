
// Select the player spawn
function GM:PlayerSelectSpawn(pl)
	--Hl2c.PlayerSelectSpawn(pl)
	if pl:Team() == TEAM_COMBINE then 
		local spawn = ents.FindByClass("info_player_combine")
		local get = math.random(#spawn)
		return spawn[get]
	end
	if pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMPLETED_MAP then
		return pl
	end
	if OC_MAP then
		local ocPoint = ents.FindByClass("info_player_deathmatch")
		oc_spawn = oc_spawn or {}
		for k, v in pairs(ocPoint) do
		
			if v["StartDisabled"] == "0" then
				--print("[hl2c]","info_player_deathmatch","Selected")
				if !table.HasValue(oc_spawn,v) then
					table.insert(oc_spawn,v)
				end
			end
			
			if v["StartDisabled"] == "1" then
				--print("[hl2c]","info_player_deathmatch","Selected")
				if table.HasValue(oc_spawn,v) then
					table.RemoveByValue(oc_spawn,v)
				end
			end
		end
		if oc_spawn[1] != nil then
		--print("[hl2c] SPAWNED ON OC_MAP")
		local get = math.random(#oc_spawn)
		--print(oc_spawn[get]:GetPos())
		return oc_spawn[get]
		else
			--print("[hl2c] SPAWNED ON INFO_PLAYER_START")
			local hl2spawn = ents.FindByClass("info_player_start")
			return hl2spawn[#hl2spawn]
		end
	elseif SYN_MAP then
		local synPoint = ents.FindByClass("info_player_coop")
		syn_spawn = syn_spawn or {}
		for k, v in pairs(synPoint) do
		
			if v["StartDisabled"] == "0" then
				--print("[hl2c]","info_player_deathmatch","Selected")
				if !table.HasValue(syn_spawn,v) then
				table.insert(syn_spawn,v)
				end
			end
			
			if v["StartDisabled"] == "1" then
				--print("[hl2c]","info_player_deathmatch","Selected")
				if table.HasValue(syn_spawn,v) then
				table.RemoveByValue(syn_spawn,v)
				end
			end
		end
		if syn_spawn[1] != nil then
		--print("[hl2c] SPAWNED ON INFO_PLAYER_COOP")
		local get = math.random(#syn_spawn)

		return syn_spawn[get]
		else
			--print("[hl2c] SPAWNED ON INFO_PLAYER_START")
			local hl2spawn = ents.FindByClass("info_player_start")
			return hl2spawn[#hl2spawn]
		end

	elseif HL2MP_IS_COOP_MAP then
	
		/*if INFO_PLAYER_SPAWN then
			GAMEMODE:CreateSpawnPoint(INFO_PLAYER_SPAWN[1], INFO_PLAYER_SPAWN[2])
		end*/
		--if string.find(game.GetMap(), "syn_") then
		
		
		--end
		local spawnPointsRebel = ents.FindByClass(HL2MP_SPAWN_ENT)
		local spawnPointsRebel_Random = math.random(#spawnPointsRebel)
		return spawnPointsRebel[spawnPointsRebel_Random]
	else
		local spawnPoints = ents.FindByClass(HL2_SPAWN_ENT)
		return spawnPoints[#spawnPoints]
	end
end 