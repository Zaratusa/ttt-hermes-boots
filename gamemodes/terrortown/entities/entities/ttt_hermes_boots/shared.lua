-- author "Zaratusa"
-- contact "http://steamcommunity.com/profiles/76561198032479768"

CreateConVar("ttt_hermesboots_detective", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Detectives be able to buy the Hermes Boots?", 0, 1)
CreateConVar("ttt_hermesboots_traitor", 1, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "Should Traitors be able to buy the Hermes Boots?", 0, 1)
local speed = CreateConVar("ttt_hermesboots_speed", 1.3, {FCVAR_SERVER_CAN_EXECUTE, FCVAR_ARCHIVE, FCVAR_REPLICATED}, "The speed multiplier for the Hermes Boots.")

EQUIP_HERMES_BOOTS = (GenerateNewEquipmentID and GenerateNewEquipmentID()) or 32

local perk = {
	id = EQUIP_HERMES_BOOTS,
	loadout = false,
	type = "item_passive",
	material = "vgui/ttt/icon_hermes_boots",
	name = "hermes_boots_name",
	desc = "hermes_boots_desc",
	hud = true
}

if (GetConVar("ttt_hermesboots_detective"):GetBool()) then
	if SERVER then
		perk["loadout"] = GetConVar("ttt_hermesboots_detective_loadout"):GetBool()
	end
	table.insert(EquipmentItems[ROLE_DETECTIVE], perk)
end
if (GetConVar("ttt_hermesboots_traitor"):GetBool()) then
	if SERVER then
		perk["loadout"] = GetConVar("ttt_hermesboots_traitor_loadout"):GetBool()
	end
	table.insert(EquipmentItems[ROLE_TRAITOR], perk)
end

--[[Perk logic]]--
hook.Add("TTTPlayerSpeedModifier", "TTTHermesBoots", function(ply)
	if (IsValid(ply) and ply:Alive() and ply:IsTerror() and ply:HasEquipmentItem(EQUIP_HERMES_BOOTS)) then
		-- ply.mult is for compatibility with TTT Sprint (ID: 933056549)
		if (EQUIP_JUGGERNAUT_SUIT and ply:HasEquipmentItem(EQUIP_JUGGERNAUT_SUIT)) then
			return (ply.mult or 1) * speed:GetFloat() * GetConVar("ttt_juggernautsuit_speed"):GetFloat() -- multiply with the speed of the Juggernaut Suit
		else
			return (ply.mult or 1) * speed:GetFloat()
		end
	end
end)
