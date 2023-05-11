ESX = exports['es_extended']:getSharedObject()
local IdentifierOnline = {}

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
    if not xPlayer then
        xPlayer = ESX.GetPlayerFromId(playerId)
    end
    IdentifierOnline[xPlayer.identifier] = true
    TriggerClientEvent('errorism.isonline:update', -1, xPlayer.identifier,true)
end)
AddEventHandler('playerDropped', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then return end
    IdentifierOnline[xPlayer.identifier] = false
    TriggerClientEvent('errorism.isonline:update', -1, xPlayer.identifier,false)
end)

function IsOnline(identifier)
    return IdentifierOnline[identifier] or false
end
exports('IsOnline', IsOnline)