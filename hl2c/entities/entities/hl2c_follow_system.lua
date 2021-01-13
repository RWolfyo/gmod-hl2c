if SERVER then AddCSLuaFile() end

--
--   Name: hl2c_follow_system
--   Desc: Used as follow manager to select enities follow activator.
--

--ENT.Base = "base_entity"
ENT.Type = "point"
ENT.Version = "v1.0.0"
--ENT.Inputs = {	["Activate"] = true,	["Deactivate"] = true,	["SetSpawnflags"] = true,	["SetFollowPlayers"] = true,	["SetFollowPlayersTeam"] = true,	["SetFollowTarget"] = true,	["targetname"] = true}
ENT.Followers = {}

--[[---------------------------------------------------------
   Name: Initialize
   Desc: First function called. Use to set up your entity
-----------------------------------------------------------]]
function ENT:Initialize()
	
	-- print("[hl2c Initialized]",self:GetClass())
	if self["StartDisabled"] == nil then
		self["StartDisabled"] = "0"
		self["Initialized"] = true
	end
	if self.distance == nil or ( isstring(self.distance) and tonumber(self.distance) < 60 ) then
		self.distance = 60
	end
	if isstring(self.distance) then self.distance = tonumber(self.distance) end
	if not isstring(self["Steal"]) then self["Steal"] = "1" end
	self["Initialized"] = true
end

--[[---------------------------------------------------------
   Name: KeyValue
   Desc: Called when a keyvalue is added to us
-----------------------------------------------------------]]
function ENT:KeyValue( key, value )
	/*
	TargetName
	ClassName
	Spawnflags
	FollowerName
	FollowerClass
	FollowTargetType
	FollowTargetName
	FollowTargetTeam
	Distance
	Steal
	*/
	if key == "Distance" then
		self.distance = tonumber(value)
	elseif isstring(key) and isstring(value) then
		self[key] = value
		-- print("hl2c_follow_system",key,self[key])
	
	elseif isstring(key) and not isstring(value) then
		self[key] = nil
	
	end
	self["Initialized"] = true
end


--[[---------------------------------------------------------
   Name: Think
   Desc: Entity's think function. 
-----------------------------------------------------------]]
function ENT:Think_FollowerByClass( ent )
	if ent:IsPet() then return end

	if ent:Hl2c_IsFollow() then
		if IsValid( ent ) and 
		ent:Hl2c_IsFollow() and 
		!IsValid( ent:Hl2c_GetFollowTarget() ) 
		then
			ent:Hl2c_StopFollow()
		end
			
		if IsValid( ent ) and 
		ent:Hl2c_IsFollow() and 
		IsValid( ent:Hl2c_GetFollowTarget() ) and
		ent:Hl2c_GetFollowTarget():Team() != 1 
		then
			ent:Hl2c_StopFollow()
		end
		
		if IsValid( ent ) and IsValid( ent:Hl2c_GetFollowTarget() ) and
		not ent:IsCurrentSchedule(SCHED_FORCED_GO_RUN) and 
		ent:GetPos():Distance( ent:Hl2c_GetFollowTarget():GetPos() ) > 100 then
			
			ent:SetLastPosition( ent:Hl2c_GetFollowTarget():GetPos() )
			ent:SetSchedule(SCHED_FORCED_GO_RUN)
			
		end
		
		if IsValid( ent ) and IsValid( ent:Hl2c_GetFollowTarget() ) and
		ent:GetPos():Distance( ent:Hl2c_GetFollowTarget():GetPos() ) < 101
		then
			
			if ent:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
				ent:ClearSchedule()
				ent:StopMoving()
			end
				
		end
		
	end

end

function ENT:Think_FollowerByName( ent )
	if ent:IsPet() then return end
	
	if ent:Hl2c_IsFollow() then
		if IsValid( ent ) and 
		ent:Hl2c_IsFollow() and 
		not IsValid( ent:Hl2c_GetFollowTarget() ) 
		then
			ent:Hl2c_StopFollow()
		end
			
		if IsValid( ent ) and 
		ent:Hl2c_IsFollow() and 
		IsValid( ent:Hl2c_GetFollowTarget() ) and
		ent:Hl2c_GetFollowTarget():Team() != 1 
		then
			ent:Hl2c_StopFollow()
		end
		
		if IsValid( ent ) and IsValid( ent:Hl2c_GetFollowTarget() ) and
		not ent:IsCurrentSchedule(SCHED_FORCED_GO_RUN) and 
		ent:GetPos():Distance( ent:Hl2c_GetFollowTarget():GetPos() ) > 100 then
			
			ent:SetLastPosition( ent:Hl2c_GetFollowTarget():GetPos() )
			ent:SetSchedule(SCHED_FORCED_GO_RUN)
			
		end
		
		if IsValid( ent ) and IsValid( ent:Hl2c_GetFollowTarget() ) and
		ent:GetPos():Distance( ent:Hl2c_GetFollowTarget():GetPos() ) < 101
		then
			
			if ent:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
				ent:ClearSchedule()
				ent:StopMoving()
			end
				
		end
		
	end
