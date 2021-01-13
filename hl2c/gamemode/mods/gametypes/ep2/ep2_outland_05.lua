local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-2906, 828, 171),0}

NEXT_MAP = "ep2_outland_06"

if file.Exists("hl2c_data/ep2_outland_04.txt", "DATA") then
	file.Delete("hl2c_data/ep2_outland_04.txt")
end
VORTEX_POS = Vector(-401.202179, 4090.828857, 406.708130)

TRIGGER_CHECKPOINT = {

/*
setpos -23.145971, 3851.312744, 171.545944;setang 31.498493 -177.308533 0.000000
] getpos 
setpos -266.953857, 3954.016113, 119.004662;setang 14.790604 -44.923477 0.000000

*/
	{Vector(-23.145971, 3851.312744, 171.545944), Vector(-266.953857, 3954.016113, 119.004662)},
	{Vector(738, 5721, 653), Vector(898, 5823, 689)}
}
//Short one
--TRIGGER_DELAYMAPLOAD = {Vector( 525.515015, 5849.073730, 70.739059 ), Vector( 525.087402, 5638.561035, 29.020523 )}

//Original
TRIGGER_DELAYMAPLOAD = {Vector( 2137, 5962, 561 ), Vector( 2006, 6414, 587 )}

//Setup the custom teleporter 
CUSTOM_TELEPORT_HL2C = "npc_vortigaunt"

