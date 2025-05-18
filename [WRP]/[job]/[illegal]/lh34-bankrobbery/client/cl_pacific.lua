local client = require 'modules.framework.client'
local target = require 'modules.target.client'
local utils = require 'modules.utils.client'

local lasersActive = false
local lasers = {}

--- Functions

--- Starts all laser movement
---@return nil
local enableLasers = function()
    for _, laser in ipairs(lasers) do 
        laser.setActive(true)
        laser.setMoving(true)
    end

    while Config.Banks['Pacific'].lockdown and lasersActive do
        for _, laser in ipairs(lasers) do laser.setVisible(true) end
        Wait(500)
        for _, laser in ipairs(lasers) do laser.setVisible(false) end
        Wait(500)
    end
end

--- Stops all laser movement
---@return nil
local disableLasers = function()
    for _, laser in ipairs(lasers) do 
        laser.setActive(false)
        laser.setMoving(false)
    end
end

--- Function called when entering Vault zone
---@return nil
local enterVault = function()
    if Config.Banks['Pacific'].laserPanel and exports['lh34-powerplant']:getPowerPlantState('city') then
        print('Do not start lasers')
    else
        lasersActive = true
        enableLasers()
    end
end

--- Function called when exiting Vault Zone
---@return nil
local exitVault = function()
    if lasersActive then
        lasersActive = false
        disableLasers()
    end
end

--- Zones

local vaultZone = lib.zones.poly({
    points = {
        vec3(266.50, 201.01, 97.50),
        vec3(218.86, 216.76, 97.50),
        vec3(232.22, 249.76, 97.50),
        vec3(278.16, 230.26, 97.50)
    },
    thickness = 3,
    debug = Config.Debug,
    onEnter = enterVault,
    onExit = exitVault
})

--- Events

RegisterNetEvent('bankrobbery:client:PacificSideHack', function(data)
    if Config.Banks['Pacific'].sideEntrance.hacked then return end
    
    local canAttempt = lib.callback.await('bankrobbery:server:CanAttemptPacificHack', 200)
    if not canAttempt then return end

    -- START VOLANTIS SPECIFIC
    local hasItem = client.hasItems('security_card_02')
    if not hasItem then
        utils.notify(Locales['missing_items'], 'error', 2500)
        return
    end

    TriggerServerEvent('bankrobbery:server:RemoveGoldCard')
    -- END VOLANTIS SPECIFIC

    local ped = cache.ped
    TaskTurnPedToFaceEntity(ped, data.entity, 1.0)

    if lib.progressBar({
        duration = math.random(5000, 10000),
        label = Locales['pacific_progressbar_sidehack'],
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true, mouse = false },
        anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
    }) then 
        utils.alertPolice(Config.Banks['Pacific'].type)

        exports['varhack']:OpenHackingGame(function(success)
            if success then 
                PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
                TriggerServerEvent('bankrobbery:server:SetPacificSideHacked')
            else
                utils.notify(Locales['pacific_sidehack_fail'], 'error', 3000)
            end
        end, Config.MinigameSettings.varHack.blocks, 7)
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:client:SetPacificSideHacked', function()
    Config.Banks['Pacific'].sideEntrance.hacked = true
end)

RegisterNetEvent('bankrobbery:client:PacificMainComputer', function()
    if Config.Banks['Pacific'].computers['main'].hacked then return end

    local ped = cache.ped
    lib.playAnim(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0, 1.0, -1, 1, 0, 0, 0, 0)

    local result = exports['lightsout']:StartLightsOut(Config.MinigameSettings.lightsOut.grid, Config.MinigameSettings.lightsOut.maxClicks)
    if result then
        TriggerServerEvent('bankrobbery:server:SetPacificComputerHacked', 'main')
    else
        utils.notify(Locales['hack_failed'], 'error', 3000)
    end

    StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
end)

RegisterNetEvent('bankrobbery:client:SetPacificComputerHacked', function(computer)
    Config.Banks['Pacific'].computers[computer].hacked = true
end)

