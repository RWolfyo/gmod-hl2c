NEXT_MAP = "d1_town_04"

TRIGGER_CHECKPOINT = {
	{Vector(-6952, 1043, -3399), Vector(-7387, 900, -3337)},
	{Vector(-7564, -286, -3408), Vector(-7461, -157, -3279)}
}

if file.Exists("hl2c_data/hl2c_d1_town_03.txt", "DATA") then
	file.Delete("hl2c_data/hl2c_d1_town_03.txt")
end

//Vortex
// -8141 -518 -3126
-- VORTEX_POS = Vector(-8141, -518, -3126)
VORTEX_POS = Vector(-6916.617676, -839.479736, -2387.456055)
local MAPSCRIPT = {}

function MAPSCRIPT:InitPost()
	
	timer.Simple(3, function()
	local town02a_auto = ents.Create("logic_auto")
	town02a_auto:SetKeyValue("spawnflags", "1")
	town02a_auto:Fire("addoutput" ,"OnMapSpawn monk,Kill,,0.1,-1")
	town02a_auto:Fire("addoutput" ,"OnMapSpawn startobjects_template,ForceSpawn,,0.5,-1")
	town02a_auto:Fire("addoutput" ,"OnMapSpawn startobjects,Kill,,0.7,-1")
	town02a_auto:Fire("addoutput" ,"OnMapSpawn monk,SetDamageFilter,filter_NoDamage,2,-1")
	town02a_auto:Spawn()
	town02a_auto:Activate()
	
	--local hl2c_nodmg = ents.Create("filter_multi")
	--hl2c_nodmg:SetKeyValue("Negated", "1")
	--hl2c_nodmg:SetKeyValue("targetname", "filter_NoDamage")
	--hl2c_nodmg:SetPos(Vector(-5214, 1970, -3241))
	--hl2c_nodmg:Spawn()
	--hl2c_nodmg:Activate()
	end)
	/*
 "logic_auto"
        {
            "spawnflags" "1"
            "OnMapSpawn" "monk,Kill,,0.1,-1"
            "OnMapSpawn" "startobjects_template,ForceSpawn,,0.5,-1"
            "OnMapSpawn" "yumyumyum,Eat,,0.8,-1"
            "OnMapSpawn" "monk,SetDamageFilter,filter_NoDamage,2,-1"
            "origin" "-5318.29 1865.17 -3222.64"
        }
        "point_weapon_eater"
        {
            "EatRadius" "64"
            "targetname" "yumyumyum"
            "origin" "-5257 1862 -3226.55"
        }
        "filter_multi"
        {
            "Negated" "1"
            "targetname" "filter_NoDamage"
            "origin" "-5214 1970 -3241"
        }
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
end

return MAPSCRIPT