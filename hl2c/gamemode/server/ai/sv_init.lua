

--[[ CreateConVar("combine_soldier_aim", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Sets Combine Soldier Weapon Proficiency 0-1-2-3-4 Default: 1")
CreateConVar("metropolice_aim", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Sets Combine Soldier Weapon Proficiency 0-1-2-3-4 Default: 1")
CreateConVar("citizen_aim", "1", { FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE }, "Sets Combine Soldier Weapon Proficiency 0-1-2-3-4 Default: 1")

local NPC_TYPES = {
["npc_metropolice"]="metropolice_aim",
["npc_combine_s"]="combine_soldier_aim",
["npc_citizen"]="citizen_aim"
}
-- HARD
function AIM_NPC_MOD()
	for k, v in pairs(NPC_TYPES) do
		for _, npc in pairs(ents.FindByClass(k)) do
			if npc:GetCurrentWeaponProficiency() != GetConVar( v ):GetInt() then
				npc:SetCurrentWeaponProficiency( GetConVar( v ):GetInt() )
			end
		end
	end
end
hook.Remove("Think","AIM_NPC_MOD")
hook.Add("Think","AIM_NPC_MOD",AIM_NPC_MOD)
--end) ]]
function CD_AI()
	if CD_MAP then
		for _, pl in pairs(player.GetAll()) do
			if IsValid(pl) and pl:Alive() and pl != NULL then
				for k, v in pairs(ents.FindByClass("npc_combinedropship")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_combine_s")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_turret_ceiling")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_turret_floor")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_turret_ground")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				/*
				for k, v in pairs(ents.FindByClass("npc_combine_camera")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				*/
				for k, v in pairs(ents.FindByClass("combine_mine")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_sniper")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_stalker")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_cscanner")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_strider")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_helicopter")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_combinegunship")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_manhack")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				for k, v in pairs(ents.FindByClass("npc_rollermine")) do
					v:AddEntityRelationship( pl, D_LI, 99 )
				end
				
				
				for k, v in pairs(ents.FindByClass("npc_citizen")) do
					v:AddEntityRelationship( pl, D_HT, 99 )
				end
			end
		end
	end
end
hook.Remove("Think","Combine Destiny Behaviour")
hook.Add("Think", "Combine Destiny Behaviour", CD_AI )