RegisterNetEvent('bankrobbery:client:PacificComputer', function(data)
    local key = Config.Banks['Pacific'].computers[data.computer].key

    local hasItem = client.hasItems(key)
    if not hasItem then
        utils.notify(Locales['pacific_need_datakey'], 'error', 3000)
        return
    end

    local ped = cache.ped
    lib.playAnim(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0, 1.0, -1, 1, 0, 0, 0, 0)

    if data.computer == 'office1' then -- varhack
        exports['varhack']:OpenHackingGame(function(success)
            if success then 
                PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
                StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
                TriggerServerEvent('bankrobbery:server:SetPacificComputerHacked', data.computer)
            else
                StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
            end
        end, Config.MinigameSettings.varHack.blocks, 7)
    elseif data.computer == 'office2' then -- bank hack, paleto difficulty
        exports['hacking']:OpenHackingGame(Config.MinigameSettings.laptop['paleto'].time, Config.MinigameSettings.laptop['paleto'].blocks, Config.MinigameSettings.laptop['paleto'].amount, function(success)
            if success then 
                TriggerServerEvent('bankrobbery:server:SetPacificComputerHacked', data.computer)
                StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
            else
                StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
            end
        end)
    elseif data.computer == 'office3' then -- maze hack
        exports['casinohack']:OpenHackingGame(function(success)
            if success then 
                TriggerServerEvent('bankrobbery:server:SetPacificComputerHacked', data.computer)
                StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
            else
                StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
            end
        end, Config.MinigameSettings.mazeHack.time)
    elseif data.computer == 'office4' then
        exports['memorygame']:thermiteminigame(Config.MinigameSettings.thermite.correctBlocks, Config.MinigameSettings.thermite.incorrectBlocks, Config.MinigameSettings.thermite.timetoShow, Config.MinigameSettings.thermite.timetoLose, function()
            TriggerServerEvent('bankrobbery:server:SetPacificComputerHacked', data.computer)
            StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
        end, function()
            StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
        end)
    end
end)

RegisterNetEvent('bankrobbery:client:SearchDrawer', function(data)
    if not Config.Banks['Pacific'].computers['main'].hacked then return end

    if lib.progressBar({
        duration = 7800,
        label = Locales['pacific_search_drawer'],
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true, mouse = false },
        anim = { dict = 'anim@gangops@facility@servers@bodysearch@', clip = 'player_search', flag = 16 }
    }) then 
        TriggerServerEvent('bankrobbery:server:SearchDrawer', data.drawer)
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:client:EnterPacificCode', function(data)
    local ped = cache.ped
    local pos = GetEntityCoords(ped)

    -- EVIDENCE
    utils.createEvidence(pos)
    
    -- ENTERING CODE
    lib.playAnim(ped, 'mp_heists@keypad@', 'idle_a', 8.0, 8.0, -1, 0, 0, false, false, false)
    
    local input = lib.inputDialog(Locales['pacific_input_header'], {
        {
            type = 'input', 
            label = '',
            placeholder = 'XXXX',
            icon = 'user-shield',
            required = true
        },
    })

    lib.playAnim(ped, 'mp_heists@keypad@', 'exit', 2.0, 2.0, -1, 0, 0, false, false, false)

    if not input then return end
    local pass = string.upper(input[1])
    TriggerServerEvent('bankrobbery:server:EnterPacificCode', data.panel, pass)
end)

RegisterNetEvent('bankrobbery:client:SetLockdownActive', function()
    Config.Banks['Pacific'].lockdown = true

    while Config.Banks['Pacific'].lockdown and lasersActive do
        for _, laser in ipairs(lasers) do laser.setVisible(true) end
        Wait(500)

        for _, laser in ipairs(lasers) do laser.setVisible(false) end
        Wait(500)
    end
end)

AddEventHandler('powerplant:client:PowerPlantHit', function(plant)
    if lasersActive and plant == 'city' and Config.Banks['Pacific'].laserPanel then
        disableLasers()
    end
end)

RegisterNetEvent('bankrobbery:client:DisableLasers', function()
    if Config.Banks['Pacific'].lockdown then
        utils.notify(Locales['pacific_lockdown_active'], 'error', 3000)
        return
    end

    if not exports['lh34-powerplant']:getPowerPlantState('city') then
        utils.notify(Locales['pacific_cannot_disable_laser'], 'error', 3000)
        return
    end

    if Config.Banks['Pacific'].laserPanel then
        utils.notify(Locales['pacific_already_disable_laser'], 'error', 3000)
        return
    end

    local ped = cache.ped
    lib.playAnim(ped, 'anim_heist@hs3f@ig11_steal_painting@male@', 'with_painting_exit', 8.0, 8.0, -1, 0, 0, 0, 0, 0)
    
    local result = exports['hackingdevice']:StartHackingDevice(Config.MinigameSettings.hackingdevice.timer, Config.MinigameSettings.hackingdevice.characters)
    if result then
        TriggerServerEvent('bankrobbery:server:LaserPowerSupplyDisabled')
    end
end)

