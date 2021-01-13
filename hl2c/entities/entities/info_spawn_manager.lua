--
--   Name: info_spawn_manager
--   Desc: Used as spawn manager to select player spawn ( in Synergy HL2 Mod ).
--

--ENT.Base = "base_entity"
ENT.Type = "point"

--[[---------------------------------------------------------
   Name: Initialize
   Desc: First function called. Use to set up your entity
-----------------------------------------------------------]]
function ENT:Initialize()
	
	print("[hl2c Initialized]",self:GetClass())
	self.target = "info_player_copp"
end

--[[---------------------------------------------------------
   Name: KeyValue
   Desc: Called when a keyvalue is added to us
-----------------------------------------------------------]]
function ENT:KeyValue( key, value )
	if key == "targetname" then
		--
		--	Name: Name
		--	Desc: Key to check the entity's Name for any input.
		--
		
		self[key] = tostring(value)
		--self.name = value
	elseif key == "classname" then
		--
		--	Name: Classname
		--	Desc: Key to check the entity's class in the entity class table.
		--
		
		self[key] = tostring(value)
		--self.class = value
		--oc.waypoints[self:EntIndex()][key] = value
	end
end

--[[---------------------------------------------------------
   Name: Think
   Desc: Entity's think function. 
-----------------------------------------------------------]]
function ENT:Think()
end

--
--   Name: AcceptInput
--   Desc: Called on input received.
--
function ENT:AcceptInput( inputName, activator, called, data )
	if ( inputName == "SetCheckPoint" or inputName == "setcheckpoint" )  then
		self.checkpoint = data
		for a, s in pairs(ents.FindByClass(self.target)) do 
		
			s:Fire("Disable")
		
			for d, f in pairs(ents.FindByName(data)) do
				
				f:Fire("Enable")
		
			end
		end

	elseif ( inputName == "ClearCheckpoint" or inputName == "setcheckpoint" )  then
		self.clearcheckpoint = data
		for a, s in pairs(ents.FindByClass(self.clearcheckpoint)) do 
		
			s:Fire("Disable")
		
		end

	elseif ( inputName == "TeleportPlayers" or inputName == "teleportplayers" )  then
		self.teleport = data:GetPos()
		for p, pl in pairs(player.GetAll()) do

			pl:SetPos(self.teleport)
		
		end
	elseif ( inputName == "MovePlayers" or inputName == "moveplayers" )  then
		self.actpos = activator:GetPos()
		for pk, plv in pairs(player.GetAll()) do
			if plv != activator then
				plv:SetPos(self.actpos)
			end
		end
	elseif ( inputName == "Kill" or inputName == "kill" )  then
		
		self:Remove()
	
	end
end

--
--   Name: OnRemove
--   Desc: Called just before entity is deleted
--
function ENT:OnRemove()
	print("[hl2c Removed]",self.class)
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