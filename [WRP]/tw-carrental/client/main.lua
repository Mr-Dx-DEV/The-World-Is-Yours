CreateThread(function()
    Core, Config.Framework = GetCore()
end)
local pedSpawned = false
local ShopPed = {}
nuiLoaded = false
local spawncarcoords
currentPed = nil

local function openRentMenu(data, k)
    currentPed = k
    SendNUIMessage({
        action = 'OPEN_NUI',
        payload = data
    })
    SetNuiFocus(true, true)
    local playerData = TriggerCallback('tworst-rental:server:getPlayerData')
    SendNUIMessage({
        action = 'LOAD_PLAYER_DATA',
        payload = playerData
    })
end
CreateThread(function()
    while Core == nil do
        Wait(0)
    end
    while not nuiLoaded do
        if NetworkIsSessionStarted() then
            SendNUIMessage({
                action = "CHECK_NUI",
            })
        end
        Wait(2000)
    end
end)

RegisterNUICallback("LoadedNUI", function(data, cb)
    nuiLoaded = true
    cb("ok")
end)

local function createBlips()
    if pedSpawned then return end
    for store in pairs(Config.Locations) do
        if Config.Locations[store]["showblip"] then
            local StoreBlip = AddBlipForCoord(Config.Locations[store]["coords"]["x"],
                Config.Locations[store]["coords"]["y"], Config.Locations[store]["coords"]["z"])
            SetBlipSprite(StoreBlip, Config.Locations[store]["blipsprite"])
            SetBlipScale(StoreBlip, Config.Locations[store]["blipscale"])
            SetBlipDisplay(StoreBlip, 4)
            SetBlipColour(StoreBlip, Config.Locations[store]["blipcolor"])
            SetBlipAsShortRange(StoreBlip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.Locations[store]["blipname"])
            EndTextCommandSetBlipName(StoreBlip)
        end
    end
end


RegisterCommand(Config.TimeLeftCommand, function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if vehicle ~= 0 then
        local plate = GetVehicleNumberPlateText(vehicle)
        local time = TriggerCallback('tworst-rental:server:getRemainingTime', plate)
        local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

        local stats, topspeed = calculateStats(vehicle)
        SendNUIMessage({
            action = "USE_REMAINING_TIME_COMMAND",
            payload = { time = time, stats = stats, topspeed = topspeed, vehicleLabel = vehicleName }
        })

        local timer = GetGameTimer()
        while GetGameTimer() - timer < 20 * 1000 do
            Wait(1)
            if IsControlJustPressed(0, 38) then
                SendNUIMessage({
                    action = "STOP_REMAINING_TIME_COMMAND",
                })
            end
        end
    end
end)


Citizen.CreateThread(function()
    if not nuiLoaded then
        while not nuiLoaded do
            Wait(0)
        end
    end
    SendNUIMessage({
        action = 'LOAD_CONFIG',
        payload = { ServerName = Config.ServerName, Thema = Config.Thema, MoneyType = Config.MoneyType, testDriveDefaultTime = Config.TestDriveDefaultTime }
    })
    local playerData = TriggerCallback('tworst-rental:server:getPlayerData')
    SendNUIMessage({
        action = 'LOAD_PLAYER_DATA',
        payload = playerData
    })
    SendNUIMessage({
        action = 'TestDriveAccess',
        payload = Config.TestDrive
    })
end)


local function createPeds()
    if pedSpawned then return end

    for k, v in pairs(Config.Locations) do
        local current = type(v["ped"]) == "number" and v["ped"] or joaat(v["ped"])

        RequestModel(current)
        while not HasModelLoaded(current) do
            Wait(0)
        end
        ShopPed[k] = CreatePed(0, current, v["coords"].x, v["coords"].y, v["coords"].z - 1, v["coords"].w, false, false)
        TaskStartScenarioInPlace(ShopPed[k], v["scenario"], 0, true)
        FreezeEntityPosition(ShopPed[k], true)
        SetEntityInvincible(ShopPed[k], true)
        SetBlockingOfNonTemporaryEvents(ShopPed[k], true)
        if Config.Interacted == "qb-target" then
            exports['qb-target']:AddTargetEntity(ShopPed[k], {
                options = {
                    {
                        label = v["targetLabel"],
                        icon = v["targetIcon"],
                        action = function()
                            openRentMenu(v.vehicleCategory, k)
                        end,
                    }
                },
                distance = 2.0
            })
            pedSpawned = true
        elseif Config.Interacted == "drawtext" then
            PedDrawtext(v["coords"], v.vehicleCategory, k)
        end
    end
end

