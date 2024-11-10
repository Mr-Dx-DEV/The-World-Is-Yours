function drawTextForTrafo()
    Citizen.CreateThread(function()
        local wait = 1000
        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regiontrafficLampCoords) do
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local trafodistance = #(playerCoords - vector3(value.regionFixedTrafo.coords.x, value.regionFixedTrafo.coords.y, value.regionFixedTrafo.coords.z))
                    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                    if trafodistance < 25 and not value.regionFixedTrafo.fixed then
                        wait = 0
                        DrawMarker(2, value.regionFixedTrafo.coords.x, value.regionFixedTrafo.coords.y,
                            value.regionFixedTrafo.coords.z + 1.0, 0, 0.75, 0.75, 0,
                            0,
                            0,
                            0.5,
                            0.5, 0.5, 255, 255, 255, 210, 0, 0.10, 0, 0, 0, 0.0, 0)
                        if trafodistance < 4 and not value.regionFixedTrafo.fixed then
                            DrawText3D(value.regionFixedTrafo.coords.x, value.regionFixedTrafo.coords.y,
                                value.regionFixedTrafo.coords.z, value.regionFixedTrafoText)

                            if not activeSmokeEffectsTrafo[index] then
                                activeSmokeEffectsTrafo[index] = CreateSmokeEffect(value.regionFixedTrafo.coords)
                            end

                            if IsControlJustPressed(0, 38) and trafodistance < 2 and not playerInVehicle then
                                local missionPermit = TriggerCallback('tworst-electrician:server:getMissionsDetails', {
                                    owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                                    missionControl = 'trafoopen'
                                })
                                if missionPermit then
                                    SetNuiFocus(true, true)
                                    NuiMessage('SWITCH_MINIGAME', {
                                        key = value.regiontrafficKey,
                                        missionName = false,
                                        coords = value.regionFixedTrafo.coords
                                    })
                                else
                                    sendNotification(Config.NotificationText['missionnotpermit'].text,
                                        Config.NotificationText['missionnotpermit'].type)
                                end
                            end
                        end
                    else
                        if activeSmokeEffectsTrafo[index] then
                            RemoveSmokeEffect(activeSmokeEffectsTrafo[index])
                            activeSmokeEffectsTrafo[index] = nil
                        end
                    end
                end
            end
            Citizen.Wait(wait)
        end
    end)
end

function drawTextForHouseBoard()
    Citizen.CreateThread(function()
        local sleep = 1000
        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionhouseBoardCoords) do
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
                    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                    if trafodistance < 10 and not value.fixed then
                        sleep = 0
                        DrawMarker(2, value.coords.x, value.coords.y,
                            value.coords.z + 0.5, 0, 0.75, 0.75, 0,
                            0,
                            0,
                            0.5,
                            0.5, 0.5, 255, 255, 255, 210, 0, 0.10, 0, 0, 0, 0.0, 0)
                        if trafodistance < 5 and not value.fixed then
                            DrawText3D(value.coords.x, value.coords.y, value.coords.z,
                                Config.Electrician['drawtext']['fixHouseBoard'])
                            if not activeSmokeEffectsHouseBoard[index] and not value.fixed and not value.open then
                                activeSmokeEffectsHouseBoard[index] = CreateSmokeEffect(value.coords)
                            end

                            if IsControlJustPressed(0, 38) and not playerInVehicle then
                                local missionPermit = TriggerCallback('tworst-electrician:server:getTrafoModal', {
                                    owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                                    missionName = 'fixHouseBoard',
                                    coords = value.coords,
                                    index = index
                                })
                                if missionPermit then
                                    SetNuiFocus(true, true)
                                    NuiMessage('SWITCH_MINIGAME_HOUSE',
                                        { coords = value.coords, missionName = 'fixHouseBoard', fixed = value.fixed })
                                    TriggerServerEvent('tworst-electrician:server:changeTrafoModal',
                                        CoopDataClient.roomSetting.owneridentifier, index, value.coords, 'fixHouseBoard',
                                        true)
                                else
                                    sendNotification(Config.NotificationText['missionnotpermit'].text,
                                        Config.NotificationText['missionnotpermit'].type)
                                end
                            end
                        end
                    else
                        if activeSmokeEffectsHouseBoard[index] then
                            RemoveSmokeEffect(activeSmokeEffectsHouseBoard[index])
                            activeSmokeEffectsHouseBoard[index] = nil
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end

