//DeriveGamemode( "core" )
// Send the required lua files to the client
AddCSLuaFile("shared.lua")
AddCSLuaFile("shared/sh_init.lua")
AddCSLuaFile("shared/sh_config.lua")
AddCSLuaFile("shared/player/sh_player.lua")
AddCSLuaFile("shared/player/xp/sh_init.lua")
AddCSLuaFile("shared/player/vortex/sh_init.lua")
AddCSLuaFile("shared/player/achievement/sh_init.lua")
AddCSLuaFile("shared/npc/sh_npc.lua")
//Client files
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("client/cl_init.lua")
AddCSLuaFile("client/zones/cl_zones.lua")
AddCSLuaFile("client/derma/cl_scoreboard.lua")
AddCSLuaFile("client/derma/cl_scoreboard_playerlist.lua")
AddCSLuaFile("client/derma/cl_scoreboard_playerrow.lua")
AddCSLuaFile("client/target/cl_targetid.lua")
AddCSLuaFile("client/derma/cl_helpmenu.lua")
AddCSLuaFile("client/derma/cl_spawnmenu.lua")
AddCSLuaFile("player_class/player_coop.lua")
AddCSLuaFile("player_class/player_combine.lua")
AddCSLuaFile("client/derma/tools/contenticon.lua")
AddCSLuaFile("client/chat/cl_chat.lua")
AddCSLuaFile("client/chat/cl_leifchat.lua")
AddCSLuaFile("client/ads/cl_ads.lua")
AddCSLuaFile("client/chat/cl_chat_color.lua")
AddCSLuaFile("client/derma/cl_upgrade_menu.lua")
AddCSLuaFile("client/hud/cl_hud.lua")
AddCSLuaFile("client/hud/cl_pet.lua")
AddCSLuaFile("client/hud/cl_voice.lua")
AddCSLuaFile("client/hud/cl_targetbar.lua")
AddCSLuaFile("client/items/cl_init.lua")
AddCSLuaFile("client/derma/cl_stat.lua")
AddCSLuaFile("client/derma/cl_powerstat.lua")
AddCSLuaFile("client/derma/pet/cl_init.lua")
AddCSLuaFile("client/derma/report/cl_init.lua")
AddCSLuaFile("client/derma/top/cl_init.lua")
AddCSLuaFile("client/derma/admin/cl_init.lua")
AddCSLuaFile("client/achievement/cl_achi_event.lua")

AddCSLuaFile("client/inventory/cl_database.lua")
AddCSLuaFile("client/inventory/cl_loot.lua")
AddCSLuaFile("client/inventory/cl_inventory.lua")
AddCSLuaFile("client/inventory/cl_drpinv.lua")
AddCSLuaFile("client/db/cl_init.lua")



AddCSLuaFile("modules/von.lua")
AddCSLuaFile("modules/netstream.lua")

include("modules/triggers.lua")
include("modules/von.lua")
include("modules/netstream.lua")
--AddCSLuaFile("sh_spawnmenu_list.lua")


// Include the required lua files
include("shared.lua")
include("server/init.lua")



--include("modules/von.lua")
--include("modules/von.lua")
--include("modules/von.lua")
--include("contenticon.lua")