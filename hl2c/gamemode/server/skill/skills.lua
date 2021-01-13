
local time = 0

hook.Add("Think", "hl2cHl2dmSkills", function()
	if time > CurTime() then return end
	
	if HL2MP_IS_COOP_MAP then
		-- timer.Simple(20, function()
			if !HL2DM_SKILL then
			game.ConsoleCommand("sk_headcrab_fast_health 25\n")
			game.ConsoleCommand("sk_headcrab_health 25\n")
			game.ConsoleCommand("sk_headcrab_poison_health 25\n")
			
			game.ConsoleCommand("sk_headcrab_dmg_bite 5\n")
			game.ConsoleCommand("sk_headcrab_melee_dmg 5\n")
			--game.ConsoleCommand("sk_headcrab_poison_health 25\n")
			
			game.ConsoleCommand("sk_vortigaunt_health 120\n")
			game.ConsoleCommand("sk_vortigaunt_dmg_zap 10\n")
			
			game.ConsoleCommand("sk_manhack_health 20\n")
			--sk_manhack_health
			game.ConsoleCommand("sk_antlion_health 75\n")
			--sk_antlion_health 
			game.ConsoleCommand("sk_antlion_swipe_damage 18\n")
			--sk_antlion_swipe_damage 
			
			game.ConsoleCommand("sk_antlionguard_health 2500\n")
			--sk_antlionguard_health 
			print("[hl2c] HL2DM Skills Initialized...")
			HL2DM_SKILL = true
			end
		-- end)
	end
	if !HL2DM_SKILL then
	-- timer.Simple(20, function()
	
		game.ConsoleCommand("sk_gunship_health_increments 6\n")
		game.ConsoleCommand("sk_helicopter_health 1500\n")
	-- end)
	end
	
	time = CurTime() + 2
end)

--hl2c = {};
--if IsValid (Hl2c) then
AI = {};
AI.CombineS = "npc_combine_s"
AI.Metrocop = "npc_metropolice"
AI.Citizen = "npc_citizen"

function AI.Initialize()
	local combine_s = ents.FindByClass(AI.CombineS)
	for _, v in pairs(combine_s) do
		if v:IsNPC() && v:IsValid() && !v:IsPet() then
			v:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		end
	
	end
	
	local metro_cop = ents.FindByClass(AI.Metrocop)
	for _, v in pairs(metro_cop) do
		if v:IsNPC() && v:IsValid() && !v:IsPet() then
			v:SetCurrentWeaponProficiency(WEAPON_PROFICIENCY_VERY_GOOD)
		end
	
	end
end
hook.Add("Think", "hl2cAIInitialize", AI.Initialize)
--end