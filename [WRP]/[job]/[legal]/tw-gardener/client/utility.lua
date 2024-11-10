jobData = {
    jobname = nil,
    job_grade_name = nil,
    job_grade = nil,
    job_label = nil
}

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    Wait(1000)
    TriggerServerEvent('tw-gardener:loadData')
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
    Wait(1000)
    TriggerServerEvent('tw-gardener:loadData')
end)

CreateThread(function()
    Core, Config.Framework = GetCore()
    spawnPed()
    createBlips()
    SetPlayerJob()
end)
AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentServerEndpoint() == nil) then
        return
    end
    if (resource == GetCurrentResourceName()) then
        TriggerServerEvent('tw-gardener:loadData')
        ClearPedTasks(PlayerPedId())
    end
end)

function SetPlayerJob()
    while Core == nil do
        Wait(0)
    end
    Wait(500)
    while not nuiLoaded do
        Wait(50)
    end
    WaitPlayer()

    if Config.Framework == 'esx' or Config.Framework == 'oldesx' then
        local PlayerData = Core.GetPlayerData()
        jobData.jobname = PlayerData.job.name
        jobData.job_grade_name = PlayerData.job.label
        jobData.job_grade = tonumber(PlayerData.job.grade)
    else
        local PlayerData = Core.Functions.GetPlayerData()
        jobData.jobname = PlayerData["job"].name
        jobData.job_grade_name = PlayerData["job"].label
        jobData.job_grade = PlayerData["job"].grade.level
    end
end

function WaitPlayer()
    if Config.Framework == "esx" or Config.Framework == 'oldesx' then
        while Core == nil do
            Wait(0)
        end
        while Core.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.GetPlayerData().job == nil do
            Wait(0)
        end
    else
        while Core == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData() == nil do
            Wait(0)
        end
        while Core.Functions.GetPlayerData().metadata == nil do
            Wait(0)
        end
    end
end

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job)
    Wait(1000)
    SetPlayerJob()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(data)
    Wait(1000)
    SetPlayerJob()
end)


local blips = {}

function createBlips()
    if Config.Gardener['blip']['show'] then
        blips = AddBlipForCoord(tonumber(Config.Gardener['coords'].intreactionCoords.x),
            tonumber(Config.Gardener['coords'].intreactionCoords.y),
            tonumber(Config.Gardener['coords'].intreactionCoords.z))
        SetBlipSprite(blips, Config.Gardener['blip'].blipType)
        SetBlipDisplay(blips, 4)
        SetBlipScale(blips, Config.Gardener['blip'].blipScale)
        SetBlipColour(blips, Config.Gardener['blip'].blipColor)
        SetBlipAsShortRange(blips, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(tostring(Config.Gardener['blip'].blipName))
        EndTextCommandSetBlipName(blips)
    end
end

function canOpen()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped, false) then
        return false
    end
    if Config.Gardener['job'] then
        if Config.Gardener['job'] ~= 'all' and Config.Gardener['job'] ~= jobData.jobname then
            Config.Notification(Config.NotificationText['wrongjob'].text,
                Config.NotificationText['wrongjob'].type, false)
            return false
        end
    end
    return true
end

function spawnPed()
    if Config.Gardener.coords.ped then
        WaitForModel(Config.Gardener.coords.pedHash)
        local createNpc = CreatePed("PED_TYPE_PROSTITUTE",
            Config.Gardener.coords.pedHash,
            Config.Gardener.coords.pedCoords.x,
            Config.Gardener.coords.pedCoords.y,
            Config.Gardener.coords.pedCoords.z - 0.98,
            Config.Gardener.coords.pedHeading, false,
            false)
        FreezeEntityPosition(createNpc, true)
        SetEntityInvincible(createNpc, true)
        SetBlockingOfNonTemporaryEvents(createNpc, true)
    end
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 41, 11, 41, 90)
end

