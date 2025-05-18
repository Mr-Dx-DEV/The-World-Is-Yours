local server = require 'modules.framework.server'
local utils = require 'modules.utils.server'

local officeCodes = {
    [1] = utils.generatePassword(5),
    [2] = utils.generatePassword(5),
    [3] = utils.generatePassword(5),
}

local checkingPasscode = false
local paletoInputCorrect = false
local paletoInputCache = {
    [1] = nil,
    [2] = nil,
    [3] = nil
}

--- Functions

ResetPaletoValues = function()
    Config.Banks['Paleto'].securityEntrance.hacked = false
    Config.Banks['Paleto'].sideEntrance.hacked = false
    Config.Banks['Paleto'].sideHack.hacked = false
    Config.Banks['Paleto'].officeHacks[1].hacked = false
    Config.Banks['Paleto'].officeHacks[2].hacked = false
    Config.Banks['Paleto'].officeHacks[3].hacked = false

    officeCodes = {
        [1] = utils.generatePassword(5),
        [2] = utils.generatePassword(5),
        [3] = utils.generatePassword(5),
    }

    checkingPasscode = false
    paletoInputCorrect = false
    paletoInputCache = {
        [1] = nil,
        [2] = nil,
        [3] = nil
    }

    utils.doorUpdate(src, Config.Banks['Paleto'].securityEntrance.id, true)
    utils.doorUpdate(src, Config.Banks['Paleto'].sideEntrance.id, true)
    utils.doorUpdate(src, Config.Banks['Paleto'].sideHack.id, true)
    
    utils.print('Paleto Office Code 1: ' .. officeCodes[1])
    utils.print('Paleto Office Code 2: ' .. officeCodes[2])
    utils.print('Paleto Office Code 3: ' .. officeCodes[3])
end

--- Events

RegisterNetEvent('bankrobbery:server:RemoveGreenCard', function()
    local src = source
    server.removeItem(src, 'security_card_01', 1)
end)

RegisterNetEvent('bankrobbery:server:SetPaletoSideHacked', function(hack)
    local src = source
    if not Config.Banks['Paleto'][hack] then return end
    if Config.Banks['Paleto'][hack].hacked then return end

    Config.Banks['Paleto'][hack].hacked = true
    TriggerClientEvent('bankrobbery:client:SetPaletoSideHacked', -1, hack)

    utils.doorUpdate(src, Config.Banks['Paleto'][hack].id, false)
end)

RegisterNetEvent('bankrobbery:server:SetPaletoOfficeHacked', function(id)
    local src = source
    if not Config.Banks['Paleto'].officeHacks[id] then return end
    if Config.Banks['Paleto'].officeHacks[id].hacked then return end
    
    Config.Banks['Paleto'].officeHacks[id].hacked = true
    TriggerClientEvent('bankrobbery:client:SetPaletoOfficeHacked', -1, id)

    TriggerClientEvent('var-ui:on', src, officeCodes[id])
    utils.doorUpdate(src, Config.Banks['Paleto'].officeHacks[id].id, false)
end)

RegisterNetEvent('bankrobbery:server:EnterPaletoPassword', function(id, input)
    local src = source
    if not Config.Banks['Paleto'].officeHacks[id].hacked then return end
    if paletoInputCorrect then return end

    paletoInputCache[id] = input

    if not checkingPasscode then
        checkingPasscode = true

        SetTimeout(Config.BankSettings.PaletoInputTime, function()
            if officeCodes[1] == paletoInputCache[1] and officeCodes[2] == paletoInputCache[2] and officeCodes[3] == paletoInputCache[3] then
                paletoInputCorrect = true
                utils.notify(src, Locales['paleto_inputs_success'], 'success', 4000)
            else
                checkingPasscode = false

                paletoInputCache[1] = nil
                paletoInputCache[2] = nil
                paletoInputCache[3] = nil

                utils.notify(src, Locales['paleto_inputs_fail'], 'error', 4000)
            end
        end)
    end
end)

--- Callbacks

lib.callback.register('bankrobbery:server:CanAttemptPaletoHack', function(source, hack)
    local src = source
    if Config.Banks['Paleto'][hack].hacked then
        utils.notify(src, Locales['laptop_hit'], 'error', 4000)
        return false
    elseif GetCopCount() < Config.MinCops['paleto'] then
        utils.notify(src, Locales['not_enough_cops']:format(Config.MinCops['paleto']), 'error', 4000)      
        return false
    else
        return true
    end
end)

lib.callback.register('bankrobbery:server:CanPaletoBankPanelHack', function(source)
    return paletoInputCorrect
end)

--- Threads

CreateThread(function()
    utils.print('Paleto Office Code 1: ' .. officeCodes[1])
    utils.print('Paleto Office Code 2: ' .. officeCodes[2])
    utils.print('Paleto Office Code 3: ' .. officeCodes[3])
end)