RegisterNetEvent('bankrobbery:client:LaserPowerSupplyDisabled', function()
    Config.Banks['Pacific'].laserPanel = true

    if lasersActive and exports['lh34-powerplant']:getPowerPlantState('city') then
        disableLasers()
    end
end)

RegisterNetEvent('bankrobbery:client:UseRedLaptop', function(data)
    if Config.Banks['Pacific'].lockdown then
        utils.notify(Locales['pacific_lockdown_active'], 'error', 3000)
        return
    end

    local hasItem = client.hasItems('laptop_red')
    if not hasItem then
        utils.notify(Locales['missing_items'], 'error', 2500)
        return
    end

    local ped = cache.ped
    TaskTurnPedToFaceEntity(ped, data.entity, 1.0)
    
    if lib.progressBar({
        duration = math.random(5000, 10000),
        label = Locales['progressbar_laptop'],
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true, mouse = false },
        anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
    }) then 
        TriggerServerEvent('bankrobbery:server:LaptopDamage', 'laptop_red')
        LaptopAnimation('Pacific')
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:client:PacificSideVault', function(data)
    if Config.Banks['Pacific'].lockdown then
        utils.notify(Locales['pacific_lockdown_active'], 'error', 3000)
        return
    end

    if not Config.Banks['Pacific'].hacked then
        utils.notify(Locales['pacific_vault_not_hit'], 'error', 3000)
        return
    end

    if Config.Banks['Pacific'].sideVaults[data.vault].hacked then
        utils.notify(Locales['laptop_hit'], 'error', 3000)
        return
    end

    local hasItem = client.hasItems('laptop_red')
    if not hasItem then
        utils.notify(Locales['missing_items'], 'error', 2500)
        return
    end

    local ped = cache.ped
    TaskTurnPedToFaceEntity(ped, data.entity, 1.0)

    if lib.progressBar({
        duration = math.random(5000, 10000),
        label = Locales['progressbar_laptop'],
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true, mouse = false },
        anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
    }) then
        LocalPlayer.state.inv_busy = true

        local ped = cache.ped
        local loc = Config.Banks['Pacific'].sideVaults[data.vault].laptop
        local targetPosition, targetRotation = vec3(GetEntityCoords(ped)), vec3(GetEntityRotation(ped))
        
        -- EVIDENCE
        utils.createEvidence(targetPosition)

        -- LAPTOP USE
        TriggerServerEvent('bankrobbery:server:LaptopDamage', 'laptop_red')

        SetEntityHeading(ped, loc.w)
        lib.requestAnimDict('anim@heists@ornate_bank@hack')
        local animPos = GetAnimInitialOffsetPosition('anim@heists@ornate_bank@hack', 'hack_enter', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
        local animPos2 = GetAnimInitialOffsetPosition('anim@heists@ornate_bank@hack', 'hack_loop', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
        local animPos3 = GetAnimInitialOffsetPosition('anim@heists@ornate_bank@hack', 'hack_exit', loc.x, loc.y, loc.z, loc.x, loc.y, loc.z, 0, 2)
        
        FreezeEntityPosition(ped, true)

        lib.requestModel(`hei_prop_hst_laptop`)
        local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, targetPosition, true, true, false)
        SetModelAsNoLongerNeeded(`hei_p_m_bag_var22_arm_s`)
    
        lib.requestModel(`hei_p_m_bag_var22_arm_s`)
        local laptop = CreateObject(`hei_prop_hst_laptop`, targetPosition, true, true, false)
        SetModelAsNoLongerNeeded(`hei_prop_hst_laptop`)
        
        local netScene = NetworkCreateSynchronisedScene(animPos, targetRotation, 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene, 'anim@heists@ornate_bank@hack', 'hack_enter', 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene, 'anim@heists@ornate_bank@hack', 'hack_enter_bag', 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene, 'anim@heists@ornate_bank@hack', 'hack_enter_laptop', 4.0, -8.0, 1)

        local netScene2 = NetworkCreateSynchronisedScene(animPos2, targetRotation, 2, false, true, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene2, 'anim@heists@ornate_bank@hack', 'hack_loop', 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene2, 'anim@heists@ornate_bank@hack', 'hack_loop_bag', 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene2, 'anim@heists@ornate_bank@hack', 'hack_loop_laptop', 4.0, -8.0, 1)

        local netScene3 = NetworkCreateSynchronisedScene(animPos3, targetRotation, 2, false, false, 1065353216, 0, 1.3)
        NetworkAddPedToSynchronisedScene(ped, netScene3, 'anim@heists@ornate_bank@hack', 'hack_exit', 1.5, -4.0, 1, 16, 1148846080, 0)
        NetworkAddEntityToSynchronisedScene(bag, netScene3, 'anim@heists@ornate_bank@hack', 'hack_exit_bag', 4.0, -8.0, 1)
        NetworkAddEntityToSynchronisedScene(laptop, netScene3, 'anim@heists@ornate_bank@hack', 'hack_exit_laptop', 4.0, -8.0, 1)

        Wait(200)
        NetworkStartSynchronisedScene(netScene)

        Wait(6300)
        NetworkStartSynchronisedScene(netScene2)

        Wait(2000)

        exports['hacking']:OpenHackingGame(Config.MinigameSettings.laptop['pacific'].time, Config.MinigameSettings.laptop['pacific'].blocks, Config.MinigameSettings.laptop['pacific'].amount, function(success)
            if success then
                TriggerServerEvent('bankrobbery:server:PacificSideVaultHacked', data.vault)
            end

            NetworkStartSynchronisedScene(netScene3)
            Wait(4600)
            NetworkStopSynchronisedScene(netScene3)
            RemoveAnimDict('anim@heists@ornate_bank@hack')
            DeleteObject(bag)
            DeleteObject(laptop)
            FreezeEntityPosition(ped, false)
        end)

        LocalPlayer.state.inv_busy = false
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:client:PacificSideVaultHacked', function(vault)
    Config.Banks['Pacific'].sideVaults[vault].hacked = true
end)

