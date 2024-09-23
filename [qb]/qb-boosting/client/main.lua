local QBCore = exports["qb-core"]:GetCoreObject()
local vehicle = nil
local contract = nil
local spawn = nil
local AntiSpam = false
local carCoords = nil
local blip = nil
local PZone = nil
local lastVehicleHealth = nil
local inZone = false
local droppedOff = false
local completed = false
local completedNotify = false
local trackerNotify = false
local currentHacking = false
local scratchNotify = false
local hacked = false
local enemies = {}
local hackAmount = 0
local hackDelay = 0
local messages = {}

----------- UTIL FUNCS ---------------
function reset()
    if blip then RemoveBlip(blip) end
    blip = nil
    vehicle = nil
    contract = nil
    spawn = nil
    AntiSpam = false
    completed = false
    completedNotify = false
    scratchNotify = false
    currentHacking = false
    currentScratching = false
    carCoords = nil
    if PZone then PZone:destroy() end
    PZone = nil
    inZone = false
    hacked = false
    enemies = {}
    trackerNotify = false
    droppedOff = false
    hackAmount = 0
    hackDelay = 0
end

function Email(sender, subject, text)
    if Config.Phone == "lb-phone" then
        TriggerServerEvent("qb-boosting:server:lbmail", subject, text)
    elseif Config.Phone == "renewed-phone" then
        TriggerServerEvent("qb-boosting:server:renewedmail", subject, text)
    else
        TriggerServerEvent(Config.Phone .. ":server:sendNewMail", {
            sender = sender,
            subject = subject,
            message = text,
            button = {}
        })
    end

    TriggerServerEvent("qb-boosting:server:SendMessage", text)
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
 end

function GetTiers()
    local tbl = {}
    for tier, _ in pairs(Config.Tiers) do
        tbl[tier] = {
            xpRequired = _.xpRequired,
            title = _.title,
        }
    end
    return tbl
end

function GetMessages()
    QBCore.Functions.TriggerCallback("qb-boosting:server:GetMessages", function(msgs)
        messages = msgs
        lastMsgLength = #msgs
        UpdateMessages()
    end)
end

function UpdateMessages()
    SendNUIMessage({
        action = "updateMessages",
        messages = messages
    })
end

function OpenUI(xp, tier, balance)
    if completed and not completedNotify then
        completed = false
        completedNotify = true
    end
    local tiers = GetTiers()
    GetMessages()
    GetBoostData()
    SendNUIMessage({
        action = "open",
        playerXP = xp,
        playerTier = tier,
        sendComplete = completedNotify,
        playerBalance = balance,
        balanceType = Config.Payment,
        tiers = tiers,
        playerName = GetPlayerName(PlayerId()),
        sender = Lang:t("email.sender"),
        subject = Lang:t("email.subject")
    })
    SetNuiFocus(true, true)
    completedNotify = false
    exports["dpemotes"]:EmoteCommandStart(nil, {"tablet2", 0})
end

function HideUI()
    SendNUIMessage({
        action = "hide",
    })
    SetNuiFocus(false, false)
    exports["dpemotes"]:EmoteCommandStart(nil, {"c", 0})
end

function CreateBlip(isRadius, radius, coords, sprite, display, scale, colour, shortRange, title)
    if not coords or not sprite or not display or not scale or not colour or shortRange == nil or not title then
        return
    elseif not isRadius then
        blip = AddBlipForCoord(coords)
        SetBlipSprite(blip, sprite)
        SetBlipDisplay(blip, display)
        SetBlipScale(blip, scale)
        SetBlipColour(blip, colour)
        SetBlipAsShortRange(blip, shortRange)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(title)
        EndTextCommandSetBlipName(blip)
    elseif isRadius then
        local rand1 = math.random(-100, 100)
        local rand2 = math.random(-100, 100)
        local x = coords.x + rand1
        local y = coords.y + rand2
        blip = AddBlipForRadius(x, y, coords.z, radius)
        SetBlipRotation(blip, 0)
        SetBlipColour(blip, Config.ShadedAreaColor)
        SetBlipAlpha(blip, 175)
    end
end

function Reward(model, mods)
    QBCore.Functions.TriggerCallback("qb-boosting:server:GetTime", function(time)
        TriggerServerEvent("qb-boosting:server:Reward", contract.id, vehicle, model, mods)
        SendNUIMessage({
            action = "contractComplete",
            id = contract.id,
            completionTime = time * 1000,
            cooldownLength = Config.Cooldown
        })
    end)
end

function DropOff()
    CreateThread(function()
        while inZone and not droppedOff do
            local ped = PlayerPedId()
            if not IsPedInAnyVehicle(ped, false) then
                local veh = GetVehiclePedIsIn(ped, true)
                local plate = GetVehicleNumberPlateText(veh)
                if veh == NetworkGetEntityFromNetworkId(vehicle) then
                    droppedOff = true
                    RemoveBlip(blip)
                    PZone:destroy()
                    Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.dropOff_leaveArea"))
                    objectiveUpdate(Lang:t("objective.leave_area"))
                    Config.VehicleKeysRemove(plate)
                    SetVehicleEngineOn(veh, false)
                    SetVehicleDoorsLocked(veh, 2)
                end
            end
            Wait(100)
        end
        while droppedOff do
            local car = NetworkGetEntityFromNetworkId(vehicle)
            local vehCoords = GetEntityCoords(car)
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(vehCoords - playerCoords)
            if dist >= Config.Tiers[contract.letter:upper()].finishDistance then
                Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.dropOff_collected"))
                SetEntityAsMissionEntity(car)
                DeleteVehicle(car)
                Reward()
                completed = true
                break
            end
            Wait(100)
        end
        Wait(1000)
        reset()
    end)
end

function VINScratchNotify2()
    if not vehicle then return end

    CreateThread(function()
        while inZone and not scratchNotify do
            local ped = PlayerPedId()
            if not IsPedInAnyVehicle(ped, false) then
                local veh = GetVehiclePedIsIn(ped, true)
                if veh == NetworkGetEntityFromNetworkId(vehicle) then
                    scratchNotify = true
                    RemoveBlip(blip)
                    Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.scratchInfo"))
                    objectiveUpdate(Lang:t("objective.scratch"))
                end
            end
            Wait(100)
        end
    end)

end

function objectiveUpdate(objective)
    SendNUIMessage({
        action = "updateObjective",
        currentObjective = objective,
    })
end

function GetBoostData()
    QBCore.Functions.TriggerCallback("qb-boosting:server:GetBoostData", function(data)
        SendNUIMessage({
            action = "updateBoostData",
            total = data.total,
            successes = data.successes,
            failures = data.failures,
            value = data.value,
            enemiesKilled = data.enemies,
            contracts = data.contracts,
        })
    end)
end

------------------ NUI CALLBACKS --------------------------
RegisterNUICallback("closeWindow", function() HideUI() end)

RegisterNUICallback("queue", function(status, cb)
    QBCore.Functions.TriggerCallback("qb-boosting:server:Queue", function(result)
        -- Handle errors
    end, status)
    cb("ok")
end)

RegisterNUICallback("accept", function(id, cb)
    id = tonumber(id)
    if not contract then
        QBCore.Functions.TriggerCallback("qb-boosting:server:Accept", function(result)
            if result == "error.cost" then
                cb("error.cost")
            elseif result == "error" then
                cb("error")
            elseif result == "nocops" then
                cb("error.nocops")
            elseif result == "success" then
                cb("ok")
            end
        end, id)
    else
        cb("error.inprogress")
    end
end)

RegisterNUICallback("decline", function(id, cb)
    QBCore.Functions.TriggerCallback("qb-boosting:server:Decline", function(result)
        -- Handle errors
    end, id)
    cb("ok")
end)

RegisterNUICallback("cancel", function(id, cb)
    QBCore.Functions.TriggerCallback("qb-boosting:server:Cancel", function(result)
        if result == "success" then
            if blip then RemoveBlip(blip) end
            if vehicle then
                SetEntityAsMissionEntity(NetworkGetEntityFromNetworkId(vehicle), true, true)
                DeleteVehicle(NetworkGetEntityFromNetworkId(vehicle))
            end
            blip = nil
            vehicle = nil
            contract = nil
            if #enemies > 0 then
                Config.SpawnLocations[spawn].pedActive = false
                for _, ped in pairs(enemies) do
                    if ped and IsEntityAPed(ped) then
                        DeleteEntity(ped)
                    end
                    enemies[_] = nil
                end
            end
            enemies = {}
            spawn = nil
            AntiSpam = false
            carCoords = nil
        end
    end, {id, spawn})
    cb("ok")
end)

------------------- NET EVENTS ---------------------------
RegisterNetEvent("qb-boosting:client:Open", OpenUI)

RegisterNetEvent("qb-boosting:client:SendContract", function(data)
    SendNUIMessage({
        action = "createContractCard",
        id = data.id,
        type = data.type,
        letter = data.letter,
        name = data.name,
        car = data.car,
        plate = data.plate,
        buyInCost = data.buyInCost,
        creationTime = data.creationTime,
        active = data.active,
        tracker = data.tracker,
        playerSource = data.playerSource
    })
    Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.contract_given"))
end)

