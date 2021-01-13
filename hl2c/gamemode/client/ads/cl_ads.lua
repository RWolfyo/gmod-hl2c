-- Create Ads on Chat 
if SERVER then return end; -- Make File Client ONLY



/****************************************************************
 *
 * Example 1
 * 
 ****************************************************************/
// When creating a panel, and you're unfamiliar with using DOCKing or Alignment, or other positioning methods,
//  you can simply hard-code the data and still have a dynamic vgui element which appears right on all
//  screen resolutions.


// First we need some base information.

// This is YOUR resolution; the resolution you're hardcoding for - We need this to create a multiplier.
local SCREEN_W = 1280;
local SCREEN_H = 720;

// The multiplier is their screen divided by your screen.
// If you run it, you multiply x and y by 1. Same sense.
// If someone with a larger screen runs it, it's greater than 1 because it's larger than your screen
// If someone with a smaller screen runs it, it's smaller than 1 because it's smaller.
local X_MULTIPLIER = ScrW( ) / SCREEN_W;
local Y_MULTIPLIER = ScrH( ) / SCREEN_H;

// Set up a panel such as:
//local _panel = vgui.Create( "DFrame" );
//_panel:SetSize( 500, 500 );
//_panel:Center( );

// The issue with leaving it like that, is that it won't change sizes with change of monitor. So if someone runs
// a resolution of 400 x 400 ( which can be manually set ), it'll be too large. Instead, do this:

//local _panel = vgui.Create( "DFrame" );
//_panel:SetSize( 500 * X_MULTIPLIER, 500 * Y_MULTIPLIER );
//_panel:Center( );

// This ensures that it's always right. For simplicity, if the screen w and screen h were both 1000. And the 400x400 person came on.
// the multiplier would then be .4 - This means the 500 would become 200. If someone with a screen of 2000, 2000 came on, the multiplier
// would become 2, meaning the window is then 1000. This is simple relativity.

// If you continue doing this everywhere where you set an X and Y position, and size, you'll have vgui that scales and positions properly with incredible ease.

/****************************************************************
 *
 * Example 2
 * 
 ****************************************************************/
 
 
 // The screensize this was developed for
local SCREEN_W, SCREEN_H = 1280, 768;

// The clients screen-size
local _w, _h = ScrW( ), ScrH( );

// Examples to show how it works...
-- local _w, _h = 1920, 1024; // Bigger screen, take up more space
-- local _w, _h = 640, 480; // smaller screen, take up less space

// The modifier needed to scale properly to other screen-sizes.
local _wMod, _hMod = _w / SCREEN_W, _h / SCREEN_H;

/****************************************************************
 *
 * Other Information in terms of positioning...
 * 
 ****************************************************************/

///For Screen-Size / Positioning, we're using width and height to represent x, y positions:
//1 = w = 0,              h = 0               is origin / top-left
//2 = w = 0,              h = ScrH( )         is bottom-left;
//3 = w = ScrW( ),        h = 0               is top-right;
//4 = w = ScrW( ),        h = ScrH( )         is bottom-right;
//5 = w = ScrW( ) / 2,    h = ScrH( ) / 2     is center;

//2D Coordinate = ( x, y ); -- We're using width and height to represent x, y just because they're 
                          -- the mins and maxs for this tutorial

//1 = ( 0,        0 );
//2 = ( 0,        ScrH( ) );
//3 = ( ScrW( ),  0 );
//4 = ( ScrW( ),  ScrH( ) );
//5 = ( ScrW( ),  ScrH( ) / 2 );

local Tab_Chat = {}
Tab_Chat[1] = "-----------------"
Tab_Chat[2] = "- F1 - HelpMenu."
Tab_Chat[3] = "- F2 - Upgrade Menu."
Tab_Chat[4] = "- F3 - Create Vehicle."
Tab_Chat[5] = "- F4 - Remove Vehicle."
Tab_Chat[6] = "-----------------"

local UPR_Chat = {}
UPR_Chat[1] = "-----------------"
UPR_Chat[2] = "- Join to other servers:"
UPR_Chat[3] = "-----------------"
UPR_Chat[4] = "- !uprsandbox"
UPR_Chat[5] = "- !uprcinema"
UPR_Chat[6] = "- !uprdarkrp"
UPR_Chat[7] = "- !uprstranded"
UPR_Chat[8] = "-----------------"
local Tab = {}
	--Tab[1] = "-----------------\nF1 - HelpMenu.\nF2 - Upgrade Menu.\nF3 - Create Vehicle.\nF4 - Remove Vehicle.\n-----------------"
	--Tab[2] = "-----------------\nSuport the Developer by join via our group Type: !join\n-----------------"
	--Tab[3] = "Chat Commands:\n!goto PLAYERNAME for player teleport\n!nextmap for skip map\n!restart for restart map\n!lobby for switch back to map select.\n!stat for check your level and xp.\n!3p to change into Thirdpersone.\n-----------------"
