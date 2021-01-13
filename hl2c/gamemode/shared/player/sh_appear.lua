if SERVER then AddCSLuaFile() end


--Set Hat or Suit or OTher SHIT
if CLIENT then



local modelexample = ClientsideModel( "models/thrusters/jetpack.mdl" )
modelexample:SetNoDraw( true )
--local model = ClientsideModel( "models/headcrabclassic.mdl", RENDERGROUP_OPAQUE )
--model:SetNoDraw( true )

--function 

local offsetvec = Vector( 3, -5.6, 0 )
local offsetang = Angle( 180, 90, -90 )
Hats = Hats or {}

function Hl2c_ModifyHat(len)
	--print()
	if IsValid(LocalPlayer().Hat) then
		if IsValid(LocalPlayer().Hat.Owner) then
		LocalPlayer().Hat.Owner = nil
		end
	LocalPlayer().Hat = nil
	end
	
	--SafeRemoveEntity( LocalPlayer().Hat )
	
	Hl2c_ClearHats()
	if IsValid(LocalPlayer().Hat) then
	SafeRemoveEntity( LocalPlayer().Hat )
	--LocalPlayer().Hat.Owner = nil
	SafeRemoveEntity( LocalPlayer().Hat )
	end
	if IsValid(LocalPlayer().Hat) then
	LocalPlayer().Hat = nil
	end
	Hl2c_ClearHats()
	if IsValid(LocalPlayer().Hat) then
	LocalPlayer().Hat = nil
	end
end
--net.Receive("Hl2c_ModifyHat",Hl2c_ModifyHat)
usermessage.Hook("Hl2c_ModifyHat",Hl2c_ModifyHat)

