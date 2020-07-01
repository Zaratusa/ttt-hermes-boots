-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

CreateConVar("ttt_hermesboots_detective_loadout", 0, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Should Detectives have the Hermes Boots in their loadout?", 0, 1)
CreateConVar("ttt_hermesboots_traitor_loadout", 0, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE}, "Should Traitors have the Hermes Boots in their loadout?", 0, 1)