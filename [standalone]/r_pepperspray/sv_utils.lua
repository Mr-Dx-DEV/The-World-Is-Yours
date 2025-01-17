/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/advanced-pepper-spray
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

if Config.RemoveWhenIsEmpty.framework.ESX then
    ESX = exports["es_extended"]:getSharedObject()
elseif Config.RemoveWhenIsEmpty.framework.QBCore then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent('r_pepperspray:server:removeItem', function(itemName)
    if Config.RemoveWhenIsEmpty.framework.ESX then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeWeapon(itemName)
    elseif Config.RemoveWhenIsEmpty.framework.QBCore then
        exports['qb-inventory']:RemoveItem(source, itemName, 1, false)
    elseif Config.RemoveWhenIsEmpty.framework.OXInventory then
        exports.ox_inventory:RemoveItem(source, itemName, 1)
    end
end)