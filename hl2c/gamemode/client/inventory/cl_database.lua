local function Test()
	local w = 300
	local h = 400
	--> Frame
	local frame = vgui.Create("DFrame")
	frame:SetPos(ScrW()/2-w/2, ScrH())
	frame:SetSize(w, h)
	frame:SetTitle("")
	frame:SetDraggable(false)
	frame:ShowCloseButton(true)
	frame:MakePopup()
	frame:MoveTo(ScrW()/2-w/2, ScrH()/2-h/2, 0.2, 0, -1)
	
	frame.Paint = function(pnl, w, h)

		draw.RoundedBox(4, 0, 0, w, h, Color(216, 203, 159, 255))
		draw.RoundedBox(4, 2, 2, w-4, h-4, Color(201,182,140, 255))

		draw.RoundedBox(4, 2, 2, w-4, 28, Color(199,179,126, 255))
		draw.SimpleText("Test Window", "DermaDefault", 11, 15, Color(0, 0, 0, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

	end
	
	
	--> Close
	-- local close = vgui.Create("DButton", frame)
	-- close:SetPos(w-45, 41/2-24/2)
	-- close:SetSize(36, 26)
	-- close:SetText("")

	-- close.DoClick = function()

		-- frame:MoveTo(ScrW()/2-w/2, ScrH(), 0.2, 0, -1, function()
			-- frame:Remove()
		-- end)

	-- end

	-- close.Paint = function(pnl, w, h)

		
		

		-- if close:IsHovered() then
			-- draw.RoundedBox(3, 0, 0, w, h, Color(255, 255, 255, 15))
			
		-- else
			-- draw.RoundedBox(3, 0, 0, w, h, Color(204, 191, 20, 255))
		-- end
		-- draw.SimpleText("x", "Default", w/2, h/2-1, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	-- end
end


Hl2c.DATABASE = Hl2c.DATABASE  or {}




local function databaseReceive( tab,name )
	Hl2c.DATABASE[name] = tab
	print(name)
end



net.Receive("inventory.database", function(len)
	local name = net.ReadString()
	local tab = net.ReadTable()
	if name and name!="client.side" then
		databaseReceive( tab,name )
	elseif name and name=="client.side" then
		CheckDB()
	end
	-- print("WORKS?")
end)

function databaseTable()
	return Hl2c.DATABASE or {}
end

function databaseGetValue( name )
	local d = databaseTable()
	return d[name]
end

function databaseGetInventorySlot()
	local d = databaseTable()
	return d.inventory.slot or {}
end
function databaseGetInventoryEquip()
	local d = databaseTable()
	-- print(d.inventory.equip)
	return d.inventory.equip or {}
end

include("cl_loot.lua")



include("cl_inventory.lua")