function drwTextForstreetTrafo()
    Citizen.CreateThread(function()
        local smokeEffect = nil
        local sleep = 1000
        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionstreetTrafoCoords) do
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
                    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                    if trafodistance < 10 and not value.fixed then
                        sleep = 0
                        DrawMarker(2, value.coords.x, value.coords.y,
                            value.coords.z + 2, 0, 0.75, 0.75, 0,
                            0,
                            0,
                            0.5,
                            0.5, 0.5, 255, 255, 255, 210, 0, 0.10, 0, 0, 0, 0.0, 0)
                        if trafodistance < 10 and not value.fixed then
                            DrawText3D(value.coords.x, value.coords.y,
                                value.coords.z + 0.2, Config.Electrician['drawtext']['fixTrafo'])
                            if not activeSmokeEffectsstreetTrafo[index] then
                                activeSmokeEffectsstreetTrafo[index] = CreateSmokeEffect(value.coords)
                            end

                            if IsControlJustPressed(0, 38) and not playerInVehicle then
                                local missionPermit = TriggerCallback('tworst-electrician:server:getTrafoModal',
                                    {
                                        owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                                        missionName = 'fixTrafo',
                                        coords = value.coords,
                                        index = index
                                    })
                                if missionPermit then
                                    SetNuiFocus(true, true)
                                    NuiMessage('SWITCH_MINIGAME_HOUSE',
                                        { coords = value.coords, missionName = 'fixTrafo', fixed = value.fixed })
                                    TriggerServerEvent('tworst-electrician:server:changeTrafoModal',
                                        CoopDataClient.roomSetting.owneridentifier, index, value.coords, 'fixTrafo', true)
                                else
                                    sendNotification(Config.NotificationText['missionnotpermit'].text,
                                        Config.NotificationText['missionnotpermit'].type)
                                end
                            end
                        end
                    else
                        if activeSmokeEffectsstreetTrafo[index] then
                            RemoveSmokeEffect(activeSmokeEffectsstreetTrafo[index])
                            activeSmokeEffectsstreetTrafo[index] = nil
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

function liftdrawtextphonePole()
    Citizen.CreateThread(function()
        while true do
            local sleep = 1000

            if CoopDataClient and CoopDataClient.roomSetting and (CoopDataClient.roomSetting.startJob or CoopDataClient.roomSetting.finishJob) then
                for key, value in ipairs(CoopDataClient.roomSetting.Mission.regionphonePoleCoords) do
                    for index, carvalue in ipairs(CoopDataClient.roomSetting.VehicleNetId) do
                        local vehicle = NetToVeh(carvalue)
                        if DoesEntityExist(vehicle) then
                            local plate = GetVehicleNumberPlateText(vehicle)
                            if CoopDataClient.roomSetting.Mission.regionJobVehiclePlate == plate and not CoopDataClient.roomSetting.liftCraft then
                                local vehicle = NetToVeh(carvalue)
                                local vehicleCoords = GetEntityCoords(vehicle)
                                local trafodistance = #(vector2(vehicleCoords.x, vehicleCoords.y) - vector2(value.coords.x, value.coords.y))
                                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                                if trafodistance < 8 and not value.fixed then
                                    sleep = 0
                                    local playerCoords = GetEntityCoords(PlayerPedId())
                                    local distanceToTrunk = #(vector2(playerCoords.x, playerCoords.y) - vector2(value.coords.x, value.coords.y))
                                    if next(Lifts) ~= nil then
                                        for k, v in pairs(Lifts) do
                                            local dist = #(v2(v.coords) - v2(playerCoords))
                                            if not (dist < 20.0) then
                                                if distanceToTrunk < 8 then
                                                    if not liftcraft then
                                                        DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z,
                                                            Config.Electrician['drawtext']['buildlift'])
                                                    end

                                                    if IsControlJustReleased(0, 38) and not liftcraft and not playerInVehicle then
                                                        TriggerServerEvent('tworst-electrician-server:build', 'lift',
                                                            value.coords,
                                                            CoopDataClient.roomSetting.owneridentifier)
                                                        liftcraft = true
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        if distanceToTrunk < 8 then
                                            if not liftcraft then
                                                DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z,
                                                    Config.Electrician['drawtext']['buildlift'])
                                            end

                                            if IsControlJustReleased(0, 38) and not liftcraft and not playerInVehicle then
                                                TriggerServerEvent('tworst-electrician-server:build', 'lift',
                                                    value.coords,
                                                    CoopDataClient.roomSetting.owneridentifier)
                                                liftcraft = true
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