--- Targets

-- Side Entrance Panel
target.AddBoxZone('bankrobbery_sidepanel_pacific', vec3(271.13, 206.89, 106.60), 0.4, 0.2, {
    name = 'bankrobbery_sidepanel_pacific',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 106.6,
    maxZ = 107.0
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificSideHack',
            icon = 'fas fa-user-secret',
            label = Locales['pacific_target_sidehack'],
            canInteract = function()
                return not Config.Banks['Pacific'].sideEntrance.hacked
            end
        }
    },
    distance = 1.0,
})

-- Main Office Computer
target.AddBoxZone('bankrobbery_main_pacific', vec3(278.78, 213.07, 110.05), 0.5, 0.5, {
    name = 'bankrobbery_main_pacific',
    heading = 9,
    debugPoly = Config.Debug,
    minZ = 110.05,
    maxZ = 119.05
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificMainComputer',
            icon = 'fas fa-user-secret',
            label = Locales['pacific_target_hackcomputer'],
            canInteract = function()
                return Config.Banks['Pacific'].sideEntrance.hacked and not Config.Banks['Pacific'].computers['main'].hacked
            end
        }
    },
    distance = 1.5,
})

-- Computer 1
target.AddBoxZone('bankrobbery_office1_pacific', vec3(260.54, 205.56, 110.05), 0.7, 0.7, {
    name = 'bankrobbery_office1_pacific',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 110.05,
    maxZ = 119.05
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificComputer',
            icon = 'fas fa-user-secret',
            label = Locales['pacific_target_decryptkey'],
            canInteract = function()
                return Config.Banks['Pacific'].computers['main'].hacked and not Config.Banks['Pacific'].computers['office1'].hacked
            end,
            computer = 'office1',
        }
    },
    distance = 1.5,
})

