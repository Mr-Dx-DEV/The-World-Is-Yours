local QBCore = exports['qb-core']:GetCoreObject()

function CustomNotifyClient(src, message, type, duration)
    -- Use QBCore's notification system by default
    TriggerClientEvent('QBCore:Notify', src, message, type, duration)
end


function GetItems(targetType, identifier)
    local items = nil

    if Config.InventoryType == 'ox_inventory' then
        if targetType == "player" then
            items = exports.ox_inventory:GetInventory(identifier)
        elseif targetType == "trunk" then
            local vehicleIdentifier = identifier
            items = exports.ox_inventory:GetInventory(vehicleIdentifier, 'trunk')
        elseif targetType == "glovebox" then
            local gloveboxIdentifier = "glovebox-" .. identifier
            items = exports.ox_inventory:GetInventory(gloveboxIdentifier, 'glovebox')
        end
    elseif Config.InventoryType == 'qb-inventory' then
        if targetType == "player" then
            items = exports['qb-inventory']:evok9CheckPlayerInventoryItems(identifier)
        elseif targetType == "trunk" or targetType == "glovebox" then
            items = exports['qb-inventory']:evok9CheckInventoryItems(identifier)
        end
    elseif Config.InventoryType == 'quasar' then
        if targetType == "player" then
            items = exports['qs-inventory']:GetPlayerInventory(identifier)
        elseif targetType == "trunk" then
            local vehicleIdentifier = "trunk-" .. identifier
            items = exports['qs-inventory']:GetVehicleTrunkInventory(vehicleIdentifier)
        elseif targetType == "glovebox" then
            local gloveboxIdentifier = "glovebox-" .. identifier
            items = exports['qs-inventory']:GetVehicleGloveboxInventory(gloveboxIdentifier)
        end
    elseif Config.InventoryType == 'minventory' then
        if targetType == "player" then
            items = exports['codem-inventory']:GetPlayerInventory(identifier)
        elseif targetType == "trunk" then
            local vehicleIdentifier = "trunk-" .. identifier
            items = exports['codem-inventory']:GetVehicleTrunkInventory(vehicleIdentifier)
        elseif targetType == "glovebox" then
            local gloveboxIdentifier = "glovebox-" .. identifier
            items = exports['codem-inventory']:GetVehicleGloveboxInventory(gloveboxIdentifier)
        end
    end

    if not items then
        print("[ERROR] Export returned nil for Target Type:", targetType, "Identifier:", identifier)
    else
        print("[DEBUG] Raw items from export:", json.encode(items))
    end

    return items
end

function SearchVehicle(source, vehicle, players, dogid)
    local currentSmell = exports['evo-k9-v2']:GetDogAttribute(dogid, 'smell')

    -- Check Trunk
    local trunkItems = GetItems("trunk", vehicle)
    if trunkItems then
        for _, item in pairs(trunkItems) do
            if Config.K9Search[item.name] and currentSmell >= Config.K9Search[item.name] then
                TriggerClientEvent("evo-k9:client:search_results", source, true, 'vehicle')
                return
            end
        end
    end

    -- Check Glovebox
    local gloveboxItems = GetItems("glovebox", vehicle)
    if gloveboxItems then
        for _, item in pairs(gloveboxItems) do
            if Config.K9Search[item.name] and currentSmell >= Config.K9Search[item.name] then
                TriggerClientEvent("evo-k9:client:search_results", source, true, 'vehicle')
                return
            end
        end
    end

    -- Check Players in the Vehicle
    for _, playerId in ipairs(players) do
        local playerItems = GetItems("player", playerId)
        if playerItems then
            for _, item in pairs(playerItems) do
                if Config.K9Search[item.name] and currentSmell >= Config.K9Search[item.name] then
                    TriggerClientEvent("evo-k9:client:search_results", source, true, 'vehicle')
                    return
                end
            end
        end
    end

    -- No Illegal Items Found
    TriggerClientEvent("evo-k9:client:search_results", source, false, 'vehicle')
end

function HasIllegalItems(target, dogid)
    local currentSmell = exports['evo-k9-v2']:GetDogAttribute(dogid, 'smell')
    local playerItems = GetItems("player", target)
    if playerItems then
        for _, item in pairs(playerItems) do
            if Config.K9Search[item.name] and currentSmell >= Config.K9Search[item.name] then
                return true
            end
        end
    end

    return false
end

--[[
██╗   ██╗███████╗ █████╗ ██████╗ ██╗     ███████╗    ██╗████████╗███████╗███╗   ███╗███████╗
██║   ██║██╔════╝██╔══██╗██╔══██╗██║     ██╔════╝    ██║╚══██╔══╝██╔════╝████╗ ████║██╔════╝
██║   ██║███████╗███████║██████╔╝██║     █████╗      ██║   ██║   █████╗  ██╔████╔██║███████╗
██║   ██║╚════██║██╔══██║██╔══██╗██║     ██╔══╝      ██║   ██║   ██╔══╝  ██║╚██╔╝██║╚════██║
╚██████╔╝███████║██║  ██║██████╔╝███████╗███████╗    ██║   ██║   ███████╗██║ ╚═╝ ██║███████║
 ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚══════╝    ╚═╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚══════╝                                                                                 
--]]


-- Search Train
function evok9useweedtrain(source)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == "police" then
        if Config.Removeitem.k9weed then
            QBCore.Functions.GetPlayer(src).Functions.RemoveItem("k9weed", 1)
        end
        TriggerClientEvent('evo-k9:client:plantweed',source)
    else
        CustomNotifyClient(src,  "For Police Officer Only", "error")
    end
end

-- Glow Stick
function evok9useglowstick(source)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('evo-k9:client:glowdog',source)
end