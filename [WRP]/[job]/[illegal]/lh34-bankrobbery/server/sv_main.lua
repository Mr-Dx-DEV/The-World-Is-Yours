local server = require 'modules.framework.server'
local utils = require 'modules.utils.server'
local Rewards = require 'server.sv_rewards'

robberyBusy = {
    fleeca = false,
    maze = false,
    paleto = false,
    pacific = false    
}

--- Functions

GetCopCount = function()
    local amount = 0
    local Players = server.GetPlayers()

    for _, Player in pairs(Players) do
        if server.isPlayerPolice(Player) then
            amount += 1
        end
    end

    return amount
end

local ResetBank = function(bank)
    -- Door    
    Config.Banks[bank].hacked = false
    Config.Banks[bank].policeClose = false

    -- lockers
    for i=1, #Config.Banks[bank].lockers, 1 do
        Config.Banks[bank].lockers[i].busy = false
        Config.Banks[bank].lockers[i].taken = false
    end

    -- Trollys
    ClearTrollys()
    for j=1, #Config.Banks[bank].trolly, 1 do
        Config.Banks[bank].trolly[j].taken = false
        Config.Banks[bank].trolly[j].busy = false
    end

    -- Thermite spots
    if Config.Banks[bank].thermite then
        for k=1, #Config.Banks[bank].thermite, 1 do
            Config.Banks[bank].thermite[k].hit = false
            utils.doorUpdate(src, Config.Banks[bank].thermite[k].doorId, true)
        end
    end

    -- Fleeca
    if Config.Banks[bank].type == 'fleeca' then
        Config.Banks[bank].keycardTaken = false
        Config.Banks[bank].innerDoor.hacked = false

        utils.doorUpdate(src, Config.Banks[bank].door.id, true)
        utils.doorUpdate(src, Config.Banks[bank].innerDoor.id, true)
    end

    -- Big Banks
    if bank == 'Paleto' then
        ResetPaletoValues()
    elseif bank == 'Pacific' then
        ResetPaletoValues()
    end

    robberyBusy[Config.Banks[bank].type] = false
    utils.scoreboardUpdate(Config.Banks[bank].type, false)
    TriggerClientEvent('bankrobbery:client:ResetBank', -1, bank)
    utils.print('Resetting ' .. bank)
end

--- Events

RegisterNetEvent('bankrobbery:server:SetBankHacked', function(bank)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local PlayerData = server.getPlayerData(Player)

    if not Config.Banks[bank] then return end
    if Config.Banks[bank].hacked then return end

    Config.Banks[bank].hacked = true
    robberyBusy[Config.Banks[bank].type] = true
    utils.scoreboardUpdate(Config.Banks[bank].type, true)

    CreateTrollys(bank)

    utils.phoneMail(src, PlayerData.identifier, Locales['mail_sender'], bank, Locales['mail_message'])

    SetTimeout(Config.BankSettings.VaultUnlockTime * 1000, function()
        TriggerClientEvent('bankrobbery:client:SetBankHacked', -1, bank)
    end)

    SetTimeout(Config.Cooldown[Config.Banks[bank].type] * 60 * 1000, function() -- Cooldown timer
        ResetBank(bank)
    end)
end)

RegisterNetEvent('bankrobbery:server:PDClose', function(data)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local bank = data.bank
    if not Config.Banks[bank] then return end
    
    if not server.isPlayerPolice(Player) then return end

    Config.Banks[bank].policeClose = not Config.Banks[bank].policeClose
    TriggerClientEvent('bankrobbery:client:PDClose', -1, bank)
end)

RegisterNetEvent('bankrobbery:server:SetTrollyBusy', function(bank, index)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))
    if not Config.Banks[bank] or not Config.Banks[bank].trolly[index] then return end
    if #(coords - Config.Banks[bank].trolly[index].coords.xyz) > 2.0 then return end

    Config.Banks[bank].trolly[index].busy = true
    TriggerClientEvent('bankrobbery:client:SetTrollyBusy', -1, bank, index)
end)

