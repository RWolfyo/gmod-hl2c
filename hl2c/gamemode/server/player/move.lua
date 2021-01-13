function GM:Move(ply, mv)

	-- Whoever stumbles upon this code might ask what this is all about.
	--
	-- Its best shown by going to d1_town_01 to the part where you have to lift up the
	-- vehicles, you have to walk on them and them and jump off which is close to impossible
	-- without the code below, feel free to comment it in order to see the difference.
	local groundEnt = ply:GetGroundEntity()

	if mv:KeyDown(IN_JUMP) and groundEnt ~= NULL and IsValid(groundEnt) then
		local class = groundEnt:GetClass()
		if class == "prop_physics" or class == "func_physbox" then
			local phys = groundEnt:GetPhysicsObject()
			if IsValid(phys) and phys:IsMotionEnabled() == true then
				local currentVel = phys:GetVelocity()
				phys:EnableMotion(false)
				-- Enable it back next frame
				util.RunNextFrame(function()
					if IsValid(groundEnt) then
						local phys = groundEnt:GetPhysicsObject()
						if IsValid(phys) then
							-- print("called?")
							phys:EnableMotion(true)
							phys:SetVelocity(currentVel)
						end
					end
				end)
			end
		end
	end

end