local MAPSCRIPT = {}

if file.Exists("hl2c_data/ep2_outland_04.txt", "DATA") then
	-- -3015.000977, -9449.565430, -835.968750
	INFO_PLAYER_SPAWN = {Vector(-3016.731689, -9381.837891, -835.968750), 0}
	NEXT_MAP = "ep2_outland_05"
	
	-- chechpoint, -2967.314941, -9380.763672, -864.046448		-3151.099365, -9264.747070, -788.447388
	
	TRIGGER_CHECKPOINT = {
	/*
setpos -3010, -9457, -888
] getpos 
setpos -3042, -9272, -721

	*/
	{Vector(-3010, -9457, -888), Vector(-3042, -9272, -721)}
	}
	
else
	INFO_PLAYER_SPAWN = {Vector(-2260, -8275, -431), 0}
	NEXT_MAP = "ep2_outland_03"
	
	TRIGGER_CHECKPOINT = {
	
	{Vector(-2702.194336, -9085.232422, -574.751343), Vector(-2256.401611, -9133.995117, -746.360840)},
	
	{Vector(-583.249268, -9428.839844, -722.282043), 
	Vector(-342.801880, -9727.513672, -599.956726)}


	}
end

--VORTEX_POS = Vector(-2963.520020, -9659.584961, -430.202759)

-- Because crap atm
HL2C_SKIP = false

function MAPSCRIPT:InitPost()
	/*local newalyxby = ents.Create("npc_alyx")
	newalyxby:SetPos(Vector( -448.734741, 711.877991, 896.031250 ))
	newalyxby:SetKeyValue("targetname", "Alyx")
	newalyxby:Spawn()*/
	/*
	timer.Simple(5, function()
	local noplydie = ents.FindByClass("logic_choreographed_scene")
	noplydie[1]:SetKeyValue("onplayerdeath", "0")
	noplydie[2]:SetKeyValue("onplayerdeath", "0")
	noplydie[3]:SetKeyValue("onplayerdeath", "0")
	noplydie[4]:SetKeyValue("onplayerdeath", "0")
	noplydie[5]:SetKeyValue("onplayerdeath", "0")
	noplydie[6]:SetKeyValue("onplayerdeath", "0")
	noplydie[7]:SetKeyValue("onplayerdeath", "0")
	noplydie[8]:SetKeyValue("onplayerdeath", "0")
	noplydie[9]:SetKeyValue("onplayerdeath", "0")
	noplydie[10]:SetKeyValue("onplayerdeath", "0")
	noplydie[11]:SetKeyValue("onplayerdeath", "0")
	noplydie[12]:SetKeyValue("onplayerdeath", "0")
	noplydie[13]:SetKeyValue("onplayerdeath", "0")
	noplydie[14]:SetKeyValue("onplayerdeath", "0")
	noplydie[15]:SetKeyValue("onplayerdeath", "0")
	noplydie[16]:SetKeyValue("onplayerdeath", "0")
	noplydie[17]:SetKeyValue("onplayerdeath", "0")
	noplydie[18]:SetKeyValue("onplayerdeath", "0")
	noplydie[19]:SetKeyValue("onplayerdeath", "0")
	noplydie[20]:SetKeyValue("onplayerdeath", "0")
	noplydie[21]:SetKeyValue("onplayerdeath", "0")
	noplydie[22]:SetKeyValue("onplayerdeath", "0")
	noplydie[23]:SetKeyValue("onplayerdeath", "0")
	noplydie[24]:SetKeyValue("onplayerdeath", "0")
	noplydie[25]:SetKeyValue("onplayerdeath", "0")
	noplydie[26]:SetKeyValue("onplayerdeath", "0")
	noplydie[27]:SetKeyValue("onplayerdeath", "0")
	noplydie[28]:SetKeyValue("onplayerdeath", "0")
	noplydie[29]:SetKeyValue("onplayerdeath", "0")
	noplydie[30]:SetKeyValue("onplayerdeath", "0")
	noplydie[31]:SetKeyValue("onplayerdeath", "0")
	noplydie[32]:SetKeyValue("onplayerdeath", "0")
	end)
	*/
	
	if !game.SinglePlayer() then
	/*
			local delcam1 = ents.FindByName("pvc0")
			delcam1[1]:Remove()
			local delcam2 = ents.FindByName("pvc3")
			delcam2[1]:Remove()
			local delcam3 = ents.FindByName("pvc1")
			delcam3[1]:Remove()
			local delcam4 = ents.FindByName("pvc_black")
			delcam4[1]:Remove()
			local delcam5 = ents.FindByName("pvc5")
			delcam5[1]:Remove()
			local delcam6 = ents.FindByName("pvc2")
			delcam6[1]:Remove()
			local delcam7 = ents.FindByName("pvc4")
			delcam7[1]:Remove()
			*/
			--delcameras[1]:Remove()
			--delcameras[2]:Remove()
			--delcameras[3]:Remove()
			--delcameras[4]:Remove()
			--delcameras[5]:Remove()
			--delcameras[6]:Remove()
			--delcameras[7]:Remove()
			
		ents.GetMapCreatedEntity(1670):Fire("addoutput","OnHitMax logicRelay_finalWave,Trigger,,0.4,-1")
		ents.GetMapCreatedEntity(1670):Fire("addoutput","OnHitMax logicRelay_finalWave,Remove,,0.41,-1")
	end
	if file.Exists("hl2c_data/ep2_outland_04.txt", "DATA") then
		/*
		"logic_auto"
        {
            "spawnflags" "1"
            "OnMapSpawn" "coming_from_04_scene_setup,Trigger,,0.2,-1"
            "OnMapSpawn" "the gman mood,Enable,,0,-1"
            "OnMapSpawn" "gman scene,Enable,,0,-1"
            "OnMapSpawn" "lightshaft,TurnOn,,0,-1"
            "OnMapSpawn" "vort_follow,Deactivate,,0,-1"
            "OnMapSpawn" "elevator_kill_trigger,Kill,,0,-1"
            "OnMapSpawn" "elevator_autosave_trigger,Enable,,0,-1"
            "OnMapSpawn" "turret_buddy_2,Kill,,1.5,-1"
            "OnMapSpawn" "turret_buddy_1,Kill,,1.5,-1"
            "OnMapSpawn" "start_the_elevator_rl,Trigger,,1,-1"
            "OnMapSpawn" "gman_template,ForceSpawn,,0.1,-1"
            "OnMapSpawn" "vort_ride_elevator_from_04,BeginSequence,,0,-1"
            "origin" "-3144 -9503.43 -2951.17"
        }
		*/
		
		local gmanvortby = ents.Create("npc_vortigaunt")
		gmanvortby:SetPos(Vector( -3015, -9449, -835 ))
		gmanvortby:SetKeyValue("targetname", "Vort")
		gmanvortby:Spawn()
		timer.Simple( 1, function()
		local new_spawn = ents.Create("logic_auto")
		new_spawn:SetPos(Vector( -3144, -9503.43, -2951.17 ))
		new_spawn:SetKeyValue("spawnflags", "1")
		new_spawn:Fire("addoutput", "OnMapSpawn coming_from_04_scene_setup,Trigger,,0.2,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn the gman mood,Enable,,0,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn gman scene,Enable,,0,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn lightshaft,TurnOn,,0,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn vort_follow,Deactivate,,0,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn elevator_kill_trigger,Kill,,0,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn elevator_autosave_trigger,Enable,,0,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn turret_buddy_2,Kill,,1.5,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn turret_buddy_1,Kill,,1.5,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn start_the_elevator_rl,Trigger,,1,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn gman_template,ForceSpawn,,0.1,-1")
		new_spawn:Fire("addoutput", "OnMapSpawn vort_ride_elevator_from_04,BeginSequence,,0,-1")
		new_spawn:Spawn()
		new_spawn:Activate()
		end)
	else
	
		for k, v in pairs(ents.FindByName("exit_gate_door_close_rl")) do
			if IsValid(v) then
				v:Remove()
			end 
		end
	end
	
	-- exit_gate_door_open_rl
	-- exit_gate_rolltop_door_playerblock
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	
	--timer.Simple(2, function()
	--pl:StripWeapon("weapon_csniper_hl2c")
	--pl:StripWeapon("weapon_mgun_hl2c")
	--pl:StripWeapon("weapon_ioncannon_hl2c")
	--pl:StripWeapon("weapon_gr9_hl2c")
	--pl:StripWeapon("weapon_airboatgun_hl2c")
	--end)
	timer.Simple(5,function()
		if IsValid(pl)
		then
			pl:PrintMessage(HUD_PRINTTALK, "[hl2c] If the map is bugged please type in chat !skip \nIt will open the exit door to skip the map.")
		end
		
	end)
	timer.Create( "UniqueName1", 120, 0, function() 
		PrintMessage(HUD_PRINTTALK, "[hl2c] If the map is bugged please type in chat !skip \nIt will open the exit door to skip the map.")
		
	end )
