local MAPSCRIPT = {}

--INFO_PLAYER_SPAWN = {Vector(5463.383301, -112.408371, -2401.022705),180}
-- 5477.330078 -114.449997 -2400.629395

ALLOWED_VEHICLE = "Van"
NEXT_MAP = "ep2_outland_07" 
-- NEXT_MAP = "ep2_outland_08"

-- VORTEX_POS = Vector(-3606.659424, -1082.756226, -2452.027100)


-- My Checkpoint :D :D
-- -2541.216797 -8375.026367 -1481.494873
TRIGGER_CHECKPOINT = {

	/*
	setpos -3011.820557, -9796.013672, -1494.274902;setang -39.195110 87.417236 0.000000
	setpos -3370.581299, -9673.524414, -1451.129150;setang -0.483929 2.417006 0.000000

	*/
	{Vector(-3011.820557, -9796.013672, -1494.274902),Vector(-3370.581299, -9673.524414, -1451.129150)}
}

/*
setpos -9985.398438, -3727.467773, -2184.916748;setang 55.306332 -118.819107 0.000000
DataTable warning: env_sprite: Out-of-range value (128.000000) in SendPropFloat 'm_flGlowProxySize', clamping.
DataTable warning: env_sprite: Out-of-range value (128.000000) in SendPropFloat 'm_flGlowProxySize', clamping.
DataTable warning: env_sprite: Out-of-range value (128.000000) in SendPropFloat 'm_flGlowProxySize', clamping.
] getpos 
setpos -9655.821289, -4164.983887, -2363.743652;setang 22.529633 -29.984257 0.000000
*/
TRIGGER_DELAYMAPLOAD = {Vector(-9985.398438, -3727.467773, -2184.916748), Vector(-9655.821289, -4164.983887, -2363.743652)}

function MAPSCRIPT:InitPost()
	--if !game.SinglePlayer then
	--local autosav = ents.FindByName("autosave")
	--autosav[1]:Remove()
	--end
	/*local remove_stalker = ents.FindByName("hunter_death_counter1")
	remove_stalker[1]:Remove()
	-- setpos -3096.364990 -9707.160156 -1448.014038 If we create a teleport :D
	local mat1ch = ents.Create("math_counter")
	mat1ch:SetPos(Vector(-2662.84, -8729, -1445.33))
	mat1ch:SetKeyValue("targetname", "hunter_death_counter1")
	----mat1ch:SetKeyValue("squadname", "hunter_squad")
	----mat1ch:SetKeyValue("spawnflags", "516")
	----mat1ch:SetKeyValue("rendercolor", "255 255 255")
	----mat1ch:SetKeyValue("renderamt", "255")
	----mat1ch:SetKeyValue("phydamagescale", "1.0")
	----mat1ch:SetKeyValue("hintlimiting", "1")
	----mat1ch:SetKeyValue("hintgroup", "hunter_zone")
	mat1ch:SetKeyValue("max", "1")
	mat1ch:SetKeyValue("hammerid", "14600")
	mat1ch:Fire("addoutput", "OnHitMax lcs_letsuseradio,Start,,4,1")
	mat1ch:Fire("addoutput", "OnHitMax trigger_useradio,Enable,,4.1,1")
	mat1ch:Fire("addoutput", "OnHitMax music_hunters,FadeOut,6,1,1")
	mat1ch:Fire("addoutput", "OnHitMax alyx,AddContext,06a_use_radio:1,0,1")
	mat1ch:Fire("addoutput", "OnHitMax enemyfinder_hunter,Kill,,0,1")
	mat1ch:Fire("addoutput", "OnHitMax achievement_hunters,FireEvent,,0,1")
	mat1ch:Fire("addoutput", "OnHitMax Magnusson Transmission,Enable,,0,1")
	mat1ch:Spawn()
	mat1ch:Activate()*/
	
	/*
	] getpos 
setpos -3542.954590 -8457.184570 -1501.772339;setang 30.801891 -54.802071 0.000000
DataTable warning: env_sprite: Out-of-range value (128.000000) in SendPropFloat 'm_flGlowProxySize', clamping.
DataTable warning: env_sprite: Out-of-range value (128.000000) in SendPropFloat 'm_flGlowProxySize', clamping.
] getpos 
setpos -2554.142090 -8417.063477 -1497.220459;setang 29.523695 8.103623 0.000000
-- For extra Npcs for more Challange
	*/
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	
	--pl:StripWeapon("weapon_ioncannon_hl2c")
	--pl:StripWeapon("weapon_gr9_hl2c")
	--pl:StripWeapon("weapon_airboatgun_hl2c")
	
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	
end

