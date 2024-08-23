local QBCore = exports['qb-core']:GetCoreObject()
local Accces_yes = false
SellingStations = {}
MyStations = {}
MyEmployess = {}
MyRefinerys = {}
RefinerySellingData = {}
local RefineryBlips = {}
local Tankers = {}
JobSettings = {
    active = false,
    fuel_amount = 0,
    plate = nil,
    refinery = nil,
    busy = false,
}

-- Functions

local function GetNearStation()
    local my_coord = GetEntityCoords(PlayerPedId())
    local station = nil
    for k,v in pairs(Config.FuelStations) do
        if #(vector3(v.garage.coord.x, v.garage.coord.y, v.garage.coord.z) - my_coord) < 20 then
            station = k
            break
        end
    end
    return station
end

local function CalculateNearGarageTanker(nearstation)
    local garage_coord = Config.FuelStations[nearstation].garage.coord
    local my_coord = GetEntityCoords(PlayerPedId())
    if #(my_coord - vector3(garage_coord.x, garage_coord.y, garage_coord.z)) < 10 then
        return true
    else
        return false
    end
end

function CustomNotifVariation(text, ttype, time)
    if Config.OxLib then
        lib.notify({
            title = 'Fuel Stations',
            description = text,
            type = ttype
        })
    else
        QBCore.Functions.Notify(text, ttype, time)
    end
end

function ShowDrawText(text)
    if Config.OxLib then
        lib.showTextUI(text)
    else
        exports["qb-core"]:DrawText(text)
    end
end

function HideDrawText()
    if Config.OxLib then
        lib.hideTextUI()
    else
        exports["qb-core"]:HideText()
    end
end

function CheckRefineryJobReady()
    local result = false
    for k,v in pairs(MyStations) do
        if v then
            result = true
            break
        end
    end
    if result then return true end
    for kk,vv in pairs(MyEmployess) do
        if vv then
            result = true
            break
        end
    end
    return result
end

function GetTankerData()
    return Tankers
end