PedDrawtext = function(coords, vehicleCategory, k)
    Citizen.CreateThread(function()
        while true do
            local wait = 1000
            local mycoords = GetEntityCoords(PlayerPedId())
            local distance = #(mycoords - vector3(coords.x, coords.y, coords.z))
            if distance < 3.0 then
                wait = 0
                DrawText3D(coords.x, coords.y, coords.z + 1.0, Config.DrawText.rentVehicle)
                if IsControlJustReleased(1, 38) then
                    openRentMenu(vehicleCategory, k)
                end
            end
            Wait(wait)
        end
    end)
end

Citizen.CreateThread(function()
    if Config.ReturnVehicle then
        while true do
            wait = 1000
            for k, v in pairs(Config.Locations) do
                local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                if vehicle ~= 0 then
                    local coords = GetEntityCoords(PlayerPedId())
                    local distance = #(coords - vector3(v["coords"].x, v["coords"].y, v["coords"].z))
                    if distance < 8.0 then
                        DrawText3D(coords.x,
                            coords.y, coords.z + 0.5, Config.DrawText.returnVehicle)
                        local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                        if GetPedInVehicleSeat(vehicle, -1) == PlayerPedId() and IsControlJustReleased(1, 38) and vehicle ~= 0 and distance < 8.0 then
                            TriggerServerEvent('tworst-vehicleRental:sv:returnVehicle',
                                GetVehicleNumberPlateText(vehicle))
                        end
                        wait = 0
                    end
                end
            end
            Citizen.Wait(wait)
        end
    end
end)

local function deletePeds()
    if not pedSpawned then return end
    for _, v in pairs(ShopPed) do
        DeletePed(v)
    end
    pedSpawned = false
end

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function()
    Wait(1000)
    createBlips()
    createPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    createBlips()
    createPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    deletePeds()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    createBlips()
    createPeds()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    deletePeds()
end)

RegisterNUICallback('closeNUI', function()
    SetNuiFocus(false, false)
end)

RegisterNUICallback('rentVehicle', function(data)
    SetNuiFocus(false, false)
    TriggerServerEvent("tworst-vehicleRental:sv:rentVehicle", data)
end)

