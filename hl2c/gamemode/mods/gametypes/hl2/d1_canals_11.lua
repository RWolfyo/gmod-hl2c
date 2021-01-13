ALLOWED_VEHICLE = "Named Airboat"

NEXT_MAP = "d1_canals_12"

TRIGGER_CHECKPOINT = {
	{Vector(6238, 5057, -888), Vector(6071, 5193, -841)},
	
	{Vector(6284, 5237, -899), Vector(6421, 5445, -835), false, 
	function()
		for k, v in pairs(ents.FindByName("brush_maproom_PCLIP")) do
			v:Fire("Enable")
			print("** Fire brush_maproom_PCLIP Enable")
		end
		
		timer.Simple(25, function()
			for k, v in pairs(ents.FindByName("door_guncave_exit")) do
			v:Fire("Open")
			print("** Found door_guncave_exit **")
			end
			
			for k, v in pairs(ents.FindByName("brush_maproom_PCLIP")) do
			v:Fire("Disable")
			v:Fire("Kill")
			print("** Fire brush_maproom_PCLIP Disable")
			end
		end)

	end}
	
	--{Vector(289, -7412, -896), Vector(315, -7064, -736)}
	/*
	setpos 6301.3, 5065.6, -882.3

setpos 6105, 5220.4, -769.4

	*/
	--{Vector(6301.3, 5065.6, -882.3), Vector(6105, 5220.4, -769.4)}
}

BRUSH_PLAYERCLIP = {

	{Vector(10253, 9761, -1004), Vector(9743, 10004, -674)}
	
}
--Must Put a Prop Brush too

-- VORTEX_POS = Vector(6329.528809, 4720.048828, -758.248779)
VORTEX_POS = Vector(4465.493652, -1709.871216, -555.913818)	
local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["gate1"] = true,
	["relay_guncave_gate_exit_close"] = true,
}

function MAPSCRIPT:PostPlayerSpawn(pl)
	--pl:GodEnable()
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_357")
	pl:Give("weapon_frag")
	pl:Give("weapon_medkit_hl2c")
end

function MAPSCRIPT:EntityRemoved(ent)
	if ent:GetName() == "door_guncave_exit" then
		local entity2 = ents.FindByClass("prop_vehicle_airboat")
		for _, ent2 in pairs(entity2) do
			ent2:Fire("enablegun", "1")
		end
		ALLOWED_VEHICLE = "Airboat Gun"
	end
end

function MAPSCRIPT:InitPost()
	
	--local gate_relay = ents.FindByName("relay_guncave_gate_entrance_close")
	--gate_relay[1]:Remove()

	--local gate = ents.FindByName("door_guncave_exit")
	--gate[1]:Fire("addoutput", "OnFullyOpen !self,Kill,,0,-1", "0")
	
	for k, v in pairs(ents.FindByName("door_guncave_exit")) do
		v:Fire("addoutput", "OnFullyOpen !self,Kill,,0.5,-1")
		print("** Found door_guncave_exit **")
	end
	
	//	relay_guncave_gate_exit_open
	// brush_maproom_PCLIP
	
	-- for k, v in pairs(ents.FindByName("relay_guncave_gate_exit_close")) do
		-- v:Remove()
		-- print("** Found relay_guncave_gate_exit_close **")
	-- end
	
	--local relay_guncave01 = ents.FindByName("lcs_gc_nagmaproom_m_02")
	for _, exit_open01 in pairs(ents.FindByName("lcs_gc_nagmaproom_m_02")) do
		--exit_open01:Fire("addoutput", "OnStart door_guncave_exit,Trigger,,45,-1")
		exit_open01:Fire("addoutput", "OnStart brush_maproom_PCLIP,Kill,,45,-1")
	end
	
	--local relay_guncave02 = ents.FindByName("logic_gc_nagmaproom_m_02")
	for _, exit_open02 in pairs(ents.FindByName("logic_gc_nagmaproom_m_02")) do
		--exit_open02:Fire("addoutput", "OnTrigger door_guncave_exit,Trigger,,45,-1")
		--exit_open02:Fire("addoutput", "OnTrigger brush_maproom_PCLIP,Kill,,45,-1")
	end
	
	--local relay_guncave03 = ents.FindByName("trigger_pre_maproom")
	for _, exit_open03 in pairs(ents.FindByName("trigger_pre_maproom")) do
		--exit_open03:Fire("addoutput", "OnTrigger door_guncave_exit,Trigger,,45,-1")
		--exit_open03:Fire("addoutput", "OnTrigger brush_maproom_PCLIP,Kill,,45,-1")
	end
	
	for k,v in pairs(ents.FindByName("trigger_guncave_showgunhint")) do
		v:Fire("addoutput", "OnTrigger door_guncave_exit,Open,,15,-1")
		print("** Found trigger_guncave_showgunhint **")
	end
	
	for k, v in pairs(ents.FindByName("music_airboatgun")) do
		v:SetKeyValue("message", "music/hl2_song14.mp3")
	end
	
	
	
end

hook.Add("Think", "hl2cThink", function()
	
	for k, v in pairs(ents.FindByName("flyby_copter1")) do
		for m, n in pairs(player.GetAll()) do
			v:AddEntityRelationship( n, D_LI, 99 )
		end
	end
end)

return MAPSCRIPT