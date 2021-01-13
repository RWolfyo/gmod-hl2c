/*
combine_mine
   * npc_alyx
   * npc_antlion
   * npc_antlion_template_maker
   * npc_antlionguard
   * npc_barnacle
   * npc_barney
   * npc_breen
   * npc_citizen
   * npc_combine_camera
   * npc_combine_s
   * npc_combinedropship
   * npc_combinegunship
   * npc_crabsynth
   * npc_cranedriver
   * npc_crow
   * npc_cscanner
   * npc_dog
   * npc_eli
   * npc_fastzombie
   * npc_fisherman
   * npc_gman
   * npc_headcrab
   * npc_headcrab_black
   * npc_headcrab_fast
   * npc_helicopter
   * npc_ichthyosaur
   * npc_kleiner
   * npc_manhack
   * npc_metropolice
   * npc_monk
   * npc_mortarsynth
   * npc_mossman
   * npc_pigeon
   * npc_poisonzombie
   * npc_rollermine
   * npc_seagull
   * npc_sniper
   * npc_stalker
   * npc_strider
   * npc_turret_ceiling
   * npc_turret_floor
   * npc_turret_ground
   * npc_vortigaunt
   * npc_zombie
   * npc_zombie_torso
*/

function GM:HUDDrawTargetID()
	if GetConVarNumber("hl2c_custom_targetid") >= 1||0 then

	/*local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return end
	--local name = Entity:GetClass()
	local pos = trace.Entity:EyePos()
	pos.z = pos.z + 10 -- The position we want is a bit above the position of the eyes
	pos = pos:ToScreen()
	pos.y = pos.y - 50 -- Move the text up a few pixels to compensate for the height of the text
	local enemyc = Color(255, 50, 55, 220)
	local friendc = Color(50, 255, 55, 220)
	local neutc = Color(255, 127, 0, 220)
	
	local text = ""
	local font = "arial32Bold"
	local hpfont = "Trebuchet24"
	
	if (trace.Entity:IsPlayer()) then
		--text = trace.Entity:Nick().." ("..trace.Entity:Health().."%)"
		draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, neutc, 1)
				draw.DrawText("Name: "..trace.Entity:Nick(), font, pos.x + 1, pos.y + -20, neutc, 1)	
	elseif (trace.Entity:IsNPC()) then
		if (trace.Entity:GetClass() == "npc_alyx") then
			--text = "Alyx Vance ("..trace.Entity:Health().."%)"
			draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
			draw.DrawText("Name: ".."Alyx", font, pos.x + 1, pos.y + -20, friendc, 1)
		elseif (trace.Entity:GetClass() == "npc_barney") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
				draw.DrawText("Name: ".."Barney", font, pos.x + 1, pos.y + -20, friendc, 1)
			--text = "Barney Calhoun ("..trace.Entity:Health().."%)"
		elseif (trace.Entity:GetClass() == "npc_citizen") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
				draw.DrawText("Name: ".."Citizen", font, pos.x + 1, pos.y + -20, friendc, 1)
			--text = "Citizen ("..trace.Entity:Health().."%)"
		elseif (trace.Entity:GetClass() == "npc_kleiner") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
				draw.DrawText("Name: ".."Kleiner", font, pos.x + 1, pos.y  -20, friendc, 1)
		elseif (trace.Entity:GetClass() == "npc_eli") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
				draw.DrawText("Name: ".."Eli", font, pos.x + 1, pos.y + -20, friendc, 1)
		elseif (trace.Entity:GetClass() == "npc_mossman") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
				draw.DrawText("Name: ".."Mossman", font, pos.x + 1, pos.y + -20, friendc, 1)
		elseif (trace.Entity:GetClass() == "npc_monk") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
				draw.DrawText("Name: ".."Monk", font, pos.x + 1, pos.y + -20, friendc, 1)
		elseif (trace.Entity:GetClass() == "npc_fisherman") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, friendc, 1)
				draw.DrawText("Name: ".."Fisherman", font, pos.x + 1, pos.y + -20, friendc, 1)

-------------------COMBINE TARGET ID ---------------------------				
		elseif (trace.Entity:GetClass() == "npc_combine_s") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Combine", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_strider") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Strider", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_helicopter") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Helicopter", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_combinegunship") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Gunship", font, pos.x + 1, pos.y + -20, enemyc, 1)		
		elseif (trace.Entity:GetClass() == "npc_combine_camera") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Camera", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_turret_ceiling") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Turret", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_turret_floor") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Turret", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_turret_ground") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Turret", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_metropolice") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Police", font, pos.x + 1, pos.y + -20, enemyc, 1)	
		elseif (trace.Entity:GetClass() == "npc_cscanner") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Scanner", font, pos.x + 1, pos.y + -20, enemyc, 1)	
		elseif (trace.Entity:GetClass() == "npc_manhack") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Manhack", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_rollermine") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Rollermine", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_hunter") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Hunter", font, pos.x + 1, pos.y + -20, enemyc, 1)
		---elseif (trace.Entity:GetClass() == "npc_apcdriver") then
		--		draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
		--		draw.DrawText("Name: ".."Apc", font, pos.x + 1, pos.y + -20, enemyc, 1)
-------------------------ZOMBIES HEADCRABS ANTLIONS VORTIGAUNTS -------------------------------------
		elseif (trace.Entity:GetClass() == "npc_zombie") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Zombie", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_zombie_torso") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Zombie", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_fastzombie") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Zombie", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_poisonzombie") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Zombie", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_zombine") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Zombie", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_zombine") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Zombie", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_headcrab") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Headcrab", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_headcrab_black") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Headcrab", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_headcrab_fast") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Headcrab", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_antlion") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Antlion", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_antlionguard") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Antlion Guard", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_antlion_grub") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Antlion", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_barnacle") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Barnacle", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_fastzombie_torso") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y + 6, enemyc, 1)
				draw.DrawText("Name: ".."Zombie", font, pos.x + 1, pos.y + -20, enemyc, 1)
		elseif (trace.Entity:GetClass() == "npc_vortigaunt") then
				draw.DrawText("HP: "..trace.Entity:Health() , hpfont, pos.x + 1, pos.y - 25, neutc, 1)
				draw.DrawText("Name: ".."Vortigaunt", font, pos.x + 1, pos.y + -50, neutc, 1)
		else
			return
		end
	else
		return
	end
	
	surface.SetFont( font )
	local w, h = surface.GetTextSize( text )
	
	local MouseX, MouseY = gui.MousePos()
	
	if ( MouseX == 0 && MouseY == 0 ) then
	
		MouseX = ScrW() / 2
		MouseY = ScrH() / 2
	
	end
	
	local x = MouseX
	local y = MouseY
	
	x = x - w / 2
	y = y + 30

	if trace.Entity:IsPlayer() && table.HasValue(BETA_TESTERS, trace.Entity:SteamID()) then
		draw.SimpleText( text, font, x, y, Color( 200, 0, 255 ) )
	else
		draw.SimpleText( text, font, x, y, self:GetTeamColor( trace.Entity ) )
	end*/
	
	else -- If hl2c_custom_targetid is 0, use the default targetid system.
	
	local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return end
	
	local text = "ERROR"
	local font = "TargetID"
	
	if (trace.Entity:IsPlayer()) then
		text = trace.Entity:Nick()
	else
		return
	end
	
	surface.SetFont( font )
	local w, h = surface.GetTextSize( text )
	
	local MouseX, MouseY = gui.MousePos()
	
	if ( MouseX == 0 && MouseY == 0 ) then
	
		MouseX = ScrW() / 2
		MouseY = ScrH() / 2
	
	end
	
	local x = MouseX
	local y = MouseY
	
	x = x - w / 2
	y = y + 30
	
	draw.SimpleText( text, font, x+1, y+1, Color(0,0,0,120) )
	draw.SimpleText( text, font, x+2, y+2, Color(0,0,0,50) )
	draw.SimpleText( text, font, x, y, self:GetTeamColor( trace.Entity ) )
	
	y = y + h + 5
	
	local text = trace.Entity:Health() .. "%"
	local font = "TargetIDSmall"
	
	surface.SetFont( font )
	local w, h = surface.GetTextSize( text )
	local x =  MouseX  - w / 2
	
	draw.SimpleText( text, font, x+1, y+1, Color(0,0,0,120) )
	draw.SimpleText( text, font, x+2, y+2, Color(0,0,0,50) )
	draw.SimpleText( text, font, x, y, self:GetTeamColor( trace.Entity ) )
	
	end
