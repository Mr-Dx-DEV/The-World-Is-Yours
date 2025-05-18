local client = require 'modules.framework.client'
local target = require 'modules.target.client'
local utils = require 'modules.utils.client'

local paletoCameras = {
    [1] = { 'Security Hallway', vec4(-99.98, 6476.69, 32.8, 190.82), -1557675482 },
    [2] = { 'Main Lobby #1', vec4(-102.22, 6475.49, 32.8, 171.44), -712148387 },
    [3] = { 'Main Lobby #2', vec4(-107.87, 6461.35, 32.8, 3.29), -712148387 },
    [4] = { 'Office #1', vec4(-101.9, 6460.61, 32.8, 75.81), 595161168 },
    [5] = { 'Office #2', vec4(-97.53, 6465.04, 32.8, 1.67), 1122715848 },
    [6] = { 'Administration Office', vec4(-105.73, 6480.59, 32.8, 189.21), 1297762420 },
    [7] = { 'Front Exit', vec4(-103.24, 6451.46, 32.8, 86.55), 0 },
    [8] = { 'Back Exit', vec4(-88.88, 6467.08, 32.8, 337.9), 0 },
}

--- Camera Menu

local cameraOptions = {}

for k, v in ipairs(paletoCameras) do
	cameraOptions[#cameraOptions + 1] = {
		title = v[1],
		icon = 'video',
		event = 'bankrobbery:client:PaletoCamera',
		arrow = true,
		args = k
	}
end

lib.registerContext({
	id = 'bankrobbery_paleto_cam',
	title = Locales['paleto_camera_header'],
	options = cameraOptions
})

--- Events

RegisterNetEvent('bankrobbery:client:PaletoSideHacks', function(data)
    if Config.Banks['Paleto'][data.hack].hacked then return end

    local canAttempt =lib.callback.await('bankrobbery:server:CanAttemptPaletoHack', 200, data.hack)
    if not canAttempt then return end

    -- START VOLANTIS SPECIFIC
    if data.hack == 'securityEntrance' then
        local hasItem = client.hasItems('security_card_01')
        if not hasItem then
            utils.notify(Locales['missing_items'], 'error', 2500)
            return
        end

        TriggerServerEvent('bankrobbery:server:RemoveGreenCard')
    end
    -- END VOLANTIS SPECIFIC

    local ped = cache.ped
    TaskTurnPedToFaceEntity(ped, data.entity, 1.0)

    if lib.progressBar({
        duration = math.random(5000, 10000),
        label = Locales['paleto_progressbar_sidehack'],
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true, mouse = false },
        anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
    }) then 
        utils.alertPolice(Config.Banks['Paleto'].type)

        exports['varhack']:OpenHackingGame(function(success)
            if success then 
                PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
                TriggerServerEvent('bankrobbery:server:SetPaletoSideHacked', data.hack)
            else
                utils.notify(Locales['paleto_sidehack_fail'], 'error', 3000)
            end
        end, Config.MinigameSettings.varHack.blocks, 7)
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:client:SetPaletoSideHacked', function(hack)
    Config.Banks['Paleto'][hack].hacked = true
end)

RegisterNetEvent('bankrobbery:client:PaletoCameraControls', function()
    if not Config.Banks['Paleto'].sideHack.hacked then return end
    
    lib.showContext('bankrobbery_paleto_cam')
end)

RegisterNetEvent('bankrobbery:client:PaletoCamera', function(id)
    if not paletoCameras[id] then return end
    if not Config.Banks['Paleto'].sideHack.hacked then return end

    local coords = paletoCameras[id][2]
    PaletoCamera(coords, paletoCameras[id][3])
end)

RegisterNetEvent('bankrobbery:client:PaletoHacksMenu', function()
    if not Config.Banks['Paleto'].sideHack.hacked then return end

    local options = {}

    for k, v in ipairs(Config.Banks['Paleto'].officeHacks) do
        options[#options + 1] = {
            title = v.label,
            disabled = v.hacked,
            icon = 'user-secret',
            event = 'bankrobbery:client:PaletoHack',
            args = k
        }
    end

    lib.registerContext({
		id = 'bankrobbery_paleto_hack',
		title = Locales['paleto_hacks_header'],
		options = options
	})

    lib.showContext('bankrobbery_paleto_hack')
end)

