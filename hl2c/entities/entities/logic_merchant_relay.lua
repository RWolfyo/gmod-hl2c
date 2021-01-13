
ENT.Type = "point"

function ENT:Initialize()
end

function ENT:KeyValue( key, value )
	if key == "OnPurchased" then
		self[key] = tostring(value)
		self.actions = self.actions or {}
		--print(self:GetClass(),key,value)
		local tbl = string.Explode(',', value)
		table.insert(self.actions, tbl)
		--print(self:GetClass(),key,value)
	elseif key == "purchasesound" then
		self[key] = tostring(value)
		self.sound = value
	elseif key == "CostOf" then
		self[key] = tostring(value)
		self.cost = value
		--print(self:GetClass(),key,value)
	elseif key == "targetname" then
		self[key] = tostring(value)
		self.target = value
	elseif key == "classname" then
		self[key] = tostring(value)
		--self.target = value
	elseif key == "PurchaseName" then
		self[key] = tostring(value)
		self.name = value
		--print(self:GetClass(),key,value)
	else
		--print(self:GetClass(), key, value)
	end
end

function ENT:Think()
end

function ENT:OnRemove()
end

function ENT:AcceptInput( inputName, activator, called, data )
	-- print(inputName,activator,called,data)
	-- if IsFirstTimePredicted() then print("true") else print("false") end
	self.player = activator
	RequestPurchase(self, inputName, activator, called, data)
	-- self.player = activator
	--print(" "..inputName.." "..data)
end

function ENT:UpdateTransmitState()
	return TRANSMIT_NEVER
end