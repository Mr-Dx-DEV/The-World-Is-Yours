local QBCore = exports['qb-core']:GetCoreObject()

--Recipe Item Callbacks
RegisterNetEvent('qb-bbq:server:CookBurger', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("b-burger", Config.BurgerAmount)
    Player.Functions.RemoveItem("b-uc-burger", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-burger'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-uc-burger'], "removed")
end)

RegisterNetEvent('qb-bbq:server:CookHotDog', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("b-hotdog", Config.HotDogAmount)
    Player.Functions.RemoveItem("b-uc-hotdog", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-hotdog'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-uc-hotdog'], "removed")
end)

RegisterNetEvent('qb-bbq:server:CookChicken', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("b-chicken", Config.ChickenAmount)
    Player.Functions.RemoveItem("b-uc-chicken", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-chicken'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-uc-chicken'], "removed")
end)

RegisterNetEvent('qb-bbq:server:CookRibs', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("b-ribs", Config.RibsAmount)
    Player.Functions.RemoveItem("b-uc-ribs", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-ribs'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-uc-ribs'], "removed")
end)

RegisterNetEvent('qb-bbq:server:CookBrisket', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("b-brisket", Config.BrisketAmount)
    Player.Functions.RemoveItem("b-uc-brisket", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-brisket'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-uc-brisket'], "removed")
end)

RegisterNetEvent('qb-bbq:server:CookJacket', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem("b-jacket", Config.JacketAmount)
    Player.Functions.RemoveItem("b-uc-jacket", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-jacket'], "add")
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['b-uc-jacket'], "removed")
end)
--buying stuff--
RegisterNetEvent('qb-bbq:server:BuyBurger', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.BuyBurgerAmount
    local item = 'b-uc-burger'
    local price = Config.BuyBurgerCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-bbq:server:BuyChicken', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.BuyChickenAmount
    local item = 'b-uc-chicken'
    local price = Config.BuyChickenCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-bbq:server:BuyHotDog', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.BuyHotDogAmount
    local item = 'b-uc-hotdog'
    local price = Config.BuyHotDogCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-bbq:server:BuyRibs', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.BuyRibsAmount
    local item = 'b-uc-ribs'
    local price = Config.BuyRibsCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-bbq:server:BuyBrisket', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.BuyBrisketAmount
    local item = 'b-uc-brisket'
    local price = Config.BuyBrisketCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)

RegisterNetEvent('qb-bbq:server:BuyJacket', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local quantity = Config.BuyJacketAmount
    local item = 'b-uc-jacket'
    local price = Config.BuyJacketCost

    Player.Functions.RemoveMoney('cash', price)
    Player.Functions.AddItem(item, quantity)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
end)