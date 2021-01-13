
local DbgPrint = GetLogging("OnEntityCreated")

local all_gibs = {
["models/gibs/gunship_gibs_engine.mdl"] = true,
["models/gibs/gunship_gibs_eye.mdl"] = true,
["models/gibs/gunship_gibs_headsection.mdl"] = true,
["models/gibs/gunship_gibs_midsection.mdl"] = true,
["models/gibs/gunship_gibs_nosegun.mdl"] = true,
["models/gibs/gunship_gibs_sensorarray.mdl"] = true,
["models/gibs/gunship_gibs_tailsection.mdl"] = true,
["models/gibs/gunship_gibs_wing.mdl"] = true,
["models/gibs/helicopter_brokenpiece_01.mdl"] = true,
["models/gibs/helicopter_brokenpiece_02.mdl"] = true,
["models/gibs/helicopter_brokenpiece_03.mdl"] = true,
["models/gibs/helicopter_brokenpiece_04_cockpit.mdl"] = true,
["models/gibs/helicopter_brokenpiece_05_tailfan.mdl"] = true,
["models/gibs/helicopter_brokenpiece_06_body.mdl"] = true,

}

local function DissolveIt( ent )
	local d = DamageInfo()
	d:SetDamage( ent:Health() )
	d:SetAttacker( ent )
	d:SetDamageType( DMG_DISSOLVE )

	ent:TakeDamageInfo( d )
end

function GM:OnEntityCreated( ent )

	local self = self
	local ent = ent
	local class = ent:GetClass()

	-- Run this next frame so we can safely remove entities and have their actual names assigned.
	--util.RunNextFrame(function()

		if not IsValid(ent) then
			return
		end
		if ent:GetClass() == "npc_antlion_grub" then
			Hl2c.ANTLIONGRUB_COUNT = Hl2c.ANTLIONGRUB_COUNT + 1
			if game.GetMap() == "ep2_outland_02" and Hl2c.ANTLIONGRUB_COUNT > 5 then
				Hl2c.ANTLIONGRUB_COUNT = 5
			end
			-- print(Hl2c.ANTLIONGRUB_COUNT)
		end
		
		
		if GAME_IS_EP2 and ent:GetClass() == "npc_grenade_frag" then
			ent:SetOriginalGrenadeThrower()
		end
		-- if ent:GetClass() == "point_viewcontrol" and HL2MP_IS_COOP_MAP != true then
			-- ent:SetKeyValue("spawnflags", "128")
			-- print(ent)
		-- end
		if ent:GetClass() == "player_weaponstrip" and HL2MP_IS_COOP_MAP then
			ent:Remove()
		end
		if ent:GetClass() == "trigger_weapon_dissolve" and HL2MP_IS_COOP_MAP then
			ent:Remove()
		end
		if ent:GetClass() == "trigger_weapon_strip" and HL2MP_IS_COOP_MAP then
			ent:Remove()
		end
		
		-- Monitor scripts that we have filtered by class name.
		if self.MapScript.EntityFilterByClass and self.MapScript.EntityFilterByClass[ent:GetClass()] == true then
			DbgPrint("Removing filtered entity by class: " .. tostring(ent))
			-- print("Removing filtered entity by class: " .. tostring(ent))
			ent:Remove()
		end
		
		-- Monitor scripts that have filtered by name.
		if self.MapScript.EntityFilterByName and self.MapScript.EntityFilterByName[ent:GetName()] == true then
			DbgPrint("Removing filtered entity by name: " .. tostring(ent) .. " (" .. ent:GetName() .. ")")
			-- print("Removing filtered entity by name: " .. tostring(ent) .. " (" .. ent:GetName() .. ")")
			ent:Remove()
		end
		
		if ent:GetClass() == "prop_ragdoll" and ent:GetModel() == "models/combine_strider.mdl"
		then
			-- print("new ragdoll?",ent,ent:GetModel())
			ent:Fire( "FadeAndRemove", "", 5)
		end
		
		if IsValid(ent) and ent:GetModel() and isstring(ent:GetModel()) and all_gibs[ent:GetModel()] and IsValid(HL2C_ENTITY_DISSOLVER) then
			-- DissolveIt(ent)
			HL2C_ENTITY_DISSOLVER:SetKeyValue("dissolvetype","1")
			HL2C_ENTITY_DISSOLVER:SetEntity("target",ent)
			HL2C_ENTITY_DISSOLVER:Fire("Dissolve","",5.1)
			-- print("called dissolve?")
			
		end
			
		if class == "env_hudhint" then
			DbgPrint("Enabling env_hudhint for all players")
			ent:AddSpawnFlags(1) -- SF_HUDHINT_ALLPLAYERS
		elseif class == "env_message" then
			ent:AddSpawnFlags(2) -- SF_MESSAGE_ALL
		elseif class == "func_areaportal" then
			-- TODO: This is not ideal at all on larger maps, however can can not get a position for them.
			-- ent:SetKeyValue("StartOpen", "1")
			-- ent:Fire("Open")
			-- ent:SetName("Lambda_" .. ent:GetName())
		elseif class == "func_areaportalwindow" then
			-- I know this is ugly, but its better than white windows everywhere, this is not 2004 anymore.
			local saveTable = ent:GetSaveTable()
			local fadeStartDist = tonumber(saveTable["FadeStartDist"] or "0") * 3
			local fadeDist = tonumber(saveTable["FadeDist"] or "0") * 3
			ent:SetKeyValue("FadeDist", fadeDist)
			ent:SetKeyValue("FadeStartDist", fadeStartDist)
		end
		if self.MapScript.OnEntityCreated ~= nil then
			self.MapScript:OnEntityCreated(ent)
			-- DbgPrint("Worked?")
		end
		if self.OrangeBox_EntityCreate ~= nil then
			self:OrangeBox_EntityCreate(ent)
			-- DbgPrint("Worked?")
		end
	--end)

end