end


hook.Add( "PlayerSay", "Hl2c_PlayerChat", function(pl, text, teamonly)
	
	if (text == "!skip") and
	IsValid(pl) and
	pl:Alive() and
	pl:IsPlayer() and
	pl:Team() == TEAM_ALIVE and
	HL2C_SKIP != true
	then
		
		print("CHATTED SKIP")
		HL2C_SKIP = true
		--for k, v in pairs(ents.FindInSphere(Vector(-531.060181, -9647.730469, -616.106079), 250)) do
		for k, v in pairs(ents.FindByName("exit_gate_door_open_rl")) do 
			if v:GetName() == "exit_gate_door_open_rl" then
				v:Fire("Enable")
				v:Fire("Activate")
				v:Fire("Trigger")
				print("Found Door SKIP")
				timer.Simple(5, function()
					for m, n in pairs(ents.FindByName("exit_gate_rolltop_door_playerblock")) do
						v:Remove()
					end
					for m, n in pairs(ents.FindByName("exit_gate_door_proxybrush")) do
						v:Remove()
					end
					
					for m, n in pairs(ents.FindByName("exit_gate_rolltop_door_model")) do
						v:Remove()
					end
				end)
			end
		end
		
		for k, v in pairs(ents.FindByName("exit_gate_rolltop_door_playerblock")) do 
			if v:GetName() == "exit_gate_rolltop_door_playerblock" then
				v:Remove()
			end
			
		end
		
		
	end
end)

function MAPSCRIPT:KeyValue(ent, key, value)

end

return MAPSCRIPT