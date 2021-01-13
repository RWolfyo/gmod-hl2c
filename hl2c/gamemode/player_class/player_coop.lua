
if SERVER then AddCSLuaFile() end

include("taunt_camera.lua")

DEFINE_BASECLASS( "player_default" )

local PLAYER = {}

PLAYER.DisplayName			= "Co-Op Class"

--PLAYER.AvoidPlayers			= false
PLAYER.MaxHealth			= 100		-- Max health we can have
PLAYER.StartHealth			= 100		-- How much health we start with
PLAYER.TauntCam = TauntCamera()

function PLAYER:GetHandsModel()

	if ( tobool( self.Player:GetInfo( "cl_playerhands" ) ) ) then
	
		local playermodel = player_manager.TranslateToPlayerModelName( self.Player:GetModel() )
		return player_manager.TranslatePlayerHands( playermodel )
	
	else
	
		return { model = "models/weapons/c_arms_hev.mdl", skin = 1, body = "0100000" }
	
	end

end

function PLAYER:ShouldDrawLocal() 

	if ( self.TauntCam:ShouldDrawLocalPlayer( self.Player, self.Player:IsPlayingTaunt() ) ) then return true end

end

function PLAYER:CreateMove( cmd )

	if ( self.TauntCam:CreateMove( cmd, self.Player, self.Player:IsPlayingTaunt() ) ) then return true end

end

function PLAYER:CalcView( view )

	if ( self.TauntCam:CalcView( view, self.Player, self.Player:IsPlayingTaunt() ) ) then return true end

end

player_manager.RegisterClass( "player_coop", PLAYER, "player_default" )
