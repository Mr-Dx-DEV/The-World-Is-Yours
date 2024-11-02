QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('qb-robnpc:giveMoney', function(source, callback)
    local Player = QBCore.Functions.GetPlayer(source)
    if math.random(1, 100) <= 50 then
        local money = math.random(Config.MinMoney, Config.MaxMoney)
        Player.Functions.AddMoney("cash", money, "robnpc")
        callback("$"..money)
    else
        local item = Config.RandomItems[math.random(1, #Config.RandomItems)]
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], 'add')
        callback(QBCore.Shared.Items[item]['label'])
    end
end)