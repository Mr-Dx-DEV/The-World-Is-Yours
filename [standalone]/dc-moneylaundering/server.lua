local QBCore = exports['qb-core']:GetCoreObject()
local RequiredItem = 'launderingcard'
local RequiredCode = 'StrongPassword123'

--- Server sided checking if the player is actually nearby the door. Since config.lua is a shared script manipulation on the client side
--- doesn't get re-created on the server side. So no worries about cheaters here.
--- @param PlayerCoords which can be pulled on the server side like so. ```local PlayerCoords = GetEntityCoords(GetPlayerPed(src))```
--- @return boolean either true or false. Also which door exactly the player is nearby.
local function NearbyDoor(PlayerCoords)
    for k, v in pairs(Config.doorIDs) do
        if #(PlayerCoords - v) < 2.2 then
            return true, k
        end
    end
    return false, nil
end

local function CreateLog(id, source, Player)
    local Log = {
        [1] = 'Tried to open a door when he isn\'t even nearby it. [Log #1]',
        [2] = 'Tried to launder money when he isn\'t even nearby any washingmachines. [Log #2]',
        [3] = 'Tried to collect money when he isn\'t even nearby any washingmachines. [Log #3]',
    }
    if not Log[id] then TriggerEvent('qb-log:server:CreateLog', 'laundering', 'Laundering', 'green', 'Tried to create a log which doesn\'t exist. #'..id) print('Tried to create a log which doesn\'t exist. #'..id) return end
    TriggerEvent('qb-log:server:CreateLog', 'laundering', 'Laundering', 'green', string.format("**%s** (CitizenID: %s | ID: %s) - %s", GetPlayerName(source), Player.PlayerData.citizenid, source, Log[id]))
end

--- Standard function to round a number.
local function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

--- Entering: check if the player is actually nearby before opening the door. Both password and item methods below.
RegisterNetEvent('qb-moneylaundering:check:password', function(Password)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerCoords = GetEntityCoords(GetPlayerPed(src))
    local Nearby, DoorID = NearbyDoor(PlayerCoords)

    if not Nearby then CreateLog(1, src, Player) return end
    if Password ~= RequiredCode then return end

    TriggerEvent('qb-doorlock:server:updateState', DoorID, false, false, false, true, true, true, src)
end)

--- Item creation in the core if set to true.
if Config.useItem then
    QBCore.Functions.CreateUseableItem(RequiredItem, function(source, item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local PlayerCoords = GetEntityCoords(GetPlayerPed(src))
        local Nearby, DoorID = NearbyDoor(PlayerCoords)

        if not Player.Functions.GetItemByName(RequiredItem) then return end
        if not Nearby then CreateLog(1, src, Player) return end

        if Config.removeItem then Player.Functions.RemoveItem(RequiredItem) end
        TriggerEvent('qb-doorlock:server:updateState', DoorID, false, false, false, true, true, true, src)
    end)
end

RegisterNetEvent('qb-moneylaundering:launder', function(WashingmachineID)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerCoords = GetEntityCoords(GetPlayerPed(src))
    local Machine = Config.washingmachines[WashingmachineID]

    if #(PlayerCoords - Machine.coords) > 4 then CreateLog(2, src, Player) return end
    if Machine.inUse == true then TriggerClientEvent('QBCore:Notify', src, 'This one is already in use', 'error') return end
    if Machine.worth ~= 0 then return end
    if not Player.Functions.GetItemByName('markedbills') then TriggerClientEvent('QBCore:Notify', src, 'You don\'t have any marked bills', 'error') return end

    local Item = Player.Functions.GetItemByName('markedbills')
    Machine.worth = Item.info.worth * Item.amount
    Player.Functions.RemoveItem('markedbills', Item.amount)

    local Subtract = (Machine.worth * math.random(Config.percentage.min, Config.percentage.max)) / 100
    Machine.worth = round(Machine.worth - Subtract, 2)
    SetResourceKvpFloat('washingmachine'..WashingmachineID, Machine.worth)

    Machine.inUse = true
    TriggerClientEvent('qb-moneylaundering:client:sync', -1, Config)
    TriggerClientEvent('qb-moneylaundering:client:particle', src, WashingmachineID)
    TriggerClientEvent('QBCore:Notify', src, 'You turned on the machine', 'success')
    TriggerEvent('qb-log:server:CreateLog', 'laundering', 'Laundering', 'green', string.format("**%s** (CitizenID: %s | ID: %s) - Put %sx %s inside of machine %s making it worth: %s", GetPlayerName(src), Player.PlayerData.citizenid, src, Item.amount, Item.info.worth, WashingmachineID, Machine.worth))
    SetTimeout(Config.timer, function()
        Machine.inUse = false
        TriggerClientEvent('qb-moneylaundering:client:sync', -1, Config)
        TriggerClientEvent('QBCore:Notify', src, 'The laundromat has finished', 'success')
    end)
end)

RegisterNetEvent('qb-moneylaundering:launder:collect', function(WashingmachineID)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local PlayerCoords = GetEntityCoords(GetPlayerPed(src))
    local Machine = Config.washingmachines[WashingmachineID]

    if #(PlayerCoords - Machine.coords) > 4 then CreateLog(3, src, Player) return end
    if Machine.inUse == true then TriggerClientEvent('QBCore:Notify', src, 'This one is still in use', 'error') return end
    if Machine.worth == 0 then TriggerClientEvent('QBCore:Notify', src, 'This one is empty', 'error') return end

    Player.Functions.AddMoney('cash', Machine.worth, 'laundering')
    TriggerEvent('qb-log:server:CreateLog', 'laundering', 'Laundering', 'green', string.format("**%s** (CitizenID: %s | ID: %s) - Got %s from machine %s", GetPlayerName(src), Player.PlayerData.citizenid, src, Machine.worth, WashingmachineID))
    Machine.worth = 0
    SetResourceKvpFloat('washingmachine'..WashingmachineID, Machine.worth)
    TriggerClientEvent('qb-moneylaundering:client:sync', -1, Config)
end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    for i = 1, #Config.washingmachines do
        Config.washingmachines[i].worth = round(GetResourceKvpFloat('washingmachine'..i), 2)
    end
    SetTimeout(400, function() TriggerClientEvent('qb-moneylaundering:client:sync', -1, Config) end)
end)

AddEventHandler('playerJoining', function(source)
    TriggerClientEvent('qb-moneylaundering:client:sync', source, Config)
end)
