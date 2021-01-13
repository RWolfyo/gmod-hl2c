include("sv_create.lua")
include("sv_remove.lua")
include("sv_death.lua")
include("sv_target.lua")
include("sv_follow.lua")
include("sv_ai.lua")
include("sv_damagetake.lua")



/*
function Hl2c.PetSummon(owner)
	if IsValid(owner) and 
	owner:IsPlayer() and 
	owner:Alive() and 
	owner:Team() == TEAM_ALIVE and
	owner.setup_achi == true
	then
		
		if owner.petalive == true then
		
		else
			--owner:GetNWInt("Pet_Type")
		end
		
	else
	
		print("****")
		print("[pet] Unknown event called to summon a pet")
		print("****")
	end
end
*/

function Hl2c.Pet_Select(owner)
	
end

function Hl2c.Pet_SetMain(owner)
	
end








/*
http://bestmovielines.co/071ec5f2bfebb
*/