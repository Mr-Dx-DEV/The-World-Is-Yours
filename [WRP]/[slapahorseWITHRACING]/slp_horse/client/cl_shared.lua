
function getoffHorseResetSkin() --DO NOT CHANGE THE NAME OF THE FUNCTION
    --CHANGE THESE ACCORDING TO YOUR RELOADSKIN FUNCTION
    if Config.clothing == 'qb-clothing' then
        QBCore = exports['qb-core']:GetCoreObject()

        local playerPed = PlayerPedId()
        local model
    
        local gender = QBCore.Functions.GetPlayerData().charinfo.gender
    
        if gender == 1 then -- Gender is ONE for FEMALE
            model = GetHashKey("mp_f_freemode_01") -- Female Model
        else
            model = GetHashKey("mp_m_freemode_01") -- Male Model
        end
    
        loadModel(model)
    
        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
    
        TriggerServerEvent("qb-clothes:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES
        TriggerServerEvent("qb-clothing:loadPlayerSkin") -- LOADING PLAYER'S CLOTHES - Event 2
        Wait(50)
        local maxhealth = GetEntityMaxHealth(PlayerPedId())
        local health = GetEntityHealth(PlayerPedId())
        SetEntityMaxHealth(PlayerPedId(),maxhealth)
        SetEntityHealth(PlayerPedId(),health)
    
    elseif Config.clothing == 'skinchanger' then
    
        ESX = exports['es_extended']:getSharedObject()
    
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
            local isMale = skin.sex == 0
    
            TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                    TriggerEvent('skinchanger:loadSkin', skin)
                    TriggerEvent('esx:restoreLoadout')
                end)
            end)
    
        end)
    elseif Config.clothing == 'illenium-appearance' then
        TriggerEvent('illenium-appearance:client:reloadSkin')
    elseif Config.clothing == 'fivem-appearance_esx' then
        ESX = exports['es_extended']:getSharedObject()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(appearance)
            exports['fivem-appearance']:setPlayerAppearance(appearance)
        end)
    elseif Config.clothing == 'fivem-appearance_qb' then
        local playerPed = PlayerPedId()
        QBCore.Functions.TriggerCallback('fivem-appearance:getPlayerSkin', function(appearance)
            exports['fivem-appearance']:setPlayerAppearance(appearance)
        end)
        for k, v in pairs(GetGamePool('CObject')) do
            if IsEntityAttachedToEntity(PlayerPedId(), v) then
                SetEntityAsMissionEntity(v, true, true)
                DeleteObject(v)
                DeleteEntity(v)
            end
        end
        Wait(50)
        local maxhealth = GetEntityMaxHealth(PlayerPedId())
        local health = GetEntityHealth(PlayerPedId())
        SetEntityMaxHealth(PlayerPedId(),maxhealth)
        SetEntityHealth(PlayerPedId(),health)
    end
end


RegisterNetEvent('slp_horse:rideHorse')
AddEventHandler('slp_horse:rideHorse', function()
    local ped = PlayerPedId()
    if DoesEntityExist(horse) and not IsEntityDead(horse) and not IsEntityDead(ped) and not IsPedRagdoll(horse) and not IsPedRagdoll(ped) and not IsPedGettingUp(ped) and not IsPedGettingUp(horse) and not IsPedFalling(ped) and not jumping then

        if IsEntityNearEntity(ped, horse, 1.5) and not IsEntityNearCoords(ped, 1199.85, 336.78, 81.99, 1.0) and not IsEntityNearCoords(ped, 1093.72, 155.24, 81.85, 1.0) and not IsEntityNearCoords(ped, 1213.65, 333.76, 82.02, 1.0) and not IsEntityNearCoords(ped, 1084.86, 89.46, 82.89, 1.0) then
            if not IsEntityAttachedToEntity(dummyClone, ped) then
                rideHeading = GetEntityHeading(horse)
                rideHorse()
            end
        end
    end
end)

if Config.commandToGetOffHorse then
    RegisterCommand(Config.commandToGetOffHorse, function()
        local ped = PlayerPedId()

        if enableHorse then
            if DoesEntityExist(dummyClone) then
                if IsEntityAttachedToEntity(dummyClone, ped) then
                    if not jumping and not IsPedFalling(ped) and not IsPedRagdoll(ped) and not IsEntityDead(ped) and IsPedStill(ped) and not IsEntityNearCoords(ped, 1199.85, 336.78, 81.99, 1.0) and not IsEntityNearCoords(ped, 1093.72, 155.24, 81.85, 1.0) and not IsEntityNearCoords(ped, 1213.65, 333.76, 82.02, 1.0) and not IsEntityNearCoords(ped, 1084.86, 89.46, 82.89, 1.0) then
                       
                        exitHorse()
                        ClearPedTasks(horse)
                        local ped = PlayerPedId()
                        local group = GetPedGroupIndex(ped)
                        local coords = GetEntityCoords(horse)
                        local heading = GetEntityHeading(horse)
                        SetPedAsGroupMember(horse, group)
                        if DoesEntityExist(dummyClone) then
                            DeleteEntity(dummyClone)
                        end
                        SetEntityCoords(ped, exitCoords.x, exitCoords.y, exitCoords.z-1.5)
                        SetEntityHeading(ped, heading)
                        makeEntityFaceEntity(ped, horse)
                        dismount = true
                        Wait(1000)
                        dismount = false
                    end
                end
            end
        end
    end)
end