function drwTextForphonePole()
    Citizen.CreateThread(function()
        local sleep = 1000
        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionphonePoleCoords) do
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
                    local onlyZdistance = math.abs(playerCoords.z - value.coords.z)

                    local drawMarkerZ = cachedZCoords[index]
                    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                    if not drawMarkerZ then
                        drawMarkerZ = FindZForCoords(value.coords.x, value.coords.y)
                        cachedZCoords[index] = drawMarkerZ + 0.1
                    end

                    if trafodistance < 20.0 and not value.fixed then
                        sleep = 0
                        DrawMarker(25, value.coords.x, value.coords.y, drawMarkerZ, 0.0, 0.0, 0.0, 0.0, 0.0,
                            0.0, 4.0, 4.0, 4.0, 255, 255, 255, 80, false, false, 2, nil, nil, false)
                    end

                    if trafodistance < 5.0 and not value.fixed and onlyZdistance < 1.0 then
                        sleep = 0
                        DrawText3D(value.coords.x, value.coords.y,
                            value.coords.z + 1.0, Config.Electrician['drawtext']['phonePole'])

                        if not activeSmokeEffectsphonePole[index] then
                            activeSmokeEffectsphonePole[index] = CreateSmokeEffect(value.coords)
                        end

                        if IsControlJustPressed(0, 38) and not playerInVehicle then
                            local missionPermit = TriggerCallback('tworst-electrician:server:getTrafoModal',
                                {
                                    owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                                    missionName = 'phonePole',
                                    coords = value.coords,
                                    index = index
                                })
                            if missionPermit then
                                TriggerServerEvent('tworst-electrician:server:changeTrafoModal',
                                    CoopDataClient.roomSetting.owneridentifier, index, value.coords, 'phonePole',
                                    true)
                                local settings = {
                                    wireCount = 4,
                                    wireWidth = 0.74,
                                    maxWeldFails = 3,
                                    time = 64,
                                    missionName =
                                    'phonePole',
                                    coords = value.coords
                                }
                                StartGame(settings, function(success)
                                    if success then
                                        TriggerServerEvent('tworst-electrician:server:switchFixedPhonePole',
                                            CoopDataClient.roomSetting.owneridentifier, value.coords)

                                        TriggerServerEvent('tworst-electrician:server:UpdateJobTask', 'phonePole',
                                            CoopDataClient.roomSetting.owneridentifier)
                                    else
                                        if (not IsPedClimbing(PlayerPedId())) then
                                            PlayAnim('failMinigame')
                                            Wait(2000)
                                        end
                                        Wait(2700)
                                        local health = GetEntityHealth(PlayerPedId())
                                        SetEntityHealth(PlayerPedId(), health - math.random(10, 25))
                                        TriggerServerEvent('tworst-electrician:server:changeTrafoModal',
                                            CoopDataClient.roomSetting.owneridentifier, index, value.coords,
                                            'phonePole',
                                            false)
                                    end
                                end)
                            else
                                sendNotification(Config.NotificationText['missionnotpermit'].text,
                                    Config.NotificationText['missionnotpermit'].type)
                            end
                        end
                    else
                        if activeSmokeEffectsphonePole[index] then
                            RemoveSmokeEffect(activeSmokeEffectsphonePole[index])
                            activeSmokeEffectsphonePole[index] = nil
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

function liftdrawtextStreetLamp()
    Citizen.CreateThread(function()
        while true do
            local sleep = 1000

            if CoopDataClient and CoopDataClient.roomSetting and (CoopDataClient.roomSetting.startJob or CoopDataClient.roomSetting.finishJob) then
                for key, value in ipairs(CoopDataClient.roomSetting.Mission.regionstreetLampCoords) do
                    for index, carvalue in ipairs(CoopDataClient.roomSetting.VehicleNetId) do
                        local vehicle = NetToVeh(carvalue)
                        if DoesEntityExist(vehicle) then
                            local plate = GetVehicleNumberPlateText(vehicle)

                            if CoopDataClient.roomSetting.Mission.regionJobVehiclePlate == plate and not CoopDataClient.roomSetting.ladderCraft then
                                local vehicleCoords = GetEntityCoords(vehicle)
                                local trafodistance = #(vector2(vehicleCoords.x, vehicleCoords.y) - vector2(value.coords.x, value.coords.y))
                                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)

                                if trafodistance < 8 and not value.fixed then
                                    sleep = 0
                                    local playerCoords = GetEntityCoords(PlayerPedId())
                                    local distanceToTrunk = #(vector2(playerCoords.x, playerCoords.y) - vector2(value.coords.x, value.coords.y))

                                    if next(Ladders) ~= nil then
                                        for k, v in pairs(Ladders) do
                                            local dist = #(v2(v.props.ladder) - v2(playerCoords))

                                            if not (dist < 20.0) then
                                                if distanceToTrunk < 8 then
                                                    if not laddercraft then
                                                        DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z,
                                                            Config.Electrician['drawtext']['buildladder'])
                                                    end

                                                    if IsControlJustReleased(0, 38) and not laddercraft and not playerInVehicle then
                                                        TriggerServerEvent('tworst-electrician-server:build', 'ladder',
                                                            value.coords,
                                                            CoopDataClient.roomSetting.owneridentifier)
                                                        laddercraft = true
                                                    end
                                                end
                                            end
                                        end
                                    else
                                        if distanceToTrunk < 8 then
                                            if not laddercraft then
                                                DrawText3D(playerCoords.x, playerCoords.y, playerCoords.z,
                                                    Config.Electrician['drawtext']['buildladder'])
                                            end

                                            if IsControlJustReleased(0, 38) and not laddercraft and not playerInVehicle then
                                                TriggerServerEvent('tworst-electrician-server:build', 'ladder',
                                                    value.coords,
                                                    CoopDataClient.roomSetting.owneridentifier)
                                                laddercraft = true
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Wait(sleep)
        end
    end)
