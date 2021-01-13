local MAPSCRIPT = {}

INFO_PLAYER_SPAWN = {Vector(-3025, -12331, 613),90}

ALLOWED_VEHICLE = "Van"

NEXT_MAP = "ep2_outland_08"


TRIGGER_DELAYMAPLOAD = {Vector(-3966, 11504, 54), Vector(-3470, 11692, 266)}


BRUSH_PLAYERCLIP = {

{Vector(-9091.825195, -10139.960938, 79.389511), 
Vector(-10129.288086, -9257.672852, 623.945129)}

}


VORTEX_POS = Vector(-9081.968750, -11194.849609, 738.303589)


function MAPSCRIPT:InitPost()
/*
	local make_alyx = ents.Create("npc_alyx")
	make_alyx:SetKeyValue("targetname", "alyx")
	make_alyx:SetPos(Vector(-3008, -12032, 540))
	make_alyx:SetKeyValue("spawnflags", "4")
	make_alyx:SetKeyValue("ShouldHaveEMP", "1")
	make_alyx:SetKeyValue("rendercolr", "255 255 255")
	make_alyx:SetKeyValue("renderamt", "255")
	make_alyx:SetKeyValue("physdamagescale", "1.0")
	make_alyx:SetKeyValue("model", "models/alyx_ep2.mdl")
	make_alyx:SetKeyValue("GameEndAlly", "1")
	make_alyx:SetKeyValue("DontPickUpWeapons", "Yes")
	make_alyx:SetKeyValue("angles", "0 0 0")
	make_alyx:SetKeyValue("AlwaysTransition", "1")
	make_alyx:SetKeyValue("additionalequipment", "weapon_alyxgun")
	make_alyx:Spawn()
	make_alyx:Activate()
*/


end

--

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	for k, v in pairs(ents.FindByName("gate_open_relay")) do
		if IsValid(v) then
			v:Fire("Trigger")
			v:Fire("Kill")
			-- print("**********************************")
			-- print("**    Found gate_open_relay     **")
			-- print("**********************************")
		end
	end
	
	for k, v in pairs(ents.FindByName("alyx_check_end_trigger")) do
		if IsValid(v) then
			v:Fire("Kill")
			-- print("**********************************")
			-- print("** Found alyx_check_end_trigger **")
			-- print("**********************************")
		end
	end

end

return MAPSCRIPT