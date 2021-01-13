local MAPSCRIPT = {}

NEXT_MAP = "winter_lobby_2012"
-- VORTEX_POS = Vector(35.848160, -1896.503662, -1019.294373)

/*
setpos -451.953979, -2060.467041, -1135.968750;setang 8.266294 -167.780197 0.000000

setpos -269.547943, -1868.118164, -1182.706665;setang 19.039688 51.891705 0.000000





setpos 1186.037964, -2264.640137, -1159.271851;setang 45.193298 176.564835 0.000000
You're playing on Half - Life 2 Campaign Test Server ..., enjoy your stay!
] getpos 
setpos 501.075684, -1899.339478, -1111.968750;setang 1.825802 -39.089821 0.000000


*/
HL2C_EP2_ELEVATOR = false

EP2_LUA_RUN_ONE = [[
print("WORKING LUA SCRIPT ON ELEVATOR") 
HL2C_EP2_ELEVATOR = true
GAMEMODE:HL2CForceRespawn()
for _, pl in pairs(player.GetAll()) do
	if IsValid(pl) then
		for k, v in pairs(ents.FindByClass("npc_alyx")) do
			pl:Teleport(v:GetPos())
		end
	end
end
]]
-- tracktrain_elevator

EP2_LUA_RUN_TWO = [[
print("WORKING LUA SCRIPT ON BUTTON PUSH") 
HL2C_EP2_ELEVATOR = false
]]

EP2_LUA_RUN_THREE = [[
print("WORKING LUA SCRIPT ON DOBCLIMB") 
HL2C_EP2_ELEVATOR = false
for k, v in pairs(ents.FindByClass("npc_dog")) do
	if IsValid(v) then
		v:SetPos(Vector(1284.118774, -2137.787109, -966.464844))
	end
end
]]

EP2_LUA_RUN_FOUR = [[
HL2C_EP2_ELEVATOR = false
for k, v in pairs(ents.FindByName("hl2c_end")) do
	timer.Simple(90,function()
	v:Fire("Changelevel")
	print("WORKING LUA SCRIPT ON CHANGELEVEL") 
	end)
	print("WORKING LUA SCRIPT ON ENDMAP") 
end
]]

TRIGGER_CHECKPOINT = {
	{Vector(-530, -1302, -1564),
	Vector(-694, -1469, -1468)},
	
	{Vector(-451.953979, -2060.467041, -1135.968750), 
	Vector(-269.547943, -1868.118164, -1182.706665)},
	
	{Vector(1186.037964, -2264.640137, -1159.271851), 
	Vector(501.075684, -1899.339478, -1111.968750)}
}


-- setpos 1544.838135 -2449.075684 -1111.968750;setang 15.022490 167.668228 0.000000 TELEPORT 


TRIGGER_DELAYMAPLOAD = {Vector(1103.271362, -1848.858521, -1175.968750), Vector(1295.968750, -2344.265137, -1020.297119)}



function MAPSCRIPT:InitPost()
	-- trigger_elevator_go_down
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_elevator")
	lua:SetKeyValue("Code", EP2_LUA_RUN_ONE)
	lua:Spawn()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_button")
	lua:SetKeyValue("Code", EP2_LUA_RUN_TWO)
	lua:Spawn()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_dogclimb")
	lua:SetKeyValue("Code", EP2_LUA_RUN_THREE)
	lua:Spawn()
	
	local lua = ents.Create("lua_run")
	lua:SetKeyValue("targetname", "lr_end")
	lua:SetKeyValue("Code", EP2_LUA_RUN_FOUR)
	lua:Spawn()
	
	local ent = ents.Create("point_changelevel")
	ent:SetKeyValue("targetname", "hl2c_end")
	ent:Spawn()
end

function MAPSCRIPT:KeyValue(ent, key, value)
	if IsValid(ent) and
	key == "targetname" and
	value == "trigger_elevator_go_down"
	then
		timer.Simple(2.5,function()
			if IsValid(ent)
			then
				ent:Fire("addoutput", "OnTrigger lr_elevator,RunCode,,1.0,-1")
				print("****************************")
				print("** Found Elevator Trigger **")
				print("****************************")
			end
		end)
	end
	
	if IsValid(ent) and
	key == "targetname" and
	value == "button_launch"
	then
		timer.Simple(2.5,function()
			if IsValid(ent)
			then
				ent:Fire("addoutput", "OnPressed lr_button,RunCode,,1.0,-1")
				print("****************************")
				print("** Found button_launch **")
				print("****************************")
			end
		end)
	end
	
	if IsValid(ent) and
	key == "targetname" and
	value == "lcs_alyx_eli_goodbye"
	then
		timer.Simple(2.5,function()
			if IsValid(ent)
			then
				ent:Fire("addoutput", "OnTrigger2 lr_dogclimb,RunCode,,1.0,-1")
				print("****************************")
				print("** Found lcs_alyx_eli_goodbye **")
				print("****************************")
			end
		end)
	end
	
	if IsValid(ent) and
	key == "targetname" and
	value == "relay.advisor.scene"
	then
		timer.Simple(2.5,function()
			if IsValid(ent)
			then
				ent:Fire("addoutput", "OnTrigger lr_end,RunCode,,30.0,-1")
				print("****************************")
				print("** Found relay.advisor.scene **")
				print("****************************")
			end
		end)
	end
	
	if IsValid(ent) and
	key == "targetname" and
	value == "door_launchbunker_exit_a"
	then
		timer.Simple(2.5,function()
			if IsValid(ent)
			then
				--ent:Remove()
				ent:Fire("addoutput", "OnFullyOpen brush_launchbunker_exit_a,Kill,,1.0,-1")
				ent:Fire("addoutput", "OnFullyOpen !self,Kill,,1.5,-1")
				print("*************************************")
				print("** Found brush_launchbunker_exit_a **")
				print("*************************************")
			end
			end)
	end
	
end


function MAPSCRIPT:PostPlayerSpawn(pl)

	if HL2C_EP2_ELEVATOR == true then
		timer.Simple(1.5,function()
			for k, v in pairs(ents.FindByClass("npc_alyx")) do
				if IsValid(pl) and
				pl:Team() == TEAM_ALIVE
				then
					pl:Teleport(v:GetPos())
					print("[hl2c spawn] player on alyx")
				end
			end
		end)
	end
	pl:StripWeapons()
	pl:Give("weapon_physcannon")

end


return MAPSCRIPT

-- dog: unknown scripted sequence "ss_12a_climb"
/*
Clamping SetLocalVelocity(0.000000,10000.000000,0.000000) on lift_door_1_a (452)
Could not find screen space effect episodic_stun
Could not find screen space effect episodic_stun
Could not find screen space effect episodic_stun
Could not find screen space effect episodic_stun
Could not find screen space effect episodic_stun
Could not find screen space effect episodic_stun
Could not find screen space effect episodic_stun
Could not find screen space effect episodic_stun
VehicleType:prop_vehicle_choreo_generic:
furniture.cvehicle.hangar: unknown scripted sequence "ep2_12a_advisorgrab"
eli_advisor: unknown scripted sequence "ss_eli_advisor"
advisor: unknown scripted sequence "dog_advisor"
ERROR! models/advisor.mdl missing ACT_DIESIMPLE
dog: unknown scripted sequence "dog_advisor"

*/