-- Computer 2
target.AddBoxZone('bankrobbery_office2_pacific', vec3(252.04, 208.66, 110.05), 0.7, 0.7, {
    name = 'bankrobbery_office2_pacific',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 110.05,
    maxZ = 119.05
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificComputer',
            icon = 'fas fa-user-secret',
            label = Locales['pacific_target_decryptkey'],
            canInteract = function()
                return Config.Banks['Pacific'].computers['main'].hacked and not Config.Banks['Pacific'].computers['office2'].hacked
            end,
            computer = 'office2',
        }
    },
    distance = 1.5,
})

-- Computer 3
target.AddBoxZone('bankrobbery_office3_pacific', vec3(270.14, 231.59, 110.05), 0.7, 0.7, {
    name = 'bankrobbery_office3_pacific',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 110.05,
    maxZ = 119.05
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificComputer',
            icon = 'fas fa-user-secret',
            label = Locales['pacific_target_decryptkey'],
            canInteract = function()
                return Config.Banks['Pacific'].computers['main'].hacked and not Config.Banks['Pacific'].computers['office3'].hacked
            end,
            computer = 'office3',
        }
    },
    distance = 1.5,
})

-- Computer 4
target.AddBoxZone('bankrobbery_office4_pacific', vec3(261.65, 234.7, 110.05), 0.7, 0.7, {
    name = 'bankrobbery_office4_pacific',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 110.05,
    maxZ = 119.05
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificComputer',
            icon = 'fas fa-user-secret',
            label = Locales['pacific_target_decryptkey'],
            canInteract = function()
                return Config.Banks['Pacific'].computers['main'].hacked and not Config.Banks['Pacific'].computers['office4'].hacked
            end,
            computer = 'office4',
        }
    },
    distance = 1.5,
})

-- Drawers
for k, v in pairs(Config.Banks['Pacific'].searchDrawers) do
    target.AddBoxZone('pacific_drawer_' .. k, v.coords.xyz, 0.4, 1.2, {
        name = 'pacific_drawer_' .. k,
        heading = v.coords.w,
        debugPoly = Config.Debug,
        minZ = v.coords.z - 1.0,
        maxZ = v.coords.z + 1.0
    }, {
        options = { 
            {
                type = 'client',
                event = 'bankrobbery:client:SearchDrawer',
                icon = 'fas fa-user-secret',
                label = Locales['pacific_target_drawers'],
                canInteract = function()
                    return Config.Banks['Pacific'].computers['main'].hacked
                end,
                drawer = k,
            }
        },
        distance = 1.5,
    })
end

-- Vault Entrance Panels
target.AddBoxZone('bankrobbery_pacific_panel1', vec3(267.51, 213.26, 97.20), 0.6, 0.4, {
    name = 'bankrobbery_pacific_panel1',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 97.20,
    maxZ = 98.0
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:EnterPacificCode',
            icon = 'fas fa-terminal',
            label = Locales['pacific_input_header'],
            canInteract = function()
                return Config.Banks['Pacific'].computers['main'].hacked
            end,
            panel = 1
        }
    },
    distance = 1.5,
})

target.AddBoxZone('bankrobbery_pacific_panel2', vec3(270.55, 221.28, 97.20), 0.6, 0.4, {
    name = 'bankrobbery_pacific_panel2',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 97.20,
    maxZ = 98.0
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:EnterPacificCode',
            icon = 'fas fa-terminal',
            label = Locales['pacific_input_header'],
            canInteract = function()
                return Config.Banks['Pacific'].computers['main'].hacked
            end,
            panel = 2
        }
    },
    distance = 1.5,
})

-- Vault Laser Disable
target.AddBoxZone('bankrobbery_pacific_laserpanel', vec3(260.64, 213.09, 97.20), 0.7, 0.3, {
    name = 'bankrobbery_pacific_laserpanel',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 98.30,
    maxZ = 99.30
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:DisableLasers',
            icon = 'fas fa-bolt',
            label = Locales['pacific_target_disablepower'],
            canInteract = function()
                return not Config.Banks['Pacific'].laserPanel
            end
        }
    },
    distance = 2.0,
})

-- Vault Panel
target.AddBoxZone('bankrobbery_panel_pacific1', vec3(236.40, 231.73, 97.20), 0.6, 0.4, {
    name = 'bankrobbery_panel_pacific1',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 97.20,
    maxZ = 97.90
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseRedLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Pacific'].hacked
            end
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['Pacific'].hacked
            end,
            bank = 'Pacific',
            job = 'lspd'
        }
    },
    distance = 1.5,
})

