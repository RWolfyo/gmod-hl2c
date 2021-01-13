local meta = FindMetaTable("Player")
if !meta then return end

EXP_MAX_LEVEL = 30
EXP_POWER_MAX_LEVEL = 2000

PowerLevelSystem = {}
LevelSystem = {}
Pet_LevelSystem = {}

local BaseCurve = 20
local Difficultyy = 2.5
local Pet_Base = 100
local Pet_Diff = 2.2
local PowerLevel_Diff = 1.85

function GenerateLevelCurve()
	for i=1, EXP_MAX_LEVEL do
		-- LevelSystem[i] = math.Round(BaseCurve*math.pow(i-1,Difficultyy))
		LevelSystem[i] = math.Round((i-1) * (Difficultyy*i*BaseCurve) )
		
	end
	for i=1, EXP_POWER_MAX_LEVEL do
		PowerLevelSystem[i] = math.Round(BaseCurve*math.pow(i-1,PowerLevel_Diff))
		
	end
	PowerLevelSystem[1] = 0
	for i=1, 25 do
		if (i == 1) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(i-1,Pet_Diff)))
		elseif (i == 2) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(1,Pet_Diff)))
		elseif (i == 3) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(1.5,Pet_Diff)))
		elseif (i == 4) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(2,Pet_Diff)))
		elseif (i == 5) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(2.5,Pet_Diff)))
		elseif (i == 6) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(3,Pet_Diff)))
		elseif (i == 7) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(3.5,Pet_Diff)))
		elseif (i == 8) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(4,Pet_Diff)))
		elseif (i == 9) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(4.5,Pet_Diff)))
		elseif (i == 10) then
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(5,Pet_Diff)))
		else
		Pet_LevelSystem[i] = math.Round(Pet_Base * (math.pow(i-1,Pet_Diff)))
		end
			
		--print( "PET_LEVEL", i, Pet_LevelSystem[ i ] )
		
		--print( "LEVEL", 0, LevelCurve[ 0 ] )
	end
	
	--LevelSystem[-2] = -6
	--LevelSystem[-1] = -4
	--LevelSystem[0] = 0.1
	LevelSystem[1] = 0
	
	file.Write( "LevelCurve.txt", "LevelCurve[".. 1 .."] = "..LevelSystem[1].." \n" )
	--file.Append( "LevelCurve.txt", "LevelCurve[".. -2 .."] = "..LevelSystem[-2].."\n" )
	--file.Append( "LevelCurve.txt", "LevelCurve[".. -1 .."] = "..LevelSystem[-1]..", \n" )
	--file.Append( "LevelCurve.txt", "LevelCurve[".. 0 .."] = "..LevelSystem[0]..", \n" )
	--file.Append( "LevelCurve.txt", LevelCurve[-2] )
	for i=1, EXP_MAX_LEVEL do
		if i == EXP_MAX_LEVEL then
			file.Append( "LevelCurve.txt", "LevelCurve[".. i .."] = "..LevelSystem[i].."\n" )
		elseif i == 1 then
		else
			file.Append( "LevelCurve.txt", "LevelCurve[".. i .."] = "..LevelSystem[i].." \n" )
		end
	end
	
	file.Write( "PowerLevelCurve.txt", "PowerLevelCurve[".. 1 .."] = "..PowerLevelSystem[1].." \n" )
	for i=1, EXP_POWER_MAX_LEVEL do
		if i == EXP_POWER_MAX_LEVEL then
			file.Append( "PowerLevelCurve.txt", "PowerLevelCurve[".. i .."] = "..PowerLevelSystem[i].."\n" )
		elseif i == 1 then
		else
			file.Append( "PowerLevelCurve.txt", "PowerLevelCurve[".. i .."] = "..PowerLevelSystem[i].." \n" )
		end
	end
	
	for i=1, 25 do
		if i == 1 then
			file.Write( "Pet_LevelCurve.txt", "Pet_LevelCurve[".. i .."] = "..Pet_LevelSystem[i].." \n" )
		else
			file.Append( "Pet_LevelCurve.txt", "Pet_LevelCurve[".. i .."] = "..Pet_LevelSystem[i].." \n" )
		end
	end
