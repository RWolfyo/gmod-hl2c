/*
hook.Add("OnPlayerChat", "chat thing", function(ply, text, teamOnly, alive, prefixText, color1, color2)
    color2 = Color(255, 255, 75, 255)
	color3 = Color(255, 255, 255, 255)
	color4 = Color(255, 255, 0, 255)
	if ply:IsPlayer() then
	if ply:IsUserGroup( "superadmin" ) then
        chat.AddText(Color(149, 255, 42, 255), "[SuperAdmin] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
    --end
	--elseif ply:IsAdmin() then		//Old Style
    elseif ply:IsUserGroup( "admin" ) then
        chat.AddText(Color(255, 2, 100, 255), "[Admin] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
   -- end
    elseif ply:IsUserGroup("donator") then
        chat.AddText(Color(255, 0, 191), "[Donator] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
    --end
    elseif ply:IsUserGroup("owner") then
        chat.AddText(Color(127, 0, 95), "[Owner] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
    --end
    elseif ply:IsUserGroup("headadmin") then
        chat.AddText(Color(0, 255, 63), "[Head Admin] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
    --end
    elseif ply:IsUserGroup("headmoderator") then
        chat.AddText(Color(255, 93, 0), "[Head Moderator] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
   -- end
    elseif ply:IsUserGroup("moderator") then
        chat.AddText(Color(29, 0, 255), "[Mod] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
    --end
    elseif ply:IsUserGroup("trusted") then
        chat.AddText(Color(255, 255, 0), "[Trusted] ", color2, ply:Nick(), color3, ":", " "..text)
        return true
    --end
    elseif ply:GetNWString("usergroup") ~= "user" then
        chat.AddText(Color(255, 0, 0, 255), "[" .. ply:GetNWString("usergroup") .. "] ", color2, ply:Nick(), color3, ": "..text)
        return true
    else
		chat.AddText(Color(29, 0, 255), "", color2, ply:Nick(), color3, ":", " "..text)
		return true
	end
	end

end)*/