local server = require 'modules.framework.server'
local utils = require 'modules.utils.server'

local usbItems = {
    'pacific_key1',
    'pacific_key2',
    'pacific_key3',
    'pacific_key4'
}

local vaultCodes = {
    [1] = utils.generatePassword(4),
    [2] = utils.generatePassword(4),
}

local checkingPacificPasscode = false
local pacificInputCorrect = false
local pacificInputCache = {
    [1] = false,
    [2] = false
}

--- Functions

ResetPacificValues = function()
    Config.Banks['Pacific'].lockdown = false
    Config.Banks['Pacific'].laserPanel = false
    Config.Banks['Pacific'].sideEntrance.hacked = false
    Config.Banks['Pacific'].computers['main'].hacked = false
    Config.Banks['Pacific'].computers['office1'].hacked = false
    Config.Banks['Pacific'].computers['office2'].hacked = false
    Config.Banks['Pacific'].computers['office3'].hacked = false
    Config.Banks['Pacific'].computers['office4'].hacked = false
    Config.Banks['Pacific'].sideVaults[1].hacked = false
    Config.Banks['Pacific'].sideVaults[2].hacked = false

    vaultCodes = {
        [1] = utils.generatePassword(4),
        [2] = utils.generatePassword(4),
    }

    checkingPacificPasscode = false
    pacificInputCorrect = false
    pacificInputCache = {
        [1] = false,
        [2] = false
    }
    
    for i = 1, 4, 1 do
        local drawer = math.random(#Config.Banks['Pacific'].searchDrawers)

        while Config.Banks['Pacific'].searchDrawers[drawer].usb do
            drawer = math.random(#Config.Banks['Pacific'].searchDrawers)
        end

        Config.Banks['Pacific'].searchDrawers[drawer].usb = true
        utils.print('Pacific Drawer USB: ' .. drawer)
    end

    utils.print('Pacific Code 1: ' .. vaultCodes[1])
    utils.print('Pacific Code 2: ' .. vaultCodes[2])
end

--- Events

RegisterNetEvent('bankrobbery:server:RemoveGoldCard', function()
    local src = source
    server.removeItem(src, 'security_card_02', 1)
end)

RegisterNetEvent('bankrobbery:server:SetPacificSideHacked', function()
    local src = source
    if Config.Banks['Pacific'].sideEntrance.hacked then return end

    Config.Banks['Pacific'].sideEntrance.hacked = true
    TriggerClientEvent('bankrobbery:client:SetPacificSideHacked', -1)

    utils.doorUpdate(src, Config.Banks['Pacific'].sideEntrance.id, false)
end)

RegisterNetEvent('bankrobbery:server:SetPacificComputerHacked', function(computer)
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local PlayerData = server.getPlayerData(Player)

    if not Config.Banks['Pacific'].computers[computer] then return end
    if Config.Banks['Pacific'].computers[computer].hacked then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - Config.Banks['Pacific'].computers[computer].coords) > 5 then return end

    Config.Banks['Pacific'].computers[computer].hacked = true
    TriggerClientEvent('bankrobbery:client:SetPacificComputerHacked', -1, computer)

    if computer == 'main' then
        TriggerClientEvent('var-ui:on', src, vaultCodes[1])

        -- Instruction Email
        utils.phoneMail(src, PlayerData.citizenid, Locales['pacific_mail_sender'], Locales['pacific_mail_subject'], Locales['pacific_mail_text1']:format(vaultCodes[1]) .. Locales['pacific_mail_text2'])

        -- Unlock Doors
        utils.doorUpdate(src, 'bankrobbery-pacific-door1', false)
        utils.doorUpdate(src, 'bankrobbery-pacific-door2', false)
        utils.doorUpdate(src, 'bankrobbery-pacific-door3', false)
        utils.doorUpdate(src, 'bankrobbery-pacific-door4', false)

        return
    elseif computer == 'office1' then
        TriggerClientEvent('var-ui:on', src, string.sub(vaultCodes[2], 1, 1) .. '...')
    elseif computer == 'office2' then
        TriggerClientEvent('var-ui:on', src, '.' .. string.sub(vaultCodes[2], 2, 2) .. '..')
    elseif computer == 'office3' then
        TriggerClientEvent('var-ui:on', src, '..' .. string.sub(vaultCodes[2], 3, 3) .. '.')
    elseif computer == 'office4' then
        TriggerClientEvent('var-ui:on', src, '...' .. string.sub(vaultCodes[2], 4, 4))
    else
        return
    end

    server.removeItem(src, Config.Banks['Pacific'].computers[computer].key, 1)
end)

RegisterNetEvent('bankrobbery:server:SearchDrawer', function(drawer)
    if not Config.Banks['Pacific'].searchDrawers[drawer] then return end
    local src = source
    local Player = server.GetPlayerFromId(src)
    if not Player then return end

    local PlayerData = server.getPlayerData(Player)

    if #(GetEntityCoords(GetPlayerPed(src)) - Config.Banks['Pacific'].searchDrawers[drawer].coords.xyz) > 10 then return end

    if Config.Banks['Pacific'].searchDrawers[drawer].usb then
        local random = math.random(#usbItems)
        local item = usbItems[random]

        Config.Banks['Pacific'].searchDrawers[drawer].usb = false
        table.remove(usbItems, random)
        
        utils.notify(src, Locales['pacific_found_datakey'], 'success', 3000)

        server.addItem(src, item, 1)
    else
        utils.notify(src, Locales['pacific_found_no_datakey'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:server:EnterPacificCode', function(panel, input)
    local src = source
    if not vaultCodes[panel] then return end
    if not Config.Banks['Pacific'].computers['main'].hacked then return end

    if vaultCodes[panel] == input then
        pacificInputCache[panel] = true

        if not checkingPacificPasscode then
            checkingPacificPasscode = true

            SetTimeout(Config.BankSettings.PacificInputTime, function()
                if pacificInputCache[1] and pacificInputCache[2] then
                    pacificInputCorrect = true
                    utils.notify(src, Locales['pacific_input_authorized'], 'success', 3000)

                    utils.doorUpdate(src, 'bankrobbery-vault-door1', false)
                    utils.doorUpdate(src, 'bankrobbery-vault-door2', false)

                    CreateTrollys('Pacific')
                else
                    utils.notify(src, Locales['pacific_input_timing'], 'error', 3000)

                    pacificInputCache[1] = false
                    pacificInputCache[2] = false
                    checkingPacificPasscode = false
                end
            end)

        end
    else
        utils.notify(src, Locales['pacific_input_incorrect'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:server:HitByLaser', function()
    local src = source
    if Config.Banks['Pacific'].lockdown then return end

    Config.Banks['Pacific'].lockdown = true
    TriggerClientEvent('bankrobbery:client:SetLockdownActive', -1)

    utils.notify(src, Locales['pacific_hitbylaser'], 'inform', 3000)
end)

RegisterNetEvent('bankrobbery:server:LaserPowerSupplyDisabled', function()
    if Config.Banks['Pacific'].lockdown then return end
    if Config.Banks['Pacific'].laserPanel then return end

    Config.Banks['Pacific'].laserPanel = true
    TriggerClientEvent('bankrobbery:client:LaserPowerSupplyDisabled', -1)
end)

RegisterNetEvent('bankrobbery:server:PacificSideVaultHacked', function(vault)
    local src = source
    if not Config.Banks['Pacific'].sideVaults[vault] then return end
    if Config.Banks['Pacific'].lockdown then return end
    if Config.Banks['Pacific'].sideVaults[vault].hacked then return end
    if #(GetEntityCoords(GetPlayerPed(src)) - Config.Banks['Pacific'].sideVaults[vault].laptop.xyz) > 5 then return end

    Config.Banks['Pacific'].sideVaults[vault].hacked = true
    TriggerClientEvent('bankrobbery:client:PacificSideVaultHacked', -1, vault)

    utils.doorUpdate(src, Config.Banks['Pacific'].sideVaults[vault].id, false)
end)

--- Callbacks

lib.callback.register('bankrobbery:server:CanAttemptPacificHack', function(source)
    local src = source
    if Config.Banks['Pacific'].sideEntrance.hacked then
        utils.notify(src, Locales['pacific_sidehack_hit'], 'error', 4000)
        return false
    elseif GetCopCount() < Config.MinCops['pacific'] then
        utils.notify(src, Locales['not_enough_cops']:format(Config.MinCops['pacific']), 'error', 4000)        
        return false
    else
        return true
    end
end)

--- Threads

CreateThread(function()
    for i = 1, 4, 1 do
        local drawer = math.random(#Config.Banks['Pacific'].searchDrawers)

        while Config.Banks['Pacific'].searchDrawers[drawer].usb do
            drawer = math.random(#Config.Banks['Pacific'].searchDrawers)
        end
        
        Config.Banks['Pacific'].searchDrawers[drawer].usb = true
        utils.print('Pacific Drawer USB: ' .. drawer)
    end

    utils.print('Pacific Code 1: ' .. vaultCodes[1])
    utils.print('Pacific Code 2: ' .. vaultCodes[2])

end)
