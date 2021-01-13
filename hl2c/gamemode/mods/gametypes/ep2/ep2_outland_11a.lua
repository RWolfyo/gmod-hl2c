local MAPSCRIPT = {}

NEXT_MAP = "ep2_outland_12"	//Add Next Map
--NEXT_MAP = "ep2_outland_12a" // While npc stuck on ep2_outland_11b ... -.-

VORTEX_POS = Vector(-633.321228, -9582.035156, -1252.022583)


--Create Checkpoints
TRIGGER_CHECKPOINT = {
	{Vector(1038, -9199, -1527), 
	Vector(953, -9379, -1450)},
	
	{Vector(-649.629517, -9328.574219, -1176.063843), 
	Vector(-703.968750, -9176.031250, -1147.968750)}

}
--Add map ending to inside the control room
TRIGGER_DELAYMAPLOAD = {Vector(2342, -11101, -91), Vector(2455, -11301, 25)}


function MAPSCRIPT:InitPost()
	timer.Simple(5, function()
	local set_off = ents.FindByName("lever_silo_door") //Disable Button to avoid crash
	--set_off[1]:SetKeyValue("StartDisabled", "1")
	set_off[1]:Remove()	//Remove the button to avoid crash
	end)
	/*
	for k, v in pairs(ents.FindInSphere(Vector(989.769470, -9175.424805, -1526.509521),150)) do
		if v:GetName() == "pclip_hall_attack_1"
		then
			print("Found Clip Door")
			v:Remove()
		end
		
		if v:GetClass() == "prop_dynamic" and
		v:GetModel() == "models/props_silo/silo_door01.mdl"
		then
			print("Found Door")
			v:Remove()
		end
	end
	*/

	
	/*
	local npc_maker = ents.Create("npc_maker")
	npc_maker:SetKeyValue("targetname", "hl2c_npc_maker_01")
	--npc_maker:SetKeyValue("additionalequipment", "weapon_ar2")
	npc_maker:SetKeyValue("MaxLiveChildren", "2")
	npc_maker:SetKeyValue("StartDisabled", "0")
	npc_maker:SetKeyValue("MaxNPCCount", "8")
	npc_maker:SetKeyValue("NPCType", "npc_fassassin")
	npc_maker:SetKeyValue("SpawnFrequency", "5")
	npc_maker:SetKeyValue("StartDisabled", "1")
	--npc_maker:SetKeyValue("spawnflags", "8320")
	npc_maker:SetPos(Vector(535, -9536, -1464))
	npc_maker:Spawn()
	--npc_maker:Activate()
	--npc_fassassin
	*/
end


function MAPSCRIPT:PostPlayerSpawn(pl)

	-- Give items
	pl:Give("weapon_physcannon")
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_357")
	pl:Give("weapon_smg1")
	pl:Give("weapon_ar2")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_frag")
	pl:Give("weapon_crossbow")
	--pl:SetAmmo("weapon_rpg", "0")
end


return MAPSCRIPT