// Called when the player attempts to noclip
-- hook.Add("PlayerNoClip", "HL2C_PlayerNoClip", function( pl, desiredState )
function GM:PlayerNoClip(pl, desiredState )
	
	
	
	if ( pl:IsUserGroup( "superadmin" ) || pl:IsUserGroup( "Owner" ) || pl:IsUserGroup( "owner" ) ) && GetConVarNumber("hl2c_admin_noclip") == 1 then
		---print("CALLED")
		Freeman_Noclip(pl, desiredState)
		return true
	end
	
	return false
	--Hl2c.PlayerNoClip(pl, desiredState)
end
-- end)