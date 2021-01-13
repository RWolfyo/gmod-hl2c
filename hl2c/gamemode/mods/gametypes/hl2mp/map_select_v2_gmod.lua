--INFO_PLAYER_SPAWN = {Vector(-1.117197, -5.040385, 163.497803), 90}

RESET_PL_INFO = true

NEXT_MAP = "map_select_v2_gmod"

--HL2MP_IS_COOP_MAP = true

--TRIGGER_CHECKPOINT = {
--	{Vector(-25.996691, -13.400346, 1130.135254), Vector(-25.996691, -13.400346, 1130.135254)}
--}
DISABLE_CUSTOM_WEAPON = false

hook.Add("InitPostEntity", "hl2cInitPostEntity", function()
	
	local logic = ents.FindByClass("logic_auto")
	logic[1]:Fire("addoutput", "OnMapSpawn wall_map01,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn door_map01,SetHealth,1000,0,-1")
	
	logic[1]:Fire("addoutput", "OnMapSpawn wall_map03,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn door_map03,SetHealth,1000,0,-1")
	
	logic[1]:Fire("addoutput", "OnMapSpawn wall_map04,Disable,,0,-1")
	logic[1]:Fire("addoutput", "OnMapSpawn door_map04,SetHealth,1000,0,-1")
	
	local text1 = ents.FindByName("text_map01")
	text1[1]:SetKeyValue("message", "Half-Life 2")
	local trigger1 = ents.FindByName("trigger_map01")
	trigger1[1]:Fire("addoutput", "OnTrigger server,Command,changelevel d1_trainstation_01,5,1")
	
	/*local text2 = ents.FindByName("text_map02")
	text2[1]:SetKeyValue("message", "Half-Life 2 Lostcoast")
	local trigger2 = ents.FindByName("trigger_map02")
	trigger2[1]:Fire("addoutput", "OnTrigger server,Command,changelevel d1_trainstation_01,5,1")*/
	
	local text3 = ents.FindByName("text_map03")
	text3[1]:SetKeyValue("message", "Half-Life 2 Episode One")
	local trigger3 = ents.FindByName("trigger_map03")
	trigger3[1]:Fire("addoutput", "OnTrigger server,Command,changelevel ep1_citadel_01,5,1")
	
	local text4 = ents.FindByName("text_map04")
	text4[1]:SetKeyValue("message", "Half-Life 2 Episode Two")
	local trigger4 = ents.FindByName("trigger_map04")
	trigger4[1]:Fire("addoutput", "OnTrigger server,Command,changelevel ep2_outland_01,5,1")
	
	--local newserver = ents.Create("point_servercommand")
	--newserver[1]:SetKeyValue("targetname", "server")
	--newserver[1]:Spawn()
	--newserver[1]:Activate()
	local ply_spawn = ents.Create("info_player_spawn")
	ply_spawn:SetPos(Vector( -11.878775, 13.045406, -100.734100))
	ply_spawn:Spawn()
	ply_spawn:Activate()
end)

/*map_select_v2
{
   Modify
   {
      classname
      {
         "logic_auto"
         {
            "OnMapSpawn" "wall_map01,Disable,,0,-1"
            "OnMapSpawn" "door_map01,SetHealth,1000,0,-   1"
         }
      }

      Targetname
      {
         "text_map01"
         {
            "message" "oc_examplemap"
         }
         "trigger_map01"
         {
            "OnTrigger" "server,Command,changelevel oc_examplemap,5,1"
         }
      }
   }
}   
*/
hook.Add("PlayerSpawn", "hl2cPlayerSpawn", function(pl)
	pl:Give("weapon_crowbar")
end)