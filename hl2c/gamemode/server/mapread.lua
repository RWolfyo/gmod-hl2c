Hl2c.MapScript = {}
function Hl2c_ReadData()
	local file_name = "example"
	if !file.Exists( file_name ..".txt","DATA") then return end
	local read = file.Read( file_name ..".txt", "DATA" )
	local text = nil
	local lines = 0
	local db = {}
	--local last_char = " "
	if read then else return end
	local lastpos = #read
	--print(#read)
	--print(#string.ToTable( read ))
	for k, v in ipairs( string.ToTable( read ) ) do
		if v != "\n" then
			
			if db[lines + 1] then
				db[lines + 1] = db[lines + 1]..v
			else
				db[lines+1] = v
			end
			
		elseif v == "\n" and k == lastpos then
		elseif v == "\n" and k != lastpos then
			--print("Sortörés")
			lines = lines + 1
		end
		--print(k)
		
	end
	--print(db[33])
	--print(#db)
	local mapname = false
	local mapnameOn = false
	local mapnameOff = false
	local starting = 0
	local ending = 0
	local SpawnItems = false
	local SpawnItemsOn = false
	local SpawnItemsOff = false
	local Add = false
	local AddOn = false
	local AddOff = false
	local AddEntOn = false
	local AddEntOff = false
	for k, v in pairs(db) do
		if string.find( v, "mapname" ) then
			--print("Found Map Name")
			mapname = true
		end
		
		if string.find( v, "SpawnItems" ) then
			SpawnItems = true
		end
		
		if string.find( v, "Add" ) then
			Add = true
		end
		
		if string.find( v, "{" ) then
			
			starting = starting + 1
			if mapnameOn == false and mapname and mapnameOff == false then
				mapnameOn = true
			end
			if SpawnItemsOn == false and SpawnItems and SpawnItemsOff == false then
				SpawnItemsOn = true
			end
			if AddOn == false and Add and AddOff == false then
				AddOn = true
			end
		end
		
		if string.find( v, "}" ) then
			
			ending = ending + 1
			if mapnameOn == true and mapname and mapnameOff == false then
				mapnameOff = true
				--mapname = false
			end
			if SpawnItemsOn == true and SpawnItems and SpawnItemsOff == false then
				SpawnItemsOff = true
				--SpawnItems = false
			end
			if AddOn == true and Add and AddOff == false then
				AddOff = true
				--SpawnItems = false
			end
		end
		
		if SpawnItems and SpawnItemsOn and string.find( v, '"' ) then
			local tbl = string.Explode( '"', v )
			--print(tbl[1])
			--print(tbl[2],tbl[4])
			--PrintTable(tbl)
			--if tbl[1] == "" then else return error("ERROR CODE ( Unknown Value ) on SpawnItems args [1] '".. tbl[1] .."'\n")  end
			if tbl[2] == "" then return error("ERROR CODE ( Missing Value ) on SpawnItems args [2]\n",5)  end
			if tbl[4] == "" then return error("ERROR CODE ( Missing Value ) on SpawnItems args [4]\n",5)  end
			--if tbl[3] == "" then else return error("ERROR CODE ( Unknown Value ) on SpawnItems args [3] '".. tbl[3] .."'\n")  end
			
			
			--for k, v in pairs(tbl1)
			--if tbl1 and tbl1[1] then
		end
		
		if Add and AddOn and string.find( v, '"' ) then
			local tbl = string.Explode( '"', v )
			--print(tbl[1])
			--print(tbl[2],tbl[4])
			--PrintTable(tbl)
			--if tbl[1] == "" then else return error("ERROR CODE ( Unknown Value ) on SpawnItems args [1] '".. tbl[1] .."'\n")  end
			if tbl[2] == "" then return error("ERROR CODE ( Missing Value ) on Add args [2]\n",5)  end
			if tbl[4] == "" then return error("ERROR CODE ( Missing Value ) on Add args [4]\n",5)  end
			--if tbl[3] == "" then else return error("ERROR CODE ( Unknown Value ) on SpawnItems args [3] '".. tbl[3] .."'\n")  end
			
			
			--for k, v in pairs(tbl1)
			--if tbl1 and tbl1[1] then
		end
		
		
		--print(starting,ending)
		print(v)
		if k == #db and mapname != true then return error("ERROR CODE ( 100 ) forget to add 'mapname'\n",5) end
		if k == #db and mapnameOff != true and mapname != true then return Error("ERROR CODE ( 100 + 1 ) forget to add '}' close\n",5) end
		if k == #db and starting != ending then return error("ERROR CODE ( 101 ) forget to close table '}'\n",4) end
		if mapnameOn != true and SpawnItems == true then return error("ERROR CODE ( 102 ) forget to add '{' after 'mapname'\n",5) end
		if k == #db and SpawnItemsOff != true and SpawnItems == true then return error("ERROR CODE ( 103 ) forget to add close SpawnItems '}'\n",4) end
		
	end
	
	
	--[[ for k, v in pairs(db) do
		local tbl1 = string.Explode( " ", v )
		if tbl1 and tbl1[1] then
		local tbl2 = string.Explode( "LevelCurve[", tbl1[1] )
		end
		if tbl1 and tbl1[3] 
		--and tbl2 and tbl2[1] 
		then
			--print(tbl2[1] .." "..tbl1[3])
			print(" "..tbl1[3])
		end
	end ]]
	
	for k, v in pairs(file.Read( "*", "DATA")) do
		print("Readed")
	end
	
end

concommand.Add("hl2c_readtest", function(pl,com,args) Hl2c_ReadData() end)
