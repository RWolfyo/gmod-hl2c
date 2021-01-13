INFO_PLAYER_SPAWN = {Vector(-4103, -3522, 168), 77}
----2384, -2319, 24
TRIGGER_CHECKPOINT = {
	{Vector(4177, -3840, 28),Vector(4177, -3840, 28)},
	{Vector(2384, -2319, 24),Vector(2384, -2319, 24)},
	
}
NEXT_MAP = "d3_c17_05"

-- Vector(-1161, -3557, 124),Vector(-1161, -3557, 160.031250)
/*TRIGGER_DELAYMAPLOAD = {
	{Vector(-1161, -3557, 124),Vector(-1161, -3557, 160.031250)}
}*/

--NEXT_MAP = "d3_c17_05"

-- VORTEX_POS = Vector(-3128.705078, -3097.447754, 352.031250)
VORTEX_POS = Vector(-1896.533691, -4007.378906, 1012.472656)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	--local tunjelragcsa = ents.FindByClass("npc_headcrab")
	--tunjelragcsa[1]:Remove()
	--tunjelragcsa[2]:Remove()
	--tunjelragcsa[3]:Remove()
--	tunjelragcsa[4]:Remove()
--	tunjelragcsa[5]:Remove()
--	tunjelragcsa[6]:Remove()
--	/*tunjelragcsa[7]:Remove()
--	tunjelragcsa[8]:Remove()
--	tunjelragcsa[9]:Remove()
--	tunjelragcsa[10]:Remove()
--	tunjelragcsa[11]:Remove()*/
--	local idegesito = ents.FindByClass("combine_mine")
--	idegesito[1]:Remove()
--	idegesito[2]:Remove()
--	idegesito[3]:Remove()
--	idegesito[4]:Remove()
--	idegesito[5]:Remove()
--	idegesito[6]:Remove()
--	
--	local killbreen = ents.FindByClass("npc_breen")
--	killbreen[1]:Remove()
--	
--	local killstuff1 =ents.FindByName("rocket_citizen_likes_crabs")
--	killstuff1[1]:Remove()
--	
--	--local strider1 = ents.FindByName("strider_1")
--	--strider1[1]:Remove()
--	
--	local strider2 = ents.FindByName("car_explode_rl_1")
--	strider2[1]:Remove()
--	
--	local strider3 = ents.FindByName("rocket_1_bullseye_2")
--	strider3[1]:Remove()
--	local car1 = ents.FindByName("blowup_car_car")
--	car1[1]:Remove()
	
	
--	local mykiller = ents.FindByName("vista_strider_1_maker_1")
--	mykiller[1]:Fire("addoutput", "OnSpawnNpc vista_strider_1,Kill,,0.2,-1")
--	mykiller[1]:Fire("addoutput", "OnSpawnNpc noisemaker_strider_1,Kill,,0.2,-1")
--	mykiller[1]:Fire("addoutput", "OnSpawnNpc strider_1,Kill,,0.3,-1")
--	mykiller[1]:Fire("addoutput", "OnSpawnNpc firstdropship,Kill,,0.4,-1")
--	mykiller[1]:Fire("addoutput", "OnSpawnNpc pod_crabs_relationship,Kill,,0.01,-1")
	--takaradjonastrider[2]:Remove()
	--takaradjonastrider[3]:Remove()
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_physcannon")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
	pl:Give("weapon_crossbow")
	pl:Give("weapon_bugbait")
end

return MAPSCRIPT