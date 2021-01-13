INFO_PLAYER_SPAWN = {Vector(-10646, 3878, -345), -90}

ALLOWED_VEHICLE = "Airboat Gun"

NEXT_MAP = "d1_eli_01"

TRIGGER_DELAYMAPLOAD = {Vector(-762, -3866, -392), Vector(-518, -3845, -231)}

BRUSH_PLAYERCLIP = {

	{Vector(-11128, 4151, -550), Vector(-10425, 4490, -185)}
	
}
BRUSH_VEHICLECLIP = {

	{Vector(-11128, 4151, -550), Vector(-10425, 4490, -185)}
	
}
--Must Put a Prop Brush too

-- VORTEX_POS = Vector(2933.674805, -1198.391479, 502.351349)

local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()

	timer.Simple( 7, function()
	
		game.ConsoleCommand("sk_helicopter_health 1000\n")
		game.ConsoleCommand("sk_airboat_max_ammo 200\n")
		game.ConsoleCommand("sk_airboat_recharge_rate 45\n")
	end)	
		/*
		local nerf_auto = ents.Create("logic_auto")
		nerf_auto:SetKeyValue("spawnflags", "1")
		nerf_auto:Fire("addoutput", "OnMapSpawn ")
		
		SetHealth
		*/
		//canals_npc_reservoircopter01
	local heli01 = ents.FindByName("logic_start_helicopter")
	for _, s_heli01 in pairs(heli01) do
		s_heli01:Fire("addoutput", "OnTrigger canals_npc_reservoircopter01,SetHealth,1000,3,-1")
	--exit_open03:Fire("addoutput", "OnTrigger door_guncave_exit,Trigger,,45,-1")
	--exit_open03:Fire("addoutput", "OnTrigger brush_maproom_PCLIP,Kill,,45,-1")
	end

	
	for k, v in pairs(ents.FindByName("canals_music_helideath")) do
		v:SetKeyValue("message", "music/stingers/hl1_stinger_song28.mp3")
	end
	
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	--pl:GodEnable()
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_357")
	pl:Give("weapon_frag")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT