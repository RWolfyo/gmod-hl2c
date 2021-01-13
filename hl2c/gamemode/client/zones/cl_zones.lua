net.Receive("Hl2c.ZoneSendZones", function()
	ZONE.zones = {}
	ZONE.zones = net.ReadTable()
	-- PrintTable(ZONE.zones)
end)

function InverseLerp( pos, p1, p2 )

	local range = 0
	range = p2-p1

	if range == 0 then return 1 end

	return ((pos - p1)/range)

end

function VectorMinMax( vec1, vec2 )
	local min = Vector(0,0,0)
	local max = Vector(0,0,0)

	if vec1.x > vec2.x then
		max.x = vec1.x
		min.x = vec2.x
	else
		max.x = vec2.x
		min.x = vec1.x
	end

	if vec1.y > vec2.y then
		max.y = vec1.y
		min.y = vec2.y
	else
		max.y = vec2.y
		min.y = vec1.y
	end

	if vec1.z > vec2.z then
		max.z = vec1.z
		min.z = vec2.z
	else
		max.z = vec2.z
		min.z = vec1.z
	end

	return min, max

end

local line_mat = Material("color.vmt")

function ZONE:DrawCuboid( pos1, pos2, col, alt )
	local pos1, pos2 = VectorMinMax( pos1, pos2 )

	col = Color(col.r, col.g, col.b, col.a )

	local points = {}
	points[1] = pos1
	points[7] = pos2

	points[2] = points[1] + ( Vector( pos2.x - pos1.x,0, 0) ) -- top level
	points[3] = points[2] + ( Vector( 0 ,pos2.y - pos1.y, 0) )
	points[4] = points[1] + ( Vector( 0 ,pos2.y - pos1.y, 0) )

	points[5] = points[1] + Vector( 0, 0, pos2.z - pos1.z)
	points[6] = points[5] + ( Vector( pos2.x - pos1.x,0, 0) )
	points[7] = points[6] + ( Vector( 0 ,pos2.y - pos1.y, 0) )
	points[8] = points[5] + ( Vector( 0 ,pos2.y - pos1.y, 0) )

	render.SetMaterial( line_mat )

	local width = 2

	render.DrawBeam( points[1], points[2], width, 1, 1, col )
	render.DrawBeam( points[2], points[3], width, 1, 1, col )
	render.DrawBeam( points[3], points[4], width, 1, 1, col )
	render.DrawBeam( points[4], points[1], width, 1, 1, col ) -- top level

	render.DrawBeam( points[5], points[6], width, 1, 1, col ) --bottom level
	render.DrawBeam( points[6], points[7], width, 1, 1, col )
	render.DrawBeam( points[7], points[8], width, 1, 1, col )
	render.DrawBeam( points[8], points[5], width, 1, 1, col )

	--Vertical connectors
	render.DrawBeam( points[1], points[5], width, 1, 1, col )
	render.DrawBeam( points[2], points[6], width, 1, 1, col )
	render.DrawBeam( points[3], points[7], width, 1, 1, col )
	render.DrawBeam( points[4], points[8], width, 1, 1, col )

	if alt then


		width = width/2 * (1+math.floor(CurTime()*4)%2)
		render.DrawBeam( points[1], points[3], width, 1, 1, col)
		render.DrawBeam( points[2], points[4], width, 1, 1, col)

		render.DrawBeam( points[1], points[6], width, 1, 1, col)
		render.DrawBeam( points[2], points[5], width, 1, 1, col)

		render.DrawBeam( points[4], points[7], width, 1, 1, col)
		render.DrawBeam( points[3], points[8], width, 1, 1, col)

		render.DrawBeam( points[3], points[6], width, 1, 1, col)
		render.DrawBeam( points[2], points[7], width, 1, 1, col)

		render.DrawBeam( points[1], points[8], width, 1, 1, col)
		render.DrawBeam( points[4], points[5], width, 1, 1, col)

		render.DrawBeam( points[5], points[7], width, 1, 1, col)
		render.DrawBeam( points[6], points[8], width, 1, 1, col)
	end

end

CreateClientConVar("hl2c_zones_visibility","0",true, false)

hook.Add("PostDrawTranslucentRenderables", "hl2c.ZoneCuboidDrawing", function()
	
	for key, z in pairs( ZONE.zones or {} ) do
		-- local z = ZONE.zones[key]
		-- print(z.pos1)
		if (z.typo) then
			local center = 0.5*(z.pos1 + z.pos2)
			local dist = center:Distance( LocalPlayer():GetPos() )
			if dist < 1000 then
				if GetConVar("hl2c_zones_visibility"):GetBool() == true then
					local tempcolor = table.Copy( z.color )

					local frac = math.Clamp( InverseLerp( dist, 1000, 400 ), 0,1)
					tempcolor.a = frac * z.color.a

					local alt = false
					local ply = LocalPlayer()



					ZONE:DrawCuboid( z.pos1, z.pos2, tempcolor, alt )

				end
			end
		end
	end
end)