-- This file allows for developers to add permission checks or even integration with a server framework.

if jobCheck.QBCore.enabled then
    QBCore = exports["qb-core"]:GetCoreObject()
end

if jobCheck.vRP.enabled then
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
end

if jobCheck.ESX.enabled then
    ESX = nil
    ESX = exports["es_extended"]:getSharedObject()
end

if not inventory.itemEnabled then
    RegisterCommand("basket", function(source, args, rawCommand)
        local source = source
        if (source > 0) then
            local permission = userHasPermission(source, jobCheck)
            if permission then
                TriggerClientEvent("Client:ToggleBasket", source, true) -- second argument is for permission notification.
            else
                TriggerClientEvent("Client:ToggleBasket", source, false) -- second argument is for permission notification.
            end
        end
    end, main.acePermissionsEnabled)

    RegisterCommand("tripod", function(source, args, rawCommand)
        local source = source
        if (source > 0) then
            local args = args[1]
            local remove = false
            if (args ~= nil) then
                if (args == "remove") then
                    remove = true
                elseif (args == "setup") then
                    remove = false
                elseif (args ~= "setup" and args ~= "remove") then
                    remove = nil
                end
                local permission = userHasPermission(source, jobCheck)
                if permission then
                    TriggerClientEvent("Client:RopeRescueCommand", source, remove)
                end
            end
        end
    end, main.acePermissionsEnabled)
end

local usedTripod = {}

if inventory.itemEnabled then
    if inventory.oxInventory then
        exports('useRopeRescueItem', function(event, item, inventory, slot, data)
            if event == 'usingItem' and userHasPermission(inventory.player.source, jobCheck) then
                if item.server.name == "tripod" then
                    TriggerClientEvent("Client:RopeRescueCommand", inventory.player.source, not not usedTripod[inventory.player.source])
                    usedTripod[inventory.player.source] = not usedTripod[inventory.player.source]
                else
                    TriggerClientEvent("Client:ToggleBasket", inventory.player.source, true) 
                end
                return false
            end
        end)

    elseif inventory.qbInventory or (inventory.coreInventory and jobCheck.QBCore.enabled) or (inventory.quasarInventory and jobCheck.QBCore.enabled) then
        QBCore.Functions.CreateUseableItem("tripod", function(source, item)
            TriggerClientEvent("Client:RopeRescueCommand", source, not not usedTripod[source])
            usedTripod[source] = not usedTripod[source]
        end)

        QBCore.Functions.CreateUseableItem("basket", function(source, item)
            TriggerClientEvent("Client:ToggleBasket", source, true)
        end)
    elseif inventory.esxInventory or (inventory.coreInventory and jobCheck.ESX.enabled) or (inventory.quasarInventory and jobCheck.ESX.enabled) then
        ESX.RegisterUsableItem("basket", function(playerId)
            TriggerClientEvent("Client:RopeRescueCommand", playerId, not not usedTripod[playerId])
            usedTripod[playerId] = not usedTripod[playerId]
        end)

        ESX.RegisterUsableItem("tripod", function(playerId)
            TriggerClientEvent("Client:ToggleBasket", playerId, true) 
        end)
    elseif inventory.vRPInventory then
        RegisterNetEvent("Server:useRopeRescueItem", function(source, itemName)
            if itemName == "tripod" then
                TriggerClientEvent("Client:RopeRescueCommand", source, not not usedTripod[source])
                usedTripod[source] = not usedTripod[source]
            elseif itemName == "basket" then
                TriggerClientEvent("Client:ToggleBasket", source, true) 
            end
        end)
    end
end

function userHasPermission(source, location)
    local permission = false
    local usingPermissions = false
    -- ESX Permissions
    if location.ESX.enabled then
        local xPlayer = ESX.GetPlayerFromId(source)
        if location.ESX.checkJob.enabled then
            usingPermissions = true
            for k, v in pairs(location.ESX.checkJob.jobs) do
                if xPlayer.job.name == v then
                    permission = true
                end
            end
        end
    end

    -- vRP Permission
    if location.vRP.enabled then
        if location.vRP.checkPermission.enabled then
            usingPermissions = true
            for k, v in pairs(location.vRP.checkPermission.permissions) do
                if vRP.hasPermission({vRP.getUserId({source}),v}) then
                    permission = true
                end
            end
        end

        if location.vRP.checkGroup.enabled then
            usingPermissions = true
            for k, v in pairs(location.vRP.checkGroup.groups) do
                if vRP.hasGroup({vRP.getUserId({source}),v}) then
                    permission = true
                end
            end
        end
    end

    -- QBCore Permission
    if location.QBCore.enabled then
        local player = QBCore.Functions.GetPlayer(source)
        if location.QBCore.checkJob.enabled then
            usingPermissions = true
            for k, v in pairs(location.QBCore.checkJob.jobs) do
                if player.PlayerData.job.name == v then
                    permission = true
                end
            end
        end
        if location.QBCore.checkPermission.enabled then
            usingPermissions = true
            for k, v in pairs(location.QBCore.checkPermission.permissions) do
                if QBCore.Functions.HasPermission(source, v) then
                    permission = true
                end
            end
        end
    end

    if not usingPermissions then
        permission = true
    end
    return permission
end

-- This server event is triggered upon player connect
RegisterServerEvent("reqestTripodPermission")
AddEventHandler("reqestTripodPermission", function()
    local source = source
    -- Add a permission check here
    -- This gives them access to go up and down ropes.
    local hasPermission = true
    TriggerClientEvent("returnTripodPermission", source, hasPermission)
    -- You must return the above client event to grant a player permission.
end)

RegisterServerEvent("Server:SyncTripod")
AddEventHandler("Server:SyncTripod", function(location, id, ropeList, remove)
    TriggerClientEvent("Client:SyncTripod", -1, location, id, ropeList, remove)
end)

RegisterServerEvent("Server:SyncBasket")
AddEventHandler("Server:SyncBasket", function(target, entityNetId, pedNetId, remove)
    TriggerClientEvent("Client:SyncBasket", -1, target, entityNetId, pedNetId, remove)
end)

RegisterServerEvent("Server:AdjustRotation")
AddEventHandler("Server:AdjustRotation", function(target, entityNetId, x, y, z)
    TriggerClientEvent("Client:AdjustRotation", -1, target, entityNetId, x, y, z)
end)

RegisterServerEvent("Server:Reattach")
AddEventHandler("Server:Reattach", function(target, pedNetId)
    TriggerClientEvent("Client:Reattach", -1, target, pedNetId)
end)

RegisterServerEvent("Server:OnRope")
AddEventHandler("Server:OnRope", function(target, pedNetId, basketNetId)
    TriggerClientEvent("Client:OnRope", -1, target, pedNetId, basketNetId)
end)