function MAPSCRIPT:InitPost()
	
	--local autosaves = ents.FindByName("autosave")
	--autosaves[1]:Remove()
	
	--guards_death_counter
	local opendoor = ents.FindByName("guards_death_counter")
	for _, openit in pairs(opendoor) do
		openit:Fire("addoutput", "OnHitMax generator_start_relay,Trigger,,18,-1")
		--openit:Fire("addoutput", "OnHitMax alyx_follow_vort,Activate,,18,-1")
		--openit:Fire("addoutput", "OnHitMax vort_follow_player,Activate,,18,-1")
	end
	
	timer.Simple(3, function()
	//ss_vort_charge
	local ss_vort = ents.FindByName("ss_vort_charge")
	for _, vort_charge in pairs(ss_vort) do
		vort_charge:Remove()
	end
	
	//ss_alyx_wait_02
	local ss_alyx_wait = ents.FindByName("ss_alyx_wait_02")
	for _, alyx_wait_02 in pairs(ss_alyx_wait) do
		alyx_wait_02:Remove()
	end
	
	//vort_waiting_for_basket_lcs
	local vort_waiting = ents.FindByName("vort_waiting_for_basket_lcs")
	for _, waiting_for_basket_lcs in pairs(vort_waiting) do
		waiting_for_basket_lcs:Remove()
	end
	
	//alyx_waiting_for_basket_lcs
	local alyx_waiting = ents.FindByName("alyx_waiting_for_basket_lcs")
	for _, waiting_for_basket_lcs in pairs(alyx_waiting) do
		waiting_for_basket_lcs:Remove()
	end
	
	//basket_path_bottom
	local basket_path = ents.FindByName("basket_path_bottom")
	for _, path_bottom in pairs(basket_path) do
		path_bottom:Fire("addoutput", "OnPass hl2c_alyxtp,Teleport,,5,-1")
		path_bottom:Fire("addoutput", "OnPass hl2c_customtp,Teleport,,5,-1")
	end
	
	//buttoncall_locked_relay
	local buttoncall = ents.FindByName("buttoncall_locked_relay")
	for _, call_locked in pairs(buttoncall) do
		call_locked:Fire("addoutput", "OnTrigger hl2c_alyxtp,Teleport,,1,-1")
		call_locked:Fire("addoutput", "OnTrigger hl2c_customtp,Teleport,,1,-1")
	end
	
	local vort_this = ents.FindByName("vort_this_lift")
	for _, this_lift in pairs(vort_this) do
		this_lift:Remove()
	end
	
	local vort_well = ents.FindByName("vort_well_done")
	for _, well_done in pairs(vort_well) do
		well_done:Remove()
	end
	
	//alyx_gj_gordon_lets_go_lcs
	local alyx_gj = ents.FindByName("alyx_gj_gordon_lets_go_lcs")
	for _, gj_gordon in pairs(alyx_gj) do
		gj_gordon:Remove()
	end
	
	end)
	/*
	hl2c_auto = ents.Create("logic_auto")
	hl2c_auto:SetPos(Vector(776, 2592, 333.524))
	hl2c_auto:SetKeyValue( "spawnflags", "1" )
	hl2c_auto:Fire("addoutput", "OnMapSpawn spawnitems,Kill,,0.3,-1")
	--hl2c_auto:Fire("addoutput", "OnMapSpawn exit_doors,Kill,,0.1,-1")
	--hl2c_auto:Fire("addoutput", "OnMapSpawn global_newgame_entmaker,ForceSpawn,,0.3,-1")
	hl2c_auto:Spawn()
	hl2c_auto:Activate()
	*/
	//Alyx must get here 662, 5751, 50
	local alyx_tp = ents.Create("point_alyx_teleport")
	alyx_tp:SetPos(Vector(624,5776,32))
	alyx_tp:SetKeyValue("targetname","hl2c_alyxtp")
	alyx_tp:Spawn()
	
	//Alyx must get here 662, 5751, 50
	local alyx_tp = ents.Create("point_c_tp")
	alyx_tp:SetPos(Vector(672,5776,32))
	alyx_tp:SetKeyValue("targetname","hl2c_customtp")
	alyx_tp:Spawn()
	
	//vort_waiting_for_basket_lcs
	local vort_waiting = ents.FindByName("vort_waiting_for_basket_lcs")
	for _, waiting_for_basket_lcs in pairs(vort_waiting) do
		waiting_for_basket_lcs:Remove()
	end
	
	
	
	/*local crapdoor = ents.FindByName("ladder_door_1")
	crapdoor[1]:Remove()
	
	local speedy = ents.FindByName("speedmod")
	speedy[1]:Remove()
	
	local cmove = ents.FindByName("trigger_crouch")
	cmove[1]:Remove()

	local get_grav = ents.Create("game_player_equip")
	get_grav:SetPos(Vector( 530, -674, 123 ))
	get_grav:SetKeyValue("targetname", "give_players_physgun")
	get_grav:SetKeyValue("weapon_physcannon", "1")
	get_grav:SetKeyValue("spawnflags", "1")*/
	
	/*local alyxwaitmove_01 = ents.FindByName("ss_alyx_wait_01")
	alyxwaitmove_01:SetPos(Vector(408, 5782, 37))
	
	local alyxwaitmove_02 = ents.FindByName("ss_alyx_wait_02")
	alyxwaitmove_02:SetPos(Vector(408, 5782, 37))
	
	local allowmybutton = ents.FindByName("player_alone_trigger")
	allowmybutton[1]:Fire("addoutput", "OnTrigger basket_button,Unlock,,0,-1")
	allowmybutton[1]:Fire("addoutput", "OnTrigger basket_button,Unlock,,1.0,-1")
	allowmybutton[1]:Fire("addoutput", "OnStartToch basket_button,Unlock,,1.0,-1")
	allowmybutton[1]:Fire("addoutput", "OnStartToch basket_button,Unlock,,0,-1")
	allowmybutton[1]:Fire("addoutput", "OnEndToch basket_button,Unlock,,1.0,-1")
	allowmybutton[1]:Fire("addoutput", "OnTrigger basket_button,Unlock,,2.0,-1")
	allowmybutton[1]:Fire("addoutput", "OnEndToch basket_button,Unlock,,0,-1")*/
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	
	timer.Simple(2, function()
	pl:StripWeapon("weapon_csniper_hl2c")
	pl:StripWeapon("weapon_mgun_hl2c")
	pl:StripWeapon("weapon_ioncannon_hl2c")
	pl:StripWeapon("weapon_gr9_hl2c")
	pl:StripWeapon("weapon_airboatgun_hl2c")
	end)
end

return MAPSCRIPT