// Called when map entities spawn
function GM:EntityKeyValue(ent, key, value)
	if ent:GetClass() == "trigger_changelevel" && key == "map" then
		ent.map = value
		DbgPrint("[hl2c Next Maps] ".. ent.map)
	end

	if ent:GetClass() == "logic_choreographed_scene" and key:iequals("busyactor") then
 		--return "0"
 	end
	
	ent.Hl2cKeyValues = ent.Hl2cKeyValues or {}

	if util.IsOutputValue(key) then
		ent.EntityOutputs = ent.EntityOutputs or {}
		ent.EntityOutputs[key] = ent.EntityOutputs[key] or {}
		table.insert(ent.EntityOutputs[key], val)
	else
		ent.Hl2cKeyValues[key] = val
	end
	
	if self.MapScript.KeyValue ~= nil then
		self.MapScript:KeyValue(ent,key,value)
	end
	
	// Need that fix for Obsidian Conflict to be able to purchase items from prop_physics
	if OC_MAP then else return end
	
	local ent = ent
	
	util.RunNextFrame(function()
		if IsValid(ent) and key == "OnPlayerUse" and string.find(value,",Purchase") then
			
			ent[key] =  ent[key] or {}
			ent[key][#ent[key] + 1 ] = value
			-- print(ent[key])
		end
	end)
	


end