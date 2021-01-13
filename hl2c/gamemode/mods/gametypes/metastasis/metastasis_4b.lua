--INFO_PLAYER_SPAWN = {Vector( -395, -1289, 32 ), 0}
INFO_PLAYER_SPAWN = {Vector( 3.929440, -330.575409, -600.777893 ), 0}

NEXT_MAP = "winter_lobby_2012"
--SUPER_GRAVITY_GUN
TRIGGER_CHECKPOINT = {

	{Vector(541.247375, 1118.203125, -343.968750), Vector(352.031250, 975.031494, -241.265884),
	false,function() end,Vector(382.689240, 1019.794434, -343.968750)},
	
	{Vector( 958.285706, 1252.416870, 268.920349 ), Vector( 1068.029297, 1371.591309, 358.709229 )}
	
}
/*
setpos 1901.4, 94.6, 238.8
] getpos 
setpos 1774.8, 141, 330.6
*/
TRIGGER_DELAYMAPLOAD = {Vector(2650.860352, 52.170666, 843.004272), Vector(2650.860352, 52.170666, 843.004272)}

METASTASIS_MAP = true

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["start-supplies"] = true,
	["start-supplies-spawn"] = true,
	["arch-gunship-spawn"] = true,
	
}
MAPSCRIPT.EntityFilterByClass = {
	["player_weaponstrip"] = true,
	["point_viewcontrol"] = true,
	
}
VORTEX_POS = Vector(1319.968750, 1639.821533, -79.968750)
function MAPSCRIPT:InitPost()

	for k, v in pairs(ents.FindInSphere( Vector(-64, -32, -432), 3 )) do
		v:Remove()
	end
	
	
	for k, v in pairs(ents.FindInSphere( Vector(-64, -32, -432), 3 )) do
		v:Remove()
	end
	
	local auto = ents.Create("logic_auto") 
	auto:SetKeyValue("spawnflags", "1")
	auto:Fire("addoutput", "OnMapSpawn tonemapper,SetAutoExposureMax,1.5,0,-1")
	auto:Fire("addoutput", "OnMapSpawn tonemapper,SetTonemapRate,0.4,0,-1")
	auto:Fire("addoutput", "OnMapSpawn underground-thunder-timer,Enable,,0,-1")
	auto:Fire("addoutput", "OnMapSpawn deeplift-lift,StartForward,,0,-1")
	auto:Fire("addoutput", "OnMapSpawn bighall-windows,Shatter,0.5 0.8 64,0,1")
	auto:Fire("addoutput", "OnMapSpawn start-supplies-spawn,Kill,,0.2,-1")
	auto:Fire("addoutput", "OnMapSpawn playerproxy,SetFlashlightSlowDrain,,0,-1")
	auto:Spawn()
	auto:Activate()
	
	local endgame = ents.Create("game_end")
	endgame:SetKeyValue("targetname", "hl2c_gamend")
	endgame:Spawn()
	
	
	
	local pt = ents.Create("point_trigger")
	pt:SetPos(Vector(2464, 64, 452))
	pt:SetKeyValue("targetname", "pt_1")
	pt:SetKeyValue("spawnflags", "1")
	pt:SetKeyValue("StartDisabled", "0")
	pt:SetKeyValue("TriggerRadius", "50")
	pt:SetKeyValue("TriggerOnce", "1")
	--pt:SetKeyValue("filtername", "blahblah")
	pt:Fire("addoutput", "OnStartTouch hl2c_gamend,EndGame,,10.0,-1")
	pt:Spawn()
	pt:Activate()
	

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	-- Need Lift Parent Spawner.
	pl:Give("weapon_physcannon")
	pl:Give("weapon_pistol")
	-- timer.Simple(1,function()
		if IsValid(pl) then
			pl:SetAmmo(150, "Pistol")
		end
	-- end)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_357")
	pl:Give("weapon_ar2")
	pl:Give("weapon_smg1")
	pl:Give("weapon_frag")
	pl:Give("weapon_rpg")


end

return MAPSCRIPT