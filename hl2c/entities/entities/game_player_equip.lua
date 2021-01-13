--AddCSluaFile()

ENT.Type = "point"

function ENT:KeyValue( key, value )
	if key == "classname" then
		self[key] = tostring(value)
		--print(self:GetClass(),key,value)
	elseif key == "targetname" then
		self[key] = tostring(value)

		--print(self:GetClass(),key,value)

	elseif string.find(key,"weapon_") then
		--print("FOUND", key, self:GetClass())
		if key == "weapon_sniperrifle" then
		elseif key == "weapon_manhack" then
		elseif key == "weapon_healer" then
		elseif key == "weapon_stunstick" then
		elseif key == "weapon_taucannon" then
		elseif key == "weapon_uzi" then
		elseif key == "weapon_alyxgun" then
		elseif key == "weapon_oicw" then
		elseif key == "weapon_graplehook" then
		else
		self.items = self.items or {}
		self.key = tostring(key)
		self[key] = tostring(value)
		--print(self:GetClass(),self.key,self[key])
		--local tbl = string.Explode(',', key)
		table.insert(self.items, key)
		end
	else
		--print(self:GetClass(), key, value)
	end
end

-- Most functions are server-based
if ( SERVER ) then

function ENT:Use( activator, caller )
	--print(activator,caller)
end

function ENT:AcceptInput( name, activator, caller, data )

	if string.lower(name) == "equipactivator" then
		print(self,name,activator,caller)
		if IsValid(activator) and activator:Alive() and activator:IsPlayer() then
		--print(self.items[1])
			if self.items then
				for k, v in pairs(self.items) do
					
					if !activator:HasWeapon(v) then
					
						activator:Give(v)
						if v != "weapon_crowbar" or v != "weapon_physcannon" then
							--activator:GiveAmmo(self[v] * 10 ,v:GetPrimaryAmmoType())
						end
					end
				end
			end
		end
	
	
	
	else
		print(self,name,activator,caller)
	end
end

end

//	http://pastebin.com/D3meccqL	http://pastebin.com/XiWmQjgS