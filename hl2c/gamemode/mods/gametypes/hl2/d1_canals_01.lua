NEXT_MAP = "d1_canals_01a"

RESPAWN_ALLOWED = true


TRIGGER_CHECKPOINT = {
	{Vector(394, -6942, 531), Vector(434, -7104, 576),false,function() end,Vector(643.708313, -6175.186523, 547.031250)},
	--{Vector(386, -4257, 523), Vector(447, -4206, 563)},
	{Vector(824, 2605, -37), Vector(887, 2668, 49)},
	{Vector(704, 2707, -94), Vector(747, 2759, 3)}
}

BRUSH_PLAYERCLIP = {

	{Vector(1461, -8257, 221), Vector(1481, -8317, 340)}
	
}

-- VORTEX_POS = Vector(1527.732544, -6210.049316, 704.031250)
VORTEX_POS = Vector(3466.995117, -9331.477539, 1587.031250)


local MAPSCRIPT = {}

MAPSCRIPT.EntityFilterByName = {
}

function MAPSCRIPT:InitPost()
	for k, v in pairs(ents.FindByName("song1")) do
		v:Fire("addoutput", "message music/stingers/hl1_stinger_song8.mp3")
	end
	
	for k, v in pairs(ents.FindByName("song2")) do
		v:Fire("addoutput", "message music/hl2_song20_submix0.mp3")
	end
	

end

function MAPSCRIPT:PostPlayerSpawn(pl)
	pl:Give("weapon_crowbar")
	pl:Give("weapon_medkit_hl2c")
end

return MAPSCRIPT
/*
Important Notice

We have noticed that during Duels, your account
has been sending data that would not be sent if
playing the game normally.
*If you are either not aware of this, or have a 
justifiable reason for doing so, please notify us
immediately.
If we notice the same occurrence in the future, we
will take strict action against your account, based
on our Terms of Use, This includes, but is not
limited to the permanently banning your account.
*/