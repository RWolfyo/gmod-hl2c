local MAPSCRIPT = {}
--INFO_PLAYER_SPAWN = {Vector(-448, 216, 896.65741),0}

--TRIGGER_VEHICLESPAWN = {
--	{Vector(667.702942, 2195.281738, 719.844604), Vector(-833.993774, 2536.300293, 991.625671)}
--}


NEXT_MAP = "ep2_outland_06a"

-- VORTEX_POS = Vector(2048.241455, 911.968750, -127.968750)



TRIGGER_CHECKPOINT = {

	{Vector(740, 401, 811), Vector(637, 676, 704)},

	{Vector(159.313080, 2298.385742, -79.330994), Vector(629.578979, 2652.863770, 10.025070)},

	{Vector(1199.770630, 2722.115967, -203.998413), Vector(906.603271, 2872.935059, -118.363831)},

	{Vector(3170.602295, 1099.001587, 239.174927), Vector(2965.668213, 980.704956, 329.596130)},

	{Vector(3280.010254, 2203.822021, 671.545837), Vector(4746.667969, 2499.235352, 784.259277)},

	{Vector(674.798523, 2462.405762, 696.408508), Vector(-459.589355, 2234.391602, 867.926941), false, function() ALLOWED_VEHICLE = "Van" end,Vector(-30.195452, 2024.410522, 740.564209)}

}

TRIGGER_DELAYMAPLOAD = {Vector(-2401.206055, 2077.934082, 687.912109), Vector(-2873.080322, 2705.699707, 969.753296)}

BRUSH_PLAYERCLIP = {
	{Vector(86.413475, 918.031250, 959.901672), Vector(161.574081, 1145.763428, 716.744019)}
}

-- Vort -581.983704 710.816284 896.031250
-- Alyx -448.734741 711.877991 896.031250


MAPSCRIPT.EntityFilterByName = {
	["poison_cancel_trigger"] = true,
	["trigger_goopit3_hurt"] = true,
}
function MAPSCRIPT:InitPost()
	
	timer.Simple(2, function()
	local remove_clip1 = ents.FindByName("clip_player_elevator")
	remove_clip1[1]:Remove()
	/*
	local newalyxby = ents.Create("npc_alyx")
	newalyxby:SetPos(Vector( -448.734741, 711.877991, 896.031250 ))
	newalyxby:SetKeyValue("targetname", "Alyx")
	newalyxby:SetKeyValue("spawnflags", "4")
	newalyxby:SetKeyValue("ShouldHaveEMP", "1")
	newalyxby:SetKeyValue("rendercolor", "255 255 255")
	newalyxby:SetKeyValue("renderamt", "255")
	newalyxby:SetKeyValue("physdamagescale", "1.0")
	newalyxby:SetKeyValue("model", "models/alyx_ep2.mdl")
	newalyxby:SetKeyValue("GameEndAlly", "1")
	newalyxby:SetKeyValue("DontPickupWeapons", "0")
	newalyxby:SetKeyValue("AlwaysTransition", "1")
	newalyxby:SetKeyValue("additionalequipment", "weapon_alyxgun")
	--newalyxby:SetKeyValue("ShouldHaveEMP", "1")
	--newalyxby:SetKeyValue("ShouldHaveEMP", "1")
	newalyxby:Spawn()
	
	local newvortby = ents.Create("npc_vortigaunt")
	newvortby:SetPos(Vector( -581.983704, 710.816284, 896.031250 ))
	newvortby:SetKeyValue("targetname", "Vort")
	newvortby:Spawn()
	*/
	end)
	ents.GetMapCreatedEntity(1924):Fire("addoutput","OnTrigger moveLinear_finalGate,Open,,1.5,-1")
	ents.GetMapCreatedEntity(1924):Fire("addoutput","OnTrigger tunnel_clip_brush,Disable,,1.5,-1")
	ents.GetMapCreatedEntity(1924):Fire("addoutput","OnTrigger tunnel_vehicle_clip_brush,Disable,,1.5,-1")
	
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

return MAPSCRIPT