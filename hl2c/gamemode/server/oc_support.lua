local nextqueue = 0
local msgqueue = {}

function oc.quickmsg(str)
	table.insert(msgqueue, str)
end

function SendNotify(player, str, time)
	local t = time or 2
	netstream.Start(player, "SendNotify", {str, t})
end

function ScreenFlash(player, alpha, color, speed)
	netstream.Start(player, "PushFlash", {alpha, color, speed})
end

function SendObjective(player, str, time)
	local t = time or 3
	netstream.Start(player, "SendObjective", {str, t})
end

function PlayBackgroundSound(player, str)
	netstream.Start(player, "SendPlaySound", {str})
end

function PushTimer(object, time, title)
	for k, v in pairs(player.GetAll()) do
		netstream.Start(v, "PushTimer", {time, title})
	end
end

function StopTimer()
	for k, v in pairs(player.GetAll()) do
		netstream.Start(v, "StopTimer")
	end
end

oc.waypoints = oc.waypoints or {}
oc.pointmsgs = oc.pointmsgs or {}

local function messagequeue() -- for fucking obsidian conflict.
	if #msgqueue > 0 then
		if nextqueue < CurTime() then
			nextqueue = CurTime() + .1
		else
			msgqueue = table.Reverse(msgqueue)
			for k, v in ipairs(player.GetAll()) do
				for _, msg in ipairs(msgqueue) do
					v:ChatPrint(msg)
				end
			end
			msgqueue = {}
		end
	end
end


function RequestPurchase(ent, input, activator, called, data)
	-- print(ent,input,activate,called,data)
	if hook.Call("CanMapPurchase", GAMEMODE, ent, input, activator, called, data) == false then
		return false
	end

	if activator:IsPlayer() and IsValid(activator) then
		if (activator:Frags() - ent.cost) > 0 then
			activator:SetFrags( activator:Frags() - ent.cost )
		else
			Hl2c.PersonDefaultChatPrint("[Merchant] Not Enough Score",activator)
			-- activator:ChatPrint("[Merchant] Not Enough Score")
			return false
		end
	else
		return false
	end
	
	
	
	for k, v in pairs(ent.actions) do
		if v[1] == "!self" then
			self:Fire(v[2], v[3], v[4])
		elseif v[1] == "!activator" then
			--print(ent:GetClass(),v[2], v[3], v[4])
			if !IsValid(activator) then return end	
			activator:Fire(v[2], v[2], v[4])
		else
			local enttbl = ents.FindByName(v[1])
			for _, target in pairs(enttbl) do
				if v[2] == "Kill" then
					target:EmitSound(ent.sound)
				end
				if target:GetClass() == "game_countdown_timer" then
				
				else
					target:Input(v[2],activator,called,v[3])
					--target:Fire(v[2], v[3], v[4])
					if v[2] == "EquipActivator" then
						print(ent:GetClass(),v[2], v[3], v[4])
					end
				end
			end
		end
	end
	--

	for k, v in pairs(player.GetAll()) do
		local name = ""
		if activator.Name then
			name = activator:Name() .. " "
			/*
			if v:Nick() == activator:Nick() then
				if ( activator:Frag() - ent.cost ) > 1 then
				elseif ( activator:Frag() - ent.cost ) < 1 then
					return false
				end 
			end
			*/
		end
		if activator:IsPlayer() then
		-- activator:ChatPrint(activator:Nick().."   "..ent.name.."   "..ent.cost)
		Hl2c.PersonDefaultChatPrint(activator:Nick().."   "..ent.name.."   "..ent.cost,activator)
		end
		--SendNotify(v, Format(lang.mappurchase, name, ent.name, ent.cost), 3)
	end
	--


	return true
end