--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--INFO_PLAYER_SPAWN = {Vector(-4712, 54, 146), 90}
--HL2MP_SPAWN_ENT = "info_player_rebel"
RESET_PL_INFO = true
NEXT_MAP = "winter_lobby_2012"

HL2MP_IS_COOP_MAP = true
OC_MAP = true
NEXT_MAP_TIME = 5
NEW_DIF = true


local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
}

AddTriggerEvent("combineshieldwall1_rot-bu", "OnPressed", "obj_lever,Disable,,2,-1")
AddTriggerEvent("button_keypad_1_fake-bu", "OnPressed", "obj_keypad,Enable,,5,-1")
AddTriggerEvent("button_keypad_1", "OnPressed", "obj_keypad,Disable,,0,-1")
AddTriggerEvent("ballgenerator_text", "message", "Something is wrong with this!")
AddTriggerEvent("ballgenerator_text_trigger", "OnStartTouch", "ballgenerator1_break,Break,,0,-1")


function MAPSCRIPT:InitPost()
	obj_lever = ents.Create("info_waypoint")
	obj_lever:SetKeyValue("origin",  "511.863 790.208 -720.724")
	obj_lever:SetKeyValue("image", "4")
	obj_lever:SetKeyValue("text", "Pull Lever")
	obj_lever:SetName("obj_lever")
	obj_lever:Fire("Enable")

	obj_keypad = ents.Create("info_waypoint")
	obj_keypad:SetKeyValue("origin",  "1152 465.5 -705")
	obj_keypad:SetKeyValue("image", "4")
	obj_keypad:SetKeyValue("text", "Pull Lever")
	obj_keypad:SetName("obj_keypad")

	obj_combine = ents.Create("info_waypoint")
	obj_combine:SetKeyValue("origin",  "1782 -977 -435")
	obj_combine:SetKeyValue("image", "4")
	obj_combine:SetKeyValue("text", "Destroy")
	obj_combine:SetName("obj_combine")
end

function MAPSCRIPT:PostPlayerSpawn(pl)
	

	difficulty = 1

end


