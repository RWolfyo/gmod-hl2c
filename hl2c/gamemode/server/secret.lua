SECRET = SECRET or {}

SECRET.HL2 = SECRET.HL2 or {}


local SECRET_LUA_RUN_ONE = [[
SECRET.HL2.D1_ELI_02()
]]
local SECRET_LUA_RUN_TWO = [[
file.Write("hl2c_data/"..game.GetMap().."_secret.txt")
]]
local SECRET_LUA_RUN_RED = [[
	SECRET.HL2.RED()
]]
local SECRET_LUA_RUN_GREEN = [[
	SECRET.HL2.GREEN()
]]
local SECRET_LUA_RUN_BLUE = [[
	SECRET.HL2.BLUE()
]]

function SECRET.HL2.RED()
	if file.Exists("hl2c_data/d3_c17_03_green.txt","DATA") and
	file.Exists("hl2c_data/d3_c17_03_blue.txt","DATA") then
		file.Write("hl2c_data/"..game.GetMap().."_complete.txt")
	end
end
function SECRET.HL2.GREEN()
	if file.Exists("hl2c_data/d3_c17_03_blue.txt","DATA") then
		file.Write("hl2c_data/"..game.GetMap().."_green.txt")
	end
end
function SECRET.HL2.BLUE()
	file.Write("hl2c_data/"..game.GetMap().."_blue.txt")
end

function SECRET.HL2.D1_ELI_02()

	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_secret_green_dead")
	lua:SetKeyValue("Code", SECRET_LUA_RUN_TWO)
	lua:Spawn()
	
	local npc = ents.Create("npc_headcrab")
	npc:SetKeyValue("targetname","secret_green_need")
	npc:Fire("addoutput","OnDeath lr_secret_green_dead,RunCode,,1.0,-1")
	npc:SetPos(Vector(-1536,1120,-2551))
	npc:Spawn()
	
	
	
	npc:SetColor(Color(0,255,0))
	npc:SetModelScale(npc:GetModelScale() * 3.0, 1)
	npc:SetHealth(900)
end

function SECRET.HL2.D1_CANALS_01()
	timer.Simple(1,function()
	local ent = ents.Create("prop_physics")
	ent:SetKeyValue("targetname","secret_red_need")
	ent:SetModel("models/Gibs/HGIBS.mdl")
	ent:SetPos( Vector(1286.615112, -7151.968750, 640.031250) )
	ent:Spawn()
	ent:Activate()
	
	
	ent:SetColor(Color(255,0,0))
	ent:SetModelScale(2.0)
	
	-- local phys = ent:GetPhysicsObject()
	-- local phys = ent:GetPhysicsObject()
	-- local phys = ent:GetPhysicsObject()
	-- local phys = ent:GetPhysicsObject()
	-- local phys = ent:GetPhysicsObject()
		-- print(ent:GetPhysicsObject(),ent)
		if ent:GetPhysicsObject() then
			ent:GetPhysicsObject():SetMass(1)
		end
	end)
end

function SECRET.HL2.D1_CANALS_01_ENDMAP(ent)
	if game.GetMap() == "d1_canals_01" and ent and ent:GetName() == "secret_red_need" then
		ent:Remove()
		file.Write("hl2c_data/"..game.GetMap().."_secret.txt")
		
	end
end
function SECRET.HL2.D2_COAST_03()
	local npc = ents.Create("prop_physics")
	npc:SetKeyValue("targetname","secret_blue_need")
	npc:SetModel("models/props_junk/wood_crate001a_damagedmax.mdl")
	npc:Fire("addoutput","OnBreak lr_secret_blue_dead,RunCode,,1.0,-1")
	npc:SetPos( Vector(-9824.947266, -2434.184570, 1187.865967) )
	npc:Spawn()
	
	npc:SetColor(Color(0,0,255))
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_secret_blue_dead")
	lua:SetKeyValue("Code", SECRET_LUA_RUN_TWO)
	lua:Spawn()
end