function CreateMyRefineryBlips()
    if RefineryBlips and next(RefineryBlips) then
        for i=1, #RefineryBlips do
            RemoveBlip(RefineryBlips[i])
        end
    end
    RefineryBlips = {}
    for k,v in pairs(Config.Refinery) do
        if MyRefinerys[k] then
            local blip = AddBlipForCoord(v.coord.x, v.coord.y, v.coord.z)
            SetBlipSprite(blip, Config.RefineryBlip.sprite)
            SetBlipDisplay(blip, 2)
            SetBlipScale(blip, Config.RefineryBlip.scale)
            SetBlipColour(blip, Config.RefineryBlip.color)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Config.RefineryBlip.text)
            EndTextCommandSetBlipName(blip)

            RefineryBlips[#RefineryBlips+1] = blip
        end
    end
end

function AddStationPedTarget(entity, station)
    exports['qb-target']:AddTargetEntity(entity, {
        options = {
            {
                label = LANG.manage_station_target_label,
                icon = "fa-solid fa-gas-pump",
                action = function()
                    TriggerEvent("wert-fuelstations:client:open-manage-menu", station)
                end,
                canInteract = function()
                    if Accces_yes then
                        if MyStations[station] or MyEmployess[station] then
                            return true
                        else
                            return false
                        end
                    else
                        return false
                    end
                end,
            },
            {
                label = LANG.ui_target_buy_station,
                icon = "fa-solid fa-building-columns",
                action = function()
                    TriggerEvent("wert-fuelstations:client:open-buy-menu", station)
                end,
                canInteract = function()
                    if Accces_yes then
                        if not SellingStations[station] then return true else return false end
                    else
                        return false
                    end
                end,
            }
        },
        distance = 1.5
    })
end

function AddRefineryTarget(name, data)
    local conv_name = tostring(name)
    name = conv_name
    
    local target_id = "Refinery-"..name
    local targetSettings = data.targetSettings
    exports["qb-target"]:AddBoxZone(target_id, targetSettings.target_coord, targetSettings.target_sizea, targetSettings.target_sizeb, {
		name=target_id,
		heading=targetSettings.target_heading,
		debugPoly=targetSettings.target_debugpoly,
		minZ=targetSettings.target_minz,
		maxZ=targetSettings.target_maxz
	}, {
		options = {
            {
				event = "wert-fuelstations:client:my-refinery-menu",
                refinery = name,
				icon = "fas fa-gear",
				label = "My Refinery Actions",
                canInteract = function()
                    if Accces_yes then
                        if MyRefinerys[name] then return true else return false end
                    else
                        return false
                    end
                end,
			},
            {
				event = "wert-fuelstations:client:buy-refinery",
                refinery = name,
				icon = "fas fa-money-check-dollar",
				label = "Buy This Refinery!",
                canInteract = function()
                    if Accces_yes then
                        if not RefinerySellingData[name] then return true else return false end
                    else
                        return false
                    end
                end,
			},
            {
				icon = "fas fa-gas-pump",
				label = "Start filling the fuel into the vehicle!",
                event = "wert-fuelstations:client:load-fuel-tanker",
                canInteract = function()
                    if Accces_yes then
                        if JobSettings.active and not JobSettings.busy and JobSettings.refinery == name then
                            return true
                        else
                            return false
                        end
                    else
                        return false
                    end
                end,
			},
		},
		distance = 1.5
	})
end

function AddRefineryManagerTarget(entity, text)
    exports['qb-target']:AddTargetEntity(entity, {
        options = {
            {
                label = text,
                icon = "fa-solid fa-clipboard",
                event = "wert-fuelstations:client:refinery-manager-menu",
                refinery = name,
                canInteract = function()
                    local access = CheckRefineryJobReady()
                    if access and not JobSettings.active then
                        return true
                    else
                        return false
                    end
                end,
            },
        },
        distance = 1.5
    })
end

function AddTruckShopTarget(entity, label, icon, event)
    exports['qb-target']:AddTargetEntity(entity, {
        options = {
            {
                label = label,
                icon = icon,
                event = event,
                canInteract = function()
                    local access = CheckRefineryJobReady()
                    if access then
                        return true
                    else
                        return false
                    end
                end,
            },
        },
        distance = 1.5
    })
end

function AddTankerTarget()
    local target_tankermodels = {
        `tanker`,
    }
    exports['qb-target']:AddTargetModel(target_tankermodels, {
        options = {
            {
                label = "Relaod Fuel",
                icon = "fa-solid fa-chevron-left",
                canInteract = function(entity)
                    local access = CheckRefineryJobReady()
                    if access then
                        local plate = QBCore.Functions.GetPlate(entity)
                        if Tankers[plate] then return true else return false end
                        --return true
                    else
                        return false
                    end
                end,
                action = function(entity)
                    local plate = QBCore.Functions.GetPlate(entity)
                    local netid = NetworkGetNetworkIdFromEntity(entity)
                    TriggerEvent("wert-fuelstations:client:reload-fuel-tanker", netid, plate) 
                end,
            },
            {
                label = "Store Tanker",
                icon = "fa-solid fa-warehouse",
                canInteract = function(entity)
                    local nearstation = GetNearStation()
                    if nearstation then
                        if MyStations[nearstation] or MyEmployess[nearstation] then
                            local neargarage = CalculateNearGarageTanker(nearstation)
                            local plate = QBCore.Functions.GetPlate(entity)
                            if Tankers[plate] and neargarage then
                                return true
                            else
                                return false
                            end
                        else
                            return false
                        end
                    else
                        return false
                    end
                end,
                action = function(entity)
                    local nearstation = GetNearStation()
                    local plate = QBCore.Functions.GetPlate(entity)
                    local netid = NetworkGetNetworkIdFromEntity(entity)
                    TriggerEvent("wert-fuelstations:client:tanker-manuel-store", netid, plate, nearstation) 
                end,
            },
        },
        distance = 1.5
    })
end

-- Events
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    Accces_yes = false
    Wait(5000)
    Accces_yes = true
    QBCore.Functions.TriggerCallback('wert-fuelstations:server:get-tanker-data', function(result)
        while not result do Wait(100) end
        for i=1, #result do
            local plate = result[i]
            Tankers[plate] = true
        end
    end)
end)

