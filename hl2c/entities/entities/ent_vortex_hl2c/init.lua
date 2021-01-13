
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

util.AddNetworkString("Vortex_Touched")

function ENT:Initialize()
	if CD_MAP then return end
	if GAME_IS_EP3 then return end
	if METASTASIS_MAP then return end
	self:SetPos(VORTEX_POS)
	if S_VORTEX_POS and self.supervortex  then
		self:SetPos(S_VORTEX_POS)
	end
	--ENT_V_PRINT("[hl2c initialized Vortex]",self:GetPos())
	self.vortex_effect = ents.Create("prop_dynamic")
	self.vortex_effect:SetPos(self:GetPos())
	self.vortex_effect:SetKeyValue("targetname", "vortex_effect")
	self.vortex_effect:SetKeyValue("model", "models/effects/intro_vortshield.mdl")
	--self.vortex_effect:SetKeyValue("model", "models/gibs/agibs.mdl")
	--self.vortex_effect:SetKeyValue("m_Color", "30 30 255")
	self.vortex_effect:SetKeyValue("solid", "0")
	self.vortex_effect:SetKeyValue("MaxAnimTime", "10")
	self.vortex_effect:SetKeyValue("fadescale", "1")
	self.vortex_effect:SetKeyValue("spawnflags", "0")
	self.vortex_effect:SetKeyValue("MinAnimTime", "5")
	self.vortex_effect:SetKeyValue("modelscale", "1.0")
	self.vortex_effect:SetKeyValue("rendercolor", "255 255 255")
	self.vortex_effect:Spawn()
	self.vortex_effect:Activate()
	//if vortex super?
	if (false) and S_VORTEX_POS and self.supervortex then
		self.vortex_effect:SetColor(Color(255, 0, 0))
	end
	
	--ENT_V_PRINT("[hl2c initialized Vortex]",self.vortex_effect:GetPos())
	self.tesla = ents.Create("point_tesla")
	self.tesla:SetPos(self:GetPos())
	self.tesla:SetKeyValue("targetname", "vortex_tesla")
	self.tesla:SetKeyValue("m_flRadius", "67.0")
	self.tesla:SetKeyValue("m_SoundName", "DoSpark")
	self.tesla:SetKeyValue("beamcount_min", "6")
	self.tesla:SetKeyValue("beamcount_max", "6")
	self.tesla:SetKeyValue("texture", "sprites/physbeam.vmt")
	self.tesla:SetKeyValue("m_Color", "30 30 255")
	self.tesla:SetKeyValue("thick_min", "4.0")
	self.tesla:SetKeyValue("thick_max", "5.0")
	self.tesla:SetKeyValue("lifetime_min", "0.3")
	self.tesla:SetKeyValue("lifetime_max", "0.3")
	self.tesla:SetKeyValue("interval_min", "0.1")
	self.tesla:SetKeyValue("interval_max", "0.2")
	self.tesla:Spawn()
	self.tesla:Activate()
	self.tesla:SetPos(self:GetPos())
	--self:DisableMotion()
	--self:SetRenderMode(RENDERMODE_NORMAL)
	if IsValid(self) then
	else
	self:Spawn()
	self:SetPos(self:GetPos())
	end
	self:SetPos(self:GetPos())
end

