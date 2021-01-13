/*------------------------

Title: Damage Scanner
Desc: Scan any npc or 
player damage

--------------------------*/

function Hl2c.Damage_Scanner(ent, dmg)
	if file.Exists("hl2c_data/dev.txt", "DATA") then
		
		
		if IsValid(ent) and
		isstring(ent:GetClass()) and
		--ent:IsPlayer() and
		IsValid(dmg:GetAttacker()) and
		isstring(dmg:GetAttacker():GetClass()) and
		(ent:GetClass() != "prop_physics" ) and
		( !string.find(ent:GetClass(), "weapon_") and
		!string.find(ent:GetClass(), "item_") and
		!string.find(ent:GetClass(), "func_") and
		!string.find(ent:GetClass(), "trigger_") and
		!string.find(ent:GetClass(), "env_") and
		ent:GetClass() != "prop_dynamic" and
		ent:GetClass() != "prop_dynamic_override" and
		ent:GetClass() != "prop_ragdoll" and
		ent:GetClass() != "entityflame" and
		ent:GetClass() != "npc_bullseye" and
		ent:GetClass() != "npc_actor" and
		ent:GetClass() != "npc_stachel" and
		ent:GetClass() != "npc_grenade" and
		ent:GetClass() != "npc_frag" and
		ent:GetClass() != "func_breakable" and
		ent:GetClass() != "func_physbox" and
		ent:GetClass() != "env_fire" and
		ent:GetClass() != "npc_slam" and
		ent:GetClass() != "npc_furniture" and
		ent:GetClass() != "bursh_playerclip" and
		ent:GetClass() != "prop_door" and
		ent:GetClass() != "prop_vehicle_airboat" and
		ent:GetClass() != "prop_vehicle_jeep" and
		ent:GetClass() != "prop_canister" and
		ent:GetClass() != "generic_actor" and
		dmg:GetAttacker():GetClass() != "entityflame" and
		dmg:GetAttacker():GetClass() != "npc_bullseye" and
		dmg:GetAttacker():GetClass() != "npc_actor" and
		dmg:GetAttacker():GetClass() != "npc_stachel" and
		dmg:GetAttacker():GetClass() != "npc_grenade" and
		dmg:GetAttacker():GetClass() != "npc_frag" and
		dmg:GetAttacker():GetClass() != "func_breakable" and
		dmg:GetAttacker():GetClass() != "func_physbox" and
		dmg:GetAttacker():GetClass() != "env_fire" 
		)
		then
			print("---------------------------------------------------")
			print("[hl2c] Damage Scanner: ")
			if ent:IsPlayer() and isstring(ent:Nick()) then
			print("","VictimClass: "..ent:GetClass().." VictimName: "..ent:Nick())
			elseif ent:IsNPC() and isstring(ent:GetName()) then
			print("","VictimClass: "..ent:GetClass().." VictimName: "..ent:GetName())
			else
			print("","VictimClass: "..ent:GetClass().." VictimName: UNKNOWN")
			end
			
			if dmg:GetAttacker():IsPlayer() then
			print("","AttackerClass: ".. dmg:GetAttacker():GetClass() .." AttackerName: ".. dmg:GetAttacker():Nick())
			elseif dmg:GetAttacker():IsNPC() and isstring(dmg:GetAttacker():GetName()) then
			print("","AttackerClass: ".. dmg:GetAttacker():GetClass() .." AttackerName: ".. dmg:GetAttacker():GetName())
			else
			print("","AttackerClass: "..dmg:GetAttacker():GetClass().." AttackerName: UNKNOWN")
			end
			if IsValid(dmg:GetInflictor()) and 
			isstring(dmg:GetInflictor():GetClass()) 
			then
			print("","Damage Inflictor: ".. dmg:GetInflictor():GetClass())
			else
			end
			print("","Damage Type: ".. dmg:GetDamageType())
			print("---------------------------------------------------")
		end
		
		
		
	end
end

-- hook.Add("EntityTakeDamage", "hl2c_dmg_log", Hl2c.Damage_Scanner)