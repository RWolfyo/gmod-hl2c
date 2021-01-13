ALLOWED_VEHICLE = "Named Jeep"

NEXT_MAP = "d2_coast_05"
EXTRA_MAP = "d2_lostcoast"

if file.Exists("hl2c_data/hl2c_hl1_easteregg2.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_hl1_easteregg2.txt")
	RESET_PL_INFO = true
end

BRUSH_PLAYERCLIP = {

{Vector(-10125, -1075, 31), Vector(-9252, -2277, 588)}

}
BRUSH_VEHICLECLIP = {

{Vector(-10125, -1075, 31), Vector(-9252, -2277, 588)}

}
-- Need Vehicle Brush

-- VORTEX_POS = Vector(-1860.897827, 1174.722412, 640.031250)
VORTEX_POS = Vector(7159.426758, -7444.023438, 803.031250)
local MAPSCRIPT = {}

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
end

function MAPSCRIPT:InitPost()
	local push = ents.FindByName("push_car_superjump_01")
	push[1]:Fire("addoutput", "StartDisabled 0", "0")

	local push_timer = ents.Create( "logic_timer" )
	push_timer:SetPos( Vector( -2033, 738, 909 ) )
	push_timer:SetKeyValue( "RefireTime", "3" )
	push_timer:SetKeyValue( "targetname", "hl2c_push_timer" )
	push_timer:Fire("addoutput", "OnTimer push_car_superjump_01,Enable,,0.00,-1", "0")
	push_timer:Spawn()
	
	if file.Exists("maps/d2_lostcoast.bsp", "GAME") and file.Exists("hl2c_data/d2_coast_01_secret.txt", "DATA") then
		file.Delete("hl2c_data/d2_coast_01_secret.txt")
		local change2 = ents.Create("point_changelevel_extra")
		change2:SetPos(Vector(-183, 855, -2446))
		change2:SetKeyValue("targetname", "hl2c_changelevel_extra")
		change2:Spawn()
		change2:Activate()
		
		local photo = ents.Create("prop_physics_override")
		photo:SetPos( Vector(7819.718262, 5174.255859, -523) )
		photo:SetKeyValue("targetname", "hl2c_easteregg")
		photo:SetKeyValue("angles", "0 180 0")
		photo:SetKeyValue("spawnflags", "8448")
		photo:SetKeyValue("health", "1")
		photo:SetKeyValue("model", "models/props_canal/boat001a.mdl")
		photo:Spawn()
		photo:Activate()
		photo:Fire("addoutput", "OnBreak hl2c_changelevel_extra,Changelevel,,6.0,-1", "1.0")
		photo:Fire("addoutput", "OnBreak hl2c_shake,StartShake,,0.0,-1", "1.0")
		photo:Fire("addoutput", "OnBreak hl2c_fade,Fade,,0.0,-1", "1.0")
		photo:Fire("addoutput", "OnBreak hl2c_easteregg,Kill,,0.5,-1", "1.0")
		local phys = photo:GetPhysicsObject()
		if phys then
			phys:EnableMotion(false)
		end
		
		local snd = ents.Create("env_shake")
		snd:SetPos(Vector(-189, 736, -2487))
		snd:SetKeyValue("targetname", "hl2c_shake")
		snd:SetKeyValue("amplitude", "16")
		snd:SetKeyValue("duration", "40")
		snd:SetKeyValue("frequency", "255.0")
		snd:SetKeyValue("spawnflags", "29")
		snd:Spawn()
		snd:Activate()
		
		local fade1 = ents.Create("env_fade")
		fade1:SetPos(Vector(-184, 855, -2446))
		fade1:SetKeyValue("targetname", "hl2c_fade")
		fade1:SetKeyValue("duration", "4")
		fade1:SetKeyValue("spawnflags", "8")
		fade1:SetKeyValue("rendercolor", "255 255 255")
		fade1:Spawn()
		fade1:Activate()
	end
	
	for k, v in pairs(ents.FindByName("crane_music")) do
		v:SetKeyValue("message", "music/hl1_song17.mp3")
	end
	
end

return MAPSCRIPT