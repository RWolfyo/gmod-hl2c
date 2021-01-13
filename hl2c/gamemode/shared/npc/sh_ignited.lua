-- sh_ignited.lua

if SERVER then AddCSLuaFile() end

local NPC = FindMetaTable( "Entity" )

if SERVER then

gameevent.Listen( "flare_ignite_npc" )
hook.Add( "flare_ignite_npc", "flare_ignite_npc_example", function( data )
	
	local index = data.entindex

	for _,npc in pairs(ents.FindByClass("*")) do
		
		if npc:IsNPC() and npc:EntIndex() == index then
			npc:SetNWBool("hl2c_ignited", true)
			--Hl2c.Ach_IgnitedNPC(npc)
		end
	end
end )

end

function NPC:IsIgnited()
	if IsValid(self) and self:IsNPC() and 
	self:GetNWBool("hl2c_ignited") == true 
	then
		return true	
	end
	return false
end
/*
hook.Add("Think", "Custom_Think_Elite", function()
	for _, ent in pairs(ents.FindByClass("npc_combine_s")) do
		ent:SetCurrentWeaponProficiency(2)
	end	

	for _, ent in pairs(ents.FindByClass("npc_metropolice")) do
		ent:SetCurrentWeaponProficiency(2)
	end
	for _, ent in pairs(ents.FindByClass("npc_citizen")) do
		ent:SetCurrentWeaponProficiency(2)
	end
end)
*/