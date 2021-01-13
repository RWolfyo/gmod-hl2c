
hook.Add("EntityKeyValue", "SceneMod_KeyValue", function(ent, key, value)
	if IsValid(ent) and 
	isstring(ent:GetClass()) and 
	isstring(key) and 
	isstring(value) 
	then
		
		
		if ent:GetClass() == "logic_choreographed_scene" and
		key == "onplayerdeath" and
		value == "1"
		then
			
			timer.Simple(1,function()
				
				if IsValid(ent)
				then
					ent:SetKeyValue("onplayerdeath", "0")
					
					--print("-----------------------------------")
					--print("[hl2c] Scene Modified to Coop ".. ent:GetClass() .."")
					--print("-----------------------------------")
				end
			end)
			
		end
		
		
	end
end)