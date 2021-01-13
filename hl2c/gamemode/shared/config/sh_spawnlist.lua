if SERVER then AddCSLuaFile() end

--------------------------------------------------[[
--   __                              __ _     _   
--  / _\_ __   __ ___      ___ __   / /(_)___| |_ 
--  \ \| '_ \ / _` \ \ /\ / / '_ \ / / | / __| __|
--  _\ \ |_) | (_| |\ V  V /| | | / /__| \__ \ |_ 
--  \__/ .__/ \__,_| \_/\_/ |_| |_\____/_|___/\__|
--     |_|                                        
--------------------------------------------------]]


if Hl2c then

Hl2c.SpawnList = {
	Ent = {
		[1] = {
			classname = "npc_combine_s",
			weapon = "weapon_ar2",
			name = "Combine Soldier (AR2)",
			model = "models/combine_soldier.mdl",
			skin = 0,
			icon = "entities/npc_combine_s.png",
			spawnid = "spawn_1",
			KeyValues = {SquadName = "overwatch", Numgrenades = 5},
			offset = Vector(0,0,30)
		},
		[2] = {
			classname = "npc_combine_s",
			weapon = "weapon_shotgun",
			name = "Combine Soldier (Shotgun)",
			model = "models/combine_soldier.mdl",
			skin = 1,
			icon = "entities/shotgunsoldier.png",
			spawnid = "spawn_2",
			KeyValues = {SquadName = "overwatch", Numgrenades = 5},
			offset = Vector(0,0,30)
		}
	
	}


	
	
	
}

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_s",
	weapon = "weapon_ar2",
	name = "Combine Elit Soldier (AR2)",
	model = "models/combine_super_soldier.mdl",
	skin = 0,
	icon = "entities/combineelite.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {SquadName = "overwatch", Numgrenades = 5},
	offset = Vector(0,0,30)
	}
)
table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_s",
	weapon = "weapon_shotgun",
	name = "Combine Elit Soldier (Shotgun)",
	model = "models/combine_super_soldier.mdl",
	skin = 0,
	icon = "entities/combineelite.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {SquadName = "overwatch", Numgrenades = 5},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_s",
	weapon = "weapon_smg1",
	name = "Combine Soldier (SMG)",
	model = "models/combine_soldier.mdl",
	skin = 0,
	icon = "entities/npc_combine_s.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {SquadName = "overwatch", Numgrenades = 5},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_metropolice",
	weapon = "weapon_stunstick",
	name = "Metrocop (Stunstick)",
	model = "",
	skin = 0,
	icon = "entities/npc_metropolice.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_metropolice",
	weapon = "weapon_pistol",
	name = "Metrocop (Pistol)",
	model = "",
	skin = 0,
	icon = "entities/npc_metropolice.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_metropolice",
	weapon = "weapon_smg1",
	name = "Metrocop (SMG)",
	model = "",
	skin = 0,
	icon = "entities/npc_metropolice.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_s",
	weapon = "weapon_smg1",
	name = "Combine Prisonguard (SMG)",
	model = "models/combine_soldier_prisonguard.mdl",
	skin = 0,
	icon = "entities/combineprison.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {SquadName = "overwatch", Numgrenades = 5},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_s",
	weapon = "weapon_ar2",
	name = "Combine Prisonguard (AR2)",
	model = "models/combine_soldier_prisonguard.mdl",
	skin = 0,
	icon = "entities/combineprison.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {SquadName = "overwatch", Numgrenades = 5},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_s",
	weapon = "weapon_shotgun",
	name = "Combine Prisonguard (Shotgun)",
	model = "models/combine_soldier_prisonguard.mdl",
	skin = 1,
	icon = "entities/prisonshotgunner.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {SquadName = "overwatch", Numgrenades = 5},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_sniper",
	weapon = "",
	name = "Combine Sniper",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_s.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_alyx",
	weapon = "weapon_alyxgun",
	name = "Alyx (alyxgun)",
	model = "",
	skin = 0,
	icon = "entities/npc_alyx.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_alyx",
	weapon = "weapon_shotgun",
	name = "Alyx (Shotgun)",
	model = "",
	skin = 0,
	icon = "entities/npc_alyx.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_alyx",
	weapon = "weapon_alyxgun",
	name = "Alyx Ep2",
	model = "models/alyx_ep2.mdl",
	skin = 0,
	icon = "entities/npc_alyx.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_alyx",
	weapon = "weapon_alyxgun",
	name = "Alyx Ep2 (Damaged)",
	model = "models/alyx_ep2.mdl",
	skin = 1,
	icon = "entities/npc_alyx.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_barney",
	weapon = "weapon_ar2",
	name = "Barney",
	model = "",
	skin = 0,
	icon = "entities/npc_barney.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_kleiner",
	weapon = "",
	name = "Kleiner",
	model = "",
	skin = 0,
	icon = "entities/npc_kleiner.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_eli",
	weapon = "",
	name = "Eli",
	model = "",
	skin = 0,
	icon = "entities/npc_eli.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_mossman",
	weapon = "",
	name = "Mossman",
	model = "",
	skin = 0,
	icon = "entities/npc_mossman.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_breen",
	weapon = "",
	name = "Breen",
	model = "",
	skin = 0,
	icon = "entities/npc_breen.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_monk",
	weapon = "weapon_annabelle",
	name = "Father Grigori",
	model = "",
	skin = 0,
	icon = "entities/npc_monk.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_crow",
	weapon = "",
	name = "Crow",
	model = "",
	skin = 0,
	icon = "entities/npc_crow.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_antlion",
	weapon = "",
	name = "Antlion",
	model = "",
	skin = 0,
	icon = "entities/npc_antlion.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_antlion",
	weapon = "",
	name = "Antlion Worker",
	model = "",
	skin = 0,
	icon = "entities/npc_antlion_worker.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	Spawnflags = {[1] = 262144},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_antlionguard",
	weapon = "",
	name = "Antlion Guard",
	model = "",
	skin = 0,
	icon = "entities/npc_antlionguard.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_antlionguard",
	weapon = "",
	name = "Antlion Guardian",
	model = "",
	skin = 1,
	icon = "entities/npc_antlionguardian.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {cavernbreed = "1",incavern = "1"},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_headcrab",
	weapon = "",
	name = "Classic Headcrab",
	model = "",
	skin = 0,
	icon = "entities/npc_headcrab.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_headcrab_fast",
	weapon = "",
	name = "Fast Headcrab",
	model = "",
	skin = 0,
	icon = "entities/npc_headcrab_fast.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_headcrab_black",
	weapon = "",
	name = "Black Headcrab",
	model = "",
	skin = 0,
	icon = "entities/npc_headcrab_black.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_zombie",
	weapon = "",
	name = "Classic Zombie",
	model = "",
	skin = 0,
	icon = "entities/npc_zombie.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_zombine",
	weapon = "",
	name = "Zombine",
	model = "",
	skin = 0,
	icon = "entities/npc_zombine.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_fastzombie",
	weapon = "",
	name = "Fast Zombie",
	model = "",
	skin = 0,
	icon = "entities/npc_fastzombie.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_poisonzombie",
	weapon = "",
	name = "Poison Zombie",
	model = "",
	skin = 0,
	icon = "entities/npc_poisonzombie.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