end

function ENT:Think()
	if self["Initialized"] != true then return end
	if self["StartDisabled"] == "1" then return end
	if isstring( self["FollowerTargetClass"] ) then
		
		for _, ent in pairs( ents.FindByClass( self["FollowerClass"] ) ) do
			if ent["BlockFollow"] == true and ent:IsFollow() then 
				ent:Hl2c_StopFollow()
				ent:ClearSchedule()
				ent:StopMoving()
			end
			self:Think_FollowerByClass( ent )
		end
	
	elseif isstring( self["FollowerTargetName"] ) then
		
		for _, ent in pairs( ents.FindByName( self["FollowName"] ) ) do
			if ent["BlockFollow"] == true and ent:IsFollow() then 
				ent:Hl2c_StopFollow()
				ent:ClearSchedule()
				ent:StopMoving()
			end
			self:Think_FollowerByName( ent )
		end

	end
	/*
	for _, npc in pairs(ents.FindByClass("npc_*")) do
		if npc:Hl2c_IsFollow() then
			if IsValid( npc ) and 
			npc:Hl2c_IsFollow() and 
			!IsValid( npc:Hl2c_GetFollowTarget() ) 
			then
				npc:Hl2c_StopFollow()
			end
			
			if IsValid( npc ) and 
			npc:Hl2c_IsFollow() and 
			IsValid( npc:Hl2c_GetFollowTarget() ) and
			npc:Hl2c_GetFollowTarget():Team() != 1 
			then
				npc:Hl2c_StopFollow()
			end
			
			if IsValid( npc ) and IsValid( npc:Hl2c_GetFollowTarget() ) and
			!npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN) and 
			npc:GetPos():Distance( npc:Hl2c_GetFollowTarget():GetPos() ) > 100 then
				
				npc:SetLastPosition( npc:Hl2c_GetFollowTarget():GetPos() )
				npc:SetSchedule(SCHED_FORCED_GO_RUN)
				
			end
			
			if IsValid( npc ) and IsValid( npc:Hl2c_GetFollowTarget() ) and
			npc:GetPos():Distance( npc:Hl2c_GetFollowTarget():GetPos() ) < 101
			then
				
				if npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
					npc:ClearSchedule()
					npc:StopMoving()
				end
				
			end
			
		end
	end
	*/
end

function ENT:KeyPress( ply, key )
	if self["Initialized"] != true then return end
	if self["StartDisabled"] == "1" then return end
	
	if ( key == IN_USE ) then
		
		local tr = util.GetPlayerTrace( ply )
		local trace = util.TraceLine( tr )
		local target = trace.Entity 
		if target["BlockFollow"] == true then return end
		--local hit = ply:GetEyeTrace().HitPos
		if IsValid(target) and 
		isstring(target:GetClass()) and
		ply:GetPos():Distance(target:GetPos()) < self.distance and
		target:GetClass() == self["FollowerClass"]
		--NPC_USE_FOLLOW_SYSTEM == true
		then
				if (self["Steal"] == "1") then
					if target:Hl2c_IsFollow() and target:Hl2c_GetFollowTarget() == ply then
						self:Use_StopFollow(ply, target)
					else
						self:Use_StartFollow(ply, target)
					end
						
				else
					if not target:Hl2c_IsFollow() then
						self:Use_StartFollow(ply, target)
					elseif target:Hl2c_IsFollow() then
						self:Use_StopFollow(ply, target)
					--elseif target:Hl2c_IsFollow() and target:Hl2c_GetFollowTarget() == ply then
						--self:Use_StopFollow(ply, target)
					end
				end
		--end
		elseif IsValid(target) and 
		isstring(target:GetName()) and
		ply:GetPos():Distance(target:GetPos()) < self.distance and
		isstring(self["FollowerName"]) and
		not string.find( self["FollowerName"], "*") and
		target:GetName() == self["FollowerName"]
		--NPC_USE_FOLLOW_SYSTEM == true
		then
				if (self["Steal"] == "1") then
					if target:Hl2c_IsFollow() and target:Hl2c_GetFollowTarget() == ply then
						self:Use_StopFollow(ply, target)
					else
						self:Use_StartFollow(ply, target)
					end
				else
					if not target:Hl2c_IsFollow() then
						self:Use_StartFollow(ply, target)
					elseif target:Hl2c_IsFollow() then
						self:Use_StopFollow(ply, target)
					--elseif target:Hl2c_IsFollow() and target:Hl2c_GetFollowTarget() == ply then
						--self:Use_StopFollow(ply, target)
					end
				end
		elseif IsValid(target) and 
		isstring(target:GetName()) and
		isstring(self["FollowerName"]) and
		ply:GetPos():Distance(target:GetPos()) < self.distance
		then
			
			local txt = string.Explode("*",self["FollowerName"])
			--print("Pressed",txt[1],target:GetName())
			if IsValid(target) and 
			isstring(target:GetName()) and
			ply:GetPos():Distance(target:GetPos()) < self.distance and
			string.find( target:GetName(), txt[1] ) 
			then
				if (self["Steal"] == "1") then
					if target:Hl2c_IsFollow() and target:Hl2c_GetFollowTarget() == ply then
						self:Use_StopFollow(ply, target)
					else
						self:Use_StartFollow(ply, target)
					end
				else
					if not target:Hl2c_IsFollow() then
						self:Use_StartFollow(ply, target)
					elseif target:Hl2c_IsFollow() then
						self:Use_StopFollow(ply, target)
					--elseif target:Hl2c_IsFollow() and target:Hl2c_GetFollowTarget() == ply then
						--self:Use_StopFollow(ply, target)
					end
				end
			end
		end
	end
