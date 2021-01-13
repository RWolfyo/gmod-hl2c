-- local DbgPrint = GetLogging("IO")

GM.InputFilters = GM.InputFilters or {}
GM.OutputCallbacks = GM.OutputCallbacks or {}
GM.InputCallbacks = GM.InputCallbacks or {}

function GM:ResetInputOutput()
	self.InputFilters = {}
	self.OutputCallbacks = {}
	self.InputCallbacks = {}
end

function GM:FilterEntityInput(name, input)

	self.InputFilters[name] = self.InputFilters[name] or {}
	table.insert(self.InputFilters[name], input)

end

function GM:AddOutputCallback(name, outputname, inputname, delay, cb)

	ents.WaitForEntityByName(name, function(ent)

		local infotarget = ents.Create("info_target")
		infotarget:SetName(inputname)
		infotarget:Spawn()

		-- DbgPrint("Added new output on " .. tostring(ent) .. " -> " .. outputname .. " " .. inputname)

		ent:Fire("AddOutput", outputname .. " " .. inputname .. ",OutputCallback", delay)

		self.OutputCallbacks[inputname] = cb

	end)

end

function GM:WaitForInput(name, input, cb)

	ents.WaitForEntityByName(name, function(ent)

		-- DbgPrint("Added new input listener on " .. tostring(ent) .. " -> " .. input)

		self.InputCallbacks[ent] = self.InputCallbacks[ent] or {}
		self.InputCallbacks[ent][input] = cb

	end)

end

function GM:RemoveInputCallback(name, input)
	ents.WaitForEntityByName(name, function(ent)

		-- DbgPrint("Removing input listener on " .. tostring(ent) .. " -> " .. input)

		self.InputCallbacks[ent] = self.InputCallbacks[ent] or {}
		self.InputCallbacks[ent][input] = nil

	end)
end

function GM:AcceptInput(ent, input, activator, caller, value)

	local name = ent:GetName()
	local filters = self.InputFilters[name]
	if filters ~= nil then
		for _,v in pairs(filters) do
			if v == input then
				-- DbgPrint(ent, "Filtered input: " .. name .. " -> " .. input)
				return true
			end
		end
	end

	local inputcb = self.InputCallbacks[ent]
	if inputcb ~= nil then
		local cb = inputcb[input]
		if cb ~= nil then
			local res = cb(ent, input, activator, caller, value)
			if res == true then
				-- DbgPrint(ent, "Filtered input: " .. name .. " -> " .. input)
				return true
			end
		else
		end
	end

	local output = self.OutputCallbacks[name]
	if output ~= nil then
		-- DbgPrint("Input Target: " .. name)
		output(name)
	end
	
	if ent:GetClass() == "func_areaportal" and (string.lower(input) == "open" ) then
		-- print(ent,input)
		ent:SetName("hl2c_"..ent:GetName())
	end
	if ent:GetClass() == "func_areaportal" and (string.lower(input) == "close" or string.lower(input) == "toggle" ) then
		-- print(ent,input)
		return true
	end

end

--AcceptInput( Entity ent, string input, Entity activator, Entity caller, any value )
hook.Remove("AcceptInput", "Mod_AcceptInput")
hook.Add("AcceptInput", "Mod_AcceptInput", function(ent, ent_input, activator, caller, value)
	
	if game.GetMap() == "d1_trainstation_03" and ent_input == "SetHealth" and value == "100" and ent:IsPlayer() then return true end
	-- if true and ent:GetClass() != "func_areaportal" then
		-- print("Trigger Input",ent,ent_input,value,caller,ent:MapCreationID())
	-- end
	// Need that fix for Obsidian Conflict to be able to buy items from prop_physics
	if IsValid(ent) and ent_input == "Use" and ent:IsOCMerchantProp() then
		-- print(ent,ent_input,activator,caller,value)
		-- PrintTable(ent["OnPlayerUse"])
		local all = string.Explode(",",ent["OnPlayerUse"][1])
		local get = ents.FindByName(all[1])
		-- print(get[1])
		get[1]:Input("Purchase",activator,caller,"")
	
	end
	if IsValid(ent) and
	ent:GetClass() != nil and
	--ent:GetClass() == "npc_helicopter" and
	(ent_input == "Kill" or ent_input == "kill")
	then
		--print(ent_input)
		ent.input_kill = 1
	end
	

end)