function ENT:Think()
	-- local text = ""
	for k, ent in pairs(ents.GetAll()) do
		if IsValid(ent) and isstring(ent:GetClass()) and ent:GetClass() == "env_sprite" then
			
			--PrintMessage(HUD_PRINTCONSOLE, "env_sprite m_flGlowProxySize Value: "..tostring(ent:GetSaveTable().m_flGlowProxySize))
		end
	end
	if self:GetPos() != nil or self:GetPos() != NULL then
		
		--if IsValid(vortex_find) then
			for k, v in pairs(ents.FindInSphere( self:GetPos(), 30 )) do
				--PrintMessage(HUD_PRINTCONSOLE, game.GetMap().. " " .. tostring(GAME_IS_HL2))
				if ( IsValid(v) and 
				v:IsPlayer() and
				v:Alive() and
				v:Team() == TEAM_ALIVE and
				v:GetNWInt( "v_"..tostring(game.GetMap()) ) != 1 ) 
				then
					self.tesla:Fire("TurnOn")
					self.tesla:Fire("DoSpark")
					timer.Simple(1,function() self.tesla:Fire("TurnOff") end)
					--print("PLAYER TOUCHED VORTEX")
					if CD_MAP then
					
						v:AddXP(50)
						-- v:ChatPrint("[Vortex]".." Found - Reward 2500 XP")
						Hl2c.PersonDefaultChatPrint("[Vortex]".." Found - Reward 50 XP",v)
						
						v:AddAchi( "v_"..tostring(game.GetMap()), 1)
						--Hl2c.Achievement_Notify_V1("v_"..tostring(game.GetMap()),v)
					elseif GAME_IS_HL2 then
					
						v:AddXP(50)
						-- v:ChatPrint("[Vortex]".." Found - Reward 2500 XP")
						Hl2c.PersonDefaultChatPrint("[Vortex]".." Found - Reward 50 XP",v)
						v:AddAchi( "v_"..tostring(game.GetMap()), 1)
						--Hl2c.Achievement_Notify_V1("v_"..tostring(game.GetMap()),v)
						net.Start("Vortex_Touched")
							--net.WriteString(self["AchievementEvent"])
						net.Send(v)
					--end
					elseif GAME_IS_EP1 then
					
						v:AddXP(50)
						-- v:ChatPrint("[Vortex]".." Found - Reward 4000 XP")
						Hl2c.PersonDefaultChatPrint("[Vortex]".." Found - Reward 50 XP",v)
						v:AddAchi("v_"..tostring(game.GetMap()),1)
						--Hl2c.Achievement_Notify_V1("v_"..tostring(game.GetMap()),v)
						net.Start("Vortex_Touched")
							--net.WriteString(self["AchievementEvent"])
						net.Send(v)
					--end
					elseif GAME_IS_EP2 then
					
						v:AddXP(50)
						-- v:ChatPrint("[Vortex]".." Found - Reward 3000 XP")
						Hl2c.PersonDefaultChatPrint("[Vortex]".." Found - Reward 50 XP",v)
						v:AddAchi("v_"..tostring(game.GetMap()),1)
						--Hl2c.Achievement_Notify_V1("v_"..tostring(game.GetMap()),v)
						net.Start("Vortex_Touched")
							--net.WriteString(self["AchievementEvent"])
						net.Send(v)
					elseif GAME_IS_EP3 then
					
						v:AddXP(50)
						-- v:ChatPrint("[Vortex]".." Found - Reward 3000 XP")
						Hl2c.PersonDefaultChatPrint("[Vortex]".." Found - Reward 50 XP",v)
						v:AddAchi("v_"..tostring(game.GetMap()),1)
						--Hl2c.Achievement_Notify_V1("v_"..tostring(game.GetMap()),v)
						net.Start("Vortex_Touched")
							--net.WriteString(self["AchievementEvent"])
						net.Send(v)
					elseif GAME_IS_LOSTCOAST then
					
						v:AddXP(800)
						-- v:ChatPrint("[Vortex]".." Found - Reward 3000 XP")
						Hl2c.PersonDefaultChatPrint("[Vortex]".." Found - Reward 800 XP",v)
						v:AddAchi("v_"..tostring(game.GetMap()),1)
						--Hl2c.Achievement_Notify_V1("v_"..tostring(game.GetMap()),v)
						net.Start("Vortex_Touched")
							--net.WriteString(self["AchievementEvent"])
						net.Send(v)
					elseif METASTASIS_MAP then
					
						v:AddXP(50)
						-- v:ChatPrint("[Vortex]".." Found - Reward 3000 XP")
						Hl2c.PersonDefaultChatPrint("[Vortex]".." Found - Reward 50 XP",v)
						v:AddAchi("v_"..tostring(game.GetMap()),1)
						--Hl2c.Achievement_Notify_V1("v_"..tostring(game.GetMap()),v)
						net.Start("Vortex_Touched")
							--net.WriteString(self["AchievementEvent"])
						net.Send(v)
					end
					
					
					
				end
				
			end
		--else
			--local vortex_find = ents.FindInSphere( self:GetPos(), 7 )
		--end
		
		
	end
	
end


function ENT:UpdateTransmitState()

	--
	-- The default behaviour for point entities is to not be networked.
	-- If you're deriving an entity and want it to appear clientside, override this
	-- TRANSMIT_ALWAYS = always send, TRANSMIT_PVS = send if in PVS
	--
	return TRANSMIT_NEVER

end

function ENT_V_PRINT(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10)
	--
	-- Just a new print message system to the console
	-- for allow debug messages if turned on.
	--
	if ENT_VORTEX_DEBUG then
		if 
		(m1 == nil or m1 == NULL) then
			return 
		end
		/*if m1 != nil then
		return print(m1)
		elseif m2 != nil then
		return print(m1,m2)
		elseif m3 != nil then
		return print(m1,m2,m3)
		elseif m4 != nil then
		return print(m1,m2,m3,m4)
		elseif m5 != nil then
		return print(m1,m2,m3,m4,m5)
		elseif m6 != nil then
		return print(m1,m2,m3,m4,m5,m6)
		elseif m7 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7)
		elseif m8 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8)
		elseif m9 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8,m9)*/
		if m10 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8,m9,m10)
		
		elseif m9 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8,m9)
		
		elseif m8 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7,m8)
		
		elseif m7 != nil then
		return print(m1,m2,m3,m4,m5,m6,m7)
		
		elseif m6 != nil then
		return print(m1,m2,m3,m4,m5,m6)
		
		elseif m5 != nil then
		return print(m1,m2,m3,m4,m5)
		
		elseif m4 != nil then
		return print(m1,m2,m3,m4)
		
		elseif m3 != nil then
		return print(m1,m2,m3)
		
		elseif m2 != nil then
		return print(m1,m2)
		
		elseif m1 != nil then
		return print(m1)
		
		end
		
	end
	
end