function SetBlipAttributes(blip, id)
    SetBlipSprite(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, true)
    SetBlipColour(blip, 26)
    ShowNumberOnBlip(blip, id)
    SetBlipShowCone(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Gardener : " .. id)
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent('tworst-gardener:openMenu', function()
    if canOpen() then
        openGardenerMenu()
    end
end)

function WaitForModel(model)
    if not IsModelValid(model) then
        return
    end

    if not HasModelLoaded(model) then
        RequestModel(model)
    end

    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end
end

function GetVehicles()
    return GetGamePool('CVehicle')
end

function GetVehiclesInArea(coords, maxDistance)
    return EnumerateEntitiesWithinDistance(GetVehicles(), false, coords, maxDistance)
end

function EnumerateEntitiesWithinDistance(entities, isPlayerEntities, coords, maxDistance)
    local nearbyEntities = {}

    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        local playerPed = PlayerPedId()
        coords = GetEntityCoords(playerPed)
    end
    for k, entity in pairs(entities) do
        local distance = #(coords - GetEntityCoords(entity))

        if distance <= maxDistance then
            nearbyEntities[#nearbyEntities + 1] = isPlayerEntities and k or entity
        end
    end
    return nearbyEntities
end

Citizen.CreateThread(function()
    Config.OpenTrigger = function()
        if Config.InteractionHandler == "qb-target" then
            exports['qb-target']:RemoveZone('twgardener' .. 1)

            exports['qb-target']:AddBoxZone("twgardener" .. 1,
                vector3(Config.Gardener.coords.intreactionCoords.x,
                    Config.Gardener.coords.intreactionCoords.y,
                    Config.Gardener.coords.intreactionCoords.z), 1.5,
                1.5,
                {
                    name = "twgardener" .. 1,
                    debugPoly = false,
                    heading = -20,
                    minZ = Config.Gardener.coords.intreactionCoords.z - 2,
                    maxZ = Config.Gardener.coords.intreactionCoords.z + 2,
                }, {
                    options = {
                        {
                            type = "client",
                            event = "tworst-gardener:openMenu",
                            icon = 'fas fa-credit-card',
                            label = "Open Gardener Menu",

                        },
                    },
                    distance = 2
                })
        elseif Config.InteractionHandler == "ox-target" then
            exports.ox_target:removeZone('twgardener' .. 1)


            exports['ox_target']:addBoxZone({
                coords = vector3(Config.Gardener.coords.intreactionCoords.x,
                    Config.Gardener.coords.intreactionCoords.y,
                    Config.Gardener.coords.intreactionCoords.z),
                minZ = Config.Gardener.coords.intreactionCoords.z - 2,
                maxZ = Config.Gardener.coords.intreactionCoords.z + 2,
                heading = -20,
                name = "twgardener" .. 1,
                id = "twgardener" .. 1,
                options = {
                    {
                        type = "client",
                        event = "tworst-gardener:openMenu",
                        icon = 'fas fa-credit-card',
                        label = "Open Gardener Menu",
                    },
                },
                distance = 2
            })
        elseif Config.InteractionHandler == "drawtext" then
            Citizen.CreateThread(function()
                while true do
                    local wait = 1500
                    local playerPed = PlayerPedId()
                    local coords = GetEntityCoords(playerPed)
                    local distance = #(coords - Config.Gardener.coords.intreactionCoords)
                    if distance < 1.5 then
                        wait = 0
                        DrawText3D(Config.Gardener.coords.intreactionCoords.x,
                            Config.Gardener.coords.intreactionCoords.y,
                            Config.Gardener.coords.intreactionCoords.z + 1.0,
                            "Press [~g~E~s~] to Gardener Menu")
                        if IsControlJustReleased(0, 38) then
                            if canOpen() then
                                openGardenerMenu()
                            end
                        end
                    end

                    Citizen.Wait(wait)
                end
            end)
        end
    end
end)

function TriggerCallback(name, data)
    local incomingData = false
    local status = 'UNKOWN'
    local counter = 0
    while Core == nil do
        Wait(0)
    end
    if Config.Framework == 'esx' then
        Core.TriggerServerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    else
        Core.Functions.TriggerCallback(name, function(payload)
            status = 'SUCCESS'
            incomingData = payload
        end, data)
    end
    CreateThread(function()
        while incomingData == 'UNKOWN' do
            Wait(1000)
            if counter == 4 then
                status = 'FAILED'
                incomingData = false
                break
            end
            counter = counter + 1
        end
    end)

    while status == 'UNKOWN' do
        Wait(0)
    end
    return incomingData
end

function GiveJobClothing()
    if Config.ChangeClothesSystem then
        local gender
        if GetEntityModel(PlayerPedId()) == GetHashKey("mp_m_freemode_01") then
            gender = 'male'
        elseif GetEntityModel(PlayerPedId()) == GetHashKey("mp_f_freemode_01") then
            gender = 'female'
        else
            return
        end

        TriggerEvent('skinchanger:getSkin', function(skin)
            TriggerEvent("esx_skin:setLastSkin", skin)
        end)

        local clothes = Config.JobClothes[gender]
        if clothes then
            for _, cloth in ipairs(clothes) do
                for part, id in pairs(cloth) do
                    if part ~= "texture" then
                        ChangeClothes(part, id, cloth.texture)
                    end
                end
            end
        end
    end
end

function ChangeClothes(key, value, texture)
    local playerPed = PlayerPedId()
    value = tonumber(value)
    texture = tonumber(texture)

    if key == 'jacket' then
        SetPedComponentVariation(playerPed, 11, value, texture, 2)
    end
    if key == 'shirt' then
        SetPedComponentVariation(playerPed, 8, value, texture, 2)
    end
    if key == 'arms' then
        SetPedComponentVariation(playerPed, 3, value, texture, 2)
    end
    if key == 'legs' then
        SetPedComponentVariation(playerPed, 4, value, texture, 2)
    end
    if key == 'shoes' then
        SetPedComponentVariation(playerPed, 6, value, texture, 2)
    end
    if key == 'mask' then
        SetPedComponentVariation(playerPed, 1, value, texture, 2)
    end
    if key == 'chain' then
        SetPedComponentVariation(playerPed, 7, value, texture, 2)
    end
    if key == 'decals' then
        SetPedComponentVariation(playerPed, 10, value, texture, 2)
    end
    if key == 'helmet' then
        SetPedPropIndex(playerPed, 0, value, texture, 2)
    end
    if key == 'glasses' then
        SetPedPropIndex(playerPed, 1, value, texture, 2)
    end
    if key == 'watches' then
        SetPedPropIndex(playerPed, 6, value, texture, 2)
    end
    if key == 'bracelets' then
        SetPedPropIndex(playerPed, 7, value, texture, 2)
    end
end

function RefreshSkin()
    if Config.ChangeClothesSystem then
        if Config.ClothingScript == 'fivem-appearance' then
            -- wasabi-fivem-appearance
            Core.TriggerServerCallback('esx_skin:getPlayerSkin', function(appearance)
                exports['fivem-appearance']:setPlayerAppearance(appearance)
            end)

            --normal fivem-appearance
            -- TriggerEvent("fivem-appearance:client:reloadSkin")
        end
        if Config.ClothingScript == 'illenium-appearance' then
            TriggerEvent("illenium-appearance:client:reloadSkin")
        end
        if Config.ClothingScript == 'esx_skin' then
            TriggerEvent("esx_skin:getLastSkin", function(lastSkin)
                TriggerEvent('skinchanger:loadSkin', lastSkin)
            end)
        end
        if Config.ClothingScript == 'qb-clothing' then
            TriggerEvent("qb-clothing:reloadSkin")
            --[[
                // Add this code in qb-clothing client/main.lua

                RegisterNetEvent("qb-clothing:reloadSkin")
                AddEventHandler("qb-clothing:reloadSkin", function()
                    local playerPed = PlayerPedId()
                    local health = GetEntityHealth(playerPed)
                    reloadSkin(health)
                end)
            --]]
            ExecuteCommand('refreshskin')
        end
    end
end
