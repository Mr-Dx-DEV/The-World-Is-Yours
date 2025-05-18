local server = require 'modules.framework.server'
local utils = require 'modules.utils.server'

--- Events

RegisterNetEvent('bankrobbery:server:GrabFleecaKeycard', function(data)
    local src = source

    -- Sent data check
    local bank = data.bank
    if not Config.Banks[bank] then return end

    local bankType = Config.Banks[bank].type
    if bankType ~= 'fleeca' then return end

    -- Distance Check
    local pos = GetEntityCoords(GetPlayerPed(src))
    if #(pos - Config.Banks[bank].coords) > 15.0 then return end

    -- Check if card taken
    if Config.Banks[bank].keycardTaken then
        utils.notify(src, Locales['keycard_taken'], 'error', 3000)
        return
    end

    -- Check Copcount
    if GetCopCount() < Config.MinCops[bankType] then
        utils.notify(src, Locales['not_enough_cops']:format(Config.MinCops[bankType]), 'error', 4000)
        return
    end

    -- Set Card Taken
    Config.Banks[bank].keycardTaken = true

    -- Add Card Item
    local metaData = {
        bank = bank
    }

    server.addItem(src, 'fleeca_bankcard', 1, metaData)

    -- Sync with clients
    TriggerClientEvent('bankrobbery:client:SetFleecaCardTaken', -1, bank)
end)

RegisterNetEvent('bankrobbery:server:HackInnerPanel', function(bank)
    local src = source

    if not Config.Banks[bank] then return end

    Config.Banks[bank].innerDoor.hacked = true

    utils.doorUpdate(src, Config.Banks[bank].innerDoor.id, false)
    TriggerClientEvent('bankrobbery:client:SetInnerHacked', -1, bank)
end)

--- Items

server.registerUseableItem('fleeca_bankcard', function(source, item)
    local coords = GetEntityCoords(GetPlayerPed(source))

    local bank = item.info?.bank or item.metadata?.bank

    if bank then
        if #(coords - Config.Banks[bank].door.coords) < 5.0 then
            -- Remove Card
            server.removeItem(source, item.name, 1, nil, item.slot)

            -- Unlock door
            utils.doorUpdate(source, Config.Banks[bank].door.id, false)

            -- Notify
            utils.notify(source, Locales['keycard_used'], 'success', 3000)
        end
    end
end)
