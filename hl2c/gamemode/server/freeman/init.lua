
function Freeman_Think_Ply(v)
	if (string.find(game.GetMap(), "d1_trainstation_") and
	game.GetMap() != "d1_trainstation_06") or 
	game.GetMap() == "winter_lobby_2012"
	then
		-- for k, v in pairs(player.GetAll()) do
			if IsValid(v) and
			(v:Team() == TEAM_ALIVE or
			v:Team() == TEAM_DEAD) and
			v.setup_achi == true and
			v.hl2_setup_trueonefreeman != true and
			(sql.TableExists( DB.AchHlTwo.Table ) == true) and
			(sql.TableExists( DB.AchEpOne.Table ) == true) and
			(sql.TableExists( DB.AchEpTwo.Table ) == true) and
			(sql.TableExists( DB.CustomSetUp.P1 ) == true)
			then
				--print("TRUE ONE FREEMAN CLEAR:",v:Nick())
				v:ClearFreeman()
				v.hl2_setup_trueonefreeman = true
			end
		-- end
	end
	if (game.GetMap() == "d1_trainstation_06" or
	game.GetMap() == "ep1_citadel_00" or
	game.GetMap() == "ep2_outland_01" )
	then
		-- for k, v in pairs(player.GetAll()) do
			if IsValid(v) and
				(v:Team() == TEAM_ALIVE or
				v:Team() == TEAM_DEAD) and
				v.setup_achi == true and
				v.hl2_setup_trueonefreeman != true and
				(sql.TableExists( DB.AchHlTwo.Table ) == true) and
				(sql.TableExists( DB.AchEpOne.Table ) == true) and
				(sql.TableExists( DB.AchEpTwo.Table ) == true) and
				(sql.TableExists( DB.CustomSetUp.P1 ) == true)
				then
					v.hl2_setup_trueonefreeman = true
					v:SetUpFreeman()
					--print("TRUE ONE FREEMAN SET UP:",v:Nick())
			end
		-- end
	end
end

function Freeman_Think()
	if (string.find(game.GetMap(), "d1_trainstation_") and
	game.GetMap() != "d1_trainstation_06" ) then
		HL2C_PET_ALLOW = false
	elseif game.GetMap() == "ep2_outland_12a" then
		HL2C_PET_ALLOW = false
	elseif game.GetMap() == "ep2_outland_01" then
		HL2C_PET_ALLOW = false
	elseif game.GetMap() == "d1_eli_02" then
	HL2C_PET_ALLOW = false
	elseif game.GetMap() == "d1_eli_01" then
		HL2C_PET_ALLOW = false
	else
		HL2C_PET_ALLOW = true
	end
	if game.GetMap() == "winter_lobby_2012" or game.GetMap() == "keyfox_lobby_summer" then
		for k, v in pairs(ents.FindByName("ep2_chapter1_brush")) do
			if IsValid(v)
			then
				v:Fire("Disable")
				v:Fire("Deactivate")
				v:Fire("Kill")
				
			end
		end
	end
	
	
	
end

function Freeman_Die(ply, inflictor, attacker)
	if (GAME_IS_HL2 or GAME_IS_EP1 or GAME_IS_EP2) and IsValid(ply) and
	game.GetMap() != "d1_trainstation_01" and
	game.GetMap() != "d1_trainstation_02" and
	game.GetMap() != "d1_trainstation_03" and
	game.GetMap() != "d1_trainstation_04" and
	game.GetMap() != "d1_trainstation_05" and
	game.GetMap() != "winter_lobby_2012" and
	game.GetMap() != "keyfox_lobby_summer" 
	then
		ply:FailFreeman()
	end
end

function Freeman_Noclip(ply, desiredState)
	if IsValid(ply) and
	ply:IsPlayer() and
	ply:IsAdmin()
	then
		ply:FailFreeman()
	end
end