end

function drwTextForStreetLamp()
    Citizen.CreateThread(function()
        local sleep = 1000
        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                for index, value in ipairs(CoopDataClient.roomSetting.Mission.regionstreetLampCoords) do
                    local playerCoords = GetEntityCoords(PlayerPedId())
                    local trafodistance = #(playerCoords - vector3(value.coords.x, value.coords.y, value.coords.z))
                    local onlyZdistance = math.abs(playerCoords.z - value.coords.z)
                    local drawMarkerZ = cachedZCoordsStreet[index]
                    local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                    if not drawMarkerZ then
                        drawMarkerZ = FindZForCoords(value.coords.x, value.coords.y)
                        cachedZCoordsStreet[index] = drawMarkerZ + 0.1
                    end
                    if trafodistance < 15 and not value.fixed then
                        sleep = 0
                        DrawMarker(25, value.coords.x, value.coords.y, drawMarkerZ, 0.0, 0.0, 0.0, 0.0, 0.0,
                            0.0, 4.0, 4.0, 4.0, 255, 255, 255, 80, false, false, 2, nil, nil, false)
                    end
                    if trafodistance < 5.0 and not value.fixed and onlyZdistance < 2.0 then
                        sleep = 0
                        DrawText3D(value.coords.x, value.coords.y,
                            value.coords.z + 1.0, Config.Electrician['drawtext'].fixStreetLamp)
                        if not activeSmokeEffectStreetLamp[index] then
                            activeSmokeEffectStreetLamp[index] = CreateSmokeEffect(value.coords)
                        end

                        if IsControlJustPressed(0, 38) and not playerInVehicle then
                            local missionPermit = TriggerCallback('tworst-electrician:server:getTrafoModal',
                                {
                                    owneridentifier = CoopDataClient.roomSetting.owneridentifier,
                                    missionName = 'fixStreetLamp',
                                    coords = value.coords,
                                    index = index
                                })
                            if missionPermit then
                                TriggerServerEvent('tworst-electrician:server:changeTrafoModal',
                                    CoopDataClient.roomSetting.owneridentifier, index, value.coords, 'fixStreetLamp',
                                    true)
                                local settings = {
                                    wireCount = 4,
                                    wireWidth = 0.74,
                                    maxWeldFails = 3,
                                    time = 64,
                                    missionName =
                                    'fixStreetLamp',
                                    coords = value.coords
                                }
                                StartGame(settings, function(success)
                                    if success then
                                        TriggerServerEvent('tworst-electrician:server:switchFixedstreetLamp',
                                            CoopDataClient.roomSetting.owneridentifier, value.coords)

                                        TriggerServerEvent('tworst-electrician:server:UpdateJobTask', 'fixStreetLamp',
                                            CoopDataClient.roomSetting.owneridentifier)
                                    else
                                        Wait(2700)
                                        if (not IsPedClimbing(PlayerPedId())) then
                                            PlayAnim('failMinigame')
                                            Wait(2000)
                                        end
                                        local health = GetEntityHealth(PlayerPedId())
                                        SetEntityHealth(PlayerPedId(), health - math.random(10, 25))
                                        TriggerServerEvent('tworst-electrician:server:changeTrafoModal',
                                            CoopDataClient.roomSetting.owneridentifier, index, value.coords,
                                            'fixStreetLamp',
                                            false)
                                    end
                                end)
                            else
                                sendNotification(Config.NotificationText['missionnotpermit'].text,
                                    Config.NotificationText['missionnotpermit'].type)
                            end
                        end
                    else
                        if activeSmokeEffectStreetLamp[index] then
                            RemoveSmokeEffect(activeSmokeEffectStreetLamp[index])
                            activeSmokeEffectStreetLamp[index] = nil
                        end
                    end
                end
            end


            Wait(sleep)
        end
    end)
