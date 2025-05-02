QBCore = exports['qb-core']:GetCoreObject()
usingOX = false

local cachedBadges = {}

Citizen.CreateThread(function()
    if GetResourceState('ox_inventory') == 'started' then
        print("OX inventory detected")
        usingOX = true
    end
    for k,v in pairs(Config.Settings) do
        QBCore.Functions.CreateUseableItem(v.itemName, function(src, item)
            local Player = QBCore.Functions.GetPlayer(src)
            local itemData
            if usingOX then 
                itemData = exports.ox_inventory:GetItem(src, v.itemName, nil, false)
            else
                itemData = Player.Functions.GetItemByName(item.name)
            end
            if not itemData then TriggerClientEvent("an_badges:notify", src, "Something went wrong with your badge, please throw it away.", "error") return end
            local itemData = Player.Functions.GetItemByName(item.name)
            local badgeAvatar = itemData.info.badge_avatar
            local fullname = itemData.info.fullname
            local rank = itemData.info.rank
            local cs = itemData.info.callsign
            if itemData and badgeAvatar and fullname and rank and cs then
                TriggerClientEvent("an_badges:showBadge", src, v.design, badgeAvatar, fullname, v.number, rank, cs)
            else
                if Player.PlayerData.job.name == v.job then
                    TriggerClientEvent("an_badges:notify", src, "You have not yet created your badge, please provide a picture URL to be used in your badge", "error")
                    TriggerClientEvent("an_badges:createBadge", src, item.name, itemData.slot)
                else
                    TriggerClientEvent("an_badges:notify", src, "That is not yours.", "error")
                end
            end
        end)
    end
end)

RegisterNetEvent('an_badges:showSV', function(pid, data)
    TriggerClientEvent("an_badges:showCL", pid, data)
end)

RegisterNetEvent('an_badges:updateBadge', function(url, itemName, itemSlot)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        local jobName = Player.PlayerData.job.name
        local cs = Player.PlayerData.metadata["callsign"]
        if not cs or cs == "NO CALLSIGN" then
            cs = Config.DefaultCallsign
        end
        local rank = Config.Ranks[jobName][Player.PlayerData.job.grade.level]
        local fullname = Player.PlayerData.charinfo.firstname .." ".. Player.PlayerData.charinfo.lastname
        local playerItem = Player.Functions.GetItemBySlot(itemSlot)
        if not playerItem then 
            TriggerClientEvent("an_badges:notify", src, "You do not have a badge to update!", "error")
            return
        end
        playerItem.info.badge_avatar = url
        playerItem.info.fullname = fullname
        playerItem.info.rank = rank
        playerItem.info.callsign = cs
        if usingOX then
            exports.ox_inventory:SetMetadata(src, playerItem.slot, playerItem.info)
            TriggerClientEvent("an_badges:notify", src, "Your badge avatar was updated successfully.", "success")
        else
            Player.Functions.RemoveItem(playerItem.name, 1, playerItem.slot)
            Player.Functions.AddItem(playerItem.name, 1, playerItem.slot, playerItem.info, "AN Badge Avatar Update")
            TriggerClientEvent("an_badges:notify", src, "Your badge avatar was updated successfully.", "success")
        end
    end

end)