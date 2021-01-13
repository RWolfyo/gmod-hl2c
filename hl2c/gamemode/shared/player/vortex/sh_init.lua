local meta = FindMetaTable("Player")
if !meta then return end
//////////////////////////////////////////////////////
//		Vortex Functions for Players				//
//////////////////////////////////////////////////////

function meta:GetVortex(vortex)
	if isstring(vortex) then
		return self:GetNWInt( vortex )
	end
	
end