-- Side Vault Panels
target.AddBoxZone('bankrobbery_panel_pacific2', vec3(241.84, 218.64, 97.20), 0.6, 0.4, {
    name = 'bankrobbery_panel_pacific2',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 97.20,
    maxZ = 97.90
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificSideVault',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Pacific'].sideVaults[1].hacked
            end,
            vault = 1
        }
    },
    distance = 1.5,
})

target.AddBoxZone('bankrobbery_panel_pacific3', vec3(247.37, 233.82, 97.20), 0.6, 0.4, {
    name = 'bankrobbery_panel_pacific3',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 97.20,
    maxZ = 97.90
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PacificSideVault',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Pacific'].sideVaults[2].hacked
            end,
            vault = 2
        }
    },
    distance = 1.5,
})

--- Threads

CreateThread(function()
    -- Static Lasers
    lasers[#lasers + 1] = Laser.new(
        vec3(256.538, 217.67, 96.75), 
        {
            vec3(239.378, 223.97, 96.75)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false,
            name = 'vault_laser1', 
            maxDistance = 19.0
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(256.538, 217.67, 97.50), 
        {
            vec3(239.378, 223.97, 97.50)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser2', 
            maxDistance = 19.0
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(256.538, 217.67, 98.25), 
        {
            vec3(239.378, 223.97, 98.25)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser3', 
            maxDistance = 19.0
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(259.199, 224.98, 96.75), 
        {
            vec3(242.047, 231.302, 96.75)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser4', 
            maxDistance = 19.0
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(259.199, 224.98, 97.50), 
        {
            vec3(242.047, 231.302, 97.50)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser5', 
            maxDistance = 19.0
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(259.199, 224.98, 98.25), 
        {
            vec3(242.047, 231.302, 98.25)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser6', 
            maxDistance = 19.0
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(254.608, 224.312, 96.75), 
        {
            vec3(253.448, 221.156, 96.75)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser7', 
            maxDistance = 3.5
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(254.608, 224.312, 97.50), 
        {
            vec3(253.448, 221.156, 97.50)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser8', 
            maxDistance = 3.5
        }
    )

    lasers[#lasers + 1] = Laser.new(
        vec3(254.608, 224.312, 98.25), 
        {
            vec3(253.448, 221.156, 98.25)}, 
        {
            travelTimeBetweenTargets = {1.0, 1.0}, 
            waitTimeAtTargets = {0.0, 0.0}, 
            randomTargetSelection = false, 
            name = 'vault_laser9', 
            maxDistance = 3.5
        }
    )


    -- Moving Lasers
    lasers[#lasers + 1] = Laser.new({
        vec3(260.829, 224.373, 96.75),
        vec3(260.829, 224.373, 97.50),
        vec3(260.829, 224.373, 98.25)
    }, {
        vec3(263.908, 223.289, 96.75),
        vec3(263.908, 223.289, 97.50),
        vec3(263.908, 223.289, 98.25)
    }, {
        travelTimeBetweenTargets = {0.5, 0.5}, 
        waitTimeAtTargets = {0.0, 0.0}, 
        randomTargetSelection = false, 
        name = 'vault_laser10', 
        maxDistance = 3.5
    })

    lasers[#lasers + 1] = Laser.new({
        vec3(261.238, 215.957, 98.25),
        vec3(261.238, 215.957, 97.50),
        vec3(261.238, 215.957, 96.75)
    }, {
        vec3(258.157, 217.033, 98.25),
        vec3(258.157, 217.033, 97.50),
        vec3(258.157, 217.033, 96.75)
    }, {
        travelTimeBetweenTargets = {0.5, 0.5}, 
        waitTimeAtTargets = {0.0, 0.0}, 
        randomTargetSelection = false, 
        name = 'vault_laser11', 
        maxDistance = 3.5
    })


    for _, laser in ipairs(lasers) do 
        laser.onPlayerHit(function(playerBeingHit, hitPos)
            if playerBeingHit then
                if not Config.Banks['Pacific'].lockdown then
                    TriggerServerEvent('bankrobbery:server:HitByLaser')
                end

                laser.clearOnPlayerHit()
            end
        end)
    end
end)
