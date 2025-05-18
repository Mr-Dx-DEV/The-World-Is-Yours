local client = require 'modules.framework.client'
local target = require 'modules.target.client'
local utils = require 'modules.utils.client'

--- Events

RegisterNetEvent('bankrobbery:client:UseGreenLaptop', function(data)
    if not currentBank or currentBank ~= data.bank then return end

    local hasItem = client.hasItems('laptop_green')
    if not hasItem then
        utils.notify(Locales['missing_items'], 'error', 2500)
        return
    end

    if Config.Banks[data.bank].hacked then
        utils.notify(Locales['laptop_hit'], 'success', 3000)
        return
    end

    local canAttempt = lib.callback.await('bankrobbery:server:CanAttemptBankRobbery', 200, data.bank)
    if not canAttempt then return end
    
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
        TriggerServerEvent('bankrobbery:server:LaptopDamage', 'laptop_green')
        utils.alertPolice(Config.Banks[data.bank].type)
        LaptopAnimation(data.bank)
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:client:SetFleecaCardTaken', function(bank)
    Config.Banks[bank].keycardTaken = true
end)

RegisterNetEvent('bankrobbery:client:HackInnerPanel', function(data)
    if not currentBank or currentBank ~= data.bank then return end
    local ped = cache.ped
    TaskTurnPedToFaceEntity(ped, data.entity, 1.0)

    if lib.progressBar({
        duration = 5000,
        label = Locales['progressbar_innerpanel'],
        useWhileDead = false,
        canCancel = true,
        disable = { car = true, move = true, combat = true, mouse = false },
        anim = { dict = 'anim@gangops@facility@servers@', clip = 'hotwire', flag = 16 }
    }) then 
        local result = exports['simonsays']:StartSimonSays(Config.MinigameSettings.simonSays.buttonGrid, Config.MinigameSettings.simonSays.length)
        if result then
            TriggerServerEvent('bankrobbery:server:HackInnerPanel', data.bank)
        else
            utils.notify(Locales['hack_failed'], 'error', 3000)
        end
    else
        utils.notify(Locales['canceled'], 'error', 3000)
    end
end)

RegisterNetEvent('bankrobbery:client:SetInnerHacked', function(bank)
    Config.Banks[bank].innerDoor.hacked = true
end)

--- Targets

-- Pink Cage Fleeca Panel
target.AddBoxZone('bankrobbery_panel_pinkcage', vec3(311.06, -284.67, 53.96), 0.4, 0.6, {
    name = 'bankrobbery_panel_pinkcage',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 53.96,
    maxZ = 54.76
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseGreenLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['PinkCage'].hacked
            end,
            bank = 'PinkCage'
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['PinkCage'].hacked
            end,
            bank = 'PinkCage',
            job = 'lspd'
        }
    },
    distance = 1.5,
})

-- Pink Cage Keycard
target.AddBoxZone('bankrobbery_keycard_pinkcage', vec3(312.67, -281.73, 53.16), 2.0, 0.4, {
    name = 'bankrobbery_keycard_pinkcage',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 53.16,
    maxZ = 55.16
}, {
    options = { 
        {
            type = 'server',
            event = 'bankrobbery:server:GrabFleecaKeycard',
            icon = 'fas fa-user-secret',
            label = Locales['keycard_target'],
            canInteract = function()
                return not Config.Banks['PinkCage'].keycardTaken
            end,
            bank = 'PinkCage'
        }
    },
    distance = 1.0,
})

-- Pink Cage Second Panel
target.AddBoxZone('bankrobbery_secondpanel_pinkcage', vec3(312.81, -284.97, 53.96), 0.6, 0.2, {
    name = 'bankrobbery_secondpanel_pinkcage',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 53.96,
    maxZ = 54.76
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:HackInnerPanel',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['PinkCage'].innerDoor.hacked
            end,
            bank = 'PinkCage'
        }
    },
    distance = 1.5,
})

-- Legion Square Fleeca Panel
target.AddBoxZone('bankrobbery_panel_legion', vec3(146.69, -1046.44, 29.27), 0.4, 0.6, {
    name = 'bankrobbery_panel_legion',
    heading = 340,
    debugPoly = Config.Debug,
    minZ = 29.27,
    maxZ = 29.97
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseGreenLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Legion'].hacked
            end,
            bank = 'Legion'
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['Legion'].hacked
            end,
            bank = 'Legion',
            job = 'lspd'
        }
    },
    distance = 1.5,
})

