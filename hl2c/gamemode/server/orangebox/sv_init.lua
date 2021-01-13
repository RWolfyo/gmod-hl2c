--
-- // OrangeBox Script \\
-- Desc:
-- In Orangebox Models got skins. 
-- So any npc has a weapon that 
-- inside Orangebox script match with the criteria then
-- it will change the model skin.
--

local DbgPrint = GetLogging("OrangeBox")

--[[ --GM:EntityKeyValue( Entity ent, string key, string value )
hook.Add("EntityKeyValue", "OrangeBox_KeyValue", function(ent, key, value)
	if IsValid(ent) and 
	isstring(ent:GetClass()) and 
	isstring(key) and 
	isstring(value) 
	then

		
		if ent:GetClass() == "npc_combine_s" and 
		key == "additionalequipment" and
		value == "weapon_shotgun" and
		ent:GetSkin() != 1
		then
			--DbgPrint("-----------------------------------")
			--DbgPrint("[hl2c] Orangebox Changed ".. ent:GetClass() .." Model's Skin")
			--DbgPrint("-----------------------------------")
			ent.orangebox = true
			ent:SetSkin(1)
			timer.Simple(0.5,function()
				if IsValid(ent)
				then
					ent:SetSkin(1)
				end
			end)
			--DbgPrint("\n[hl2c] Entity:",ent:GetClass().."\n[hl2c] Key:",key.."\n[hl2c] Value:",value.."\n")
			
		end
		/*
		if ent:GetClass() == "npc_turret_floor" and
		--ent:GetSkin() == 0 and 
		ent:HasSpawnFlags(512)
		then
			DbgPrint("-----------------------------------")
			DbgPrint("[hl2c] Orangebox Changed ".. ent:GetClass() .." Model's Skin")
			DbgPrint("-----------------------------------")
			ent.orangebox = true
			ent:SetSkin( 1 )
			ent:SetKeyValue("SkinNumber", tostring( math.random(1,2) ) )
			timer.Simple(0.5,function()
				if IsValid(ent)
				then
					--ent:SetSkin( 1 )
					--ent:SetKeyValue("SkinNumber", tostring( 1 ) )
				end
			end)
			--DbgPrint("\n[hl2c] Entity:",ent:GetClass().."\n[hl2c] Key:",key.."\n[hl2c] Value:",value.."\n")
			
		end
		*/
	end
end) ]]

function GM:OrangeBox_EntityCreate(ent)
	-- DbgPrint(tostring(ent).." "..tostring(ent:GetKeyValues()["additionalequipment"]))
	if ent:GetClass() == "npc_combine_s" and 
	(ent:GetKeyValues()["additionalequipment"] == "weapon_shotgun" or
	ent:GetKeyValues()["additionalequipment"] == "ai_weapon_shotgun")
	then
		ent:SetSkin(1)
		ent:SetKeyValue("SkinNumber", tostring( 1 ) )
		//DbgPrint(tostring(ent))
	end
end

-- DbgPrint("-----------------------------------")
DbgPrint("-- Script is loaded --")
-- DbgPrint("-----------------------------------")