--local trimov = ents.FindByName("hunter_2")
	--trimov[1]:Remove()
	--local playpow = ents.FindByName("playerclip_powerroom")
	--playpow[1]:Remove()
	--local playele = ents.FindByName("playerclip_elevator")
	--playele[1]:Remove()
	
	--mat1ch:SetPos(Vector(-3232, -8792, -1528))
	--mat1ch:SetKeyValue("targetname", "hunter_2")
	--mat1ch:SetKeyValue("squadname", "hunter_squad")
	--mat1ch:SetKeyValue("spawnflags", "516")
	--mat1ch:SetKeyValue("rendercolor", "255 255 255")
	--mat1ch:SetKeyValue("renderamt", "255")
	--mat1ch:SetKeyValue("phydamagescale", "1.0")
	--mat1ch:SetKeyValue("hintlimiting", "1")
	--mat1ch:SetKeyValue("hintgroup", "hunter_zone")
	--mat1ch:SetKeyValue("angles", "0 270 0")
	--mat1ch:SetKeyValue("hammerid", "1345601")
	--mat1ch:Spawn()
	--mat1ch:Activate()
	--mat1ch:Fire("addoutput", "OnDeath hunter_death_counter1,Add,1,0,-1")
	--mat1ch:Fire("addoutput", "OnDeath relay_npcs_move_freely,Trigger,,0,-1")
	--mat1ch:Fire("addoutput", "OnDeath exit_gate_1,Open,,0,-1")
	--mat1ch:Fire("addoutput", "OnDeath exit_gate_1,Open,,0.11,-1")
	--mat1ch:Fire("addoutput", "OnDeath exit_gate_1,Open,,0.12,-1")
	--mat1ch[1]:Spawn()
	--mat1ch[1]:Activate()
	--mat1ch:Fire("addoutput", "OnHitMax,exit_gate_1,Open,,0.12,-1")
	--mat1ch:Fire("addoutput", "OnHitMax,exit_gate_1,Open,,0.12,-1")
	--mat1ch:Fire("addoutput", "OnHitMax,exit_gate_1,Open,,0.12,-1")
	--mat1ch:Fire("addoutput", "OnHitMax,exit_gate_1,Open,,0.12,-1")
	/*
	"OnHitMax,lcs_letsuseradio,Start,,4,1"
		"OnHitMax,trigger_useradio,Enable,,4.1,1"
		"OnHitMax,music_hunters,FadeOut,6,1,1"
		"OnHitMax,alyx,AddContext,06a_use_radio:1,0,1"
		"OnHitMax,enemyfinder_hunter,Kill,,0,1"
		"OnHitMax,achievement_hunters,FireEvent,,0,1"
		"OnHitMax,Magnusson Transmission,Enable,,0,1"
		"OnHitMax" "autosave,SaveDangerous,5,0,-1"
	*/
	
	
	/*local mat2ch = ents.FindByName("hunter_death_counter2")
	mat2ch:SetKeyValue("max", "1")
	mat2ch:Fire("addoutput", "OnHitMax,exit_gate_1,Open,,0.1,-1")*/
	
	--local logchor = ents.FindByClass("logic_choreographed_scene")
	--logchor:SetKeyValue("onplayerdeath", "0")
	
	--local filmut = ents.Create("filter_multi")
	--filmut:SetPos(Vector(-12777, -12651, 456))
	--filmut:SetKeyValue("targetname", "filter_NoDamage")
	--filmut:SetKeyValue("Negated", "1")
	--filmut:Spawn()
	--filmut:Activate()
	--logtim[1]:Fire("addoutput","alyx,SetDamageFilter,filter_NoDamage,0,-1")
	
	--local logtim = ents.Create("logic_timer")
	--logtim:SetPos(Vector(-12851.4, -12588.1, 567.059))
	--logtim:SetKeyValue("RefireTime", "2")
	--logtim:Fire("addoutput", "alyx,SetDamageFilter,filter_NoDamage,0,-1")
	--logtim:Spawn()
	--logtim:Activate()
	
	/*local logaut = ents.Create("logic_auto")
	logaut:SetPos(Vector(5247.72, -0.228314, -2458.07))
	logaut:SetKeyValue("spawnflags", "1")
	logaut:Fire("addoutput", "OnMapSpawn,jeep,Kill,,0,-1")
	logaut:Fire("addoutput", "OnMapSpawn,alyx,Kill,,0,-1")
	logaut:Fire("addoutput", "OnMapSpawn,new_game_items,ForceSpawn,,0.5,-1")
	logaut:Fire("addoutput", "OnMapSpawn,jeep,LockExit,,0.8,-1")
	logaut:Fire("addoutput", "OnMapSpawn,alyx,Addcontext,pre_hunter_battle:1,0.8,-1")
	logaut:Spawn()
	logaut:Activate()*/