-- Legion Square Keycard
target.AddBoxZone('bankrobbery_keycard_legion', vec3(148.37, -1043.37, 28.37), 2.0, 0.4, {
    name = 'bankrobbery_keycard_legion',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 28.37,
    maxZ = 30.37
}, {
    options = { 
        {
            type = 'server',
            event = 'bankrobbery:server:GrabFleecaKeycard',
            icon = 'fas fa-user-secret',
            label = Locales['keycard_target'],
            canInteract = function()
                return not Config.Banks['Legion'].keycardTaken
            end,
            bank = 'Legion'
        }
    },
    distance = 1.0,
})

-- Legion Square Second Panel
target.AddBoxZone('bankrobbery_secondpanel_legion', vec3(148.45, -1046.62, 29.27), 0.6, 0.2, {
    name = 'bankrobbery_secondpanel_legion',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 29.27,
    maxZ = 29.97
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:HackInnerPanel',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Legion'].innerDoor.hacked
            end,
            bank = 'Legion'
        }
    },
    distance = 1.5,
})

-- Hawick Avenue Fleeca Panel
target.AddBoxZone('bankrobbery_panel_hawick', vec3(-354.02, -55.61, 48.84), 0.4, 0.6, {
    name = 'bankrobbery_panel_hawick',
    heading = 338,
    debugPoly = Config.Debug,
    minZ = 48.84,
    maxZ = 49.64
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseGreenLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Hawick'].hacked
            end,
            bank = 'Hawick',
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['Hawick'].hacked
            end,
            bank = 'Hawick',
            job = 'lspd'
        }
    },
    distance = 1.5,
})

-- Hawick Avenue Keycard
target.AddBoxZone('bankrobbery_keycard_hawick', vec3(-352.42, -52.5, 48.04), 2.0, 0.4, {
    name = 'bankrobbery_keycard_hawick',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 48.04,
    maxZ = 50.04
}, {
    options = { 
        {
            type = 'server',
            event = 'bankrobbery:server:GrabFleecaKeycard',
            icon = 'fas fa-user-secret',
            label = Locales['keycard_target'],
            canInteract = function()
                return not Config.Banks['Hawick'].keycardTaken
            end,
            bank = 'Hawick'
        }
    },
    distance = 1.0,
})

-- Hawick Avenue Second Panel
target.AddBoxZone('bankrobbery_secondpanel_hawick', vec3(-352.29, -55.84, 48.94), 0.6, 0.2, {
    name = 'bankrobbery_secondpanel_hawick',
    heading = 250,
    debugPoly = Config.Debug,
    minZ = 48.94,
    maxZ = 49.74
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:HackInnerPanel',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Hawick'].innerDoor.hacked
            end,
            bank = 'Hawick'
        }
    },
    distance = 1.5,
})

-- Del Perro Fleeca Panel
target.AddBoxZone('bankrobbery_panel_delperro', vec3(-1210.75, -336.77, 37.58), 0.4, 0.6, {
    name = 'bankrobbery_panel_delperro',
    heading = 26,
    debugPoly = Config.Debug,
    minZ = 37.58,
    maxZ = 38.38
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseGreenLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['DelPerro'].hacked
            end,
            bank = 'DelPerro',
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['DelPerro'].hacked
            end,
            bank = 'DelPerro',
            job = 'lspd'
        }
    },
    distance = 1.5,
})

-- Del Perro Keycard
target.AddBoxZone('bankrobbery_keycard_delperro', vec3(-1211.75, -333.52, 36.78), 2.0, 0.4, {
    name = 'bankrobbery_keycard_delperro',
    heading = 296,
    debugPoly = Config.Debug,
    minZ = 36.78,
    maxZ = 38.78
}, {
    options = { 
        {
            type = 'server',
            event = 'bankrobbery:server:GrabFleecaKeycard',
            icon = 'fas fa-user-secret',
            label = Locales['keycard_target'],
            canInteract = function()
                return not Config.Banks['DelPerro'].keycardTaken
            end,
            bank = 'DelPerro'
        }
    },
    distance = 1.0,
})

