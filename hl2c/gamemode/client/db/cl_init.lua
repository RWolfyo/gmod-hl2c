function SaveDB()
	file.CreateDir( "hl2c_data" )
	-- if !file.Exists("hl2c_data/client.txt", "DATA" ) then
	if GetHostName() and GetHostName()=="[Half - Life 2 Campaign] - [Beta Test Server]" then
		local db = {}
		db={}
		
		db["version"]="0400"
		db["stat"]={}
		db["stat"]["xp"]=LocalPlayer():GetXP()
		db["stat"]["perma"]=LocalPlayer():GetPerma()
		db["stat"]["hat"]=LocalPlayer():GetNWString("hl2c_hat")
		db["stat"]["squad"]=0
		db["stat"]["antlion-kills"]=LocalPlayer():GetNWInt("COUNT_KILLS_ANTLIONS")
		db["stat"]["combine-kills"]=LocalPlayer():GetNWInt("COUNT_KILLS_COMBINES")
		db["stat"]["headcrab-kills"]=LocalPlayer():GetNWInt("COUNT_KILLS_HEADCRABS")
		db["stat"]["rebel-kills"]=LocalPlayer():GetNWInt("COUNT_KILLS_REBELS")
		db["stat"]["vortigaunt-kills"]=LocalPlayer():GetNWInt("COUNT_KILLS_VORTIGAUNTS")
		db["stat"]["zombie-kills"]=LocalPlayer():GetNWInt("COUNT_KILLS_ZOMBIES")
		-- db["inventory"]={[0]={["id"]="000",["amount"]=0}}
		local weps={}
		for k, v in pairs(LocalPlayer():GetWeapons()) do
			weps[v:GetClass()]= 1
		end
		db["map-data"]={["map"]=game.GetMap(),["weapons"]=weps,["frags"]=LocalPlayer():Frags()}
		db["pets"]={}
		db["pets"]={
			[1]={
			["pet_id"]="none",
			["pet_xp"] = 0,
			["pet_level"] = 1,
			["pet_name"] = "pet",
			["pet_hp"] =100,
			["main"]=true
			}
		}
		db["inventory"]={["mats"]={}}
		db["inventory"]["mats"][1] = 0 -- common scrap
		db["inventory"]["mats"][2] = 0 -- rare scrap
		db["inventory"]["mats"][3] = 0 -- epic scrap
		db["inventory"]["mats"][4] = 0 -- legendary scrap
		
		db["inventory"]["mats"][5] = 0 -- common food
		db["inventory"]["mats"][6] = 0 -- rare food
		db["inventory"]["mats"][7] = 0 -- epic food
		db["inventory"]["mats"][8] = 0 -- legendary food
		db["custom"]= { ["counter"]={}, ["setup"]={},["plan"]={} }
		
		for i=1,100 do
			db["custom"]["counter"][i] = LocalPlayer():GetNWInt("customcounter_"..tostring(i))
			db["custom"]["setup"][i] = LocalPlayer():GetNWInt("customsetup_"..tostring(i))
			db["custom"]["plan"][i] = LocalPlayer():GetNWInt("customplan_"..tostring(i))
			
		end
		db["ach"]={["hl2"]={},["ep1"]={},["ep2"]={},["gen"]={} }
		for i=1,#Hl2c.EP2_ACH_LIST do
			db["ach"]["ep2"][i] = LocalPlayer():GetNWInt(Hl2c.EP2_ACH_LIST[i])
		end
		
		for i=1,#Hl2c.EP1_ACH_LIST do
			db["ach"]["ep1"][i] = LocalPlayer():GetNWInt(Hl2c.EP1_ACH_LIST[i])
		end
		
		for i=1,#Hl2c.HL2_ACH_LIST do
			db["ach"]["hl2"][i] = LocalPlayer():GetNWInt(Hl2c.HL2_ACH_LIST[i])
		end
		
		for i=1,#Hl2c.GEN_ACH_LIST do
			db["ach"]["gen"][i] = LocalPlayer():GetNWInt(Hl2c.GEN_ACH_LIST[i])
		end
		db["vortex"]= {["hl2"]={},["ep1"]={},["ep2"]={},["cd"]={},["ep3"]={},["lostcoast"]={},["metastasis"]={},["s-hl2"]={} }
		for i=1,#Hl2c.VORTEX_EP1_LIST do
			db["vortex"]["ep1"][i] = LocalPlayer():GetNWInt(Hl2c.VORTEX_EP1_LIST[i])
		end
		for i=1,#Hl2c.VORTEX_EP2_LIST do
			db["vortex"]["ep2"][i] = LocalPlayer():GetNWInt(Hl2c.VORTEX_EP2_LIST[i])
		end
		for i=1,#Hl2c.VORTEX_HL2_LIST do
			db["vortex"]["hl2"][i] = LocalPlayer():GetNWInt(Hl2c.VORTEX_HL2_LIST[i])
		end
		for i=1,#Hl2c.VORTEX_CD_LIST do
			db["vortex"]["cd"][i] = LocalPlayer():GetNWInt(Hl2c.VORTEX_CD_LIST[i])
		end
		for i=1,#Hl2c.VORTEX_EP3_LIST do
			db["vortex"]["ep3"][i] = LocalPlayer():GetNWInt(Hl2c.VORTEX_EP3_LIST[i])
		end
		for i=1,#Hl2c.VORTEX_LT_LIST do
			db["vortex"]["lostcoast"][i] = LocalPlayer():GetNWInt(Hl2c.VORTEX_LT_LIST[i])
		end
		for i=1,#Hl2c.VORTEX_META_LIST do
			db["vortex"]["metastasis"][i] = LocalPlayer():GetNWInt(Hl2c.VORTEX_META_LIST[i])
		end
		// Super Vortex
		-- for i=1,#Hl2c.VORTEX_HL2_LIST do
			-- db["vortex"]["s-hl2"][i] = LocalPlayer():GetNWInt(Hl2c.HL2_LAMBDA_LIST[i])
		-- end
		db["lambda"]={["hl2"]={},["ep2_radar"]={},["ep2_web"] = {} }
		for i=1,#Hl2c.HL2_LAMBDA_LIST do
			db["lambda"]["hl2"][i] = LocalPlayer():GetNWInt(Hl2c.HL2_LAMBDA_LIST[i])
		end
		for i=1,#Hl2c.EP2_RADARCACHE_LIST do
			db["lambda"]["ep2_radar"][i] = LocalPlayer():GetNWInt(Hl2c.EP2_RADARCACHE_LIST[i])
		end
		for i=1,#Hl2c.EP2_WEBCACHE_LIST do
			db["lambda"]["ep2_web"][i] = LocalPlayer():GetNWInt(Hl2c.EP2_WEBCACHE_LIST[i])
		end
		file.Write("hl2c_data/client.txt",util.TableToKeyValues(db))
		print("SAVE DATA")
	else
		timer.Destroy("hl2c_db_update")
	end
	
	
end
function ReadDB()
end
function CheckDB()
	if file.Exists("hl2c_data/client.txt","DATA") then
		print("[DB]: client.txt exists")
		net.Start("Client.Database")
			-- net.WriteEntity(LocalPlayer())
		net.SendToServer()
	else
		print("[DB]: client.txt is not exists... Creating folder and file...")
		net.Start("Client.Database")
			-- net.WriteString( LocalPlayer():SteamID() )
		net.SendToServer()
	end
end
function Database()
	timer.Destroy("hl2c_db_update")
	timer.Create("hl2c_db_update", 4, 0, function() SaveDB() end)
end
Hl2c.BANS =Hl2c.BANS or {}
net.Receive("hl2c.banlist",function() 
	db = net.ReadTable()
	-- print(db)
	if db != nil then
		for k, v in pairs(db) do
			Hl2c.BANS[v]=v
		end
	end
end)