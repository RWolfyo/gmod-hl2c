--[[function SpawnJeep(pl)

	/*local trace = { }  
	local getply = LocalPlayer()
	trace.start = getply:EyePos()  
	trace.endpos = trace.start + ply:GetAimVector() * 85  
	trace.filter = getply  
	 
	local tr = util.TraceLine( trace )  
	  
	local car = ents.Create("prop_vehicle_jeep_old")  
	car:SetModel("models/buggy.mdl")  
	car:SetKeyValue("vehiclescript","scripts/vehicles/jeep_test.txt")  
	car:SetPos(tr.HitPos)  
	car:Spawn()*/
	--local tr = pl:GetEyeTrace()
	if CLIENT then
	local spawningpos = Player:GetPos()
	local tr = pl:GetEyeTrace()
	end
	if SERVER then
	local ent = ents.Create( "prop_vehicle_jeep_old")
	ent:SetPos(tr.HitPos)
	ent:SetModel("models/buggy.mdl")  
	ent:SetKeyValue("vehiclescript","scripts/vehicles/jeep_test.txt") 
	ent:Spawn()
	ent:Activate()	
	end
	
	/*if ( !tr.Hit ) then return end
	
	local SpawnPos = tr.HitPos + tr.HitNormal * 10
	local SpawnAng = ply:EyeAngles()
	SpawnAng.p = 0
	SpawnAng.y = SpawnAng.y + 180
	
	local ent = ents.Create( ClassName )
		ent:SetCreator( ply )
		ent:SetPos( SpawnPos )
		ent:SetAngles( SpawnAng )
	ent:Spawn()
	ent:Activate()

	ent:DropToFloor()
	
	return ent*/
end

concommand.Add("spawn_vehicle", function(ply) if ply:IsAdmin() then SpawnJeep() end end)]]--

--[[
  _____________________
//					   \\
||	Start Spawn List   ||
\\_____________________//
]]--

util.AddNetworkString("spawn_barney")

