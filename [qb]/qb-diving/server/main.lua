local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-diving:server:removeItemAfterFill', function()
   local src = source
   local Player = QBCore.Functions.GetPlayer(src)
   Player.Functions.RemoveItem("diving_fill", 1)
   TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["diving_fill"], "remove")
end)

QBCore.Functions.CreateUseableItem("diving_gear", function(source)
    TriggerClientEvent("qb-diving:client:UseGear", source)
end)

QBCore.Functions.CreateUseableItem("diving_fill", function(source)
    TriggerClientEvent("qb-diving:client:setoxygenlevel", source)
end)
