local oldPrint = print

local function print(...)

end

function lootProgress(self)
	local PROGRESS = 0
	local prog = {}
	prog["PROG_HELICOPTER"] = {[1]=false,[2]=2000}
	prog["PROG_GUNSHIP"] = {[1]=false,[2]=1000}
	prog["PROG_STRIDER"] = {[1]=false,[2]=700}
	prog["PROG_HUNTER"] = {[1]=false,[2]=600}
	prog["PROG_HEAL"] = {[1]=false,[2]=400}
	prog["PROG_GUARD"] = {[1]=false,[2]=600}
	prog["PROG_NODEATH"] = {[1]=false,[2]=1000}
	prog["PROG_FREEMAN"] = {[1]=false,[2]=600}
	
	prog["PROG_PETKILL_5"] = {[1]=false,[2]=800}
	prog["PROG_PETKILL_3"] = {[1]=false,[2]=500}
	
	prog["PROG_BOOM_COUNT_6"] = {[1]=false,[2]=700}
	prog["PROG_BOOM_COUNT_3"] = {[1]=false,[2]=400}
	
	prog["PROG_PROPKILL_COUNT_3"] = {[1]=false,[2]=800}
	prog["PROG_PROPKILL_COUNT_1"] = {[1]=false,[2]=400}
	
	prog["PROG_NPCKILL_30"] = {[1]=false,[2]=2500}
	prog["PROG_NPCKILL_20"] = {[1]=false,[2]=2000}
	prog["PROG_NPCKILL_15"] = {[1]=false,[2]=1700}
	prog["PROG_NPCKILL_10"] = {[1]=false,[2]=1200}
	prog["PROG_NPCKILL_5"] = {[1]=false,[2]=700}
	prog["PROG_NPCKILL_1"] = {[1]=false,[2]=400}
	
	prog["PROG_TOPKILL"] = {[1]=false,[2]=700}
	
	
	if self:GetNWBool("PROG_HELICOPTER") == true then
		PROGRESS = PROGRESS + prog["PROG_HELICOPTER"][2]
		prog["PROG_HELICOPTER"][1] = true
		print(2000,"PROG_HELICOPTER",self)
	end
	if self:GetNWBool("PROG_GUNSHIP") == true then
		PROGRESS = PROGRESS + prog["PROG_GUNSHIP"][2]
		prog["PROG_GUNSHIP"][1] = true
		print(1000,"PROG_GUNSHIP",self)
	end
	if self:GetNWBool("PROG_STRIDER") == true then
		PROGRESS = PROGRESS + prog["PROG_STRIDER"][2]
		prog["PROG_STRIDER"][1] = true
		print(700,"PROG_STRIDER",self)
	end
	
	if self:GetNWBool("PROG_HUNTER") == true then
		PROGRESS = PROGRESS + prog["PROG_HUNTER"][2]
		prog["PROG_HUNTER"][1] = true
		print(600,"PROG_HUNTER",self)
	end
	if self:GetNWBool("PROG_HEAL") == true then
		PROGRESS = PROGRESS + prog["PROG_HEAL"][2]
		prog["PROG_HEAL"][1] = true
		print(400,"PROG_HEAL",self)
	end
	if self:Deaths() < 1 then
		PROGRESS = PROGRESS + prog["PROG_NODEATH"][2]
		prog["PROG_NODEATH"][1] = true
		print(1000,"Deaths",self)
	end
	
	if self:GetNWBool("PROG_GUARD") == true then
		PROGRESS = PROGRESS + prog["PROG_GUARD"][2]
		prog["PROG_GUARD"][1] = true
		print(600,"PROG_GUARD",self)
	end
	
	if self:GetNWInt("PROG_FREEMAN_COUNT") >= 1 and self:GetNWInt("PROG_NONFREEMAN_COUNT") == 0 then
		self:SetNWBool("PROG_FREEMAN",true)
		prog["PROG_FREEMAN"][1] = true
		PROGRESS = PROGRESS + prog["PROG_FREEMAN"][2]
		print(600,"PROG_FREEMAN",self)
	end
	
	if self:GetNWInt("PROG_PETKILL") >= 5 then
		PROGRESS = PROGRESS + prog["PROG_PETKILL_5"][2]
		prog["PROG_PETKILL_5"][1] = true
		print(700,"PROG_PETKILL 5",self)
	elseif self:GetNWInt("PROG_PETKILL") >= 3 then
		PROGRESS = PROGRESS + prog["PROG_PETKILL_3"][2]
		prog["PROG_PETKILL_3"][1] = true
		print(400,"PROG_PETKILL 3",self)
	end
	
	if self:GetNWInt("PROG_BOOM_COUNT") >= 5 then
		PROGRESS = PROGRESS + prog["PROG_BOOM_COUNT_6"][2]
		print(700,"PROG_BOOM_COUNT 6",self)
		prog["PROG_BOOM_COUNT_6"][1] = true
	elseif self:GetNWInt("PROG_BOOM_COUNT") >= 3 then
		PROGRESS = PROGRESS + prog["PROG_BOOM_COUNT_3"][2]
		prog["PROG_BOOM_COUNT_3"][1] = true
		print(400,"PROG_BOOM_COUNT 3",self)
	end
	
	print("NPC KILLS ",self:GetNWInt("PROG_NPCKILL") )
	if self:GetNWInt("PROG_NPCKILL") >= 30 then
		PROGRESS = PROGRESS + prog["PROG_NPCKILL_30"][2]
		prog["PROG_NPCKILL_30"][1] = true
		print(2500,"PROG_NPCKILL 30",self)
		
	elseif self:GetNWInt("PROG_NPCKILL") >= 20 then
		PROGRESS = PROGRESS + prog["PROG_NPCKILL_20"][2]
		prog["PROG_NPCKILL_20"][1] = true
		print(2000,"PROG_NPCKILL 20",self)
		
	elseif self:GetNWInt("PROG_NPCKILL") >= 15 then
		PROGRESS = PROGRESS + prog["PROG_NPCKILL_15"][2]
		print(1700,"PROG_NPCKILL 15",self)
		prog["PROG_NPCKILL_15"][1] = true
		
	elseif self:GetNWInt("PROG_NPCKILL") >= 10 then
		PROGRESS = PROGRESS + prog["PROG_NPCKILL_10"][2]
		print(1200,"PROG_NPCKILL 10",self)
		prog["PROG_NPCKILL_10"][1] = true
		
	elseif self:GetNWInt("PROG_NPCKILL") >= 5 then
		PROGRESS = PROGRESS + prog["PROG_NPCKILL_5"][2]
		print(700,"PROG_NPCKILL 5",self)
		prog["PROG_NPCKILL_5"][1] = true
		
	elseif self:GetNWInt("PROG_NPCKILL") >= 1 then
		PROGRESS = PROGRESS + prog["PROG_NPCKILL_1"][2]
		print(400,"PROG_NPCKILL 1",self)
		prog["PROG_NPCKILL_1"][1] = true
		
	end
	
	if self:GetNWInt("PROG_PROPKILL_COUNT") >= 3 then
		PROGRESS = PROGRESS + prog["PROG_PROPKILL_COUNT_3"][2]
		print(800,"PROG_PROPKILL_COUNT_3",self)
		prog["PROG_PROPKILL_COUNT_3"][1] = true
	elseif self:GetNWInt("PROG_PROPKILL_COUNT") >= 1 then
		PROGRESS = PROGRESS + prog["PROG_PROPKILL_COUNT_1"][2]
		print(400,"PROG_PROPKILL_COUNT_1",self)
		prog["PROG_PROPKILL_COUNT_1"][1] = true
	end
	
	local max = NULL
	for _,pl in pairs(player.GetAll()) do
		if self != pl and pl.setup_achi then
			if self:GetNWInt("PROG_NPCKILL") < pl:GetNWInt("PROG_NPCKILL") then
				max = NULL
				break
			end
			if self:GetNWInt("PROG_NPCKILL") > pl:GetNWInt("PROG_NPCKILL") and pl:GetNWBool("PROG_TOPKILL") != true then
				max = self
			end
			
		end
	end
	if max == self then
		self:SetNWBool("PROG_TOPKILL",true)
		PROGRESS = PROGRESS + prog["PROG_TOPKILL"][2]
		print(700,"PROG_TOPKILL",self)
		prog["PROG_TOPKILL"][1] = true
	end
	
	
	print(PROGRESS,"END RESULT",self)
	return PROGRESS,prog
end