RegisterNetEvent('bankrobbery:client:PaletoHack', function(id)
    if Config.Banks['Paleto'].officeHacks[id].hacked then return end

    local ped = cache.ped
    lib.playAnim(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0, 1.0, -1, 1, 0, 0, 0, 0)

    exports['casinohack']:OpenHackingGame(function(success)
        if success then 
            PlaySound(-1, 'Lose_1st', 'GTAO_FM_Events_Soundset', 0, 0, 1)
            TriggerServerEvent('bankrobbery:server:SetPaletoOfficeHacked', id)
        else
            utils.notify(Locales['paleto_office_hack_fail'], 'error', 3000)
        end

        StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)
    end, Config.MinigameSettings.mazeHack.time)
end)

RegisterNetEvent('bankrobbery:client:SetPaletoOfficeHacked', function(id)
    Config.Banks['Paleto'].officeHacks[id].hacked = true
end)

RegisterNetEvent('bankrobbery:client:OfficePassword', function(data)
    local ped = cache.ped
    local pos = GetEntityCoords(ped)

    -- EVIDENCE
    utils.createEvidence(pos)
    
    -- ENTERING CODE
    lib.playAnim(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0, 1.0, -1, 1, 0, 0, 0, 0)
    
    local input = lib.inputDialog(Locales['paleto_input_header'], {
        {
            type = 'input', 
            label = '',
            placeholder = 'XXXXX',
            icon = 'user-shield',
            required = true
        },
    })

    StopAnimTask(ped, 'anim@heists@prison_heiststation@cop_reactions', 'cop_b_idle', 1.0)

    if not input then return end
    local pass = string.upper(input[1])
    TriggerServerEvent('bankrobbery:server:EnterPaletoPassword', data.office, pass)
end)

RegisterNetEvent('bankrobbery:client:UseBlueLaptop', function(data)
    local hasItem = client.hasItems('laptop_blue')
    if not hasItem then
        utils.notify(Locales['missing_items'], 'error', 2500)
        return
    end

    local canAttempt = lib.callback.await('bankrobbery:server:CanPaletoBankPanelHack', 200)
    if not canAttempt then
        utils.notify(Locales['paleto_lockdown'], 'error', 4500)
        Wait(5000)
        utils.notify(Locales['paleto_lockdown2'], 'error', 4500)
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
        TriggerServerEvent('bankrobbery:server:LaptopDamage', 'laptop_blue')
        LaptopAnimation('Paleto')
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

--- Targets

-- Side Entrance Panel
target.AddBoxZone('bankrobbery_sidepanel_paleto', vec3(-115.55, 6480.31, 31.80), 0.4, 0.2, {
    name = 'bankrobbery_sidepanel_paleto',
    heading = 315,
    debugPoly = Config.Debug,
    minZ = 31.80,
    maxZ = 32.10
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PaletoSideHacks',
            icon = 'fas fa-user-secret',
            label = Locales['paleto_target_sidehack'],
            canInteract = function()
                return not Config.Banks['Paleto'].sideEntrance.hacked
            end,
            hack = 'sideEntrance'
        }
    },
    distance = 1.0,
})

-- Side Entrance Inside Hack
target.AddBoxZone('bankrobbery_sidehack_paleto', vec3(-118.04, 6470.28, 30.80), 1.4, 0.3, {
    name = 'bankrobbery_backpanel_paleto',
    heading = 225,
    debugPoly = Config.Debug,
    minZ = 30.80,
    maxZ = 32.80
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PaletoSideHacks',
            icon = 'fas fa-user-secret',
            label = Locales['paleto_target_sidehack'],
            canInteract = function()
                return not Config.Banks['Paleto'].sideHack.hacked
            end,
            hack = 'sideHack'
        }
    },
    distance = 1.0,
})