end

hook.Add( "Initialize", "GenerateLevelCurve", GenerateLevelCurve)
--hook.Add( "PlayerSpawn", "OnSpawn_GenerateLevelCurve", GenerateLevelCurve)

/*----------------------
Pet Level Up System
----------------------*/

function meta:Pet_GetXP()
	if isnumber(self:GetNWInt("pet_xp")) then
		return self:GetNWInt("pet_xp")
	else
		return 0
	end
end

function meta:Pet_GetLevel()
	if isnumber(self:GetNWInt("pet_level")) then
		return self:GetNWInt("pet_level")
	else
		return 1
	end
end


function meta:Pet_NextLevelReq()
	if isnumber(self:Pet_GetLevel()) and self:Pet_GetLevel() > 0 and self:Pet_GetLevel() < 26 then
		--self.pet_reqlevelxp
		
		self.pet_reqlevelxp = Pet_LevelCurve[self:Pet_GetLevel() + 1] - self:Pet_GetXP()
		--print(self.pet_reqlevelxp)
		if isnumber(self.pet_reqlevelxp) then
		
			--print(self.pet_reqlevelxp)
			return self.pet_reqlevelxp
		end
		--return LevelCurve[self:GetCLevel()]
	elseif self:Pet_GetLevel() == 26
	then
		return 999999999
	end
end
function meta:Pet_MaxXP()
	if isnumber(self:Pet_GetLevel()) and self:Pet_GetLevel() > 0 and self:Pet_GetLevel() < 26 then
		--self.pet_reqlevelxp
		
		local max_xp = Pet_LevelCurve[self:Pet_GetLevel() + 1]
		--print(self.pet_reqlevelxp)
		if isnumber(max_xp) then
		
			--print(self.pet_reqlevelxp)
			return max_xp
		end
		--return LevelCurve[self:GetCLevel()]
	else
		return self:Pet_GetXP()
	end
end

function meta:Pet_NextLevel()
	if isnumber(self:Pet_GetLevel()) and self:Pet_GetLevel() > 0 and self:Pet_GetLevel() < 26 then
		if self:Pet_GetLevel() == 25 then
			return 26
		else
			return self:Pet_GetLevel() + 1
		end
	else
		return 1
	end
end

if SERVER then


end

/*============================
Player Level Up System
==============================*/


/*-------------------------
Player Get XP
---------------------------*/
function meta:GetXP()
	return self:GetNWInt( "XP" )
end

function meta:GetPXP()
	return self:GetNWInt( "Power-XP" )
end

function meta:MaxPXP()
	return PowerLevelCurve[meta:NextPLevel()]
end

function meta:MaxXP()
	return LevelCurve[meta:NextLevel()]
end

/*-------------------------
Player Get Level
---------------------------*/
function meta:GetPLevel()
	return self:GetNWInt("Power-Level")
end
function meta:GetCLevel()
	--GenerateLevelCurve()
	
	--if isnumber(self:GetXP()) != nil then
	--if self:GetXP() then
	--	for i=1, 150 do
	--		if self:GetXP() <= LevelCurve[i] and self:GetXP() > LevelCurve[i - 1] then
	--			return (i - 1)
	--		end
	--	end
	--end
	--self.getlevel = false
	if isnumber(self:GetNWInt("Level")) and
	--self.getlevel != true and
	self:GetNWInt("Level") > 0 and
	self:GetNWInt("Level")  < 151

	then
		self.getlevel = true
		return self:GetNWInt("Level")

	elseif self.getlevel != true then
		--return self:GetCLevel()
		return 1
	end

	--return self:GetNWInt("Level")
end

