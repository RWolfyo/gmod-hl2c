--[[ -- namespace table to hold everything in
cbt = cbt or {}




-- a list of valid commands the user can enter
cbt.Commands = {
	"!kick", "!ban", "!content", "!3p", "!thirdperson", "!nextmap", "!lobby", "!restart", "!menu", "!goto", "!bring",
}




-- creates a DListView that will be used to act like the "tooltip"
-- this is positioned underneath the chatbox with the same width
function cbt.CreateList()
	if ( IsValid( cbt.List ) ) then
		--cbt.Panel:Remove()
		cbt.List:Remove()
		cbt.Panel:Remove()
	end
	
	local x, y = chat.GetChatBoxPos()
	local w, h = chat.GetChatBoxSize()
	
	local _Panel_w = 200
	local _Panel_h = 200

	local _listframe = vgui.Create( "DPanel" )
	_listframe:SetPos( x + 600, y -225 + h   )
	_listframe:SetSize( _Panel_w, _Panel_h )
	function _listframe:Paint(_Panel_w, _Panel_h)
	draw.RoundedBox(8, 0, 0, _Panel_w, _Panel_h, Color(0, 0, 0, 0) )
	end
	--_listframe:SetTitle( "DTileLayout Example" )
	--_listframe:MakePopup()

	local list = vgui.Create( "DTileLayout", _listframe )
	list:SetBaseSize( 5 ) -- Tile size
	list:Dock( FILL )

	//Draw a background so we can see what it's doing
	list:SetDrawBackground( true )
	list:SetBackgroundColor( Color( 0, 100, 100 ) )
	--list:SetTextColor(Color(255,255,0,255))
	/*
	local list = vgui.Create( "DListView" )
	list:SetPos( x + 600, y -225 + h   )
	list:SetSize( 100, 70 )
	list:AddColumn( "Commands" )
	*/
	--function list:Paint( x, y)
	--draw.RoundedBox(8, 0, 0, 160, 20, Color(208, 166, 0, 0) )
	--end
	
	cbt.List = list
	cbt.Panel = _listframe
end




-- gets a table of commands that match the full or partial text entered by the user
-- e.g., typing "Sla" would return a table with "slap" and "slay" (case insensitive) 
function cbt.GetMatchedCommands( word )
	word = word:lower():Trim()
	
	local matches  = {}
	local commands = cbt.Commands
	
	for i = 1, #commands do
		local command = commands[ i ]
		if ( command:sub( 1, word:len() ):lower() == word ) then
			matches[#matches+1] = command
		end
	end
	
	return matches
end




-- hook into GM:ChatTextChanged and listen for changes to the typed text
-- try to find commands that match what the user has typed and then
-- display them on the DListView
hook.Add( "ChatTextChanged", "Example", function( text )
	if ( not IsValid( cbt.List && cbt.Panel ) ) then cbt.CreateList() end
	
	local list = cbt.List
	local _listframe = cbt.Panel
	
	local words = text:Split( " " )
	local word = words[1]
	local matches = {}
	
	if ( word ~= "" and #words == 1 ) then 
		matches = cbt.GetMatchedCommands( word )
	end
	
	list:Clear()
	
	if ( #matches > 0 ) then
		for k, v in pairs( matches ) do
			/*
			list:AddLine( v )
			*/
			list:Add(Label(v))
		end
		_listframe:SetVisible(true)
		list:InvalidateLayout( true )
		list:SizeToContents()
		list:SetVisible( true )
		_listframe:SetVisible(true)
	else
	_listframe:SetVisible(false)
		list:SetVisible( false )
		_listframe:SetVisible(false)
	end
end )




-- hide the DListView when the users closes their chatbox
hook.Add( "FinishChat", "CloseTooltips", function()
	if ( not IsValid( cbt.List ) ) then cbt.CreateList() end
	
	cbt.List:SetVisible( false )
end ) ]]