-- table.insert(
	-- Hl2c.SpawnList.Ent,
	-- #Hl2c.SpawnList.Ent+1,
	-- { 
	-- classname = "npc_barnacle",
	-- weapon = "",
	-- name = "Barnacle",
	-- model = "",
	-- skin = 0,
	-- icon = "entities/npc_barnacle.png",
	-- spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	-- offset = Vector(0,0,0)
	-- }
-- )

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_hunter",
	weapon = "",
	name = "Hunter",
	model = "",
	skin = 0,
	icon = "entities/npc_hunter.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

-- table.insert(
	-- Hl2c.SpawnList.Ent,
	-- #Hl2c.SpawnList.Ent+1,
	-- { 
	-- classname = "npc_fassassin",
	-- weapon = "",
	-- name = "Combine Female Assassin",
	-- model = "",
	-- skin = 0,
	-- icon = "entities/npc_fassassin.png",
	-- spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	-- offset = Vector(0,0,30)
	-- }
-- )

-- table.insert(
	-- Hl2c.SpawnList.Ent,
	-- #Hl2c.SpawnList.Ent+1,
	-- { 
	-- classname = "npc_cremator",
	-- weapon = "",
	-- name = "Combine Cremator",
	-- model = "",
	-- skin = 0,
	-- icon = "entities/npc_cremator.png",
	-- spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	-- offset = Vector(0,0,30)
	-- }
-- )

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_rollermine",
	weapon = "",
	name = "Rollermine",
	model = "",
	skin = 0,
	icon = "entities/npc_rollermine.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,100)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_citizen",
	weapon = "",
	name = "Ctizien",
	model = "",
	skin = 0,
	icon = "entities/npc_citizen.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_citizen",
	weapon = "weapon_smg1",
	name = "Rebel (smg1)",
	model = "",
	skin = 0,
	icon = "entities/rebel.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {citizentype="3"},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_citizen",
	weapon = "weapon_shotgun",
	name = "Rebel (shotgun)",
	model = "",
	skin = 0,
	icon = "entities/rebel.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {citizentype="3"},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_citizen",
	weapon = "weapon_ar2",
	name = "Rebel (ar2)",
	model = "",
	skin = 0,
	icon = "entities/rebel.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	KeyValues = {citizentype="3"},
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_vortigaunt",
	weapon = "",
	name = "Vortigaunt",
	model = "",
	skin = 0,
	icon = "entities/npc_vortigaunt.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_shield",
	weapon = "",
	name = "Combine Shield",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_shield.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_sniper",
	weapon = "",
	name = "Combine Sniper",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_sniper.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_support",
	weapon = "",
	name = "Combine Support",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_support.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_synth",
	weapon = "",
	name = "Combine Synth",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_synth.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_synth_elite",
	weapon = "",
	name = "Combine Elite Synth",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_synth_elite.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_veteran",
	weapon = "",
	name = "Combine Veteran",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_veteran.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_prisonguard_s",
	weapon = "",
	name = "Prison Shotgun Guard",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_prisonguard_s.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_prisonguard",
	weapon = "",
	name = "Prison Guard",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_prisonguard.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_overwatch_s",
	weapon = "",
	name = "Combine Shotgun Soldier",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_overwatch_s.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_overwatch",
	weapon = "",
	name = "Combine Soldier",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_overwatch.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_medic",
	weapon = "",
	name = "Combine Medic",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_medic.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_hg",
	weapon = "",
	name = "Combine Juggernaut",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_hg.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_grenadier",
	weapon = "",
	name = "Combine Grenadier",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_grenadier.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_engineer",
	weapon = "",
	name = "Combine Engineer",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_engineer.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_elite",
	weapon = "",
	name = "Combine Elite",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_elite.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_commander",
	weapon = "",
	name = "Combine Commander",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_commander.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_burner",
	weapon = "",
	name = "Combine Pyro",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_burner.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_combine_assassin",
	weapon = "",
	name = "Combine Female Assassin",
	model = "",
	skin = 0,
	icon = "entities/npc_combine_assassin.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)

table.insert(
	Hl2c.SpawnList.Ent,
	#Hl2c.SpawnList.Ent+1,
	{ 
	classname = "npc_metro_arrest",
	weapon = "",
	name = "Cop Arrest",
	model = "",
	skin = 0,
	icon = "entities/npc_metro_arrest.png",
	spawnid = "spawn_"..tostring(#Hl2c.SpawnList.Ent+1),
	offset = Vector(0,0,30)
	}
)


end
