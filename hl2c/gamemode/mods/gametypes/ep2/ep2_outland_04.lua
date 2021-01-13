local MAPSCRIPT = {}
--NEXT_MAP = "ep2_outland_02"
NEXT_MAP = "ep2_outland_05" //While ep2_outland_02 when we coming back...
-- Chechpoints :D
-- 6130.648926, -3044.131348, -1087.968750
-- 5307.166504, -4146.979492, -2232.600342
-- VORTEX_POS = Vector(6301.720215, 656.817322, -2520.988281)


TRIGGER_CHECKPOINT = {

-- setpos 6537.781250, -3517.244629, -388.974548;setang 81.183167 -59.801277 0.000000
--] getpos 
--setpos 6635.211426, -3716.741211, -596.346741;setang -89.000000 85.457024 0.000000

	{Vector(6537.781250, -3517.244629, -388.974548), Vector(6635.211426, -3716.741211, -596.346741)},
	
/*
setpos 5373.124512, -4139.351074, -2090.227295;setang 71.287842 8.717402 0.000000
] getpos 
setpos 5297.277344, -4191.180176, -1997.135010;setang 89.000000 -103.764160 0.000000

*/	
	{Vector(5373.124512, -4139.351074, -2090.227295), Vector(5297.277344, -4191.180176, -1997.135010)}
}

TRIGGER_DELAYMAPLOAD = {Vector(4921, -1587, 3065), Vector(4930, -1604, 2852)}

--file.Write("hl2-campaign/ep2_outland_04.txt", "We have been to ep2_outland_04.")
if !file.Exists("hl2c_data/ep2_outland_04.txt", "DATA") then
	file.Write("hl2c_data/ep2_outland_04.txt", "We have been to ep2_outland_04.")
end

function MAPSCRIPT:InitPost()
--setpos 5333.364746 -4158.510254 -2039.216797;setang 31.389713 -144.484070 0.000000 --for hl2c teleport :D to all players because I hate to see others stuck with guardian :D

--
--	local telepl = ents.Create("point_hl2cteleport")
--	telepl:SetPos(Vector(-7740, -3960, 389))
--	telepl:SetKeyValue("targetname", "hl2c_teleport")
--	telepl:Spawn()
--	telepl:Activate()
		
--	local trigger = ents.FindByName("trigger_elevator_go_down")
--	trigger[1]:Fire("addoutput", "OnTrigger hl2c_teleport,Teleport,,0.1,-1")
	timer.Simple( 3, function()
	--maze_bridge_clip
	local del_clip1 = ents.FindByName("maze_bridge_clip")
	del_clip1[1]:Remove()
	--guardcaveentry_block_player
	local del_clip2 = ents.FindByName("guardcaveentry_block_player")
	del_clip2[1]:Remove()
	--grub_tunnel_1_playerblock
	local del_clip3 = ents.FindByName("grub_tunnel_1_playerblock")
	del_clip3[1]:Remove()
	--grub_tunnel_2_playerblock
	local del_clip4 = ents.FindByName("grub_tunnel_2_playerblock")
	del_clip4[1]:Remove()
	--guard_leap_3_playerblock
	local del_clip5 = ents.FindByName("guard_leap_3_playerblock")
	del_clip5[1]:Remove()
	end)
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
end

hook.Add("EntityTakeDamage", "Hl2c.EntityTakeDamage_", function(ent,dmg)
	if IsValid(ent) and 
	isstring(ent:GetClass()) and 
	ent:GetClass() == "npc_antlionguard"
	then
		dmg:SetDamage(0)
	end
end)

return MAPSCRIPT