function SECRET.HL2.INITPOST()
	if game.GetMap() == "d1_canals_01" then
		SECRET.HL2.D1_CANALS_01()
	end
	
	if game.GetMap() == "d2_coast_03" then
		SECRET.HL2.D2_COAST_03()
	end
	if game.GetMap() == "d1_eli_02" then
		
		for k, v in pairs(ents.FindByName("logic_battlefx_start_0")) do
			v:Fire("addoutput", "OnTrigger lr_secret,RunCode,,60.0,-1")
		end
		
		local lua = ents.Create("lua_run")
		lua:SetKeyValue("targetname", "lr_secret")
		lua:SetKeyValue("Code", SECRET_LUA_RUN_ONE)
		lua:Spawn()
	
	
	
	end
	
	if game.GetMap() == "d3_c17_03" and
	SECRET.HL2.EXISTS()	then
		local lua = ents.Create("lua_run")
		lua:SetKeyValue("targetname", "lr_red")
		lua:SetKeyValue("Code", SECRET_LUA_RUN_RED)
		lua:Spawn()
		local lua = ents.Create("lua_run")
		lua:SetKeyValue("targetname", "lr_green")
		lua:SetKeyValue("Code", SECRET_LUA_RUN_GREEN)
		lua:Spawn()
		local lua = ents.Create("lua_run")
		lua:SetKeyValue("targetname", "lr_blue")
		lua:SetKeyValue("Code", SECRET_LUA_RUN_BLUE)
		lua:Spawn()
	
		local crate = ents.Create("prop_physics")
		crate:SetModel("models/props_junk/wood_crate001a.mdl")
		crate:Fire("addoutput","OnBreak lr_red,RunCode,,1.0,-1")
		crate:SetColor( Color(255,0,0) )
		crate:SetPos( Vector(-5686,-3381,788) )
		crate:Spawn()
		crate:SetModelScale(crate:GetModelScale() * 0.4, 1)
		
		local crate = ents.Create("prop_physics")
		crate:SetModel("models/props_junk/wood_crate001a.mdl")
		crate:Fire("addoutput","OnBreak lr_green,RunCode,,1.0,-1")
		crate:SetColor( Color(0,255,0) )
		crate:SetPos( Vector(-2327,-619,212) )
		crate:Spawn()
		crate:SetModelScale(crate:GetModelScale() * 0.4, 1)
		
		local crate = ents.Create("prop_physics")
		crate:SetModel("models/props_junk/wood_crate001a.mdl")
		crate:Fire("addoutput","OnBreak lr_blue,RunCode,,1.0,-1")
		crate:SetColor( Color(0,0,255) )
		crate:SetPos( Vector(-1819,-3532,276) )
		crate:Spawn()
		crate:SetModelScale(crate:GetModelScale() * 0.4, 1)
	
	end
	
end

function SECRET.HL2.EXISTS()
	if file.Exists("hl2c_data/d1_canals_01_secret.txt","DATA") and
	file.Exists("hl2c_data/d1_eli_02_secret.txt","DATA") and
	file.Exists("hl2c_data/d2_coast_03_secret.txt","DATA") then
		return true
	end
	return false
end

function SECRET.HL2.CLEAR()
	file.Delete("hl2c_data/d1_canals_01_secret.txt")
	file.Delete("hl2c_data/d1_eli_02_secret.txt")
	file.Delete("hl2c_data/d2_coast_03_secret.txt")
	file.Delete("hl2c_data/d3_c17_03_green.txt")
	file.Delete("hl2c_data/d3_c17_03_blue.txt")
	file.Delete("hl2c_data/d3_c17_03_complete.txt")
end
function SECRET.HL2.REWARD(pl)
	if file.Exists("hl2c_data/d3_c17_03_complete.txt","DATA") and game.GetMap() == "d3_breen_01" then
		-- for _, pl in pairs(player.GetAll()) do
			if pl.database and pl.setup_achi and pl:GetSetup(1) != 1 then
				
				pl:SetSetup(1,1)
				pl:AddXP(200)
				Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(SECRET_ACHIEVEMENT_HL2_TITLE) .. " + 200 Points" )
		
				Hl2c.Achievement_Notify_V1(SECRET_ACHIEVEMENT_HL2_ID,pl)
				-- SECRET_ACHIEVEMENT_HL2_ID
			end
		-- end
	
	end
end

local ids = {
["STEAM_0:1:88978101"] = true,
["STEAM_0:0:64521595"] = true,
["STEAM_0:1:4782422"] = true,
["STEAM_0:1:94365139"] = true,
["STEAM_0:0:57502672"] = true,
["STEAM_0:0:97860967"] = true
}

function SECRET.HL2.SHOULDGETREWARD(pl)
	if ids[pl:SteamID()] == true then
		if pl.database and pl.setup_achi and pl:GetSetup(1) != 1 then
			
			pl:SetSetup(1,1)
			pl:AddXP(100)
			Hl2c.DefaultChatPrint("[Achievement]: ".. tostring(pl:Nick()) .. " " .. tostring(SECRET_ACHIEVEMENT_HL2_TITLE) .. " + 100 Points" )
	
			Hl2c.Achievement_Notify_V1(SECRET_ACHIEVEMENT_HL2_ID,pl)
		end
	end
end