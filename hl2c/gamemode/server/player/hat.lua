function Hl2c.Add_Hat(pl,com,args)
	if not (Hl2c_Valid_Pl(pl)) then return end
	if args and args[1] and args[2] and 
	isstring(args[1]) and isstring(args[2]) and 
	((DEV_MODE and args[2] == "test") or args[2] == "jelszo") then else return end
	if args[1] == "none" then return end
	pl:SetNWString("hl2c_hat",args[1])
	--game.ConsoleCommand("changelevel".. args[1] .."\n")
	--net.Start("Hl2c_ModifyHat")
	--net.Send(pl)
	if args[1] != "" then pl:databaseGet("stat")["hat"] = args[1] end
	umsg.Start("Hl2c_ModifyHat",pl)
	umsg.End(pl)
	--ent:Activate()
	Hl2c.PersonDefaultChatPrint("[Hat] Switched Hat to: ".. tostring(args[1]) .."",pl)
end