end

function drawTextForTrafic()
    Citizen.CreateThread(function()
        local sleep = 1000
        while true do
            if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.startJob then
                for index, vv in ipairs(CoopDataClient.roomSetting.Mission.regiontrafficLampCoords) do
                    if vv.regionFixedTrafo.fixed then
                        sleep = 0
                        for _, selectedCoords in ipairs(vv.regionTrafficCoords) do
                            local coordsKey = string.format("%f,%f,%f", selectedCoords.coords.x, selectedCoords.coords.y,
                                selectedCoords.coords.z)
                            if not createdBlips[coordsKey] then
                                addBlipsFunctions(selectedCoords.coords, 'Traffic Light', 'fixTrafficLamp2')
                                createdBlips[coordsKey] = true
                            end

                            local playerCoords = GetEntityCoords(PlayerPedId())
                            local trafodistance = #(playerCoords - vector3(selectedCoords.coords.x, selectedCoords.coords.y, selectedCoords.coords.z))
                            local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                            if trafodistance < 10 and not selectedCoords.fixed then
                                DrawText3D(selectedCoords.coords.x, selectedCoords.coords.y,
                                    selectedCoords.coords.z + 1.0, Config.Electrician['drawtext'].fixTrafficLamp)
                                if trafodistance < 4 then
                                    if IsControlJustPressed(0, 38) and not playerInVehicle then
                                        if selectedCoords.open then
                                            sendNotification(Config.NotificationText['missionnotpermit'].text,
                                                Config.NotificationText['missionnotpermit'].type)
                                            return
                                        end
                                        SetNuiFocus(true, true)
                                        NuiMessage('WIRING_MINIGAME',
                                            { coords = selectedCoords.coords, missionName = 'fixTrafficLamp' })
                                        TriggerServerEvent('tworst-electrician:server:trafficLightsOpenStatus',
                                            CoopDataClient.roomSetting.owneridentifier,
                                            selectedCoords.coords, true)
                                    end
                                end
                            end
                        end
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end)
end

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local wait = 1500
        local isInRange = false
        for k, v in pairs(Lifts) do
            local dist = #(v2(v.coords) - v2(coords))
            if (dist < 50.0) then
                wait = 0
                local lift = EnsureLift(k)
                local location = GetOffsetFromEntityInWorldCoords(lift.lift, 0.0, 0.0, 0.0)
                local dist = #(location - coords)
                if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.owneridentifier == v.owneridentifier then
                    if dist < 1.3 then
                        ControlLift(k)
                        isInRange = true
                    end
                end
                local location = GetOffsetFromEntityInWorldCoords(lift.rails[1], -1.0, 0.0, -1.0)
                local dist = #(location - coords)
                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.owneridentifier == v.owneridentifier then
                    if dist < 1.3 then
                        DrawText3D(coords.x, coords.y, coords.z, Config.Electrician['drawtext'].removelift)
                    end
                    if dist < 1.3 and IsControlJustPressed(1, 51) and not playerInVehicle then
                        RemoveLift(k)
                    end
                end
            elseif (GetLift(k)) then
                DeleteLift(k)
            end
        end

        if isInRange then
            liftInfo = true
        else
            liftInfo = false
        end
        Wait(wait)
    end
end)


CreateThread(function()
    while true do
        local wait = 1500
        local ped = PlayerPedId()
        local pcoords = GetEntityCoords(ped)
        for k, v in pairs(Ladders) do
            local coords = v.props.ladder
            local dist = #(pcoords - coords)
            if dist < 50.0 then
                wait = 0
                EnsureLadder(k)
                if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.owneridentifier == v.owneridentifier then
                    if dist < 2.25 then
                        DrawText3D(coords.x, coords.y, coords.z, Config.Electrician['drawtext'].removeladder)
                    end
                end
                local playerInVehicle = IsPedInAnyVehicle(PlayerPedId(), false)
                if CoopDataClient and CoopDataClient.roomSetting and CoopDataClient.roomSetting.owneridentifier == v.owneridentifier then
                    if dist < 2.25 and IsControlJustPressed(1, 51) and not playerInVehicle then
                        RemoveLadder(k)
                    end
                end
            else
                DeleteLadder(k)
            end
        end
        Wait(wait)
    end
end)