-- Del Perro Second Panel
target.AddBoxZone('bankrobbery_secondpanel_delperro', vec3(-1209.3, -335.77, 37.58), 0.6, 0.2, {
    name = 'bankrobbery_secondpanel_delperro',
    heading = 296,
    debugPoly = Config.Debug,
    minZ = 37.58,
    maxZ = 38.38
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:HackInnerPanel',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['DelPerro'].innerDoor.hacked
            end,
            bank = 'DelPerro'
        }
    },
    distance = 1.5,
})

-- Great Ocean Fleeca Panel
target.AddBoxZone('bankrobbery_panel_greatocean', vec3(-2956.33, 481.61, 15.50), 0.6, 0.4, {
    name = 'bankrobbery_panel_greatocean',
    heading = 358,
    debugPoly = Config.Debug,
    minZ = 15.50,
    maxZ = 16.30
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseGreenLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['GreatOcean'].hacked
            end,
            bank = 'GreatOcean',
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['GreatOcean'].hacked
            end,
            bank = 'GreatOcean',
            job = 'lspd'
        }
    },
    distance = 1.5,
})

-- Great Ocean Keycard
target.AddBoxZone('bankrobbery_keycard_greatocean', vec3(-2959.61, 482.25, 14.70), 2.0, 0.4, {
    name = 'bankrobbery_keycard_greatocean',
    heading = 357,
    debugPoly = Config.Debug,
    minZ = 14.70,
    maxZ = 16.70
}, {
    options = { 
        {
            type = 'server',
            event = 'bankrobbery:server:GrabFleecaKeycard',
            icon = 'fas fa-user-secret',
            label = Locales['keycard_target'],
            canInteract = function()
                return not Config.Banks['GreatOcean'].keycardTaken
            end,
            bank = 'GreatOcean'
        }
    },
    distance = 1.0,
})

-- Great Ocean Second Panel
target.AddBoxZone('bankrobbery_secondpanel_greatocean', vec3(-2956.46, 483.38, 15.50), 0.6, 0.2, {
    name = 'bankrobbery_secondpanel_greatocean',
    heading = 358,
    debugPoly = Config.Debug,
    minZ = 15.50,
    maxZ = 16.30
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:HackInnerPanel',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['GreatOcean'].innerDoor.hacked
            end,
            bank = 'GreatOcean'
        }
    },
    distance = 1.5,
})

-- Sandy Shores Fleeca Panel
target.AddBoxZone('bankrobbery_panel_sandy', vec3(1176.04, 2713.15, 37.89), 0.4, 0.6, {
    name = 'bankrobbery_panel_sandy',
    heading = 359,
    debugPoly = Config.Debug,
    minZ = 37.89,
    maxZ = 38.69
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:UseGreenLaptop',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Sandy'].hacked
            end,
            bank = 'Sandy',
        },
        {
            type = 'server',
            event = 'bankrobbery:server:PDClose',
            icon = 'fas fa-door-closed',
            label = Locales['panel_target_pd'],
            canInteract = function()
                return Config.Banks['Sandy'].hacked
            end,
            bank = 'Sandy',
            job = 'lspd'
        }
    },
    distance = 1.5,
})

-- Sandy Shores Keycard
target.AddBoxZone('bankrobbery_keycard_sandy', vec3(1175.63, 2709.76, 37.09), 2.0, 0.4, {
    name = 'bankrobbery_panel_sandy',
    heading = 269,
    debugPoly = Config.Debug,
    minZ = 37.09,
    maxZ = 39.09
}, {
    options = { 
        {
            type = 'server',
            event = 'bankrobbery:server:GrabFleecaKeycard',
            icon = 'fas fa-user-secret',
            label = Locales['keycard_target'],
            canInteract = function()
                return not Config.Banks['Sandy'].keycardTaken
            end,
            bank = 'Sandy'
        }
    },
    distance = 1.0,
})

-- Sandy Shores Second Panel
target.AddBoxZone('bankrobbery_secondpanel_sandy', vec3(1174.35, 2712.85, 37.89), 0.6, 0.2, {
    name = 'bankrobbery_secondpanel_sandy',
    heading = 270,
    debugPoly = Config.Debug,
    minZ = 37.89,
    maxZ = 38.69
}, {
    options = { 
        {
            type = 'client',
            event = 'bankrobbery:client:HackInnerPanel',
            icon = 'fas fa-user-secret',
            label = Locales['panel_target_hack'],
            canInteract = function()
                return not Config.Banks['Sandy'].innerDoor.hacked
            end,
            bank = 'Sandy'
        }
    },
    distance = 1.5,
})
