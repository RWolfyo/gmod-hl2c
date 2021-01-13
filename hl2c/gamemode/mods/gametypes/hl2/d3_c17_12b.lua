NEXT_MAP = "d3_c17_13"

TRIGGER_CHECKPOINT = {

	{Vector(-8715.698242, -1361.315308, -251.763733), Vector(-9050.343750, -596.599609, -26.898087)}

}

-- VORTEX_POS = Vector(-4264.031250, 291.479401, 352.031250)
VORTEX_POS = Vector(-5977.001953, 449.031250, 646.270996)
local MAPSCRIPT =  {}

function MAPSCRIPT:InitPost()
	
	for k, v in pairs(ents.FindInSphere(Vector(-5259.91, -77, 40), 30)) do
		
		v:Fire("addoutput", "OnTrigger relay_pillars,Trigger,,3.0,-1")
		-- print("[hl2c] modify",v:GetClass())
	end
	local relay = ents.Create("logic_relay")
	relay:SetPos(Vector(-2424, 632, 710))
	relay:SetKeyValue("spawnflags", "0")
	relay:SetKeyValue("StartDisabled", "0")
	relay:SetKeyValue("targetname", "relay_pillars")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1_npcclip,Kill,,0,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1,DisableMotion,,3,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1_nodelink_1,TurnOn,,2,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1_nodelink_2,TurnOn,,2,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1_shake_1,StartShake,,0,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1,EnableShadow,,0,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1_exp_1,Explode,,0,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1,EnableMotion,,0,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1_wav_1,PlaySound,,0,-1")
	relay:Fire("addoutput", "OnTrigger floor_beam_1_linkcontroller,TurnOff,,0,-1")
	relay:Fire("addoutput", "OnTrigger second_floor_beam_1_pillar_1,Break,,0,-1")
	relay:Spawn()
	relay:Activate()
	/*	-- FOR FIX STRIDER SHOOT PILLAR
	"OnBreak" "second_floor_beam_1_npcclip,Kill,,0,-1"
	"OnBreak" "second_floor_beam_1,DisableMotion,,3,-1"
	"OnBreak" "second_floor_beam_1_nodelink_1,TurnOn,,2,-1"
	"OnBreak" "second_floor_beam_1_nodelink_2,TurnOn,,2,-1"
	"OnBreak" "second_floor_beam_1_shake_1,StartShake,,0,-1"
	"OnBreak" "second_floor_beam_1,EnableShadow,,0,-1"
	"OnBreak" "second_floor_beam_1_exp_1,Explode,,0,-1"
	"OnBreak" "second_floor_beam_1,EnableMotion,,0,-1"
	"OnBreak" "second_floor_beam_1_wav_1,PlaySound,,0,-1"
	"OnBreak" "second_floor_beam_1_linkcontroller,TurnOff,,0,-1"
	*/
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
	---timer.Simple(4, function()
	--pl:SetAmmo( 0, "rpg_round")
	--end)
end

return MAPSCRIPT