--	Tab[4] = "You want to restart map then Type: !restart for vote."
--	Tab[5] = "You want to skip map then Type: !nextmap for vote."
--	Tab[6] = "You want to go back to lobby to choose another map then Type: !lobby for vote."
	Tab[1] = "Spoiling isn't fun for the others. Don't do it"
	table.insert( Tab, #Tab+1, "You Stuck on a Map: !nextmap" )
	table.insert( Tab, #Tab+1, "You Want a New Map: !lobby" )
	table.insert( Tab, #Tab+1, "Can't Find Your Mate? !goto" )
	table.insert( Tab, #Tab+1, "Support The Developer: !donate" )
	table.insert( Tab, #Tab+1, "Join Our Steam Group: !join" )
	table.insert( Tab, #Tab+1, "Got an error? Please share it on our Steam Group" )
	table.insert( Tab, #Tab+1, "Citizens are FRIENDLY, do not KILL them" )
	table.insert( Tab, #Tab+1, "You are not Gordon Freeman, you won't survive everything" )
	table.insert( Tab, #Tab+1, "Admins are here to help you respect them" )
	table.insert( Tab, #Tab+1, "Finished HL2? No problem, we got Episode 1" )
	table.insert( Tab, #Tab+1, "You want to check your stat? Type !stat in chat" )
	table.insert( Tab, #Tab+1, "Gordon Freeman couldn't bypass the puzzles, why should you able to?" )
	table.insert( Tab, #Tab+1, "Finished Episode 1? No problem, we got Episode 2" )
	table.insert( Tab, #Tab+1, "Don't break the rules. Respect the others. !rules" )
local count_tab = 1
timer.Create("Advertising",30,0,function()
	--chat.AddText(Color(102,255,102), table.Random(Tab))
	chat.PlaySound()
	//print( math.tanh( 30 ) )
	INotifyPanel = vgui.Create( "DNotify" )
	INotifyPanel:SetPos( -7, 7 )
	INotifyPanel:SetSize( ScrW(), ScrH() )
	INotifyPanel:SetLife( 25 )
	local Ilbl = vgui.Create( "DLabel", INotifyPanel )
	Ilbl:SetPos(0,0)
	Ilbl:SetSize( ScrW(), ScrH() )
	-- Ilbl:DockMargin( 0,0,0,0 )
	-- Ilbl:Dock(TOP)
	Ilbl:SetContentAlignment( 9 )
	Ilbl:SetText(Tab[count_tab])
	Ilbl:SetTextColor( Color( 255, 255, 255, 200) )
	Ilbl:SetFont( "hl2cchatads" )
	//Ilbl:SetSize( 100, 100 )
	//Ilbl:SetAutoStretchVertical( true )
	Ilbl:SetContentAlignment( 9 )
	//Ilbl:SetWrap( true )
	INotifyPanel:AddItem( Ilbl )
	if count_tab == #Tab then
		count_tab = 1
	else
		count_tab = count_tab + 1
	end
end)
timer.Destroy("Advertising_Chat")
local next_ads = 1

timer.Create("Advertising_Chat",180,0,function()
	-- Msg("Working? Advertise Chat?")
	if next_ads == 1 then
		for i=1, #Tab_Chat do
			chat.AddText(Color(102,255,102), Tab_Chat[i].."\n" )
		end
		chat.PlaySound()
	else
		for i=1,#UPR_Chat do
			chat.AddText(Color(102,255,102), UPR_Chat[i].."\n" )
		end
		chat.PlaySound()
	end
	if next_ads == 1 then next_ads = 0 end
	if next_ads != 1 then next_ads = 1 end
end)
//Download Content
if (!file.Exists("models/i_have_downloaded_the_half-life_2_campaign_pack.mdl", "GAME")) then
	chat.AddText(Color(255, 255, 255), "Hello, you do not appear to have the content pack loaded.")
	chat.AddText(Color(255, 255, 255), "Please type ", Color(0, 255, 0), "!content", Color(255, 255, 255), " in chat and click to subscribe the addon opened in Steam")
end