net.Receive("spawn_barney", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos

	local ent = ents.Create("npc_barney")
	ent:SetModel("models/barney.mdl")
	ent:SetKeyValue("targetname", "barney")
	ent:SetPos(hit)
	ent:Spawn()
	ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_barney")

net.Receive("spawn_barney", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos

	local ent = ents.Create("npc_barney")
	ent:SetModel("models/barney.mdl")
	ent:SetKeyValue("targetname", "barney")
	ent:SetPos(hit)
	ent:Spawn()
	ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_alyx")

net.Receive("spawn_alyx", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos

	local ent = ents.Create("npc_alyx")
	ent:SetModel("models/alyx.mdl")
	ent:SetKeyValue("targetname", "alyx")
	ent:SetPos(hit)
	ent:Spawn()
	ent:Give("weapon_alyxgun")
end)

util.AddNetworkString("spawn_alyx_ep2")

net.Receive("spawn_alyx_ep2", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos

	local ent = ents.Create("npc_alyx")
	ent:SetModel("models/alyx_ep2.mdl")
	ent:SetKeyValue("targetname", "alyx")
	ent:SetPos(hit)
	ent:Spawn()
	ent:Give("weapon_alyxgun")
end)

util.AddNetworkString("spawn_combine_s")

net.Receive("spawn_combine_s", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos

	local ent = ents.Create("npc_combine_s")
	ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "combine_soldier")
	ent:SetPos(hit)
	ent:Spawn()
	ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_strider")

net.Receive("spawn_strider", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	local offset = (Vector(0, 0, 50))
	local ent = ents.Create("npc_strider")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "strider")
	ent:SetPos(hit + offset)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_zombie")

net.Receive("spawn_zombie", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos

	local ent = ents.Create("npc_zombie")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "zombie")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_helicopter")

net.Receive("spawn_helicopter", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	local offset = (Vector(0, 0, 400))
	local ent = ents.Create("npc_helicopter")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "helicopter")
	ent:SetPos(hit + offset)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_combinegnuship")

net.Receive("spawn_combinegnuship", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	local offset = (Vector(0, 0, 400))
	local ent = ents.Create("npc_combinegunship")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "gunship")
	ent:SetPos(hit + offset)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_vortigaunt")

net.Receive("spawn_vortigaunt", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_vortigaunt")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "vortigaunt")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)
--npc_antlionguard

util.AddNetworkString("spawn_antlionguard")

net.Receive("spawn_antlionguard", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_antlionguard")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "antlionguard")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_cremator")

net.Receive("spawn_cremator", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_cremator")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "cremator")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_fassassin")
net.Receive("spawn_fassassin", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_fassassin")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "fassassin")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_rollermine")
net.Receive("spawn_rollermine", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_rollermine")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "rollermine")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_fastzombie")
net.Receive("spawn_fastzombie", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_fastzombie")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "fastzombie")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_poisonzombie")
net.Receive("spawn_poisonzombie", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_poisonzombie")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("crabcount", "0")
	ent:SetSaveValue("m_bCrabs",false)
	ent:SetSaveValue("m_nCrabCount",0)
	ent:SetKeyValue("targetname", "poisonzombie")
	
	ent:SetPos(hit)
	ent:Spawn()
	ent:SetKeyValue("crabcount", "0")
	ent:SetSaveValue("m_bCrabs",false)
	ent:SetSaveValue("m_nCrabCount",0)
	ent:SetSkin(1)
	--ent:Give("ai_weapon_ar2")
	--print("Spawned",ent:GetClass())
	--timer.Simple(1.0,function() 
	--PrintTable(ent:GetBodyGroups()) 
	--print(ent:GetBodyGroup("headcrab4")) 
	--ent:SetBodyGroup(0,0)
	--end)
end)

util.AddNetworkString("spawn_hunter")
net.Receive("spawn_hunter", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_hunter")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "hunter")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_sniper")
net.Receive("spawn_sniper", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_sniper")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "sniper")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_antlion")
net.Receive("spawn_antlion", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_antlion")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "antlion")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_headcrab")
net.Receive("spawn_headcrab", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_headcrab")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "headcrab")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_headcrab_black")
net.Receive("spawn_headcrab_black", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_headcrab_black")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "headcrab_black")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_headcrab_fast")
net.Receive("spawn_headcrab_fast", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_headcrab_fast")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "headcrab_fast")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_citizen_smg")
net.Receive("spawn_citizen_smg", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_citizen")
	ent:SetKeyValue("citizentype", "3")
	ent:SetKeyValue("expressiontype", "3")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "citizen_smg")
	ent:SetKeyValue("citizentype", "3")
	ent:SetKeyValue("expressiontype", "3")
	ent:SetPos(hit)
	ent:Spawn()
	ent:Give("ai_weapon_ar2")
end)

util.AddNetworkString("spawn_eli")
net.Receive("spawn_eli", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_eli")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "eli")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("weapon_smg1")
end)

util.AddNetworkString("spawn_kleiner")
net.Receive("spawn_kleiner", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_kleiner")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "kleiner")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("weapon_smg1")
end)

util.AddNetworkString("spawn_mossman")
net.Receive("spawn_mossman", function(l, ply)
	local hit = ply:GetEyeTrace().HitPos
	--local offset = (Vector(0, 0, 470))
	local ent = ents.Create("npc_mossman")
	--ent:SetModel("models/combine_soldier.mdl")
	ent:SetKeyValue("targetname", "mossman")
	ent:SetPos(hit)
	ent:Spawn()
	--ent:Give("weapon_smg1")
end)
--[[
  _____________________
//					   \\
||	End Spawn List     ||
\\_____________________//
]]--

/*NPC LIST

   * combine_mine
   * npc_alyx
   * npc_antlion
   * npc_antlion_template_maker
   * npc_antlionguard
   * npc_barnacle
   * npc_barney
   * npc_breen
   * npc_citizen
   * npc_combine_camera
   * npc_combine_s
   * npc_combinedropship
   * npc_combinegunship
   * npc_crabsynth
   * npc_cranedriver
   * npc_crow
   * npc_cscanner
   * npc_dog
   * npc_eli
   * npc_fastzombie
   * npc_fisherman
   * npc_gman
   * npc_headcrab
   * npc_headcrab_black
   * npc_headcrab_fast
   * npc_helicopter
   * npc_ichthyosaur
   * npc_kleiner
   * npc_manhack
   * npc_metropolice
   * npc_monk
   * npc_mortarsynth
   * npc_mossman
   * npc_pigeon
   * npc_poisonzombie
   * npc_rollermine
   * npc_seagull
   * npc_sniper
   * npc_stalker
   * npc_strider
   * npc_turret_ceiling
   * npc_turret_floor
   * npc_turret_ground
   * npc_vortigaunt
   * npc_zombie
   * npc_zombie_torso
   
   
   
   
   
*/