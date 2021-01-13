
function Hl2c.Select_Inventory(pl,item)
	if not (Hl2c_Valid_Pl(pl)) then return end
	--pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Working Inventory")
	if HL2C_DISABLE_WEAPONS == true then 
		-- pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Shop is Disabled!") 
		Hl2c.PersonDefaultChatPrint("[hl2c] Shop is Disabled!",pl)
		return 
	end
	if item == nil then return end
	if item[1] == nil then return end
	if Hl2c.IsItemBlock(pl,item[1]) then return end
	--pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Working Giving: ".. tostring( item[1] ) .."")
	
	if Hl2c.Item_CheckWeapon(item[1]) then
		if Hl2c.Item_CheckReq(pl,item[1]) then
			--pl:PrintMessage(HUD_PRINTTALK,"[hl2c] Working Giving Item From Inventory")
			if item[1] == "weapon_combineshotgun" then return end
			pl:Give(item[1])
			
		end
	end
	
end