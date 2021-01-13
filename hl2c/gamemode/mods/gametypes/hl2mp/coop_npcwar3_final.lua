RESET_PL_INFO = true

NEXT_MAP = "winter_lobby_2012"

HL2MP_IS_COOP_MAP = true

local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
	["usedstripper"] = true,
}

function MAPSCRIPT:InitPost()

	local change = ents.Create("point_changelevel")
	change:SetPos(Vector(3840, 13366, 4266))
	change:SetKeyValue("targetname", "hl2c_changelevel")
	change:Spawn()
	change:Activate()

	--local end1 = ents.FindByName("once_timer_1")
	--end1[1]:Fire("addoutput", "OnTrigger hl2c_changelevel,Changelevel,,300,1")
	
	--OnAllSpawnedDead
	--relay_combineshieldwall1_off
	--print( "makeantguard",ents.FindFirstByName( "makeantguard" ):MapCreationID() )
	--OnAllSpawnedDead
	--OnSpawnNPC
	--relay_antguard_3
	--print( "makeantguard_3",ents.FindFirstByName( "makeantguard_3" ):MapCreationID() )
	
	-- remove weapon remover on spawn fuck this stripper
	local remove1 = ents.FindByName("usedstripper")
	remove1[1]:Remove()
	
	
	// Need to find the Trigger that activates on teleported to the tunnel to skip the bugged part.
	ents.GetMapCreatedEntity( 3429 ):Fire("addoutput", "OnTrigger relay_rock,Trigger,,450,1")
	ents.GetMapCreatedEntity( 2554 ):Fire("addoutput", "OnAllSpawnedDead relay_combineshieldwall1_off,Trigger,,1,-1") -- makeantguard 
	ents.GetMapCreatedEntity( 3389 ):Fire("addoutput", "OnSpawnNPC relay_antguard_3,Trigger,,10,-1") -- makeantguard_3
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_pistol")
	pl:Give("weapon_smg1")
	pl:Give("weapon_medkit_hl2c")
	pl:Give("weapon_frag")
	pl:Give("weapon_357")
	pl:Give("weapon_shotgun")
	pl:Give("weapon_ar2")
	pl:Give("weapon_rpg")
	pl:Give("weapon_crossbow")
end

return MAPSCRIPT