RegisterNetEvent('tworst-vehicleRental:cl:spawnVehicle', function(model, time, rentType)
    if not currentPed then
        print('hata currentPed')
        return
    end
    local availableCoords = {}
    for i, coords in ipairs(Config.Locations[currentPed].carspawn) do
        local newCoords = coords
        local distanceCheck = GetVehiclesInArea(newCoords, 2.0)
        if next(distanceCheck) == nil then
            table.insert(availableCoords, newCoords)
        end
    end
    if #availableCoords > 0 then
        local randomIndex = math.random(#availableCoords)
        local selectedCoords = availableCoords[randomIndex]
        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do
            Wait(0)
        end
        vehicle = CreateVehicle(GetHashKey(model), selectedCoords, true,
            true)
        local plate = GetVehicleNumberPlateText(vehicle)
        SetEntityHeading(vehicle, selectedCoords.w)
        Config.GiveVehicleKey(GetVehicleNumberPlateText(vehicle),
            GetHashKey(model))
        SetVehicleEngineOn(vehicle, true, true)
        SetVehicleDirtLevel(vehicle, 0.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        Config.setFuel(vehicle, 100)
        TriggerServerEvent("tworst-vehicleRental:sv:updatesql", plate, model, time, rentType)
        Config.Notification(Config.NotificationText["succespurchase"].text,
            Config.NotificationText["succespurchase"].type, false)
        TriggerServerEvent('tworst-vehicleRental:giveRentalPaper', plate, model, time, rentType)
    else
        Config.Notification(Config.NotificationText["noparkingspot"].text, Config.NotificationText["noparkingspot"].type,
            false)
    end
end)

RegisterNetEvent('tworst-vehicleRental:cl:deleteVehicle', function(plate)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    print(plate)
    print(GetVehicleNumberPlateText(vehicle))
    if GetVehicleNumberPlateText(vehicle) == plate then
        Config.RemoveVehicleKey(plate, GetHashKey(model))
        DeleteEntity(vehicle)
    end
end)

CreateThread(function()
    while true do
        TriggerServerEvent("tworst-vehicleRental:sv:checktime")
        Wait(Config.TimeRefresh)
    end
end)

RegisterNUICallback('startTestDrive', function(data)
    SetNuiFocus(false, false)
    StartTestDrive(data)
end)
RegisterNUICallback('stopTestDrive', function()
    SetNuiFocus(false, false)
    TestDriveActive = false
end)

function getField(field, vehicle)
    return GetVehicleHandlingFloat(vehicle, 'CHandlingData', field)
end

local statsCache = {}
function calculateStats(vehicle)
    local model = GetEntityModel(vehicle)
    local info = statsCache[model]
    if info then
        return info.info, info.vehClass, info.topSpeed
    end

    info = {}

    --calculate specs percentage
    local braking = getField('fBrakeForce', vehicle) * getField('fBrakeBiasFront', vehicle) * 100
    local traction = (getField('fTractionCurveMax', vehicle) + getField('fTractionCurveMin', vehicle) + getField('fTractionCurveLateral', vehicle)) *
        3
    local transmission = (getField('fClutchChangeRateScaleUpShift', vehicle) * getField('fClutchChangeRateScaleDownShift', vehicle)) *
        2
    local acceleration = getField('fInitialDriveMaxFlatVel', vehicle) * getField('fInitialDriveForce', vehicle)
    local handling = (getField('fSteeringLock', vehicle) + getField('fTractionBiasFront', vehicle) - getField('fTractionLossMult', vehicle)) *
        2

    info = {
        braking = {
            name = "Braking",
            value = braking,
        },
        traction = {
            name = "Traction",
            value = traction,
        },
        transmission = {
            name = "Transmission",
            value = transmission,
        },
        acceleration = {
            name = "Acceleration",
            value = acceleration,
        },
        handling = {
            name = "Handling",
            value = handling,
        },
    }

    local topSpeedKM = math.floor(GetVehicleEstimatedMaxSpeed(vehicle) * 3.6)

    statsCache[model] = { info = info, topSpeed = topSpeedKM }
    return info, topSpeedKM
end

function LoadModel(model)
    if type(model) == "string" then model = GetHashKey(model) end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(10)
    end
    return model
end

function StartTestDrive(vehicleData)
    RenderScriptCams(false, true, 300, true, true)
    TestDriveActive = true
    local hash = LoadModel(vehicleData.vehicleData.vehicleName)

    local vehpos = Config.Locations[currentPed].testdrivecoords

    local pedlastcoords = Config.Locations[currentPed].coords
    local veh = CreateVehicle(hash, vehpos.x, vehpos.y, vehpos.z, vehpos.w, true, false)
    SetVehicleOnGroundProperly(veh)
    SetVehicleNumberPlateText(veh, Config.TestDrivePlate)
    SetVehicleEngineOn(veh, true, true, false)
    SetVehicleEngineCanDegrade(veh, false)
    SetVehicleDirtLevel(veh)
    SetVehicleUndriveable(veh, false)
    SetVehicleDoorsLocked(veh, 1)
    SetVehicleExtraColours(veh, 0, 0)
    Config.GiveVehicleKey(GetVehicleNumberPlateText(veh),
        GetHashKey(hash))
    SetVehicleEngineOn(veh, true, true)
    SetVehicleDirtLevel(veh, 0.0)
    Config.setFuel(veh, 100)

    local stats, topspeed = calculateStats(veh)
    SendNUIMessage({
        action = "START_TESTDRIVE",
        payload = { time = Config.TestDriveDefaultTime, stats = stats, topspeed = topspeed }
    })
    TriggerServerEvent("tworst-vehicleRental:TestDrive", true, NetworkGetNetworkIdFromEntity(veh))

    while not DoesEntityExist(veh) do
        Wait(10)
    end


    TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    Wait(250)
    local timer = GetGameTimer()
    while GetGameTimer() - timer < Config.TestDriveDefaultTime * 1000 do
        DisableControlAction(1, 75, true)
        DisableControlAction(1, 200, true)
        Wait(1)
        if IsControlJustPressed(0, 38) then
            SendNUIMessage({
                action = "STOP_TESTDRIVE",
            })
            Config.RemoveVehicleKey(GetVehicleNumberPlateText(veh),
                GetHashKey(hash))
            Wait(400)
            if DoesEntityExist(veh) then
                DeleteEntity(veh)
            end
            SetCamActive(PreviewCam, true)
            RenderScriptCams(true, false, 0, true, true)
            SetEntityCoords(PlayerPedId(), pedlastcoords)
            while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
                Wait(10)
            end
            Wait(500)
            TriggerServerEvent("tworst-vehicleRental:TestDrive", false)

            return false
        end
        if IsDisabledControlJustReleased(1, 200) then
            break
        end

        local playerPed = PlayerPedId()
        if not IsPedInAnyVehicle(playerPed, false) or GetPedInVehicleSeat(veh, -1) ~= playerPed then
            break
        end
    end
    Config.RemoveVehicleKey(GetVehicleNumberPlateText(veh),
        GetHashKey(hash))
    Wait(400)
    if DoesEntityExist(veh) then
        DeleteEntity(veh)
    end


    SetCamActive(PreviewCam, true)
    RenderScriptCams(true, false, 0, true, true)
    SetEntityCoords(PlayerPedId(), pedlastcoords)

    while not HasCollisionLoadedAroundEntity(PlayerPedId()) do
        Wait(10)
    end

    Wait(500)
    TriggerServerEvent("tworst-vehicleRental:TestDrive", false)
    SetNuiFocus(true, true)
    return true
end
