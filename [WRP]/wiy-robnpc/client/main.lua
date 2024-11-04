QBCore = exports['qb-core']:GetCoreObject()

local robbedRecently = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        if IsControlJustPressed(0, 38) then
            local aiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))

            if aiming then
                local playerPed = GetPlayerPed(-1)
                local pCoords = GetEntityCoords(playerPed, true)
                local tCoords = GetEntityCoords(targetPed, true)

                if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                    if robbedRecently then
                        QBCore.Functions.Notify(_U('robbed_too_recently'))
                    elseif IsPedDeadOrDying(targetPed, true) then
                        QBCore.Functions.Notify(_U('target_dead'))
                    elseif GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, tCoords.x, tCoords.y, tCoords.z, true) >= Config.RobDistance then
                        QBCore.Functions.Notify(_U('target_too_far'))
                    else
                        robNpc(targetPed)
                    end
                end
            end
        end
    end
end)

function robNpc(targetPed)
    robbedRecently = true

    Citizen.CreateThread(function()
        local dict = 'random@mugging3'
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(10)
        end
        ClearPedTasks(targetPed)
        TaskStandStill(targetPed, Config.RobAnimationSeconds * 1000)
        FreezeEntityPosition(targetPed, true)
        TaskPlayAnim(targetPed, dict, 'handsup_standing_base', 8.0, -8, .01, 15, 0, 0, 0, 0)
        QBCore.Functions.Notify(_U('robbery_started'))

        -- Triggering police alert when robbery starts
        TriggerEvent('qs-dispatch:policeAlert', 'Robbery in Progress', GetEntityCoords(PlayerPedId()))  -- Example for qs-dispatch
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job = {
                "police",
                "sheriff",
                "fbi",
                "lspd",
                "bcso",
                "sahp",
                "lsso",
                "safw",
                "sadoc",
                "usms",
                "dhs",
                "ss"
            }, -- Target jobs
            coords = GetEntityCoords(PlayerPedId()), -- Robbery coordinates
            title = 'Robbery Alert', -- Title of the dispatch alert
            message = 'A robbery has been reported!', -- Message to be shown in dispatch
            flash = 0, -- Flash the blip in the map (0 = No flash, 1 = Flash)
            uniqueId = tostring(math.random(1000, 9999)), -- Unique ID for the alert
            callSign = '10-31', -- Optional call sign for the alert
        }) -- Example for cd_dispatch

        Citizen.Wait(Config.RobAnimationSeconds * 1000)

        QBCore.Functions.TriggerCallback('qb-robnpc:giveMoney', function(x)
            FreezeEntityPosition(targetPed, false)
            ClearPedTasks(targetPed)
            TaskSmartFleePed(targetPed, PlayerPedId(), 100, -1)
            QBCore.Functions.Notify(_U('robbery_completed', x))
        end)

        if Config.ShouldWaitBetweenRobbing then
            Citizen.Wait(math.random(Config.MinWaitSeconds, Config.MaxWaitSeconds) * 1000)
            QBCore.Functions.Notify(_U('can_rob_again'))
        end

        robbedRecently = false
    end)
end
