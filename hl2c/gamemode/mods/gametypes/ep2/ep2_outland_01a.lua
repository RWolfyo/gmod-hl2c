local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}
--NEXT_MAP = "ep2_outland_02"
--Because ep2_outland_02 BUGGY cant make it work sorry :(
INFO_PLAYER_SPAWN = {Vector(-11371, -6318, 1361),-90}


NEXT_MAP = "ep2_outland_02"
--Because ep2_outland_02 BUGGY cant make it work sorry :(
--NEXT_MAP = "ep2_outland_05"

TRIGGER_CHECKPOINT = {
/*
setpos -10833, -7251, 1306
] getpos 
setpos -11010, -7004, 1409

*/
	--{Vector(-10833, -7251, 1306), Vector( -11010, -7004, 1409 )}
	{Vector(-11302, -6951, 1589), Vector( -11192, -7167, 1685 )},
	{Vector(-11118, -7955, 547), Vector( -11019, -8074, 418 )},
	{Vector(-7234.915039, -8547.343750, 10.230240), Vector(-7033.307617, -8918.620117, 125.185776)}
	
}


/*
setpos -2218.556641, -8238.381836, -455.480713;setang 23.281479 14.773148 0.000000
] getpos 
setpos -2278.040039, -8268.660156, -297.933563;setang -77.131042 -149.292831 0.000000

*/


TRIGGER_DELAYMAPLOAD = {Vector(-2218.556641, -8238.381836, -455.480713), Vector(-2278.040039, -8268.660156, -297.933563)}

VORTEX_POS = Vector(-6087.967285, -8082.211426, 135.911240)


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_medkit_hl2c")
	
	timer.Simple(2, function()
	pl:StripWeapon("weapon_csniper_hl2c")
	pl:StripWeapon("weapon_mgun_hl2c")
	pl:StripWeapon("weapon_ioncannon_hl2c")
	pl:StripWeapon("weapon_gr9_hl2c")
	pl:StripWeapon("weapon_airboatgun_hl2c")
	end)
end

function MAPSCRIPT:InitPost()
	for k, v in pairs(ents.FindByName("watercave_exit_portalbrush_1")) do v:Remove() end
	for k, v in pairs(ents.FindByName("bigcave_areaportal_3")) do v:Remove() end
	for k, v in pairs(ents.FindByName("mineexit_portal_brush_1")) do v:Remove() end
	for k, v in pairs(ents.FindByName("entrytunnel_portal_1_brush")) do v:Remove() end
	for k, v in pairs(ents.FindByName("elevator_portal_brush3")) do v:Remove() end
	for k, v in pairs(ents.FindByName("elevator_portal_brush2")) do v:Remove() end
	for k, v in pairs(ents.FindByName("elevator_portal_brush1")) do v:Remove() end
	for k, v in pairs(ents.FindByName("platform_2_thruster_1")) do 
		v:SetKeyValue("Force", "350") 
	end
end

return MAPSCRIPT