AddCSLuaFile("shared.lua")
AddCSLuaFile("cl_init.lua")

include("shared.lua")



--This accepts inputs. Prints them to the console and gives our current position (doesn't work with brush entities)
function ENT:AcceptInput(inputName, activator, called, data)
	-- print(inputName)
	-- print(tostring(self.Entity:GetPos()))

end
/*
-- Updates the bounds of this collision box
function ENT:SetBounds(min, max)
	self:SetSolid(SOLID_BBOX)
	self:SetCollisionBounds(min, max)
	self:SetTrigger(true)
	self:UseTriggerBounds( true, 24 )
end
*/
-- Run when any entity starts touching our trigger
function ENT:Touch(ent)
	
	-- if ent and ent:IsPlayer() then print("\nTouched me a Player\n") end
	
end

function ENT:StartTouch( ent )
	if ent and ent:IsPlayer() and ent:Team() == TEAM_ALIVE and ent:Alive() then else return end
	-- print("TOUCHED MAPEND")
	GAMEMODE:NextMap()
	
	self:Remove()
end


-- print("hi")


function Create_Trigger_MapEnd(min,max,name)
	-- print(min,max)
	if min and max and isvector(min) and isvector(max) then else return end
	-- getpos = max - ((max - min) / 2)
	
	local trigger = ents.Create("trigger_mapend_hl2c")
	-- trigger:SetPos(getpos)
	trigger.min = min
	trigger.max = max
	if name and type(name) == string then
		trigger:SetKeyValue("targetname",tostring(name))
	end
	trigger:Spawn()
	-- print("Created")
end
hook.Add("InitPostEntity","Trigger_MapEnd",function()
		if TRIGGER_MAPEND then
			for _, get in pairs(TRIGGER_MAPEND) do
				-- print(get)
				-- print(get[1],get[2],get[3])
				if get[3] and isstring(get[3]) then
				Create_Trigger_MapEnd(get[1],get[2],get[3])
				else
				Create_Trigger_MapEnd(get[1],get[2])
				end

				
			end
		end
end)