end

hook.Add( "KeyPress", "KP_hl2c_follow_system", function( ply, key )
	--print( ply, key )
	--if DEV_MODE != true then return end
	--ENT:KeyPress(ply,key)
	for _, ent in pairs( ents.FindByClass("hl2c_follow_system") ) do
		--print("************************************** found")
		ent:KeyPress( ply, key )
	end
end )



function ENT:Use_StartFollow(ply, target)
	--print(ply:Nick())
	if table.Empty(self.Followers) then
	elseif not table.Empty(self.Followers) and 
	not self.Followers[target]
	then
		self.Followers[target] = true
		--print(self.Followers[target])
	end
	

	target:ClearSchedule()
	target:StopMoving()
	--print("Set Follow")
	target:Hl2c_SetFollow(ply)
end

function ENT:Use_StopFollow(ply, target)
	--print("Stop Follow")
	if table.Empty(self.Followers) then
	elseif not table.Empty(self.Followers) and 
	self.Followers[target]
	then
		table.Remove(self.Followers,self.Followers[target])
	end
	target:Hl2c_StopFollow()
	target:ClearSchedule()
	target:StopMoving()
end


--
--   Name: AcceptInput
--   Desc: Called on input received.
--
function ENT:AcceptInput( iName, activator, called, data )
	if self["Initialized"] != true then return end
	
	if string.lower(iName) == "enable" then 
		self["StartDisabled"] = "0"
	end
	
	if string.lower(iName) == "disable" then 
		self["StartDisabled"] = "1"
		if not table.Empty(self.Followers) then
			for k, v in pairs(self.Followers) do
				if IsValid(k) then
					
					k:Hl2c_StopFollow()
					table.Remove(self.Followers,self.Followers[k])
				end
			end
		end
	end
	
	if string.lower(iName) == "kill" then 
		self["StartDisabled"] = "1"
		self["Initialized"] = false
		if not table.Empty(self.Followers) then
			for k, v in pairs(self.Followers) do
				if IsValid(k) then
					
					k:Hl2c_StopFollow()
					table.Remove(self.Followers,self.Followers[k])
				end
			end
		end
	end
end

