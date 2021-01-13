--
--   Name: info_player_equip
--   Desc: Used as player loadout manager to give items on player spawn ( in Synergy HL2 Mod ).
--
--ENT.Base = "base_entity"
ENT.Type = "point"

--[[---------------------------------------------------------
   Name: Initialize
   Desc: First function called. Use to set up your entity
-----------------------------------------------------------]]
function ENT:Initialize()
	
	--print("["..self:GetClass().."]","Initialized")
	if self["StartDisabled"] then
	
	else
		self:SetKeyValue("StartDisabled", "0")
	end
end

--[[---------------------------------------------------------
   Name: KeyValue
   Desc: Called when a keyvalue is added to us
-----------------------------------------------------------]]
function ENT:KeyValue( key, value )

	if key == "classname" then
		self[key] = tostring(value)

	elseif key == "targetname" then
		
		self[key] = tostring(value)
	
	elseif key == "StartDisabled" then
		
		self[key] = tostring(value)
		--print("["..self:GetClass().."]",key,value)
	elseif string.find(key,"weapon_") then

		if key == "weapon_deagle" then
		elseif key == "weapon_sl8" then
		elseif key == "weapon_mp5k" then
		elseif key == "weapon_mg5" then
		elseif key == "weapon_mg1" then
		elseif key == "weapon_flaregun" then
		elseif key == "weapon_medkit" then
		elseif key == "weapon_melee" then
		elseif key == "weapon_mg1" then

		else
			self.weapon = self.weapon or {}

			--local tbl = string.Explode("x",value)
			table.insert(self.weapon,key)
			self[key] = tostring(value)
			print(self:GetClass(),key,value)
		end
	elseif string.find(key,"item_") then
		if key == "item_suit" then
			
		elseif key == "item_flare_round" then
		elseif key == "item_box_flare_rounds" then
		elseif key == "item_box_sl8_rounds" then
--		elseif key == "item_flare_round" then
--		elseif key == "item_flare_round" then
--		elseif key == "item_flare_round" then

		else
			self.item = self.item or {}
			self.itemamount = self.itemamount or {}
			local tbl = string.Explode("x",value)
			table.insert(self.item,key)
			self[key] = tostring(value)
			table.insert(self.itemamount,tbl)
			print(self:GetClass(),key,value,tbl[1])
		end

	end

end


--
--   Name: AcceptInput
--   Desc: Called on input received.
--
function ENT:AcceptInput( inputName, activator, called, data )
	if ( inputName == "Enable" or inputName == "enable" ) then
		
		self["StartDisabled"] = "0"
		self:SetKeyValue("StartDisabled",self["StartDisabled"])


	elseif ( inputName == "Disable" or inputName == "disable" ) then
		
		self["StartDisabled"] = "1"
		self:SetKeyValue("StartDisabled",self["StartDisabled"])


	elseif ( inputName == "EquipPlayer" or inputName == "equipplayer" ) then
		
		if (activator:IsPlayer() and IsValid(activator)) and ( activator:Alive() and activator:Team() == TEAM_ALIVE ) then
			
			for k, v in pairs(self.weapon) do
				activator:Give(v)
			end
		end 


	elseif ( inputName == "EquipAllPlayers" or inputName == "equipallplayers" ) then
		
		local find = player.GetAll()
		for k, v in pairs(find) do
			for b, n in pairs(self.weapon) do
				if IsValid(v) then
					if (v:Alive()) and (v:Team() == TEAM_ALIVE) then
						v:Give(n)				
					end
				end
			end

		end

	elseif ( inputName == "Kill" or inputName == "kill" )  then
		
		self:Remove()
	
	end
end


--[[---------------------------------------------------------
   Name: Think
   Desc: Entity's think function. 
-----------------------------------------------------------]]
function ENT:Think()
end

--
--   Name: OnRemove
--   Desc: Called just before entity is deleted
--
function ENT:OnRemove()
	--print(self:GetClass(),"Removed")
end

--
--	UpdateTransmitState
--
function ENT:UpdateTransmitState()

	--
	-- The default behaviour for point entities is to not be networked.
	-- If you're deriving an entity and want it to appear clientside, override this
	-- TRANSMIT_ALWAYS = always send, TRANSMIT_PVS = send if in PVS
	--
	return TRANSMIT_NEVER

end


--[[

--
--	Name: Possiblites of equipments.
--	Desc: Normally Synergy is using custom weapons that default hl2 engine cannot recognize.
--	So I am triyng to avoid them by do nothing if I get the data.
--

weapon_flaregun
weapon_medkit
weapon_melee
weapon_mg1
weapon_mp5k
weapon_sl8
item_flare_round
item_box_flare_rounds
item_box_sl8_rounds
]]--