end

/*
function DrawEnemyHP(ply)
	
	local ply = LocalPlayer()
	local range = 510
	local enemyc = Color(255, 50, 55, 100)
	local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	if (!trace.Hit) then return end
	if (!trace.HitNonWorld) then return end
	--local enemyhp = "HP: "..target:Health() 
	for k,target in pairs(ents.FindInSphere(ply:GetEyeTrace().HitPos, range)) do

		local name = target:GetClass()
		local pos = target:EyePos()
		pos.z = pos.z + 20 -- The position we want is a bit above the position of the eyes
		pos = pos:ToScreen()
		pos.y = pos.y - 50 -- Move the text up a few pixels to compensate for the height of the text
			
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_antlion" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "HudHintTextLarge", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Antlion", "HudHintTextLarge", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_antlionguard" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Antlion Guard", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_zombie" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Zombie", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_poisonzombie" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Zombie", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_combine_s" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Combine Soldier", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_headcrab_fast" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Fast Headcrab", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_headcrab_black" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Poison Headcrab", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_headcrab" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Headcrab", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_vortigaunt" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Vortigaunt", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
		if target:GetPos():Distance(LocalPlayer():GetPos()) < range and name == "npc_manhack" and target:Health() > 0 then
			draw.DrawText("HP: "..target:Health() , "TargetIDSmall", pos.x + 1, pos.y + 6, enemyc, 1)
			draw.DrawText("Name: ".."Manhack", "TargetID", pos.x + 1, pos.y + -20, enemyc, 1)
		end
	end
end
hook.Add("HUDPaint", "DrawEHPLookAt", DrawEnemyHP)*/

