local meta = FindMetaTable("Player")
if !meta then return end

function meta:GetAch(name)
	if isstring(name) and
	self.setup_achi == true
	then
		return self:GetNWInt(name)
	end
end

function meta:GetAchi(name)
	if isstring(name) and
	self.setup_achi == true
	then
		return self:GetNWInt(name)
	end
end


function meta:IsSetUpAchi()
	if self.setup_achi == true then
		return true
	else
	 return false
	end
end

DbgPrint("[hl2c] Achievement Mod Loaded")