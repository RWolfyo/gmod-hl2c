local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector( 1035.792480, -9184.308594, 80.669167 ), 0}
--setpos 1035.624512, -9183.216797, 136.031250;setang 24.285812 -5.934499 0.000000

-- VORTEX_POS = Vector(815.968750, -9236.031250, 355.031250)




--ALLOWED_VEHICLE = "Jalopy"

NEXT_MAP = "ep2_outland_10"
--NEXT_MAP = "ep2_outland_11"


--setpos 567.839661, -9162.216797, 125.850967
--setpos 363.322662, -9238.862305, 109.994225;
TRIGGER_CHECKPOINT = {
	{Vector(567, -9162, 125),Vector(363.322662, -9238.862305, 109)}
	
	
/*
setpos -1597, -5269, 117

setpos -1899, -5618, 292


*/	
	--{Vector(-1597, -5269, 117),Vector(-1899, -5618, 292)}
}

--setpos 3524.267334, 7297.742188, 211.143433;setang 17.073130 -85.909325 0.000000
--setpos 3103.952393, 7151.714355, 457.919983;
TRIGGER_DELAYMAPLOAD = {Vector(3524.267334, 7297.742188, 211.143433),Vector(3103.952393, 7151.714355, 457.919983)}
--

function MAPSCRIPT:EntityRemoved(ent)

	if ent:GetClass() == "point_c_tp" then
	
		ALLOWED_VEHICLE = "Van"
		-- PrintMessage(HUD_PRINTTALK, "Vehicles Available.\nPress F3 to Spawn Vehicle.")
	
	end

end

function MAPSCRIPT:InitPost()
	--[[
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
	end)
	]]--
	

	
	local killmeplz = ents.Create("point_c_tp")
	killmeplz:SetKeyValue("targetname", "hl2c_killme")
	killmeplz:SetPos(Vector(0, 0, 0))
	killmeplz:Spawn()
	//relay.player.exits.garage
	local exits_garage = ents.FindByName("door.garage.main")
	for _, player_exits in pairs(exits_garage) do
		player_exits:Fire("addoutput", "OnOpen hl2c_killme,Kill,,1,-1")
	end
	
	local alyx_check = ents.FindByName("alyx_check_fail")
	for _, check_fail in pairs(alyx_check) do
		check_fail:SetKeyValue("message", "a")
		check_fail:SetKeyValue("holdtime", "0")
		check_fail:SetKeyValue("fadeout", "0")
		check_fail:SetKeyValue("fadein", "0")
	end

end


function MAPSCRIPT:PostPlayerSpawn(pl)

	
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")

end
-- alyx_check_fail
function MAPSCRIPT:KeyValue(ent, key, value)
	if IsValid(ent) and
	key == "targetname" and
	value == "alyx_check_fail"
	then
	--print("\nFOUND ALYX CHECK FAIL RELAY\n")
		--timer.Simple(3, function()
			if IsValid(ent) then
				print("\nFOUND ALYX CHECK FAIL RELAY\n")
				ent:Remove()
			end
		--end)
	end
end

return MAPSCRIPT