/*-------------------------
Player Next Level XP Required
---------------------------*/
function meta:NextPLevelReq()
	-- Required xp to next level.
	
	if isnumber(PowerLevelCurve[self:GetPLevel()+1]) then
		--self.reqplvlxp
		
		self.reqplvlxp = PowerLevelCurve[self:GetPLevel() + 1] - self:GetPXP()
		--print(self.reqplvlxp)
		if isnumber(self.reqplvlxp) then
		
			--print(self.reqplvlxp)
			return self.reqplvlxp
		end
		--return PowerLevelCurve[self:GetPLevel()]
	elseif !isnumber(PowerLevelCurve[self:GetPLevel()+1]) or
	(isnumber(self:GetPLevel()) and self:GetPLevel() == EXP_POWER_MAX_LEVEL)
	then
		return 999999999


	end
end

function meta:NextLevelReq()
	-- Required xp to next level.
	
	if isnumber(LevelCurve[self:GetCLevel()+1]) then
		--self.reqlevelxp
		
		self.reqlevelxp = LevelCurve[self:GetCLevel() + 1] - self:GetXP()
		--print(self.reqlevelxp)
		if isnumber(self.reqlevelxp) then
		
			--print(self.reqlevelxp)
			return self.reqlevelxp
		end
		--return LevelCurve[self:GetCLevel()]
	elseif !isnumber(LevelCurve[self:GetCLevel()+1]) or
	(isnumber(self:GetCLevel()) and self:GetCLevel() == 150)
	then
		return 999999999


	end
end

/*-------------------------
Player Next Level
---------------------------*/
function meta:NextLevel()
	-- body
	if isnumber(self:GetCLevel()) and
	self:GetCLevel() < 150 and
	self:GetCLevel() > 0 
	then
		return (self:GetCLevel() + 1)
	elseif isnumber(self:GetCLevel()) and 
	self:GetCLevel() == 150 
	then
		self.maxlevel = true
		return 150
	end
end

function meta:NextPLevel()
	-- body
	if isnumber(self:GetPLevel()) and
	self:GetPLevel() < EXP_POWER_MAX_LEVEL and
	self:GetPLevel() > 0 
	then
		return (self:GetPLevel() + 1)
	elseif isnumber(self:GetPLevel()) and 
	self:GetPLevel() == EXP_POWER_MAX_LEVEL 
	then
		self.maxplevel = true
		return EXP_POWER_MAX_LEVEL
	end
end


/*-------------------------
Player is Level?
---------------------------*/
function meta:IsLevel(amount)
	amount = tonumber(amount)
	if isnumber(amount) and
	isnumber(self:GetCLevel()) and 
	self:GetCLevel() > 0 and
	self:GetCLevel() < 151 and
	self:GetCLevel() == amount then
		return true
	else
		return false
	end
end

/*-------------------------
Player enough Level?
---------------------------*/
function meta:EnoughLevel(amount)
	amount = tonumber(amount)
	if isnumber(amount) and
	isnumber(self:GetCLevel()) and 
	self:GetCLevel() > 0 and
	self:GetCLevel() < 151 and
	self:GetCLevel() >= amount then
		return true
	else
		return false
	end
end



//I don't think you would need this, but just incase
--function meta:IsLevelExact(amount)
--	if self:GetCLevel() == amount then
--		return true
--	else
--		return false
--	end
--	
--end
------

/*-------------------------
**OLD FUNCTION NEVER USE**
Player Get Level
---------------------------*/
--function meta:GetLevel()
--	return self:GetCLevel()
--end

/*-------------------------
Player Get Perma
---------------------------*/
function meta:GetPerma()
	
	if isnumber(self:GetNWInt("Perma_Number")) then
		return self:GetNWInt("Perma_Number")
	end
end

function meta:ShopWithPerma(value)
	if isnumber(value) then
		if (self:GetNWInt("Perma_Number") - value) >= 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

