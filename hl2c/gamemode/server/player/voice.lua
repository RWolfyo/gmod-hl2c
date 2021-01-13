// If HL2C Additions is enabled and the game is not in singleplayer, let every player alive & valid say something.
function HeIsDead()
	for _, pl in pairs(player.GetAll()) do
		if (game.SinglePlayer()) then return end
		if (pl:Team() == TEAM_ALIVE or pl:Team() == TEAM_COMBINE) then else return end
		if (!pl:Alive()) then return end

		--local modelNameGender = player_manager.TranslatePlayerModel(pl:GetInfo("cl_playermodel"))
		--local modelNameGender = pl:GetInfo("cl_playermodel")
		local modelNameGender = pl:GetHeadModel()
		--print("BlahBlah")
		
		-- MALE --
		if pl:Team() == TEAM_ALIVE and modelNameGender && table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameGender)) then
			pl:EmitSound(MALE_HEISDEAD_SOUNDS[math.random(1, #MALE_HEISDEAD_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		end
		-- MALE --
		
		-- FEMALE --
		if pl:Team() == TEAM_ALIVE and modelNameGender && table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameGender)) then
			pl:EmitSound(FEMALE_HEISDEAD_SOUNDS[math.random(1, #FEMALE_HEISDEAD_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		end
		-- FEMALE --
		
		-- COMBINE --
		if modelNameGender then
		if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
			pl:EmitSound(COMBINE_ISDEAD_SOUNDS[math.random(1, #COMBINE_ISDEAD_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		end
		end
		-- COMBINE --
		if CD_MAP or pl:Team() == TEAM_COMBINE then
		-- if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
			pl:EmitSound(COMBINE_ISDEAD_SOUNDS[math.random(1, #COMBINE_ISDEAD_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		-- end
		end
		
		// Do we really want these custom voice lines playing when playermodel restrictions are on? We're gonna have combine rebels if I don't do this.
		if GetConVarNumber("hl2c_playermodel_restrictions") == 0 then
			
			-- ALYX --
			if modelNameGender == "models/player/alyx.mdl" then
				pl:EmitSound("vo/npc/alyx/ohgod01.wav", 75, pl.voicePitch, 1, CHAN_VOICE)
			end
			-- ALYX --
			
			-- BARNEY --
			if modelNameGender == "models/player/barney.mdl" then
				pl:EmitSound("vo/npc/barney/ba_ohshit03.wav", 75, pl.voicePitch, 1, CHAN_VOICE)
			end
			-- BARNEY --
		
		end
	end
end


// Heads up!
function PlayerWarning(pl)
	if (GetConVarNumber("hl2c_additions") == 0) then return end
	if (game.SinglePlayer()) then return end
	if (pl:Team() != TEAM_ALIVE) then return end
	if (!pl:Alive()) then return end
	if (warningPositions[1]) then return end

	--local modelNameGender = pl:GetInfo("cl_playermodel")
	local modelNameGender = pl:GetHeadModel()
	-- MALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameGender)) then
		pl:EmitSound("vo/npc/male01/headsup0"..math.random(1, 2)..".wav", 75, pl.voicePitch, 1, CHAN_VOICE)
	end
	-- MALE --
		
	-- FEMALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameGender)) then
		pl:EmitSound("vo/npc/female01/headsup0"..math.random(1, 2)..".wav", 75, pl.voicePitch, 1, CHAN_VOICE)
	end
	-- FEMALE --
	
	-- COMBINE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
		pl:EmitSound(COMBINE_WARN_SOUNDS[math.random(1,#COMBINE_WARN_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
	end
	-- COMBINE --
	
	
	table.insert(warningPositions, pl:EyePos())
	
	for _, pl in pairs(player.GetAll()) do
		net.Start("PlayerWarningPositions")
			net.WriteVector(warningPositions[1])
		net.Send(pl)
	end
	
	timer.Simple(12, function() PlayerWarningRemove() end)
end

// Connected with Player Warning, get rid of that one warning sign.
function PlayerWarningRemove()
	table.remove(warningPositions, 1)
	for _, pl in pairs(player.GetAll()) do
		if warningPositions[1] then
			net.Start("PlayerWarningPositions")
				net.WriteVector(warningPositions[1])
			net.Send(pl)
		else
			warningPositions = {}
			net.Start("PlayerWarningPositionsDisable")
			net.Send(pl)
		end
	end
end


// Some taunt sounds.
function PlayerTaunt( killer )
	if ( game.SinglePlayer() ) then return end
	if ( killer:Team() == TEAM_ALIVE or killer:Team() == TEAM_COMBINE ) then else return end
	if ( !killer:Alive() ) then return end
	
	--local modelNameGender = player_manager.TranslatePlayerModel(killer:GetInfo("cl_playermodel"))
	--local modelNameGender = killer:GetInfo("cl_playermodel")
	local modelNameGender = killer:GetHeadModel()
	local modelWithNoHead = killer:GetModel()
	
	-- COMBINE --
	if killer:Team() == TEAM_COMBINE or CD_MAP then
		-- if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
			killer:EmitSound(COMBINE_TAUNT_SOUNDS[math.random(1, #COMBINE_TAUNT_SOUNDS)], 75, killer.voicePitch, 1, CHAN_VOICE)
			return
		-- end
	end
	if killer:Team() == TEAM_ALIVE and modelNameGender then
		if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
			killer:EmitSound(COMBINE_TAUNT_SOUNDS[math.random(1, #COMBINE_TAUNT_SOUNDS)], 75, killer.voicePitch, 1, CHAN_VOICE)
		end
	end
	-- COMBINE --
	
	-- MALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameGender)) then
		killer:EmitSound(MALE_TAUNT_SOUNDS[math.random(1, #MALE_TAUNT_SOUNDS)], 75, killer.voicePitch, 1, CHAN_VOICE)
		return
	end
	-- MALE --

	-- FEMALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameGender)) then
		killer:EmitSound(FEMALE_TAUNT_SOUNDS[math.random(1, #FEMALE_TAUNT_SOUNDS)], 75, killer.voicePitch, 1, CHAN_VOICE)
		return
	end
	-- FEMALE --
	


	// Do we really want these custom voice lines playing when playermodel restrictions are on? We're gonna have combine rebels if I don't do this.
	if GetConVarNumber("hl2c_playermodel_restrictions") == 0 then
		
		// ALYX --
		-- if modelNameGender == "models/player/alyx.mdl" then
			-- killer:EmitSound("vo/npc/alyx/brutal02.wav", 75, killer.voicePitch, 1, CHAN_VOICE)
		-- end
		// ALYX --
		
		// BARNEY --
		-- if modelNameGender == "models/player/barney.mdl" then
			-- killer:EmitSound("vo/npc/barney/ba_laugh0"..math.random(1, 4)..".wav", 75, killer.voicePitch, 1, CHAN_VOICE)
		-- end
		// BARNEY --

	end
end


// Some random voice lines
function PlayerVoiceLine(pl)
	if (GetConVarNumber("hl2c_additions") == 0) then return end
	if (game.SinglePlayer()) then return end
	if (pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMPLETED_MAP or pl:Team() == TEAM_COMBINE_DEAD ) then pl:EmitSound("ambient/levels/citadel/strange_talk"..math.random(3, 11)..".wav", 75, 100, 1, CHAN_VOICE) return end
	if (!pl:Alive()) then return end
	
	--local modelNameGender = player_manager.TranslatePlayerModel(pl:GetInfo("cl_playermodel"))
	--local modelNameGender = pl:GetInfo("cl_playermodel")
	local modelNameGender = pl:GetHeadModel()

	
	if CD_MAP or pl:Team() == TEAM_COMBINE or table.HasValue( PLAYER_MODELS_COMBINE, string.lower( pl:GetHeadModel() ) ) then
	-- COMBINE --
	-- if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
		pl:EmitSound(COMBINE_VOICELINE_SOUNDS[math.random(1, #COMBINE_VOICELINE_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		return
	end
	-- MALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameGender) ) then
		pl:EmitSound(MALE_VOICELINE_SOUNDS[math.random(1, #MALE_VOICELINE_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		return
	end
	-- MALE --

	-- FEMALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameGender)) then
		pl:EmitSound(FEMALE_VOICELINE_SOUNDS[math.random(1, #FEMALE_VOICELINE_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		return
	end
	-- FEMALE --
	

	
	// Do we really want these custom voice lines playing when playermodel restrictions are on? We're gonna have combine rebels if I don't do this.
	if GetConVarNumber("hl2c_playermodel_restrictions") == 0 then
	/*
		-- COMBINE --
		if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
			pl:EmitSound(COMBINE_VOICELINE_SOUNDS[math.random(1, #COMBINE_VOICELINE_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		end
		-- COMBINE --
	*/	
	end
end

// Some random cheer lines
function PlayerCheer(pl)
	if (GetConVarNumber("hl2c_additions") == 0) then return end
	if (game.SinglePlayer()) then return end
	-- if (pl:Team() == TEAM_DEAD or pl:Team() == TEAM_COMPLETED_MAP or pl:Team() == TEAM_COMBINE_DEAD ) then pl:EmitSound("ambient/levels/citadel/strange_talk"..math.random(3, 11)..".wav", 75, 100, 1, CHAN_VOICE) return end
	if (pl:Team() == TEAM_ALIVE  ) then else return end
	if (!pl:Alive()) then return end
	
	--local modelNameGender = player_manager.TranslatePlayerModel(pl:GetInfo("cl_playermodel"))
	--local modelNameGender = pl:GetInfo("cl_playermodel")
	local modelNameGender = pl:GetHeadModel()

	
	-- if CD_MAP or pl:Team() == TEAM_COMBINE or table.HasValue( PLAYER_MODELS_COMBINE, string.lower( pl:GetHeadModel() ) ) then
	-- //-- COMBINE --
	-- //-- if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
		-- pl:EmitSound(COMBINE_VOICELINE_SOUNDS[math.random(1, #COMBINE_VOICELINE_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		-- return
	-- end
	-- MALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_MALE, string.lower(modelNameGender) ) then
		pl:EmitSound(MALE_CHEER_SOUNDS[math.random(1, #MALE_CHEER_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		return
	end
	-- MALE --

	-- FEMALE --
	if modelNameGender && table.HasValue(PLAYER_MODELS_FEMALE, string.lower(modelNameGender)) then
		pl:EmitSound(FEMALE_CHEER_SOUNDS[math.random(1, #FEMALE_CHEER_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		return
	end
	-- FEMALE --
	

	
	// Do we really want these custom voice lines playing when playermodel restrictions are on? We're gonna have combine rebels if I don't do this.
	if GetConVarNumber("hl2c_playermodel_restrictions") == 0 then
	/*
		-- COMBINE --
		if modelNameGender && table.HasValue(PLAYER_MODELS_COMBINE, string.lower(modelNameGender)) then
			pl:EmitSound(COMBINE_VOICELINE_SOUNDS[math.random(1, #COMBINE_VOICELINE_SOUNDS)], 75, pl.voicePitch, 1, CHAN_VOICE)
		end
		-- COMBINE --
	*/	
	end
end