function Hl2c_ClearHats()
	--print(#Hats)
	for k, v in pairs(Hats) do
		if #Hats > 0 then
			
			--table.RemoveByValue( Hats, v )
			--SafeRemoveEntity( v )
		end
	end
	for k, v in pairs( Hats ) do
		if not IsValid( v ) then
			Hats[ k ] = nil
		elseif not IsValid( v.Owner ) then
			print("Removing Hat")
			SafeRemoveEntity( v )
			Hats[ k ] = nil
		end
	end
end

function Hl2c_AddHat(name,ply)
	SafeRemoveEntity( ply.Hat )
	--if IsValid(ply.Hat) then return ply.Hat end
	local hat 
	-- print("Creating Hat")
	hat = ClientsideModel( name )
	hat:SetNoDraw(true)
	ply.Hat = hat
	hat.Owner = ply
	
	table.insert(Hats, hat )
	-- print(#Hats)
	--return hat
end 

hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
	Hl2c_ClearHats()
	if !IsValid(ply) or ply:Team() != TEAM_ALIVE or !ply:Alive() then return end
	-- local ply = ply.myhead
	--ply.Hats = "hat_headcrabclassic"
	--ply.ItemsEquip = ply.ItemsEquip or {}
	/*
	if ply:GetCLevel() > 100 then
	local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

	if not boneid then
		return
	end

	local matrix = ply:GetBoneMatrix( boneid )

	if not matrix then
		return
	end

	local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

	modelexample:SetPos( newpos )
	modelexample:SetAngles( newang )
	modelexample:SetupBones()
	modelexample:DrawModel()
	end
	*/
	
	for m, n in pairs(Hl2c.Items) do
		if n["Type"] == 5 and isstring( ply:GetNWString("hl2c_hat") ) and n["Name"] == ply:GetNWString("hl2c_hat") and ply and ply.myhead then
			--if IsValid( ply.Hat ) then SafeRemoveEntity( ply.Hat ) end
			--ply:SetNWEntity( n["Name"], NULL )
			--ply:PrintMessage(HUD_PRINTTALK,tostring( n["Accs"]["Ang"] ) )
			--ply:SetNWEntity( n["Name"], NULL )
			--if #ply.ItemsEquip < 1
			if not IsValid( ply.Hat ) then
			Hl2c_AddHat(n["Model"],ply)
			end
			--local model
				
				
				
				
			
			--print(ply.Hat)
			--if table.HasValue(ply.ItemsEquip,ply:GetNWEntity( n["Name"] ) ) then 
				--mdl = nil 
			--else
				--table.insert(ply.ItemsEquip, ply:GetNWEntity( n["Name"] ) )
			--end
			--print( ply:GetNWEntity( n["Name"] ) )
			--/*
			local pos = Vector()
			local ang = Angle()
			
			if n["Accs"]["Attachment"] and ply and ply.myhead then
				local attach_id = ply.myhead:LookupAttachment(n["Accs"]["Attachment"])
				if not attach_id then return end

				local attach = ply.myhead:GetAttachment(attach_id)

				if not attach then return end

				pos = attach.Pos
				ang = attach.Ang
			elseif ply and ply.myhead then
				local bone_id = ply.myhead:LookupBone(n["Accs"]["Bone"])
				if not bone_id then return end

				pos, ang = ply.myhead:GetBonePosition(bone_id)
			end
			/*
			local attach_id = ply:LookupAttachment(n["Accs"]["Attachment"])
			
			if not attach_id then return end
				
			local attach = ply:GetAttachment(attach_id)
				
			if not attach then return end
					
			pos = attach.Pos
			ang = attach.Ang
			*/
			--print( n["Name"],n["Model"],n["Accs"]["Attachment"],n["Accs"]["Scale"],n["Accs"]["Pos"],n["Accs"]["Ang"] )
			
			--print( ply:GetNWEntity( n["Name"] ) )
			--if IsValid( ply.Hat ) then 
			ply.Hat:SetModel(n["Model"])
			if n.ModifyClientSideModel then
				ply.Hat, pos, ang = n.ModifyClientSideModel(ply.myhead, ply.Hat, pos, ang)
			else
				ply.Hat:SetModelScale(n["Accs"]["Scale"], 0)
					
				pos = pos + (ang:Forward() * n["Accs"]["Pos"])
				if n["Accs"]["Z"] and isnumber(n["Accs"]["Z"]) then
					pos = pos + Vector(0,0,n["Accs"]["Z"])
				end
				if ply.Hat:GetModel() == "models/nova/w_headgear.mdl" then
					ang:RotateAroundAxis(ang:Up(), n["Accs"]["Ang"])
					ang:RotateAroundAxis(ang:Right(), 180)
					ang:RotateAroundAxis(ang:Forward(), 270)
					pos = pos - Vector(0,0,3)
				elseif ply.Hat:GetModel() == "models/props_junk/sawblade001a.mdl" then
					ang:RotateAroundAxis(ang:Up(), n["Accs"]["Ang"])
					ang:RotateAroundAxis(ang:Right(), 180)
					ang:RotateAroundAxis(ang:Forward(), 270)
					pos = pos - Vector(0.75,0,-3)
				elseif ply.Hat:GetModel() == "models/props_combine/stalkerpod_lid.mdl" then
					-- ang:RotateAroundAxis(ang:Right(), 270)
					pos = pos - Vector(0,0,9)
					-- ang = Angle(0,-270,0)
					-- ang:RotateAroundAxis(ang:Up(), 90)
					ang:RotateAroundAxis(ang:Right(), 90)
					ang:RotateAroundAxis(ang:Up(), 0)
					ang:RotateAroundAxis(ang:Forward(), 180)
				elseif ply:GetNWString("hl2c_hat")=="hat_lamp" then
					pos = pos + (ang:Right() * -0.5) + (ang:Forward() * 5) + (ang:Up() * 4)
				elseif ply:GetNWString("hl2c_hat")=="hat_tvhead" then
					pos = pos + (ang:Right() * -0.5) + (ang:Forward() * -1) + (ang:Up() * 1)
				elseif ply:GetNWString("hl2c_hat")=="hat_conehat" then
					pos = pos + (ang:Forward() * -4) + (ang:Up() * 15.7)
					ang:RotateAroundAxis(ang:Right(), 20)
				elseif ply:GetNWString("hl2c_hat")=="hat_clockmask" then
					pos = pos + (ang:Forward() * 3) + (ang:Up() * 2) --+Vector(0,-6,0)
					ang:RotateAroundAxis(ang:Right(), -90)
				elseif ply:GetNWString("hl2c_hat")=="hat_chefhat" then
					pos = pos + (ang:Forward() * 1) + (ang:Up() * 5) --+Vector(0,-6,0)
					ang:RotateAroundAxis(ang:Right(), 1)
				elseif ply:GetNWString("hl2c_hat")=="hat_buckethat" then
					pos = pos + (ang:Forward() * 1) + (ang:Up() * 3) --+Vector(0,-6,0)
					ang:RotateAroundAxis(ang:Right(), 200)
				else
				
					ang:RotateAroundAxis(ang:Right(), n["Accs"]["Ang"])
				end
				-- pos = pos + n["Accs"]["PosX"]
				-- pos = pos + (ang:Up() * n["Accs"]["Pos"])
				
			
			end
			ply.Hat:SetPos(pos)
			
			ply.Hat:SetAngles(ang)

			ply.Hat:SetRenderOrigin(pos)
			ply.Hat:SetRenderAngles(ang)
			ply.Hat:SetupBones()
			ply.Hat:DrawModel()
			-- ply.Hat:SetRenderOrigin()
			-- ply.Hat:SetRenderAngles()
			if ply:GetNWString("hl2c_hat") == "hat_mask2" then
				-- ply.Hat:SetPos(pos - Vector(0,0,-200))
			end
			--ply.Hat:SetRenderOrigin()
			--ply.Hat:SetRenderAngles()
			--end
				--*/
		end			
	end
	
	/*Should Work*/
	
	
	
	
	--local boneindex = ply:LookupBone("ValveBiped.Bip01_Head1")
	--local bonematrix = ply:GetBoneMatrix(ply:LookupBone("ValveBiped.Bip01_Head1"))
	--ply:ManipulateBoneScale( boneindex, Vector(0,0,0) )
	--ply:SetBoneMatrix( boneindex , bonematrix )
	
	--if IsValid(ply.MaskMDL) then SafeRemoveEntity( ply.MaskMDL ) end
	--if IsValid(ply.MaskMDL) then
	--else
	--ply.MaskMDL = ClientsideModel( "models/player/Group01/male_06.mdl")
	--end
	--local MaskMDL = ply.MaskMDL	
	--MaskMDL:SetParent( ply )
	--MaskMDL:AddEffects(EF_BONEMERGE)
	/*
	local headboneindex = MaskMDL:LookupBone("ValveBiped.Bip01_Head1")
	local headbonematrix = MaskMDL:GetBoneMatrix(MaskMDL:LookupBone("ValveBiped.Bip01_Head1"))
	MaskMDL:ManipulateBoneScale( headboneindex, Vector(1,1,1) )
	MaskMDL:SetBoneMatrix( headboneindex , headbonematrix )
	*/
	/*
	if IsValid(ply.MaskMDL) then
	else
	ply.MaskMDL = ClientsideModel( "models/player/Group01/male_06.mdl")
	end
	local MaskMDL = ply.MaskMDL	
	local headmatrix = ply:GetBoneMatrix(ply:LookupBone("ValveBiped.Bip01_Head1"))
	for key, bone in pairs(bonelist) do
		local index = MaskMDL:LookupBone(bone)  
		--if !isnumber(MaskMDL:GetBoneMatrix(index)) then print(MaskMDL:GetBoneMatrix(index)) end
		local matrix = MaskMDL:GetBoneMatrix(index)
		--print(matrix)
		if isnumber(matrix) then
		matrix:Scale(vector_origin)
		matrix:SetTranslation(headmatrix:GetTranslation())
		MaskMDL:SetBoneMatrix(index, matrix) 
		end
	end
	
	local position, angles = ply:GetBonePosition(ply:LookupBone("ValveBiped.Bip01_Head1"))
		
	local x = angles:Up() * 0  
	local y = angles:Right() * 0
	local z = angles:Forward() * -65
	
	angles:RotateAroundAxis(angles:Forward(), -90)  
	angles:RotateAroundAxis(angles:Right(), -90)  
	angles:RotateAroundAxis(angles:Up(), 0)  
	
	MaskMDL:SetPos(position + x + y + z)
	MaskMDL:SetAngles(angles)
	*/
end )
end

if CLIENT then

local bones_for_head = {	
"ValveBiped.Bip01_Pelvis",
"ValveBiped.Bip01_Spine",
"ValveBiped.Bip01_Spine1",
"ValveBiped.Bip01_Spine2",
--"ValveBiped.Bip01_Spine4",
--"ValveBiped.Bip01_Neck1",
--"ValveBiped.Bip01_Head1",
"ValveBiped.forward",
"ValveBiped.Bip01_R_Clavicle",
"ValveBiped.Bip01_R_UpperArm",
"ValveBiped.Bip01_R_Forearm",
"ValveBiped.Bip01_R_Hand",
"ValveBiped.Anim_Attachment_RH",
"ValveBiped.Bip01_L_Clavicle",
"ValveBiped.Bip01_L_UpperArm",
"ValveBiped.Bip01_L_Forearm",
"ValveBiped.Bip01_L_Hand",
"ValveBiped.Anim_Attachment_LH",
"ValveBiped.Bip01_R_Thigh",
"ValveBiped.Bip01_R_Calf",
"ValveBiped.Bip01_R_Foot",
"ValveBiped.Bip01_L_Thigh",
"ValveBiped.Bip01_L_Calf",
"ValveBiped.Bip01_L_Foot",
"ValveBiped.Bip01_R_Wrist",
"ValveBiped.Bip01_L_Wrist",
"ValveBiped.Bip01_L_Ulna",
"ValveBiped.Bip01_R_Ulna",
}
local bones_for_cuthead = {	
--"ValveBiped.Bip01_Pelvis",
--"ValveBiped.Bip01_Spine",
--"ValveBiped.Bip01_Spine1",
--"ValveBiped.Bip01_Spine2",
--"ValveBiped.Bip01_Spine4",
"ValveBiped.Bip01_Neck1",
"ValveBiped.Bip01_Head1",
--"ValveBiped.forward",
--"ValveBiped.Bip01_R_Clavicle",
--"ValveBiped.Bip01_R_UpperArm",
--"ValveBiped.Bip01_R_Forearm",
--"ValveBiped.Bip01_R_Hand",
--"ValveBiped.Anim_Attachment_RH",
--"ValveBiped.Bip01_L_Clavicle",
--"ValveBiped.Bip01_L_UpperArm",
--"ValveBiped.Bip01_L_Forearm",
--"ValveBiped.Bip01_L_Hand",
--"ValveBiped.Anim_Attachment_LH",
--"ValveBiped.Bip01_R_Thigh",
--"ValveBiped.Bip01_R_Calf",
--"ValveBiped.Bip01_R_Foot",
--"ValveBiped.Bip01_L_Thigh",
--"ValveBiped.Bip01_L_Calf",
--"ValveBiped.Bip01_L_Foot",
--"ValveBiped.Bip01_R_Wrist",
--"ValveBiped.Bip01_L_Wrist",
--"ValveBiped.Bip01_L_Ulna",
--"ValveBiped.Bip01_R_Ulna",
}

local cut_head_bonelist = {
"Mouth",
"C_Eyebrow",
"R_Eyebrow",
"L_Eyebrow",
"L_Eye",
"R_Eye",
"R_Eyelid",
"L_Eyelid",
"ValveBiped.Bip01_Head1",
"ValveBiped.Bip01_Neck1"
--"ValveBiped.Bip01_Spine4",
}

local hev_suit_bones = {

"ValveBiped.Bip01_Pelvis",
"ValveBiped.Bip01_Spine",
"ValveBiped.Bip01_Spine1",
"ValveBiped.Bip01_Spine2",
"ValveBiped.Bip01_Spine4",
"ValveBiped.Bip01_Neck1",
-- "ValveBiped.Bip01_Head1",
"ValveBiped.forward",
-- "Mouth",
-- "C_Eyebrow",
-- "R_Eyebrow",
-- "L_Eyebrow",
-- "L_Eye",
-- "R_Eye",
-- "R_Eyelid",
-- "L_Eyelid",
"ValveBiped.Bip01_R_Clavicle",
"ValveBiped.Bip01_R_UpperArm",
"ValveBiped.Bip01_R_Forearm",
"ValveBiped.Bip01_R_Hand",
"ValveBiped.Anim_Attachment_RH",
"ValveBiped.Bip01_R_Finger4",
"ValveBiped.Bip01_R_Finger41",
"ValveBiped.Bip01_R_Finger42",
"ValveBiped.Bip01_R_Finger3",
"ValveBiped.Bip01_R_Finger31",
"ValveBiped.Bip01_R_Finger32",
"ValveBiped.Bip01_R_Finger2",
"ValveBiped.Bip01_R_Finger21",
"ValveBiped.Bip01_R_Finger22",
"ValveBiped.Bip01_R_Finger1",
"ValveBiped.Bip01_R_Finger11",
"ValveBiped.Bip01_R_Finger12",
"ValveBiped.Bip01_R_Finger0",
"ValveBiped.Bip01_R_Finger01",
"ValveBiped.Bip01_R_Finger02",
"ValveBiped.Bip01_L_Clavicle",
"ValveBiped.Bip01_L_UpperArm",
"ValveBiped.Bip01_L_Forearm",
"ValveBiped.Bip01_L_Hand",
"ValveBiped.Anim_Attachment_LH",
"ValveBiped.Bip01_L_Finger4",
"ValveBiped.Bip01_L_Finger41",
"ValveBiped.Bip01_L_Finger42",
"ValveBiped.Bip01_L_Finger3",
"ValveBiped.Bip01_L_Finger31",
"ValveBiped.Bip01_L_Finger32",
"ValveBiped.Bip01_L_Finger2",
"ValveBiped.Bip01_L_Finger21",
"ValveBiped.Bip01_L_Finger22",
"ValveBiped.Bip01_L_Finger1",
"ValveBiped.Bip01_L_Finger11",
"ValveBiped.Bip01_L_Finger12",
"ValveBiped.Bip01_L_Finger0",
"ValveBiped.Bip01_L_Finger01",
"ValveBiped.Bip01_L_Finger02",
"ValveBiped.Bip01_R_Thigh",
"ValveBiped.Bip01_R_Calf",
"ValveBiped.Bip01_R_Foot",
"ValveBiped.Bip01_R_Toe0",
"ValveBiped.Bip01_L_Thigh",
"ValveBiped.Bip01_L_Calf",
"ValveBiped.Bip01_L_Foot",
"ValveBiped.Bip01_L_Toe0",
-- "Glasses",
}

local headmodel = "models/player/group01/female_01.mdl"
util.PrecacheModel(headmodel)


if Hl2c then

	Hl2c.PlayersHead = Hl2c.PlayersHead or {}

end

local function GetModel(pl)
	return pl:GetNWString( "Head_Model" )
end

local function Remove_HeadFromTable(head)
	if #Hl2c.PlayersHead > 0 and Head_Exist(head) then
		table.RemoveByValue(Hl2c.PlayersHead,head)
	end
end

local function Head_Exist(head)
	if table.HasValue(Hl2c.PlayersHead,head) then
		-- print("Return True to Exist")
		return true
	end
		-- print("Return False to Exist")
		return false
	
end

local function BuildBones(pl,head)
	head:RemoveEffects( EF_BONEMERGE )
	for i = 0, head:GetBoneCount()-1 do
		if head:GetBoneName(i) == "ValveBiped.Bip01_Head1" then
		elseif head:GetBoneName(i) == "Glasses" then
		elseif head:GetBoneName(i) == "Mouth" then
		elseif head:GetBoneName(i) == "C_Eyebrow" then
		elseif head:GetBoneName(i) == "R_Eyebrow" then
		elseif head:GetBoneName(i) == "L_Eyebrow" then
		elseif head:GetBoneName(i) == "L_Eye" then
		elseif head:GetBoneName(i) == "R_Eye" then
		elseif head:GetBoneName(i) == "R_Eyelid" then
		elseif head:GetBoneName(i) == "L_Eyelid" then
			-- head:ManipulateBoneScale( head:LookupBone("ValveBiped.Bip01_Head1"), Vector( 10, 10, 10 ) )
		elseif head:GetBoneName(i) != "__INVALIDBONE__" then
			local boneName = head:GetBoneName(i)
			local boneIndex = head:LookupBone(boneName)
			-- if boneIndex != nil then
				head:ManipulateBoneScale( boneIndex, Vector( 0.1, 0.1, 0.1 ) )
			-- end
		end
	end
	for i = 0, pl:GetBoneCount()-1 do
		 if pl:GetBoneName(i) == "ValveBiped.Bip01_Head1" then
			pl:ManipulateBoneScale( pl:LookupBone("ValveBiped.Bip01_Head1"), Vector( 0.1, 0.1, 0.1 ) )
		 elseif pl:GetBoneName(i) != "__INVALIDBONE__" then
			local boneName = pl:GetBoneName(i)
			local boneIndex = pl:LookupBone(boneName)
			pl:ManipulateBoneScale( pl:LookupBone(boneName), Vector( 1, 1, 1 ) )
			if other_boneIndex != nil then


			end
			head:SetNoDraw(false)
			
		end
	end
	head:AddEffects(EF_BONEMERGE)
	head:SetupBones()
	pl:SetupBones()
	if pl == LocalPlayer() and LocalPlayer():InVehicle() then
		head:SetNoDraw(true)
		-- print("hi")
	elseif pl == LocalPlayer() then
	head:SetNoDraw(false)
	else
	head:SetNoDraw(false)
	end
	pl.headbonemerged = true
	-- print("Called BoneModify")
end


local function Fix_Freeman_Head(pl,head)
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_L_Finger4" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_R_Finger4" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
		
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_L_Finger41" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_L_Finger41" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_L_Finger42" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_L_Finger42" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_L_Finger3" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_L_Finger3" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_L_Finger31" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_L_Finger31" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_L_Finger32" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_L_Finger32" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
	
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_R_Finger4" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_R_Finger4" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_L_Finger2" ) ) )
		
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_R_Finger41" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_R_Finger41" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_R_Finger42" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_R_Finger42" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_R_Finger3" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_R_Finger3" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_R_Finger31" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_R_Finger31" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	
	head:ManipulateBonePosition( head:LookupBone( "ValveBiped.Bip01_R_Finger32" ), pl:GetManipulateBonePosition( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	head:ManipulateBoneAngles( head:LookupBone( "ValveBiped.Bip01_R_Finger32" ), pl:GetManipulateBoneAngles( pl:LookupBone( "ValveBiped.Bip01_R_Finger2" ) ) )
	-- head:SetPos(pl:GetPos())
	-- head:SetupBones()
end

local function HeadSwitch(pl,head)
	pl:ManipulateBoneScale( pl:LookupBone("ValveBiped.Bip01_Head1"), Vector( 0.1, 0.1, 0.1 ) )
	if pl:GetSuitModel() == "models/romsn/gordon_player.mdl" and pl:GetModel() == "models/romsn/gordon_player.mdl" then

		pl:ManipulateBoneScale( pl:LookupBone("Glasses"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("Mouth"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("C_Eyebrow"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("R_Eyebrow"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("L_Eyebrow"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("L_Eye"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("R_Eye"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("R_Eyelid"), Vector( 0.1, 0.1, 0.1  ) )
		pl:ManipulateBoneScale( pl:LookupBone("L_Eyelid"), Vector( 0.1, 0.1, 0.1  ) )
	end
	
	if pl:GetHeadModel() == "models/romsn/gordon_player.mdl" then
		head:ManipulateBoneScale( head:LookupBone("Glasses"), Vector( 10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("Mouth"), Vector( 10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("C_Eyebrow"), Vector( 10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("R_Eyebrow"), Vector( 10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("L_Eyebrow"), Vector( 10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("L_Eye"), Vector( 10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("R_Eye"), Vector(10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("R_Eyelid"), Vector( 10, 10, 10 ) )
		head:ManipulateBoneScale( head:LookupBone("L_Eyelid"), Vector( 10, 10, 10 ) )

	end
	if pl:GetSuitModel() != "models/romsn/gordon_player.mdl" and pl:GetHeadModel() == "models/romsn/gordon_player.mdl" then
		for k, v in pairs(hev_suit_bones) do
			-- head:ManipulateBoneScale( head:LookupBone(v), Vector( vector_origin ) )
		end
		-- head:ManipulateBoneScale( head:LookupBone("Glasses"), Vector( 10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("Mouth"), Vector( 10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("C_Eyebrow"), Vector( 10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("R_Eyebrow"), Vector( 10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("L_Eyebrow"), Vector( 10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("L_Eye"), Vector( 10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("R_Eye"), Vector(10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("R_Eyelid"), Vector( 10, 10, 10 ) )
		-- head:ManipulateBoneScale( head:LookupBone("L_Eyelid"), Vector( 10, 10, 10 ) )
	end
	if pl:GetHeadModel() == HL2C_HEV_SUIT_LIST[1] and pl:GetModel() != HL2C_HEV_SUIT_LIST[1] then
		-- Fix_Freeman_Head(pl,head)
		-- print()
	end
	
	for i = 0, pl:GetBoneCount()-1 do
		if pl:GetBoneName(i) == "ValveBiped.Bip01_Head1" then
			pl:ManipulateBoneScale( pl:LookupBone("ValveBiped.Bip01_Head1"), Vector( 0.1, 0.1, 0.1 ) )
		elseif pl:GetBoneName(i) != "__INVALIDBONE__" then
			local boneName = pl:GetBoneName(i)
			local boneIndex = pl:LookupBone(boneName)
			pl:ManipulateBoneScale( pl:LookupBone(boneName), Vector( 1, 1, 1 ) )
			if other_boneIndex != nil then


			end
			-- head:SetNoDraw(false)
			
		end
	end
	head:ManipulateBoneScale( head:LookupBone("ValveBiped.Bip01_Head1"), Vector( 10, 10, 10 ) )
	head:SetNoDraw(false)
	-- head:AddEffects(EF_BONEMERGE)
	-- head:SetupBones()
	-- pl:SetupBones()
end

function Hl2c_RemoveHead(pl)
	
	-- if pl.myhead != nil then
		-- pl:SetNWString("Head_Model", "")
		-- Remove_HeadFromTable(pl.myhead)
		for k, v in pairs(Hl2c.PlayersHead) do
			if pl.myhead == v then
				table.remove( Hl2c.PlayersHead, k )
				-- print("Success Remove Head")
			end
		end
		-- SafeRemoveEntity( pl.myhead )
		-- if IsValid(pl.myhead) then
			-- SafeRemoveEntity( pl.myhead )
		-- end
		pl.myhead:SetNoDraw(true)
		pl.myhead:RemoveEffects(EF_BONEMERGE)
		pl.myhead:SetParent(NULL)
		pl.myhead = nil
	-- end
end
function Hl2c_RemoveHeadByHead(head)
	if !IsValid(head.owner) then
		-- Remove_HeadFromTable(head)
		-- SafeRemoveEntity( head )
		for k, v in pairs(Hl2c.PlayersHead) do
			if head == v then
				table.remove( Hl2c.PlayersHead, k )
				-- print("Success Remove Head")
			end
		end
		head:SetNoDraw(true)
		head:RemoveEffects(EF_BONEMERGE)
		head:SetParent(NULL)
		-- if IsValid(pl.myhead) then
			-- SafeRemoveEntity( pl.myhead )
		-- end
		head = nil
	end
end
Hl2c.HeadList = {}
local function AddHead(pl,model)
	local head = ClientsideModel( model )
	head:SetNoDraw(true)
	head.owner = pl
	pl.myhead = head
	table.insert(Hl2c.HeadList,head)
	if #Hl2c.PlayersHead == 0 then
		table.insert(Hl2c.PlayersHead, head )
	elseif #Hl2c.PlayersHead > 0 then
		if Head_Exist(head) then
			Hl2c_AddHead(pl,model)
		elseif !Head_Exist(head) then
			table.insert(Hl2c.PlayersHead, head )
		end
	end
end

function Hl2c_AddHead(pl,model)
	if pl.myhead != nil then
	
	else
		AddHead(pl,model)
	end
end

function Hl2c_ModifyHead(pl,model)
	if pl.myhead != nil then
		-- Hl2c_RemoveHead(pl)
		-- AddHead(pl,model)
		
		util.PrecacheModel( model )
		pl.myhead:SetModel(model)
		-- if model == "models/romsn/gordon_player.mdl" then
		-- pl.myhead:SetSkin(1)
		-- pl.myhead:SetBodygroup( 1, 5 )
		-- end
		return
	end
	-- Hl2c_RemoveHead(pl)
	-- AddHead(pl,model)
end
function Hl2c_DefaultHead(pl)

	-- Hl2c_RemoveHead(pl)
	for i = 0, pl:GetBoneCount()-1 do
		 if pl:GetBoneName(i) != "__INVALIDBONE__" then
			local boneName = pl:GetBoneName(i)
			local boneIndex = pl:LookupBone(boneName)
			pl:ManipulateBoneScale( pl:LookupBone(boneName), Vector( 1, 1, 1 ) )
		end
	end
	pl:SetupBones()
	-- AddHead(pl,model)
end
local delay = 0
hook.Remove( "PreDrawTranslucentRenderables", "CUSTOM_PostDrawTranslucentRenderable" )
hook.Add("PreDrawTranslucentRenderables", "CUSTOM_PostDrawTranslucentRenderable", function(bDrawingDepth, bDrawingSkybox) 
	for k, v in pairs(Hl2c.PlayersHead) do
		if v and !IsValid(v.owner) then
			v:SetNoDraw(true)
			Hl2c_RemoveHeadByHead(v)
			
			-- print(k,v.owner)
		end
		if v and IsValid(v.owner) and v.owner:Team() != TEAM_ALIVE and !v.owner:Alive() then
			v:SetNoDraw(true)
			Hl2c_RemoveHead(v.owner)
			
			-- print(k,v.owner)
		end
	end
	
	for _, pl in pairs( player.GetAll( ) ) do
		if !pl:Alive() and pl:Team() != TEAM_ALIVE and pl.myhead then
			pl.myhead:SetNoDraw(true)
			pl.headbonemerged = false
		end
		if pl:Alive() and pl:Team() != TEAM_ALIVE and pl.myhead then
			pl.myhead:SetNoDraw(true)
			pl.headbonemerged = false
			pl:ManipulateBoneScale( pl:LookupBone("ValveBiped.Bip01_R_Calf"), Vector( 1,1,1 ) )
			
		end
		if pl:Alive() and pl:Team() == TEAM_COMBINE then
			Hl2c_DefaultHead(pl)
		end
		if pl:Alive() and pl:Team() == TEAM_ALIVE then

			-- pl:SetupBones()
			
			if pl:GetHeadModel() and pl:GetSuitModel() and HL2C_ALL_PLAYER_MODELS[pl:GetSuitModel()] then
				if pl.myhead and HL2C_ALL_PLAYER_MODELS[pl:GetSuitModel()] then 
					
					pl.myhead:SetPos(pl:GetPos())
					pl.myhead:SetParent(pl)
					if isstring(pl:GetNWString( "Head_Model" )) and string.len(pl:GetNWString( "Head_Model" )) > 5 and pl.myhead:GetModel() != pl:GetNWString( "Head_Model" ) then 
						Hl2c_ModifyHead(pl, pl:GetNWString( "Head_Model" ) )
						pl.headbonemerged = false
					end
					if !(string.len(pl:GetNWString( "Head_Model" )) > 5) and pl.myhead:GetModel() != headmodel then
						
						-- Hl2c_ModifyHead(pl, headmodel )
						-- pl.headbonemerged = false
					end
					-- head:AddEffects(EF_BONEMERGE)
					if pl.myhead:GetEffects() == EF_BONEMERGE then 
						if pl == LocalPlayer() and LocalPlayer():InVehicle() then
							pl.myhead:SetNoDraw(true)
							pl.myhead:AddEffects( EF_NODRAW )
							-- print("hi",pl.myhead)
						end
					else
						Hl2c_DefaultHead(pl)
						BuildBones(pl,pl.myhead)
						-- pl.headbonemerged = false
						BuildBones(pl,pl.myhead)
						for k,v in pairs(Hl2c.PlayersHead) do
							-- print(k,v.owner)
						end
						
					end
					HeadSwitch(pl,pl.myhead)
				elseif HL2C_ALL_PLAYER_MODELS[pl:GetSuitModel()] then
					Hl2c_AddHead(pl,headmodel)
					-- print("Called? ADD HEAD?")
				end
			end

			--print(pl:SteamID())
		end
		
		-- if CurTime() < delay then
		-- else
			-- print("")
			-- print("---------------------------------------------------")
			-- print("-- Key","Value","","","","Owner")
			-- for k, v in pairs(Hl2c.PlayersHead) do
				-- print("-- ".. k,v,v.owner)
			-- end
			-- delay = CurTime() + 10
			-- print("---------------------------------------------------")
			-- print("")
		-- end
	end
	
end)

concommand.Add("get_bonelist",function(ply,com,args) 
	local BoneCount = ply:GetBoneCount()
	print('i','', 'name','','',' index','','',' position','','',' angle')
	for i = 0, ply:GetBoneCount() - 1 do
		if ply:GetBoneName(i) != "__INVALIDBONE__" then
		local boneName = ply:GetBoneName(i)
		local boneIndex = ply:LookupBone(boneName)
		--if boneIndex != nil then
		local bonePos, boneAng = ply:GetBonePosition(boneIndex)
		--end
		print(i, boneName, boneIndex, bonePos, boneAng)
		end
		
	end
end)


concommand.Add("get_bonelist_head",function(ply,com,args) 
	if ply.myhead then else return end
	local head = ply.myhead 
	local BoneCount = head:GetBoneCount()
	print('i','', 'name','','',' index','','',' position','','',' angle')
	for i = 0, head:GetBoneCount() - 1 do
		if head:GetBoneName(i) != "__INVALIDBONE__" then
		local boneName = head:GetBoneName(i)
		local boneIndex = head:LookupBone(boneName)
		--if boneIndex != nil then
		local bonePos, boneAng = head:GetBonePosition(boneIndex)
		--end
		print(i, boneName, boneIndex, bonePos, boneAng)
		end
		
	end
end)



end

