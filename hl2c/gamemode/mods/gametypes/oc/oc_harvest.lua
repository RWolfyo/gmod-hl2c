local DbgPrint = GetLogging("MapScript")

local MAPSCRIPT = {}


RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"


HL2MP_IS_COOP_MAP = true
OC_MAP = true

NEXT_MAP_TIME = 5

function MAPSCRIPT:InitPost()

end


function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_physcannon")
end

return MAPSCRIPT

/*

SOLID_VPHYSICS static prop with no vphysics model! (models/props_furniture/kitchen_shelf1.mdl)
SOLID_VPHYSICS static prop with no vphysics model! (models/props_furniture/kitchen_shelf1.mdl)
SOLID_VPHYSICS static prop with no vphysics model! (models/props_furniture/kitchen_shelf1.mdl)
[hl2c] SHARED file: sh_config_gamemode_ttt.lua
[hl2c] SHARED file: sh_config_gamemode_sandbox.lua
[hl2c] SHARED file: sh_config_gamemode_prophunt.lua
[hl2c] SHARED file: sh_config_gamemode_murder.lua
[hl2c] SHARED file: sh_config_gamemode_darkrp.lua
[hl2c] SHARED file: sh_config_core_usercommands.lua
[hl2c] SHARED file: sh_config_core_tabs.lua
[hl2c] SHARED file: sh_config_core_servers.lua
[hl2c] SHARED file: sh_config_core_languages.lua
[hl2c] SHARED file: sh_config_core_columns.lua
[hl2c] SHARED file: sh_config.lua
[hl2c] SERVER file: sv_init.lua
[hl2c] CLIENT file: cl_override.lua
[hl2c] CLIENT file: cl_init.lua
[hl2c] CLIENT file: cl_fonts.lua
[hl2c] CLIENT file: vgui_tab_home.lua
[hl2c] CLIENT file: vgui_tab_controls.lua
[hl2c] CLIENT file: vgui_tab_actions.lua
[hl2c] CLIENT file: vgui_settings.lua
[hl2c] CLIENT file: vgui_serversettings.lua
[hl2c] CLIENT file: vgui_serverconn.lua
[hl2c] CLIENT file: vgui_plyrow.lua
[hl2c] CLIENT file: vgui_core.lua
[hl2c] CLIENT file: vgui_about.lua

..........................[ Vliss Scoreboard Loaded - Half-Life 2 Campaign ]..........................

No custom nodegraph found!
Couldn't include file 'includes\modules\tracex.lua' (File not found) (<nowhere>)
Particles: Missing 'particles/centaur_spit.pcf'
Particles: Missing 'particles/slv_explosion.pcf'
Adding derived addon Half[-]Life Beta


/////////////////////////////////////
//    OLD LEIFTIGER CODES INIT     //
/////////////////////////////////////
//       LOADING PLUGINS..         //
/////////////////////////////////////
//   cl_rules.lua                  //
/////////////////////////////////////
//    ALL LEIFTIGER CODE LOADED    //
/////////////////////////////////////
///////////////////////////////
//      Ulysses Library      //
///////////////////////////////
// Loading...                //
//  shared/defines.lua       //
//  shared/misc.lua          //
//  shared/util.lua          //
//  shared/hook.lua          //
//  shared/table.lua         //
//  shared/player.lua        //
//  server/player.lua        //
//  shared/messages.lua      //
//  shared/commands.lua      //
//  server/concommand.lua    //
//  server/util.lua          //
//  shared/sh_ucl.lua        //
//  server/ucl.lua           //
//  server/phys.lua          //
//  server/player_ext.lua    //
//  server/entity_ext.lua    //
//  shared/plugin.lua        //
//  shared/cami_global.lua   //
//  shared/cami_ulib.lua     //
// Load Complete!            //
///////////////////////////////
[ULIB] Loading SHARED module: ulx_init.lua
///////////////////////////////
//       ULX Admin Mod       //
///////////////////////////////
// Loading...                //
//  sh_defines.lua           //
//  lib.lua                  //
//  base.lua                 //
//  sh_base.lua              //
//  log.lua                  //
//  MODULE: slots.lua        //
//  MODULE: uteam.lua        //
//  MODULE: votemap.lua      //
//  MODULE: xgui_server.lua  //
///////////////////////////////
// ULX GUI -- by Stickly Man //
///////////////////////////////
// Adding Main Modules..     //
//  bans.lua                 //
//  commands.lua             //
//  groups.lua               //
//  maps.lua                 //
//  settings.lua             //
// Adding Setting Modules..  //
//  client.lua               //
//  server.lua               //
// Adding Gamemode Modules.. //
//  sandbox.lua              //
// Loading Server Modules..  //
//  sv_bans.lua              //
//  sv_groups.lua            //
//  sv_maps.lua              //
//  sv_sandbox.lua           //
//  sv_settings.lua          //
// XGUI modules added!       //
///////////////////////////////
//  MODULE: chat.lua         //
//  MODULE: fun.lua          //
//  MODULE: menus.lua        //
//  MODULE: rcon.lua         //
//  MODULE: teleport.lua     //
//  MODULE: user.lua         //
//  MODULE: userhelp.lua     //
//  MODULE: util.lua         //
//  MODULE: vote.lua         //
//  end.lua                  //
// Load Complete!            //
///////////////////////////////
(1.02)[SV] [hl2c] sh_config loaded
(1.02)[SV] [hl2c] Achievement Mod Loaded
(1.02)[SV] GameTypes Loaded
(1.02)[SV] [hl2c] Server loaded
(1.02)[SV] [hl2c]: Initialized Custom Map
(1.02)[SV] [hl2c]: Initialized Obsidian Conflict Map
Executing dedicated server config file server.cfg
Attempted to create unknown entity type weapon_gauss!
Can't init weapon_gauss
Attempted to create unknown entity type weapon_manhack!
Can't init weapon_manhack
Couldn't find any entities named Weapon_Tau, which point_template template_Weapon_Tau is specifying.
Couldn't find any entities named Weapon_Manhack, which point_template template_Weapon_Manhack is specifying.
ERROR!: Can't create physics object for models/Tysn/tysn_book_open_recipes.mdl
ERROR!: Can't create physics object for models/Tysn/tysn_mrbucket.mdl
Door Extractor_FakeDoor with conflicting collision settings, removing ignoredebris
ERROR!: Can't create physics object for models/tysn/tysn_bellbivdevoe.mdl
ERROR!: Can't create physics object for models/tysn/tysn_raisinbran.mdl
ERROR!: Can't create physics object for models/tysn/tysn_boardgameslime.mdl
ERROR!: Can't create physics object for models/tysn/tysn_tophat.mdl
ERROR!: Can't create physics object for models/tysn/tysn_pubix_1.mdl
ERROR!: Can't create physics object for models/tysn/tysn_landsoflore3_1.mdl
ERROR!: Can't create physics object for models/tysn/tysn_skeleton_trophy_1.mdl
ERROR!: Can't create physics object for models/tysn/tysn_hexen64_1.mdl
ERROR!: Can't create physics object for models/tysn/tysn_butter_1.mdl
ERROR!: Can't create physics object for models/maps/cleanup/phone.mdl
ERROR!: Can't create physics object for models/tysn/tysn_bullchickenfeed_1.mdl
ERROR!: Can't create physics object for models/tysn/tysn_bullchickenfeed_1.mdl
ERROR!: Can't create physics object for models/tysn/tysn_bullchickenfeed_1.mdl

ERROR!: Can't create physics object for models/tysn/tysn_mushroom_1.mdl
*/