RegisterNetEvent('wert-fuelstations:client:notif', function(text, ttype, time)
    CustomNotifVariation(text, ttype, time)
end)

RegisterNetEvent('wert-fuelstations:client:update-selling-state', function(station, state)
    SellingStations[station] = state
    TriggerEvent("wert-fuelstations:client:refresh-blip", station)
end)

RegisterNetEvent('wert-fuelstations:client:update-refinery-selling-data', function(name, data, owner, state)
    if owner then
        MyRefinerys[name] = state
        if state then
            CreateMyRefineryBlips()
        end
    end
    RefinerySellingData[name] = data
end)

RegisterNetEvent('wert-fuelstations:client:refinery-withdraw-mails', function(money, action)
    if action == "first" then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = 'Refinery Payment Systems',
            subject = 'Your money is on its way to you (' .. money .. ')$',
            message = "Your money will be delivered to you in " .. Config.RefineryWithdrawMinute .. " Minutes"
        })
    else
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = 'Refinery Payment Systems',
            subject = 'Your money has been delivered',
            message = "Your payment has been paid, you can check your bank account. Have a good days"
        })
    end
end)

RegisterNetEvent('wert-fuelstations:client:give-key-event', function(vehicle, plate)
    --local veh = NetToVeh(vehicle) -- (If you use this variable any code please open)
    TriggerEvent("vehiclekeys:client:SetOwner", plate)
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Accces_yes = false
        Wait(5000)
        Accces_yes = true
        QBCore.Functions.TriggerCallback('wert-fuelstations:server:get-tanker-data', function(result)
            while not result do Wait(100) end
            for i=1, #result do
                local plate = result[i]
                Tankers[plate] = true
            end
        end)
    end
end)

RegisterNetEvent('wert-fuelstations:client:add-tanker', function(plate)
    Tankers[plate] = true
end)

RegisterNetEvent('wert-fuelstations:client:load-fuel-tanker', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local NearTankers = {}
    local Menu = {
        {
            header = LANG.job_refillable_tankers,
            txt = "",
            icon = "fa-solid fa-truck",
            isMenuHeader = true
        }
    }
    if Config.OxLib then
        Menu = {}
    end
    local vehicles = GetGamePool('CVehicle')
    for i = 1, #vehicles do
        local car = vehicles[i]
        if DoesEntityExist(car) then
            local vehicleCoords = GetEntityCoords(car)
            if #(coords - vehicleCoords) < 10 then
                local plate = QBCore.Functions.GetPlate(car)
                if Tankers[plate] then
                    if Config.OxLib then
                        Menu[#Menu+1] = {
                            title = LANG.start_load_fuel .. " | [" .. plate .. "]",
                            description = LANG.start_load_fuel_desc,
                            icon = "arrow-right",
                            arrow = true,
                            event = "wert-fuelstations:client:load-fuel-tanker-step2",
                            args = {
                                plate = plate,
                            }
                        }
                    else
                        Menu[#Menu+1] = {
                            header = LANG.start_load_fuel .. " | [" .. plate .. "]",
                            txt = LANG.start_load_fuel_desc,
                            icon = "fa-solid fa-arrow-right",
                            params = {
                                event = "wert-fuelstations:client:load-fuel-tanker-step2",
                                args = {
                                    plate = plate,
                                }
                            }
                        }
                    end
                end
            end
        end
    end
    if Config.OxLib then
        lib.registerContext({
            id = 'wert-fuelstations-client-job-load-fuel',
            title = LANG.garage_menu_header,
            menu = 'some_wert-fuelstations-client-job-load-fuel',
            options = Menu
        })
        lib.showContext('wert-fuelstations-client-job-load-fuel')
    else
        exports['qb-menu']:openMenu(Menu)
    end
end)

-- Returns player stations
exports("MyStations", function()
    return MyStations
end)

-- Returns player employee stations
exports("MyEmployess", function()
    return MyEmployess
end)

-- Returns player refinerys
exports("MyRefinerys", function()
    return MyRefinerys
end)

-- Get station selling data
exports("SellingStations", function()
    return SellingStations
end)