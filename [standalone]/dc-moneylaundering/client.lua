local QBCore = exports['qb-core']:GetCoreObject()

if not Config.useItem then
    exports['qb-target']:AddBoxZone("LaunderingDoor1", vector3(1142.0, -986.74, 45.93), 1.2, 0.4, {
    name = "LaunderingDoor1",
    heading = 8,
    debugPoly = false,
    minZ = 45.13,
    maxZ = 47.73
    }, {
        options = {
            {
                icon = 'fas fa-lock',
                label = 'Try Combination',
                action = function(entity)
                    local dialog = exports['qb-input']:ShowInput({
                        header = "Password",
                        submitText = "Confirm",
                        inputs = {
                            {
                                text = "StrongPassword123",
                                name = "password",
                                type = "text",
                                isRequired = true
                            }
                        }
                    })
                    if dialog then
                        TriggerServerEvent('qb-moneylaundering:check:password', dialog.password)
                    end
                end,
                drawDistance = 10.0,
                drawColor = {255, 255, 255, 255},
                successDrawColor = {30, 144, 255, 255},
            }
        },
        distance = 2.5,
    })
    exports['qb-target']:AddBoxZone("LaunderingDoor2", vector3(1130.81, -989.11, 45.96), 1.2, 0.4, {
    name = "LaunderingDoor2",
    heading = 8,
    debugPoly = false,
    minZ = 44.96,
    maxZ = 47.76
    }, {
        options = {
            {
                icon = 'fas fa-lock',
                label = 'Try Combination',
                action = function(entity)
                    local dialog = exports['qb-input']:ShowInput({
                        header = "Password",
                        submitText = "Confirm",
                        inputs = {
                            {
                                text = "StrongPassword123",
                                name = "password",
                                type = "text",
                                isRequired = true
                            }
                        }
                    })
                    if dialog then
                        TriggerServerEvent('qb-moneylaundering:check:password', dialog.password)
                    end
                end,
                drawDistance = 10.0,
                drawColor = {255, 255, 255, 255},
                successDrawColor = {30, 144, 255, 255},
            }
        },
        distance = 2.5,
    })
end

for i = 1, #Config.washingmachines do
    exports['qb-target']:AddBoxZone("LaunderingMachine"..i, Config.washingmachines[i].coords, 1.5, 1.2, {
    name = "LaunderingMachine"..i,
    heading = 100,
    debugPoly = false,
    minZ = Config.washingmachines[i].coords.z - 1.0,
    maxZ = Config.washingmachines[i].coords.z + 1.0
    }, {
        options = {
            {
                icon = 'fas fa-hand-sparkles',
                label = 'Launder Money',
                action = function(entity)
                    TriggerServerEvent('qb-moneylaundering:launder', i)
                end,
                drawDistance = 10.0,
                drawColor = {255, 255, 255, 255},
                successDrawColor = {30, 144, 255, 255},
            },
            {
                icon = 'fas fa-money-bill-wave',
                label = 'Collect Money',
                action = function(entity)
                    TriggerServerEvent('qb-moneylaundering:launder:collect', i)
                end,
                drawDistance = 10.0,
                drawColor = {255, 255, 255, 255},
                successDrawColor = {30, 144, 255, 255},
            }
        },
        distance = 2.5,
    })
end

AddEventHandler('onResourceStop', function(resource)
    if GetCurrentResourceName() ~= resource then return end
    exports['qb-target']:RemoveZone("LaunderingDoor1")
    exports['qb-target']:RemoveZone("LaunderingDoor2")
    for i = 1, #Config.washingmachines do
        exports['qb-target']:RemoveZone("LaunderingMachine"..i)
    end
end)

RegisterNetEvent('qb-moneylaundering:client:sync', function(ServerConfig)
    Config = ServerConfig
end)

RegisterNetEvent('qb-moneylaundering:client:particle', function(ID)
    local Dictionary = 'cut_paletoscore'
    local Dictionary2 = 'core'
    local ParticleName = 'scr_paleto_banknotes'
    local ParticleName2 = 'water_splash_ped_out'
    CreateThread(function()
        RequestNamedPtfxAsset(Dictionary)
        while not HasNamedPtfxAssetLoaded(Dictionary) do Wait(0) end
        RequestNamedPtfxAsset(Dictionary2)
        while not HasNamedPtfxAssetLoaded(Dictionary2) do Wait(0) end
        local Timer = Config.timer
        while Timer > 0 do
            UseParticleFxAssetNextCall(Dictionary)
            StartNetworkedParticleFxNonLoopedAtCoord(ParticleName, Config.washingmachines[ID].coords, 0.0, 0.0, 0.0, 1.5)
            UseParticleFxAssetNextCall(Dictionary2)
            StartNetworkedParticleFxNonLoopedAtCoord(ParticleName2, Config.washingmachines[ID].coords, 0.0, 0.0, 0.0, 2.0)
            RemoveNamedPtfxAsset(Dictionary)
            RemoveNamedPtfxAsset(Dictionary2)
            Timer = Timer - 1000
            Wait(1000)
        end
    end)
end)
