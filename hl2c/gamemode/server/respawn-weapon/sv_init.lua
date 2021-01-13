ITEM_RESPAWN_ENTITY_CLASS_LIST = {
	"item_healthkit",
	"item_healthvial",
	"item_battery",
	"item_ammo_pistol",
	"item_ammo_pistol_large",
	"item_ammo_357",
	"item_ammo_357_large",
	"item_ammo_smg1",
	"item_ammo_smg1_large",
	"item_ammo_smg1_grenade",
	"item_ammo_ar2",
	"item_ammo_ar2_large",
	"item_ammo_ar2_altfire",
	"item_box_buckshot",
	"item_ammo_crossbow",
	"item_rpg_round",
}

ALLOW_WEAPON_RESPAWNS_WEAPON_LIST = {}

local function RespawnSystem()
	if HL2MP_IS_COOP_MAP then
		-- Add stuff to the weapons list if allow weapon respawns is disabled.
		if ( !ALLOW_WEAPON_RESPAWNS ) then
	
			for _, ply in pairs( player.GetAll() ) do
		
				for k, v in pairs( ply:GetWeapons() ) do
				
					if ( !table.HasValue( ALLOW_WEAPON_RESPAWNS_WEAPON_LIST, v:GetClass() ) ) then
					if table.HasValue(WHITELIST_WEAPONS, v:GetClass()) then
					if !table.HasValue(WHITELIST_WEAPONS, v:GetClass()) then
						table.insert( ALLOW_WEAPON_RESPAWNS_WEAPON_LIST, v:GetClass() )
						--print("ALLOW_WEAPON_RESPAWNS_WEAPON_LIST",v:GetClass())
					end
					end
					end
				
				end
			
				for k, v in pairs( ALLOW_WEAPON_RESPAWNS_WEAPON_LIST ) do
				
					if ( ( ply:IsValid() && ply:Alive() ) && !ply:HasWeapon( v ) ) then
					if table.HasValue(WHITELIST_WEAPONS, v:GetClass()) then
						ply:Give( v )
						--print("ALLOW_WEAPON_RESPAWNS_WEAPON_LIST",v:GetClass())
					end
					end
				
				end
			
			end
		
		end
	end
end
hook.Add("Think", "RespawnSystem", RespawnSystem)