theSavedEntity = NULL
surface.CreateFont( "coolvetica2", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 80,
	weight = 700,
	blursize = 1.8,
	scanlines = 0.5,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = true,
	outline = false,
} )
--print(theSavedEntity)
--if LocalPlayer():Alive() && LocalPlayer():IsValid() then
--local tr = util.GetPlayerTrace( LocalPlayer() )
--local trace = util.TraceLine( tr )
--local theSavedEntity = trace.Entity

hook.Add("PostDrawTranslucentRenderables", "MyNewID", function()
	if !IsValid( LocalPlayer() ) then return end
	local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	--if (!trace.Hit) then return false end
	--if (!trace.HitNonWorld) then return false end
	local ply = LocalPlayer()
	local frame = FrameTime()
	local frame05 = 1
	
	local pet_color = Color(100,200,255,255)
	local plyPos = ply:GetPos()
	local plyAngles = ply:GetAngles()
	local text_color = Color( 255, 200, 60, 255 )
	color_ply1 = Color( 255, 230, 80, 255 )
	if IsColor( color1 ) then
	else
	color1 = Color( 255, 230, 80, 255 )
	end
	local color2 = Color( 255, 150, 60, 255 )
	local color3 = Color( 255, 100, 0, 255 )
	local color4 = Color( 255, 0, 0, 255 )
	local offset = Angle( 0,270,90 )
	if IsValid(c_Model) then
	else
		c_Model = ents.CreateClientProp()
		--c_Model:SetPos( ply:GetPos() )
		--c_Model:SetModel( "models/props_borealis/bluebarrel001.mdl" )
		c_Model:SetModel( "models/gibs/agibs.mdl" )
		-- c_Model:SetModel( "models/flashlight/lamps/env_projectedtexture.mdl" )
		--c_Model:SetParent( ply, 8 )
		c_Model:Spawn()
		c_Model:SetRenderFX( 6 )
		c_Model:DrawShadow( false )
		c_Model:DestroyShadow( )
		--c_Model:SetColor( Color( 0, 0, 0, 0 ) )
		--c_Model:SetRenderMode( RENDERMODE_TRANSALPHA )
	end
	
	
	if ( IsValid( trace.Entity ) ) && 
	( ( trace.Entity:IsPlayer() && ( trace.Entity:Team() == 1 || trace.Entity:Team() == 5 ) ) 
	|| ( trace.Entity:IsNPC() && 
	NPC_ID_TARGET[trace.Entity:GetClass()] ) ) and 
	LocalPlayer():GetPos():Distance( trace.Entity:GetPos() ) < 1000
	then
	--if LastSavedEntity != theSavedEntity then
	theSavedEntity = trace.Entity
	--end
		if !isnumber( increment ) then
		increment = 0
		
		end
		--print(math.Approach( increment, 1, 0.1 ))
		--c_Model:SetPos( LerpVector( frame *1, ply:GetPos(), theSavedEntity:GetPos() ) )
		--c_Model:SetPos( theSavedEntity:GetPos() )
		if IsValid(theSavedEntity) and 
		theSavedEntity:Hl2c_GetFollowTarget() == LocalPlayer() 
		then
			color1 = Color( 0, 255, 0, 255 )
		elseif IsValid(theSavedEntity) and 
		theSavedEntity:Hl2c_GetFollowTarget() != LocalPlayer() 
		then
			color1 = Color( 255, 230, 80, 255 )
		end
		
	end
	if IsValid(theSavedEntity) then
		c_Model:SetParent( theSavedEntity )
		
		get_model_pos = c_Model:GetPos()
		
		if IsValid(theSavedEntity) and c_Model:GetPos():Distance( theSavedEntity:GetPos() ) < 5 then
			increment = 0
			c_Model:SetPos( LerpVector( 0.05, c_Model:GetPos(), theSavedEntity:GetPos() ) )
		elseif IsValid(theSavedEntity) and c_Model:GetPos():Distance( theSavedEntity:GetPos() ) < 300 and c_Model:GetPos():Distance( theSavedEntity:GetPos() ) > 4 then
		c_Model:SetPos( LerpVector( 0.02, c_Model:GetPos(), theSavedEntity:GetPos() ) )
		elseif IsValid(theSavedEntity) then
		
			
			c_Model:SetPos( LerpVector( 0.01, c_Model:GetPos(), theSavedEntity:GetPos() ) )
		end
	end
	--if ( IsValid( trace.Entity )) then --theSavedEntity = trace.Entity end
	if ( (IsValid(theSavedEntity)) && (theSavedEntity:IsPlayer()) && ( theSavedEntity:Team() == 1 || theSavedEntity:Team() == 5 ) ) then --|| theSavedEntity:IsPlayer() ) then

		cam.Start3D2D(c_Model:GetPos()+Vector(0,0,90),  Angle(0,plyAngles.y,0) + offset, 0.1)

			-- theSavedEntity:GetNWInt("SQUAD_ID")
			
			if theSavedEntity:Health() > 80 then
				if theSavedEntity:GetNWInt("SQUAD_ID") >= 1 then
				draw.SimpleText("SQUAD( "..tostring( theSavedEntity:GetNWInt("SQUAD_ID") )..")", "coolvetica2", 0, -20, color_ply1, TEXT_ALIGN_CENTER, 1) 
				end
				draw.SimpleText(theSavedEntity:Nick(), "coolvetica2", 0, 50, color_ply1, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, 130, color_ply1, TEXT_ALIGN_CENTER, 1)
			
			elseif theSavedEntity:Health() > 50 && theSavedEntity:Health() < 81 then
				if theSavedEntity:GetNWInt("SQUAD_ID") >= 1 then
				draw.SimpleText("SQUAD( "..tostring( theSavedEntity:GetNWInt("SQUAD_ID") )..")", "coolvetica2", 0, -20, color2, TEXT_ALIGN_CENTER, 1) 
				end
				draw.SimpleText(theSavedEntity:Nick(), "coolvetica2", 0, 50, color2, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, 130, color2, TEXT_ALIGN_CENTER, 1)
			elseif theSavedEntity:Health() > 25 && theSavedEntity:Health() < 51 then
				if theSavedEntity:GetNWInt("SQUAD_ID") >= 1 then
				draw.SimpleText("SQUAD( "..tostring( theSavedEntity:GetNWInt("SQUAD_ID") )..")", "coolvetica2", 0, -20, color3, TEXT_ALIGN_CENTER, 1) 
				end
				draw.SimpleText(theSavedEntity:Nick(), "coolvetica2", 0, 50, color3, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, 130, color3, TEXT_ALIGN_CENTER, 1)
				
			elseif theSavedEntity:Health() > 0 && theSavedEntity:Health() < 26 then
				if theSavedEntity:GetNWInt("SQUAD_ID") >= 1 then
				draw.SimpleText("SQUAD( "..tostring( theSavedEntity:GetNWInt("SQUAD_ID") )..")", "coolvetica2", 0, -20, color4, TEXT_ALIGN_CENTER, 1) 
				end
				draw.SimpleText(theSavedEntity:Nick(), "coolvetica2", 0, 50, color4, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, 130, color4, TEXT_ALIGN_CENTER, 1)
			end
			
			
		cam.End3D2D()

	elseif IsValid(theSavedEntity) && theSavedEntity:IsNPC() then
		
			cam.Start3D2D(c_Model:GetPos()+Vector(0,0,90),  Angle(0,plyAngles.y,0) + offset, 0.1)
			
			if theSavedEntity:GetClass() == "npc_dog" then
				draw.SimpleText(theSavedEntity:GetClass(), "coolvetica2", 0, -250, color1, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, -170, color1, TEXT_ALIGN_CENTER, 1) 
			elseif theSavedEntity:GetClass() == "npc_antlionguard" then
				draw.SimpleText(theSavedEntity:GetClass(), "coolvetica2", 0, -250, color1, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, -170, color1, TEXT_ALIGN_CENTER, 1) 
			elseif theSavedEntity:IsPet() and theSavedEntity:GetClass() == "npc_hunter" then
				draw.SimpleText(theSavedEntity:GetNWString("pet_name"), "coolvetica2", 0, -100, pet_color, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, -20, pet_color, TEXT_ALIGN_CENTER, 1) 
			elseif !theSavedEntity:IsPet() and theSavedEntity:GetClass() == "npc_hunter" then
				draw.SimpleText(theSavedEntity:GetClass(), "coolvetica2", 0, -250, color1, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, -170, color1, TEXT_ALIGN_CENTER, 1) 
			elseif isstring(theSavedEntity:GetClass()) and 
			(theSavedEntity:GetClass() == "npc_strider" or
			theSavedEntity:GetClass() == "npc_helicopter" or
			theSavedEntity:GetClass() == "npc_combinegunship" or
			theSavedEntity:GetClass() == "npc_furniture" or
			theSavedEntity:GetClass() == "npc_actor" or
			theSavedEntity:GetClass() == "npc_combinedropship") and
			!theSavedEntity:IsPet()
			then
			
			elseif theSavedEntity:IsPet() then
				draw.SimpleText(theSavedEntity:GetNWString("pet_name"), "coolvetica2", 0, 50, Color(100,200,255,255), TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, 130, Color(100,200,255,255), TEXT_ALIGN_CENTER, 1) 
			elseif isstring(theSavedEntity:GetClass()) then
				if IsValid( theSavedEntity ) and
				IsValid( theSavedEntity:Hl2c_GetFollowTarget() ) and
				theSavedEntity:Hl2c_GetFollowTarget():IsPlayer() and
				isstring( theSavedEntity:Hl2c_GetFollowTarget():Nick() )
				then
					draw.SimpleText("FOLLOW: "..theSavedEntity:Hl2c_GetFollowTarget():Nick(), "coolvetica2", 0, -20, color1, TEXT_ALIGN_CENTER, 1) 
				end
				draw.SimpleText(theSavedEntity:GetClass(), "coolvetica2", 0, 50, color1, TEXT_ALIGN_CENTER, 1) 
				draw.SimpleText(theSavedEntity:Health().." Health", "coolvetica2", 0, 130, color1, TEXT_ALIGN_CENTER, 1)
			end
				
			cam.End3D2D() 
		end

	if IsValid(ply) then
	else
		print("REMOVED TARGET HUD")
	end
	if IsValid(theSavedEntity) then
	else
		if IsValid(c_Model) and 
		!c_Model:GetParent() and 
		trace.Entity == NULL
		then
			print("REMOVED TARGET HUD")
		end
	end
end)