RegisterNetEvent("qb-boosting:client:MissionStarted", function(data)
    if not data then return end
    contract = data[1]
    spawn = data[2]
    Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.contract_accepted"))
end)

RegisterNetEvent("qb-boosting:client:SpawnVehicle", function(data)
    QBCore.Functions.SpawnVehicle(data[1], function(veh)
        SetVehicleNumberPlateText(veh, data[3])
        exports[Config.Fuel]:SetFuel(veh, 100.0)
        SetVehicleEngineOn(veh, false, false)
        vehicle = NetworkGetNetworkIdFromEntity(veh)
        carCoords = data[2]
    end, data[2], true)

    CreateBlip(true, 200.0, vector3(carCoords.x,carCoords.y,carCoords.z), 4, 2, 1, 1, false, "Contract Area")

    if Config.Debug then
        SetNewWaypoint(carCoords.x, carCoords.y)
    end

    Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.vehicle_spawned"))
    objectiveUpdate(Lang:t("objective.break_in"))

end)

RegisterNetEvent("lockpicks:UseLockpick", function()
    if AntiSpam then return end
    if not vehicle then return end
    if not contract then return end
    if not spawn then return end
    local car = NetworkGetEntityFromNetworkId(vehicle)
    if DoesEntityExist(car) then
        local dist = #(GetEntityCoords(car) - GetEntityCoords(PlayerPedId()))
        if dist <= 3.5 then
            if #(vector3(carCoords.x, carCoords.y, carCoords.z) - GetEntityCoords(car)) <= 6.9 then
                AntiSpam = true
                if Config.SpawnLocations[spawn].spawnPeds and not Config.SpawnLocations[spawn].pedActive then
                    Config.SpawnLocations[spawn].pedActive = true
                    objectiveUpdate(Lang:t("objective.remove_tracker"))
                    CreateThread(function()
                        -- Delay the spawn
                        math.randomseed(GetGameTimer())
                        Wait(math.random(5, 10) * 1000)
                        -- Do the spawning
                        for _, pData in pairs(Config.SpawnLocations[spawn].peds) do
                            -- Get ped model
                            local model = GetHashKey(pData.model)
                            RequestModel(model)
                            while not HasModelLoaded(model) do Wait(1) end
                            -- Create ped
                            local ped = CreatePed(0, model, pData.spawnCoords.x, pData.spawnCoords.y, pData.spawnCoords.z, pData.spawnCoords.w, true)
                            while not DoesEntityExist(ped) do Wait(0) end
                            SetPedRelationshipGroupHash(ped, "HATES_PLAYER")
                            table.insert(enemies, ped)
                            -- Give weapons
                            if pData.weapon == "random" then
                                math.randomseed(GetGameTimer())
                                local randWeapon = Config.Tiers[contract.letter:upper()].pedWeapons[math.random(1, #Config.Tiers[contract.letter:upper()].pedWeapons)]
                                GiveWeaponToPed(ped, randWeapon, 20, false, true)
                            else
                                local weapon = pData.weapon
                                GiveWeaponToPed(ped, weapon, 20, false, true)
                            end
                            -- Set armor
                            if pData.armor[1] > 0 then
                                local armor = math.random(pData.armor[1], pData.armor[2])
                                SetPedArmour(ped, armor)
                            end
                            -- Set ped hostility towards weapons
                            local afraid = Config.Tiers[contract.letter:upper()].pedAfraid
                            afraid = not afraid
                            SetPedCombatAttributes(ped, 46, afraid)

                            -- Make ped attack player
                            TaskCombatPed(ped, PlayerPedId(), 0, 16)

                        end

                        -- Thread to despawn peds
                        local origCarCoords = GetEntityCoords(car)
                        local origSpawn = spawn
                        while true do
                            if spawn ~= origSpawn then return end
                            if not Config.SpawnLocations[spawn].pedActive then return end
                            local newCarCoords = GetEntityCoords(car)
                            local dist = #(origCarCoords - newCarCoords)
                            if dist > 30 then
                                Config.SpawnLocations[spawn].pedActive = false
                                for _, ped in pairs(enemies) do
                                    if ped and IsEntityAPed(ped) then
                                        DeleteEntity(ped)
                                    end
                                    enemies[_] = nil
                                end
                            end
                            Wait(10000)
                        end
                    end)
                end
            else
                AntiSpam = false
            end
        end
    end
end)

RegisterNetEvent("qb-boosting:client:DisableTracker", function()
    if currentHacking then return end
    if hacked then return end
    if hackDelay > 0 then
        QBCore.Functions.Notify(Lang:t("info.tracker_wait"))
        return
    end
    currentHacking = true
    local ped = PlayerPedId()
    local hasItem = QBCore.Functions.HasItem(Config.HackingDevice)
    if hasItem then
        if IsPedInAnyVehicle(ped, false) then
            local car = GetVehiclePedIsIn(ped, false)
            if car and vehicle and NetworkGetEntityFromNetworkId(vehicle) == car then
                carCoords = GetEntityCoords(car)

                local hackType = ""
                local rand = math.random(1, #Config.Tiers[contract.letter:upper()].hack)
                hackType = Config.Tiers[contract.letter:upper()].hack[rand]

                if hackAmount == 0 and contract then
                    hackAmount = Config.Tiers[contract.letter:upper()].trackerCount
                end

                exports['ps-ui']:Scrambler(function(success)
                    contract.tracker = success
                    currentHacking = false
                    if success then
                        hackAmount = hackAmount - 1
                    else
                        QBCore.Functions.Notify(Lang:t("info.tracker_failed"), "error")
                    end
                    hackDelay = Config.Tiers[contract.letter:upper()].hackDelay * 1000

                    if hackAmount == 0 then
                        TriggerServerEvent("qb-boosting:server:TrackerStatus", contract.id, success)
                        if success then
                            QBCore.Functions.Notify(Lang:t("info.tracker_removed"), "success")
                        end
                    else
                        QBCore.Functions.Notify(Lang:t("info.tracker_again"))
                    end

                    CreateThread(function()
                        while hackDelay > 0 do
                            Wait(1000)
                            hackDelay = hackDelay - 1000
                        end
                    end)
                    CreateThread(function()
                        local delay = Config.DispatchDelayHacking * 1000
                        Wait(delay)
                        Config.Dispatch(car, carCoords)
                    end)

                end, hackType, 30, 0) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
            else
                currentHacking = false
            end
        else
            currentHacking = false
        end
    else
        currentHacking = false
    end
end)

RegisterNetEvent("qb-boosting:client:DropOffNotify", function(location)
    if not location then return end
    RemoveBlip(blip)
    Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.dropOff_wait"))
    CreateThread(function()
        math.randomseed(GetGameTimer())
        if Config.Debug then Wait(5000) else Wait(math.random(7500, 15000)) end
        Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.dropOff_sent"))
        objectiveUpdate(Lang:t("objective.drop_off"))
        CreateBlip(false, 0, Config.ReturnLocations[location].coords, 225, 2, 1.0, 47, false, "Contract Dropoff")
        SetNewWaypoint(Config.ReturnLocations[location].coords.x, Config.ReturnLocations[location].coords.y)
        PZone = CircleZone:Create(Config.ReturnLocations[location].coords, 15, {
            name = "QB-Boosting:ReturnVehicle" .. math.random(1, 1000),
            debugPoly = Config.Debug,
        })

        PZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                inZone = true
                DropOff()
            else
                inZone = false
            end
        end)
    end)
end)

RegisterNetEvent("qb-boosting:client:VINScratchNotify", function(location)
    if not location then return end
    RemoveBlip(blip)
    Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.scratchLocation_wait"))
    CreateThread(function()
        math.randomseed(GetGameTimer())
        if Config.Debug then Wait(5000) else Wait(math.random(7500, 15000)) end
        Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.scratchLocation_sent"))
        objectiveUpdate(Lang:t("objective.scratch_area"))
        CreateBlip(false, 0, Config.ScratchLocations[location].coords, 225, 2, 1.0, 47, false, "VIN Scratch Location")
        SetNewWaypoint(Config.ScratchLocations[location].coords.x, Config.ScratchLocations[location].coords.y)
        PZone = CircleZone:Create(Config.ScratchLocations[location].coords, 15, {
            name = "QB-Boosting:ScratchLocation" .. math.random(1, 1000),
            debugPoly = Config.Debug,
        })

        PZone:onPlayerInOut(function(isPointInside)
            if isPointInside then
                inZone = true
                VINScratchNotify2()
            else
                inZone = false
            end
        end)
    end)
end)

RegisterNetEvent("qb-boosting:client:ScratchVIN", function()
    local car = NetworkGetEntityFromNetworkId(vehicle)
    if DoesEntityExist(car) and GetVehiclePedIsIn(PlayerPedId(), false) == 0 then
        local dist = #(GetEntityCoords(car) - GetEntityCoords(PlayerPedId()))
        if dist <= 3.5 and inZone then
            math.randomseed(GetGameTimer())
            local time = math.random(3,5)
            local circles = math.random(2, 5)
            exports['ps-ui']:Circle(function(success)
                if success then
                    QBCore.Functions.Progressbar("vin_scratching", "Scratching Vin", 7000, false, false,
                        { -- Name | Label | Time | useWhileDead | canCancel
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = '"anim@amb@clubhouse@tutorial@bkr_tut_ig3@"@',
                            anim = 'machinic_loop_mechandplayer',
                            flags = 1,
                        }, {}, {}, function() -- Play When Done
                            local carName = GetDisplayNameFromVehicleModel(GetEntityModel(car))
                            local model = string.match(GetLabelText(carName):lower(), "%s*(%w+)$")
                            local mods = QBCore.Functions.GetVehicleProperties(car)
                            Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.scratched"))
                            Reward(model, mods)
                            completed = true
                            exports["qb-target"]:RemoveTargetEntity(car, "Scratch Vin")
                            ClearPedTasks(PlayerPedId())
                            Wait(1000)
                            reset()
                        end, function() -- Play When Cancel
                        ClearPedTasks(PlayerPedId())
                    end)
                end
            end, circles, time)
        elseif not inZone then
            QBCore.Functions.Notify(Lang:t("info.notInLocation"), "error")
            return
        end
    elseif GetVehiclePedIsIn(PlayerPedId(), false) ~= 0 and inZone then
        QBCore.Functions.Notify(Lang:t("info.exitVehicle"), "error")
        return
    end
end)

CreateThread(function()
    while true do
        Wait(250)
        local playerPed = PlayerPedId()
        local currentVehicle = GetVehiclePedIsIn(playerPed, false)
        if currentVehicle ~= 0 and vehicle and NetworkGetEntityFromNetworkId(vehicle) == currentVehicle and contract.tracker and not trackerNotify then
            trackerNotify = true
            QBCore.Functions.Notify(Lang:t("info.tracker"))
        elseif currentVehicle ~= 0 and vehicle and NetworkGetEntityFromNetworkId(vehicle) == currentVehicle and not contract.tracker and not trackerNotify then
            trackerNotify = true
            TriggerServerEvent("qb-boosting:server:TrackerStatus", contract.id, true)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)

        if vehicle then
            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
            if veh and veh ~= 0 then
                local vehicleHealth = GetEntityHealth(veh)

                if lastVehicleHealth == nil and vehicleHealth > 0 then
                    lastVehicleHealth = vehicleHealth
                end

                if lastVehicleHealth and contract and Config.Tiers[contract.letter].damageDetection.enabled and vehicleHealth < lastVehicleHealth then
                    local maxVehicleHealth = GetEntityMaxHealth(veh)
                    local damageTaken = lastVehicleHealth - vehicleHealth
                    lastVehicleHealth = vehicleHealth

                    if damageTaken >= (maxVehicleHealth * Config.Tiers[contract.letter].damageDetection.threshold) then
                        TriggerServerEvent("qb-boosting:server:VehicleDamage", contract.id)
                        Email(Lang:t("email.sender"), Lang:t("email.subject"), Lang:t("email.damaged"))
                    end
                end
            end
        else
            lastVehicleHealth = nil
        end
    end
end)

-- Listen for death of peds
CreateThread(function()
    AddEventHandler('gameEventTriggered', function(name, args)
        if name == 'CEventNetworkEntityDamage' then
            local victim = args[1]
            local attacker = args[2]
            local isFatal = args[4]

            -- Check if the victim is a ped and if the damage was fatal
            if isFatal and attacker == PlayerPedId() and contract then
                for _, ped in pairs(enemies) do
                    if ped == victim then
                        TriggerServerEvent("qb-boosting:server:PedKilled", contract.id)
                        break
                    end
                end
            end
        end
    end)
end)

RegisterNetEvent("qb-boosting:client:syncDataUI", function(playerXP, playerTier, playerBalance)
    SendNUIMessage({
        action = "syncData",
        xp = playerXP,
        tier = playerTier,
        balance = playerBalance
    })
end)

RegisterNetEvent("qb-boosting:client:ReceiveMessages", function(msgs)
    messages = msgs
    lastMsgLength = #msgs
    UpdateMessages()
end)

----------------------- DEBUG ------------------------------
if Config.Debug then
    local boostmenu = false
    RegisterCommand("boostmenu", function()
        boostmenu = not boostmenu
        if boostmenu then
            OpenUI()
        else
            HideUI()
        end
    end)
end