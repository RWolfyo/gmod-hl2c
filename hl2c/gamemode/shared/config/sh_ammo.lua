if SERVER then AddCSLuaFile() end

Hl2c.AmmoTypes = {
	["AR2"] = 60,
	["AR2AltFire"] = 3,
	["Pistol"] = 150,
	["SMG1"] = 225,
	["357"] = 12,
	["XBowBolt"] = 11,
	["Buckshot"] = 30,
	["RPG_Round"] = 3,
	["SMG1_Grenade"] = 3,
	["Grenade"] = 5,
	["slam"] = 5,
	["AlyxGun"] = 120,
	["SniperRound"] = 11,
}
Hl2c.AmmoTypes_Name = {
	["AR2"] = true,
	["AR2AltFire"] = true,
	["Pistol"] = true,
	["SMG1"] = true,
	["357"] = true,
	["XBowBolt"] = true,
	["Buckshot"] = true,
	["RPG_Round"] = true,
	["SMG1_Grenade"] = true,
	["Grenade"] = true,
	["slam"] = true,
	["AlyxGun"] = true,
	["SniperRound"] = true,
}
Hl2c.AmmoTypes_Id = {
	[1] = true,
	[2] = true,
	[3] = true,
	[4] = true,
	[5] = true,
	[6] = true,
	[7] = true,
	[8] = true,
	[9] = true,
	[10] = true,
	[11] = true,
	[12] = true,
	[13] = true,
}

Hl2c.AmmoTypes_Max_Id = {
	[1] = 60,
	[2] = 3,
	[3] = 150,
	[4] = 225,
	[5] = 12,
	[6] = 11,
	[7] = 30,
	[8] = 3,
	[9] = 3,
	[10] = 5,
	[11] = 5,
	[12] = 120,
	[13] = 11,
}

Hl2c.AmmoTypes_WeaponClass_Max = {
	["weapon_ar2"] = 60,
	-- ["weapon_"] = 3,
	["weapon_pistol"] = 150,
	["weapon_smg1"] = 225,
	["weapon_357"] = 12,
	["weapon_crossbow"] = 11,
	["weapon_shotgun"] = 30,
	["weapon_rpg"] = 3,
	-- ["weapon_frag"] = 3,
	["weapon_frag"] = 5,
	["weapon_slam"] = 5,
	-- ["weapon_alyxgun"] = 120,
	["weapon_sniperrifle"] = 11,
}
Hl2c.AmmoTypes_WeaponClass = {
	["weapon_ar2"] = true,
	-- ["weapon_"] = true,
	["weapon_pistol"] = true,
	["weapon_smg1"] = true,
	["weapon_357"] = true,
	["weapon_crossbow"] = true,
	["weapon_shotgun"] = true,
	["weapon_rpg"] = true,
	-- ["weapon_frag"] = true,
	["weapon_frag"] = true,
	["weapon_slam"] = true,
	-- ["weapon_alyxgun"] = true,
	["weapon_sniperrifle"] = true,
}
Hl2c.AmmoTypes_WeaponClass_Id = {
	["weapon_ar2"] = 1,
	-- ["weapon_"] = 2,
	["weapon_pistol"] = 3,
	["weapon_smg1"] = 4,
	["weapon_357"] = 5,
	["weapon_crossbow"] = 6,
	["weapon_shotgun"] = 7,
	["weapon_rpg"] = 8,
	-- ["weapon_frag"] = 9,
	["weapon_frag"] = 10,
	["weapon_slam"] = 11,
	-- ["weapon_alyxgun"] = 12,
	["weapon_sniperrifle"] = 13,
}