RegisterNetEvent('bankrobbery:server:TrollyReward', function(netId, bank, index)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local PlayerData = server.getPlayerData(Player)

    if type(netId) ~= 'number' or not Config.Banks[bank] or not Config.Banks[bank].trolly[index] then return end

    local entity = NetworkGetEntityFromNetworkId(netId)
    if entity ~= trollies[bank][index] then return end
    
    if #(GetEntityCoords(GetPlayerPed(src)) - Config.Banks[bank].trolly[index].coords.xyz) > 10 then return end
    if Config.Banks[bank].trolly[index].taken then return end

    TriggerClientEvent('bankrobbery:client:SetTrollyTaken', -1, bank, index)
    Config.Banks[bank].trolly[index].taken = true

    SwapTrolly(bank, index, entity)

    local bankType = Config.Banks[bank].type
    local rewardType = Config.Banks[bank].trolly[index].type

    if rewardType == 'money' then
        local receiveAmount = math.random(Rewards.Trollys[rewardType][bankType].minAmount, Rewards.Trollys[rewardType][bankType].maxAmount)
        
        local metaData = {
            worth = math.random(Rewards.Trollys[rewardType][bankType].minWorth, Rewards.Trollys[rewardType][bankType].maxWorth)
        }

        server.addItem(src, 'markedbills', receiveAmount, metaData)

        server.createLog(PlayerData.name, 'Trolly Reward', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' Received ' .. receiveAmount .. ' x markedbills')
    elseif rewardType == 'gold' then
        local receiveAmount = math.random(Rewards.Trollys[rewardType][bankType].minAmount, Rewards.Trollys[rewardType][bankType].maxAmount)

        server.addItem(src, 'goldbar', receiveAmount)

        server.createLog(PlayerData.name, 'Trolly Reward', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' Received ' .. receiveAmount .. ' x goldbar')
    end
end)

RegisterNetEvent('bankrobbery:server:SetLockerBusy', function(bank, index)
    local src = source
    local coords = GetEntityCoords(GetPlayerPed(src))
    if not Config.Banks[bank] or not Config.Banks[bank].lockers[index] then return end
    if #(coords - Config.Banks[bank].lockers[index].coords.xyz) > 5.0 then return end

    Config.Banks[bank].lockers[index].busy = true
    TriggerClientEvent('bankrobbery:client:SetLockerBusy', -1, bank, index)
end)

RegisterNetEvent('bankrobbery:server:LockerReward', function(bank, index)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local PlayerData = server.getPlayerData(Player)

    if not Config.Banks[bank] or not Config.Banks[bank].lockers[index] then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - Config.Banks[bank].lockers[index].coords.xyz) > 10 then return end
    if Config.Banks[bank].lockers[index].taken then return end

    TriggerClientEvent('bankrobbery:client:SetLockerTaken', -1, bank, index)
    Config.Banks[bank].lockers[index].taken = true

    local bankType = Config.Banks[bank].type

    if math.random(100) < Rewards.Lockers[bankType].rareChance then -- Rare item loot
        server.addItem(src, Rewards.Lockers[bankType].rareItem, 1)
        server.createLog(PlayerData.name, 'Locker Reward', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' Received 1 x ' .. Rewards.Lockers[bankType].rareItem)
    else
        local randomItem = Rewards.Lockers[bankType].items[math.random(#Rewards.Lockers[bankType].items)]
        local receiveAmount = math.random(Rewards.Lockers[bankType].amount.minAmount, Rewards.Lockers[bankType].amount.maxAmount)
        
        server.addItem(src, randomItem, receiveAmount)
        server.createLog(PlayerData.name, 'Locker Reward', PlayerData.name .. ' (identifier: ' .. PlayerData.identifier .. ' | id: ' .. src .. ')' .. ' Received ' .. receiveAmount .. ' x ' .. randomItem)
    end
end)

RegisterNetEvent('bankrobbery:server:RemoveThermite', function()
    local src = source
    server.removeItem(src, 'thermite', 1)
end)

RegisterNetEvent('bankrobbery:server:SetThermiteHit', function(bank, index)
    Config.Banks[bank].thermite[index].hit = true
    TriggerClientEvent('bankrobbery:client:SetThermiteHit', -1, bank, index)
end)

RegisterNetEvent('bankrobbery:server:ThermitePtfx', function(bank, index)
    local src = source
    local coords = Config.Banks[bank].thermite[index].ptfx
    TriggerClientEvent('bankrobbery:client:ThermitePtfx', -1, coords)

    Wait(27000)
    utils.doorUpdate(src, Config.Banks[bank].thermite[index].doorId, false)
end)

--- Callbacks

lib.callback.register('bankrobbery:server:GetConfig', function(source)
    return Config
end)

lib.callback.register('bankrobbery:server:CanAttemptBankRobbery', function(source, bank)
    local src = source
    local bankType = Config.Banks[bank].type

    if robberyBusy[bankType] then
        utils.notify(src, Locales['bank_cooldown'], 'error', 4000)
        return false
    elseif GetCopCount() < Config.MinCops[bankType] then
        utils.notify(src, Locales['not_enough_cops']:format(Config.MinCops[bankType]), 'error', 4000)
        return false
    else
        return true
    end
end)

--- Items

server.registerUseableItem('thermite', function(source, item)
    TriggerClientEvent('thermite:UseThermite', source)
end)
