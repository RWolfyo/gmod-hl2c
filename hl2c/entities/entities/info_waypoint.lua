
ENT.Type = "point"

function ENT:Initialize()
end

local imgtbl = {
	["sprites/waypoint_move2.vmt"] = 4,
	["sprites/attention_waypoint"] = 3,
}
function ENT:KeyValue( key, value )
	key = string.lower(key)
	oc.waypoints[self:EntIndex()] = oc.waypoints[self:EntIndex()] or {}

	if key == "origin" then
		local vectbl = string.Explode( " ", value )
		oc.waypoints[self:EntIndex()][key] = Vector(vectbl[1],vectbl[2],vectbl[3])
	elseif key == "image" then
		if imgtbl[value] then
			oc.waypoints[self:EntIndex()][key] = imgtbl[value]
		else
			oc.waypoints[self:EntIndex()][key] = value or 2
		end
	elseif key == "parent" then
		--
		self[key] = tostring(value)
	else
		oc.waypoints[self:EntIndex()][key] = value
	end
end

function ENT:Think()
	if self["parent"] then
		local entity = ents.FindByName(self["parent"])
		self:SetParent(entity)
		self:SetPos(entity:GetPos())
	end
end

function ENT:OnRemove()
end

function ENT:AcceptInput( inputName, activator, called, data )
	if string.lower(inputName) == "enable" then
		oc.waypoints[self:EntIndex()].curobj = true
		netstream.Start(player.GetAll(), "oc.WaypointToggle", {self:EntIndex(), true})
	elseif string.lower(inputName) == "disable" then
		oc.waypoints[self:EntIndex()].curobj = false
		netstream.Start(player.GetAll(), "oc.WaypointToggle", {self:EntIndex(), false})
	end
end