-- Security Entrance Panel
target.AddBoxZone('bankrobbery_backpanel_paleto', vec3(-95.52, 6473.04, 31.80), 0.4, 0.2, {
    name = 'bankrobbery_backpanel_paleto',
    heading = 225,
    debugPoly = Config.Debug,
    minZ = 31.80,
    maxZ = 32.10
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PaletoSideHacks',
            icon = 'fas fa-user-secret',
            label = Locales['paleto_target_sidehack'],
            canInteract = function()
                return not Config.Banks['Paleto'].securityEntrance.hacked
            end,
            hack = 'securityEntrance'
        }
    },
    distance = 1.0,
})

-- Security Room Camera Panel
target.AddBoxZone('bankrobbery_paleto_camera', vec3(-92.86, 6463.76, 31.40), 0.7, 0.4, {
    name = 'bankrobbery_paleto_camera',
    heading = 320,
    debugPoly = Config.Debug,
    minZ = 31.40,
    maxZ = 31.70
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PaletoCameraControls',
            icon = 'fas fa-video',
            label = Locales['paleto_camera_target'],
            canInteract = function()
                return Config.Banks['Paleto'].sideHack.hacked
            end
        }
    },
    distance = 1.0,
})

-- Security Room Hack Panel
target.AddBoxZone('bankrobbery_paleto_hacks', vec3(-91.76, 6464.88, 31.40), 0.6, 0.4, {
    name = 'bankrobbery_paleto_hacks',
    heading = 325,
    debugPoly = Config.Debug,
    minZ = 31.40,
    maxZ = 31.70
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:PaletoHacksMenu',
            icon = 'fas fa-user-secret',
            label = Locales['paleto_target_office_hack'],
            canInteract = function()
                return Config.Banks['Paleto'].sideHack.hacked
            end
        }
    },
    distance = 1.0,
})

-- Office 1 Hack
target.AddBoxZone('bankrobbery_paleto_office_1', vec3(-98.24, 6466.1, 31.40), 0.8, 0.6, {
    name = 'bankrobbery_paleto_office_1',
    heading = 315,
    debugPoly = Config.Debug,
    minZ = 31.40,
    maxZ = 31.70
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:OfficePassword',
            icon = 'fas fa-terminal',
            label = Locales['paleto_input_header'],
            canInteract = function()
                return Config.Banks['Paleto'].officeHacks[1].hacked
            end,
            office = 1,
        }
    },
    distance = 1.5,
})

-- Office 2 Hack
target.AddBoxZone('bankrobbery_paleto_office_2', vec3(-103.83, 6460.49, 31.40), 0.8, 0.6, {
    name = 'bankrobbery_paleto_office_2',
    heading = 315,
    debugPoly = Config.Debug,
    minZ = 31.40,
    maxZ = 31.70
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:OfficePassword',
            icon = 'fas fa-terminal',
            label = Locales['paleto_input_header'],
            canInteract = function()
                return Config.Banks['Paleto'].officeHacks[2].hacked
            end,
            office = 2,
        }
    },
    distance = 1.5,
})

-- Office 3 Hack
target.AddBoxZone('bankrobbery_paleto_office_3', vec3(-104.68, 6479.34, 31.40), 0.8, 0.6, {
    name = 'bankrobbery_paleto_office_3',
    heading = 315,
    debugPoly = Config.Debug,
    minZ = 31.40,
    maxZ = 31.70
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:OfficePassword',
            icon = 'fas fa-terminal',
            label = Locales['paleto_input_header'],
            canInteract = function()
                return Config.Banks['Paleto'].officeHacks[3].hacked
            end,
            office = 3,
        }
    },
    distance = 1.5,
})

-- Vault Panel
target.AddBoxZone('bankrobbery_panel_paleto', vec3(-101.86, 6462.81, 31.70), 0.6, 0.4, {
    name = 'bankrobbery_panel_paleto',
    heading = 135,
    debugPoly = Config.Debug,
    minZ = 31.70,
    maxZ = 32.50
 }, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseBlueLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Paleto'].hacked
            end
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['Paleto'].hacked
            end,
            bank = 'Paleto',
            job = 'lspd'
        }
    },
    distance = 1.5,
})
