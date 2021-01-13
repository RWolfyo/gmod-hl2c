// Set the player model
function GM:PlayerSetModel(pl)
	Hl2c.PlayerSetModel(pl)
end

function Hl2c.SetUpAppear_NoSave(pl,model,head)
	model = PLAYER_MODELS[math.random(1, #PLAYER_MODELS)]
	util.PrecacheModel(model)
	pl:SetModel(model)
	pl:SetNWString( "Suit_Model", model )
	pl:SetNWString( "Head_Model", model )
	-- pl:SetSuitModel(pl.modelName)
	-- pl:SetHeadModel(head)
	-- pl:SetSuitModel(model)
	pl:SetHeadModel(model)
	pl:SetSuitModel(model)
	pl:SetNWString( "Head_Model", model )
	pl:SetHeadModel(model)
	pl:SetSuitModel(model)
end

function Hl2c.SetUpAppear_Save(pl,model,head)
	-- model = PLAYER_MODELS[math.random(1, #PLAYER_MODELS)]
	util.PrecacheModel(model)
	util.PrecacheModel(head)
	pl:SetModel(model)
	pl:SetNWString( "Suit_Model", model )
	pl:SetNWString( "Head_Model", head )
	-- pl:SetSuitModel(pl.modelName)
	-- pl:SetHeadModel(head)
	-- pl:SetSuitModel(model)
	pl:SetHeadModel(head)
	pl:SetSuitModel(model)
	pl:SetNWString( "Head_Model", head )
	pl:SetHeadModel(head)
	pl:SetSuitModel(model)
end

// Set the player model
function Hl2c.PlayerSetModel(pl)
	if pl:Team() == TEAM_ALIVE then else return end
	if pl:Alive() then else return end
		-- pl.combinemodelName = PLAYER_MODELS_COMBINE[math.random(1,#PLAYER_MODELS_COMBINE)]
		-- util.PrecacheModel(pl.combinemodelName)
		-- pl:SetModel(pl.combinemodelName)
		-- return
	-- end

	
	if pl.info && pl.info.model then
		pl.modelName = pl.info.model
	else

	end
	
	if CD_MAP then
		pl.modelName = PLAYER_MODELS_COMBINE[1]
		util.PrecacheModel(pl.modelName)
		pl:SetModel(pl.modelName)
		return
	else
		if sql.TableExists( DB.Player.Appear ) == true and IsValid( pl ) and isstring( pl:SteamID() ) then
			if tostring( sql.QueryValue("SELECT STEAMID FROM ".. DB.Player.Appear .." WHERE STEAMID = '".. pl:SteamID() .."' " ) ) == pl:SteamID() then 
				local head = tostring( sql.QueryValue("SELECT HEAD FROM ".. DB.Player.Appear .." WHERE STEAMID = '".. pl:SteamID() .."' " ) )
				local model = tostring( sql.QueryValue("SELECT MODEL FROM ".. DB.Player.Appear .." WHERE STEAMID = '".. pl:SteamID() .."' " ) )
				-- print( model,"Loading Model" )
				-- print( head,"Loading Head" )
				pl.SavedModel = model
				pl.SavedHead = head
				if HL2C_ALL_PLAYER_MODELS[pl:GetSuitModel()] then
					-- print(true)
				else
					-- print(false)
				end
				if pl:GetSuitModel() and pl:GetHeadModel() and isstring(pl.SavedModel) and isstring(pl.SavedHead) then 
					Hl2c.SetUpAppear_Save( pl, pl:GetSuitModel(), pl:GetHeadModel() )
				else
					
					if HL2C_ALL_PLAYER_MODELS[pl.SavedHead] and HL2C_ALL_PLAYER_MODELS[pl.SavedModel] then
						Hl2c.SetUpAppear_Save(pl,pl.SavedModel,pl.SavedHead)
					return
					
					else
						Hl2c.SetUpAppear_NoSave(pl)
						return
					end
				end
			else
				sql.Query( "INSERT INTO ".. DB.Player.Appear .." (`STEAMID`)VALUES ('"..pl:SteamID().."')" )
				-- print( pl:SteamID(),"Adding Player Appear Table",tostring( sql.QueryValue("SELECT STEAMID FROM ".. DB.Player.Appear .." WHERE STEAMID = '".. pl:SteamID() .."'") ) )
				Hl2c.SetUpAppear_NoSave(pl)
				return
			end
				
		end
		-- pl.modelName = PLAYER_MODELS[math.random(1, 3)]
		-- if pl:GetSuitModel() and pl:GetHeadModel() then 
			-- pl.modelName = pl:GetSuitModel()
			-- pl.headName = pl:GetHeadModel()
			-- util.PrecacheModel(pl.modelName)
			-- pl:SetNWString( "Head_Model", " " )
			-- pl:SetSuitModel(pl.modelName)
			-- pl:SetHeadModel(pl.headName)
			-- pl:SetSuitModel(pl.modelName)
			-- pl:SetHeadModel(pl.headName)
			-- pl:SetSuitModel(pl.modelName)
			-- pl:SetHeadModel(pl.headName)
			-- pl:SetNWString( "Head_Model", pl.headName )
			-- print(pl.modelName,"Spawning as Exist Model and Head TEAM_ALIVE")
			-- return

		
		-- else
			-- util.PrecacheModel(pl.modelName)
			-- pl.modelName = PLAYER_MODELS[math.random(1, #PLAYER_MODELS)]
			-- util.PrecacheModel(pl.modelName)
			-- pl:SetModel(pl.modelName)
			-- pl:SetNWString( "Suit_Model", pl.modelName )
			-- pl:SetNWString( "Head_Model", pl.modelName )
			-- pl:SetHeadModel(pl.modelName)
			-- pl:SetSuitModel(pl.modelName)
			-- pl:SetHeadModel(pl.modelName)
			-- pl:SetSuitModel(pl.modelName)
			-- pl:SetNWString( "Head_Model", pl.modelName )
			-- pl:SetHeadModel(pl.modelName)
			-- pl:SetSuitModel(pl.modelName)
			-- print(pl.modelName,"Fresh Spawn")
			-- return
			-- print("CAlled")
		-- end
	end
	
	-- util.PrecacheModel(pl.modelName)
	-- pl:SetModel(pl.modelName)
	
end