function ENT:CallingSomething(ent, iName, activator, called, data)
	/*
	print("////////////////")
	print("//")
	print("// Hello World!")
	print("//")
	print("////////////////")
	*/
	if self["Initialized"] != true then return end
	--value = string.Explode(" ",data)
	--inputs = string.Explode(",",value[2])
	--PrintMessage(HUD_PRINTCONSOLE," ")
	-- PrintMessage(HUD_PRINTCONSOLE,"Input                   ".."Param                   ".."Time              ".."FireOnce")
	if isstring(iName) and isstring(activator) and isstring(called)  and isstring(data) then
	-- PrintMessage(HUD_PRINTCONSOLE,""..iName.." "..activator.." "..called.." "..data.."")
	
	elseif isstring(iName) and isstring(activator) and isstring(called) then
	-- PrintMessage(HUD_PRINTCONSOLE,""..iName.." "..activator.." "..called.." ")
	elseif isstring(iName) and isstring(activator) then
	-- PrintMessage(HUD_PRINTCONSOLE,""..iName.." "..activator.." ")
	elseif isstring(iName) then
	-- PrintMessage(HUD_PRINTCONSOLE,""..iName.."")
	end
	--PrintMessage(HUD_PRINTCONSOLE," ")
	--print(" ")
	--PrintMessage(HUD_PRINTTALK,inputs[2].." "..inputs[3].." "..inputs[4].." "..inputs[5])
	--PrintMessage(HUD_PRINTCONSOLE,inputs[2].." "..inputs[3].." "..inputs[4].." "..inputs[5])
	
	--print("Input","Param","Time","FireOnce")
	--print(iName,activator,called,data)
	--print(inputs[2],inputs[3],inputs[4],inputs[5])
	--print(inputs[2],inputs[3],inputs[4],inputs[5])
	--print(" ")
	
	--if inputs[3] == "Citizens_Safe_Ep1_05:1" and self["FollowerClass"] == ent:GetClass() then
	if iName == "Removefromplayersquad" and self["FollowerClass"] == ent:GetClass() then
		ent["BlockFollow"] = true 	
	--elseif inputs[3] == "Citizens_Safe_Ep1_05:1" and self["FollowerName"] == ent:GetName() then
	elseif iName == "Removefromplayersquad" and self["FollowerName"] == ent:GetName() then
		ent["BlockFollow"] = true
	elseif iName == "Removefromplayersquad" then
			local txt = string.Explode("*",self["FollowerName"])
			if IsValid(ent) and 
			isstring(ent:GetName()) and
			string.find( ent:GetName(), txt[1] ) 
			then
				ent["BlockFollow"] = true
				ent:Hl2c_StopFollow()
				if not table.Empty(self.Followers) and table.HasValue(self.Followers,self.Followers[ent])then
					table.Remove(self.Followers,self.Followers[ent])
				end
			end
	end
	
end
hook.Remove("AcceptInput", "hl2c_fs_Ainput")
hook.Add("AcceptInput", "hl2c_fs_Ainput", function( ent, Ainput, activator, caller, value )
	if ent and Ainput and value and ent:GetClass() != "func_areaportal" and ent:GetName() == "intro_relay" then
		--print(ent:GetClass(), Ainput, value)
	end
	if game.GetMap() == "ep1_c17_05" and ent:GetName() == "citizen_refugees_1" then
		for k, v in pairs( ents.FindByClass("hl2c_follow_system") ) do
			--print("************************************** found")
			--v:AcceptInput(Ainput,activator,caller,value)

			v:CallingSomething(ent,Ainput,activator,caller,value)
		end
	end
	
	if game.GetMap() == "ep1_c17_05" and ent:GetName() == "citizen_refugees_2" then
		for k, v in pairs( ents.FindByClass("hl2c_follow_system") ) do
			--print("************************************** found")
			--v:AcceptInput(Ainput,activator,caller,value)

			v:CallingSomething(ent,Ainput,activator,caller,value)
		end
	end
	
	if game.GetMap() == "ep1_c17_05" and ent:GetName() == "citizen_refugees_3" then
		for k, v in pairs( ents.FindByClass("hl2c_follow_system") ) do
			--print("************************************** found")
			--v:AcceptInput(Ainput,activator,caller,value)

			v:CallingSomething(ent,Ainput,activator,caller,value)
		end
	end
	if game.GetMap() == "ep1_c17_05" and ent:GetName() == "citizen_refugees_4" then
		for k, v in pairs( ents.FindByClass("hl2c_follow_system") ) do
			--print("************************************** found")
			--v:AcceptInput(Ainput,activator,caller,value)

			v:CallingSomething(ent,Ainput,activator,caller,value)
		end
	end
	
	if ent and ent:IsNPC() and isstring(value) and string.find(value,"AddContext,Citizens_Safe_Ep1_05:1") 
	then
		--print(ent:GetClass(),value)
		for k, v in pairs( ents.FindByClass("hl2c_follow_system") ) do
			--print("************************************** found")
			--v:AcceptInput(Ainput,activator,caller,value)

			v:CallingSomething(ent,Ainput,activator,caller,value)
		end
		--func = hl2c_follow_system_access()
		--func:AcceptInput(Ainput,activator,caller,value)	
		--func = nil
	end
end)

function ENT:Running()
	
end