Hl2c.AmmoTypes_ItemClass_Max = {
	["item_ammo_ar2"] = 60,
	["item_ammo_ar2_large"] = 60,
	["item_ammo_ar2_altfire"] = 3,
	["item_ammo_pistol"] = 150,
	["item_ammo_pistol_large"] = 150,
	["item_ammo_smg1"] = 225,
	["item_ammo_smg1_large"] = 225,
	["item_ammo_357"] = 12,
	["item_ammo_357_large"] = 12,
	["item_ammo_crossbow"] = 11,
	["item_box_buckshot"] = 30,
	["item_rpg_round"] = 3,
	["item_ammo_smg1_grenade"] = 3,
	["weapon_frag"] = 5,
	["weapon_slam"] = 5,
	-- ["weapon_alyxgun"] = 120,
	-- ["weapon_sniperrifle"] = 11,
}
Hl2c.AmmoType_Pointer_Bonus={
	[1] = 15,//ar2
	[2] = 0,//ar2altfire
	[3] = 20,//pistol
	[4] = 20,//smg1
	[5] = 8,//magnum
	[6] = 8,//crossbow
	[7] = 10,//shotgun
	[8] = 0,//rpg
	[9] = 0,//smg1grneade
	[10] = 0,//frag
	[11] = 0,//slam
	[12] = 0,//alyxgun
	[13] = 0,//sniperround
}
Hl2c.AmmoTypes_ItemClass_Bonus = {
	[1] = Hl2c.AmmoType_Pointer_Bonus[1],//ar2
	[2] = Hl2c.AmmoType_Pointer_Bonus[2],//ar2altfire
	[3] = Hl2c.AmmoType_Pointer_Bonus[3],//pistol
	[4] = Hl2c.AmmoType_Pointer_Bonus[4],//smg1
	[5] = Hl2c.AmmoType_Pointer_Bonus[5],//magnum
	[6] = Hl2c.AmmoType_Pointer_Bonus[6],//crossbow
	[7] = Hl2c.AmmoType_Pointer_Bonus[7],//shotgun
	[8] = Hl2c.AmmoType_Pointer_Bonus[8],//rpg
	[9] = Hl2c.AmmoType_Pointer_Bonus[9],//smg1grneade
	[10] = Hl2c.AmmoType_Pointer_Bonus[10],//frag
	[11] = Hl2c.AmmoType_Pointer_Bonus[11],//slam
	[12] = Hl2c.AmmoType_Pointer_Bonus[12],//alyxgun
	[13] = Hl2c.AmmoType_Pointer_Bonus[13],//sniperround
	
	["weapon_ar2"] = Hl2c.AmmoType_Pointer_Bonus[1],
	-- ["weapon_"] = 2,
	["weapon_pistol"] = Hl2c.AmmoType_Pointer_Bonus[3],
	["weapon_smg1"] = Hl2c.AmmoType_Pointer_Bonus[4],
	["weapon_357"] = Hl2c.AmmoType_Pointer_Bonus[5],
	["weapon_crossbow"] = Hl2c.AmmoType_Pointer_Bonus[6],
	["weapon_shotgun"] = Hl2c.AmmoType_Pointer_Bonus[7],
	["weapon_rpg"] = Hl2c.AmmoType_Pointer_Bonus[8],
	-- ["weapon_frag"] = 9,
	["weapon_frag"] = Hl2c.AmmoType_Pointer_Bonus[10],
	["weapon_slam"] = Hl2c.AmmoType_Pointer_Bonus[11],
	["weapon_alyxgun"] = Hl2c.AmmoType_Pointer_Bonus[12],
	["weapon_sniperrifle"] = Hl2c.AmmoType_Pointer_Bonus[13],
	
	["item_ammo_ar2"] = Hl2c.AmmoType_Pointer_Bonus[1],
	["item_ammo_ar2_large"] = Hl2c.AmmoType_Pointer_Bonus[1],
	["item_ammo_ar2_altfire"] = Hl2c.AmmoType_Pointer_Bonus[2],
	["item_ammo_pistol"] = Hl2c.AmmoType_Pointer_Bonus[3],
	["item_ammo_pistol_large"] = Hl2c.AmmoType_Pointer_Bonus[3],
	["item_ammo_smg1"] = Hl2c.AmmoType_Pointer_Bonus[4],
	["item_ammo_smg1_large"] = Hl2c.AmmoType_Pointer_Bonus[4],
	["item_ammo_357"] = Hl2c.AmmoType_Pointer_Bonus[5],
	["item_ammo_357_large"] = Hl2c.AmmoType_Pointer_Bonus[5],
	["item_ammo_crossbow"] = Hl2c.AmmoType_Pointer_Bonus[6],
	["item_box_buckshot"] = Hl2c.AmmoType_Pointer_Bonus[7],
	["item_rpg_round"] = Hl2c.AmmoType_Pointer_Bonus[8],
	["item_ammo_smg1_grenade"] = Hl2c.AmmoType_Pointer_Bonus[9],
	["weapon_frag"] = Hl2c.AmmoType_Pointer_Bonus[10],
	["weapon_slam"] = Hl2c.AmmoType_Pointer_Bonus[11],
	["weapon_alyxgun"] = Hl2c.AmmoType_Pointer_Bonus[12],
	["weapon_sniperrifle"] = Hl2c.AmmoType_Pointer_Bonus[13],
}
Hl2c.AmmoTypes_ItemClass = {
	["item_ammo_ar2"] = true,
	["item_ammo_ar2_large"] = true,
	["item_ammo_ar2_altfire"] = true,
	["item_ammo_pistol"] = true,
	["item_ammo_pistol_large"] = true,
	["item_ammo_smg1"] = true,
	["item_ammo_smg1_large"] = true,
	["item_ammo_357"] = true,
	["item_ammo_357_large"] = true,
	["item_ammo_crossbow"] = true,
	["item_box_buckshot"] = true,
	["item_rpg_round"] = true,
	["item_ammo_smg1_grenade"] = true,
	["weapon_frag"] = true,
	["weapon_slam"] = true,
	-- ["weapon_alyxgun"] = true,
	-- ["weapon_sniperrifle"] = true,
}
Hl2c.AmmoTypes_ItemClass_Id = {
	["item_ammo_ar2"] = 1,
	
	["item_ammo_ar2_large"] = 1,
	["item_ammo_ar2_altfire"] = 2,
	["item_ammo_pistol"] = 3,
	["item_ammo_pistol_large"] = 3,
	["item_ammo_smg1"] = 4,
	["item_ammo_smg1_large"] = 4,
	["item_ammo_357"] = 5,
	["item_ammo_357_large"] = 5,
	["item_ammo_crossbow"] = 6,
	["item_box_buckshot"] = 7,
	["item_rpg_round"] = 8,
	["item_ammo_smg1_grenade"] = 9,
	["weapon_frag"] = 10,
	["weapon_slam"] = 11,
	-- ["weapon_alyxgun"] = 12,
	-- ["weapon_sniperrifle"] = 13,
}
/*

		if weapon:GetClass() == "weapon_slam" then
		
		if weapon:GetClass() == "weapon_frag" then

		if weapon:GetClass() == "weapon_rpg" then

		if weapon:GetClass() == "weapon_crossbow" then

		if weapon:GetClass() == "weapon_shotgun" then
		
		if weapon:GetClass() == "weapon_ar2" then

		if weapon:GetClass() == "weapon_smg1" then

		if weapon:GetClass() == "weapon_357" then

		if weapon:GetClass() == "weapon_pistol" then
		
		if item:GetClass() == "item_ammo_pistol" || item:GetClass() == "item_ammo_pistol_large" then
		
		if item:GetClass() == "item_ammo_357" || item:GetClass() == "item_ammo_357_large" then
		
		if item:GetClass() == "item_ammo_smg1" || item:GetClass() == "item_ammo_smg1_large" then
		
		if item:GetClass() == "item_ammo_smg1_grenade" then
		
		if item:GetClass() == "item_ammo_ar2" || item:GetClass() == "item_ammo_ar2_large" then
	
		if item:GetClass() == "item_ammo_ar2_altfire" then

		if item:GetClass() == "item_box_buckshot" then
		
		if item:GetClass() == "item_ammo_crossbow" then

		if item:GetClass() == "item_rpg_round" then

		if item:GetClass() == "weapon_frag" then

	-- ["SniperPenetratedRound"] = 11,
	-- ["Thumper"] = 60,
	-- ["Gravity"] = 60,
	-- ["Battery"] = 60,
	-- ["GaussEnergy"] = 60,
	-- ["CombineCannon"] = 60,
	-- ["AirboatGun"] = 60,
	-- ["StriderMinigun"] = 60,
	-- ["HelicopterGun"] = 60,
	-- ["9mmRound"] = 60,
	-- ["MP5_Grenade"] = 60,
	-- ["Hornet"] = 60,
	-- ["StriderMinigunDirect"] = 60,
	-- ["CombineHeavyCannon"] = 60,


	1	AR2	weapon_ar2 ammo
2	AR2AltFire	weapon_ar2 altfire ammo
3	Pistol	weapon_pistol ammo
4	SMG1	weapon_smg1 ammo
5	357	weapon_357 ammo
6	XBowBolt	weapon_crossbow ammo
7	Buckshot	weapon_shotgun ammo
8	RPG_Round	weapon_rpg ammo
9	SMG1_Grenade	weapon_smg1 altfire ammo
10	Grenade	weapon_frag ammo
11	slam	weapon_slam ammo
12	AlyxGun	weapon_alyxgun ammo
13	SniperRound	Combine Sniper ammo
14	SniperPenetratedRound	Combine Sniper alternate ammo
15	Thumper	
16	Gravity	
17	Battery	
18	GaussEnergy	
19	CombineCannon	
20	AirboatGun	Airboat mounted gun ammo
21	StriderMinigun	Strider minigun ammo
22	HelicopterGun	Attack Helicopter ammo
23	9mmRound	HL:S pistol ammo
24	MP5_Grenade	HL:S grenade ammo
25	Hornet	HL:S hornet ammo
26	StriderMinigunDirect	npc_strider "EnableAggressiveBehavior" ammo ( Less damage )
27	CombineHeavyCannon	The "Combine Autogun" ammo from Half-Life 2: Episode 2
	*/