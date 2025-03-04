local QBCore = exports['qb-core']:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local Levels = Config.XP.Levels



--notification function
local function SendNotify(src, msg, type, time, title)
    if NotifyType == nil then print("Lusty94_Cocaine: NotifyType Not Set in Config.CoreSettings.Notify.Type!") return end
    if not title then title = 'Cocaine' end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print('Notification Sent With No Message') return end
    if NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, msg, type, time)
    elseif NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', src, title, msg, time, type, Config.CoreSettings.Notify.Sound)
    elseif NotifyType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msg, style = { ['background-color'] = '#00FF00', ['color'] = '#FFFFFF' } })
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end

--conusmables
for itemName, _ in pairs(Config.Drugs) do
    QBCore.Functions.CreateUseableItem(itemName, function(source, item)
        TriggerClientEvent('lusty94_cocaine:client:UseItem', source, item.name)
    end)
end


--remove items
local function removeItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:RemoveItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'remove', amount)
        end
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, item, amount)
    end
end

--add items
local function addItem(src, item, amount)
    if InvType == 'qb' then
        if exports['qb-inventory']:AddItem(src, item, amount, false, false, false) then
            TriggerClientEvent('qb-inventory:client:ItemBox', src, QBCore.Shared.Items[item], 'add', amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, item, amount) then
            exports.ox_inventory:AddItem(src, item, amount)
        else
            SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 5000)
        end
    end
end

--calculate rewards
local function calculateXP(DrugXP)
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            return math.random(1, 4)
        elseif DrugXP <= 500 then
            return math.random(3, 6)
        elseif DrugXP <= 750 then
            return math.random(5, 8)
        elseif DrugXP <= 1250 then
            return math.random(7, 10)
        elseif DrugXP <= 1500 then
            return math.random(9, 12)
        elseif DrugXP <= 2200 then
            return math.random(11, 14)
        else
            return math.random(13, 16) -- For players beyond the XP threshold
        end
    else
        return math.random(1,3) -- Default reward when XP is disabled
    end
end

--give xp
local function giveDrugXP(src)
    if Config.XP.Enabled then
        local Player = QBCore.Functions.GetPlayer(src)
        if not Player then
            print("Error: Player not found for source: " .. tostring(src))
            return
        end
        local MetaDataName = Config.XP.MetaDataName
        local DrugXP = Player.PlayerData.metadata[MetaDataName] or 0
        local xpChance = Config.XP.XPChance
        local xpAmount = Config.XP.XPGain
        if math.random(1, 100) <= xpChance then
            local newXP = DrugXP + xpAmount
            Player.Functions.SetMetaData(MetaDataName, newXP)
            SendNotify(src, 'You earned ' .. xpAmount .. ' XP!', 'success', 3000)
        end
    end
end



-- jerry can callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:GasCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.Gasoline.Item) -- plastic jerry can
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)


-- hydro can callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:HydroCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.HydrochloricAcid.Item) -- plastic jerry can
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--callback for requireditem in consumables
QBCore.Functions.CreateCallback('lusty94_cocaine:server:hasItem', function(source, cb, itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = Config.Drugs[itemName]
    if item then
        if item.requireditem then
            local requiredItem = Player.Functions.GetItemByName(item.requireditem)          
            if requiredItem then
                cb(true)
            else
                SendNotify(src, 'You need a ' .. item.requireditemlabel .. ' to use this!', 'error', 5000)       
                cb(false)
            end
        else
            cb(true)
        end
    else
        cb(false)        
    end
end)

--Get player's item count
local function GetPlayerItemCount(source, itemName)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return 0 end
    local item = Player.Functions.GetItemByName(itemName)
    if item then
        return item.amount
    end
    return 0
end

--Calculate max processable
local function GetMaxProcessable(source, recipe)
    local maxProcessable = math.huge
    for _, v in ipairs(recipe.required) do
        local playerCount = GetPlayerItemCount(source, v.item)
        maxProcessable = math.min(maxProcessable, math.floor(playerCount / v.amount))
    end
    return maxProcessable
end

-- pick CocaLeaves
RegisterServerEvent('lusty94_cocaine:server:PickCocaLeaves', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local rewardAmount = calculateXP(DrugXP)
    if not Player then return end
    addItem(src, 'cocaleaf', rewardAmount)
    giveDrugXP(src)
end)


-- pick cement
RegisterServerEvent('lusty94_cocaine:server:GetCement', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local rewardAmount = calculateXP(DrugXP)
    if not Player then return end
    addItem(src, 'cement', rewardAmount)
    giveDrugXP(src)
end)

--pick gasoline
RegisterServerEvent('lusty94_cocaine:server:GetGasoline', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local rewardAmount = calculateXP(DrugXP)
    local can = Config.CoreSettings.Props.Gasoline.Item
    if not Player then return end
    removeItem(src, can, 1)
    Wait(250)
    addItem(src, 'gasoline', rewardAmount)
    giveDrugXP(src)
end)

--pick hydro acid
RegisterServerEvent('lusty94_cocaine:server:GetHydrochloricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local rewardAmount = calculateXP(DrugXP)
    local can = Config.CoreSettings.Props.HydrochloricAcid.Item
    if not Player then return end
    removeItem(src, can, 1)
    Wait(250)
    addItem(src, 'hydrochloricacid', rewardAmount)
    giveDrugXP(src)
end)

--use consumable item
RegisterNetEvent('lusty94_cocaine:server:UseItem', function(itemName)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        removeItem(src, itemName, 1)
    end
end)

--max processable
RegisterNetEvent("lusty94_cocaine:server:GetMaxProcessable", function(item)
    local src = source
    local recipe = Config.Processing[item]
    if not recipe then
        SendNotify(src, "Invalid recipe!", 'error', 5000)
        return
    end
    local maxProcessable = GetMaxProcessable(src, recipe)
    TriggerClientEvent("lusty94_cocaine:client:ShowProcessingInput", src, item, maxProcessable)
end)

--process items
RegisterNetEvent('lusty94_cocaine:server:ProcessItem', function(item, quantity)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local recipe = Config.Processing[item]
    local MetaDataName = Config.XP.MetaDataName
    local DrugXP = Player.PlayerData.metadata[MetaDataName] or 0
    for _, req in ipairs(recipe.required) do
        local playerItemCount = GetPlayerItemCount(src, req.item)
        if playerItemCount < req.amount * quantity then
            SendNotify(src, Config.Language.Notifications.NoItems, 'error', 5000)
            return
        end
    end
    for _, req in ipairs(recipe.required) do
        removeItem(src, req.item, req.amount * quantity)
        Wait(250)
    end
    local itemsRewardedPerBatch = calculateXP(DrugXP)
    local totalReward = itemsRewardedPerBatch * quantity
    addItem(src, item,  totalReward)
    giveDrugXP(src)
end)




-- /commands
if Config.XP.Enabled then
    if Config.XP.Command then
        QBCore.Commands.Add(MetaDataName, 'Check Your Drug XP Level', {}, true, function(source, args)
            local source = source
            local src = source
            local level = 1
            local Player = QBCore.Functions.GetPlayer(source)
            local data = Player.PlayerData.metadata[MetaDataName]
            if data ~= nil then
                for i=1, #Levels, 1 do
                    if data >= Levels[i] then
                        level = i + 1
                    end
                end
                SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'success', 2000)
            end
        end)
    end
end

------------------------< QB-INVENTORY SHOPS >--------------------

RegisterNetEvent('lusty94_cocaine:server:SuppliesShop', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local cocaineSupplies = {
        {name = "trowel",                 price = 5,      amount = 1000, info = {}, type = "item", slot = 1,},
        {name = "emptybaggies",           price = 10,     amount = 1000, info = {}, type = "item", slot = 2,},
        {name = "plasticjerrycan",        price = 100,    amount = 1000, info = {}, type = "item", slot = 3,},
        {name = "sodiumcarbonate",        price = 50,     amount = 1000, info = {}, type = "item", slot = 4,},
        {name = "water_bottle",           price = 10,     amount = 1000, info = {}, type = "item", slot = 5,},
    }
    exports['qb-inventory']:CreateShop({
        name = 'cocaineSupplies',
        label = 'Cocaine Supplies Shop',
        slots = 6,
        items = cocaineSupplies
    })
    if Player then
        exports['qb-inventory']:OpenShop(source, 'cocaineSupplies')
    end
end)


------------------------< OX_INVENTORY SHOPS >--------------------

--shop for ox
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
		if InvType == 'ox' then
            exports.ox_inventory:RegisterShop('CocaineSupplyShop', {
                name = 'Cocaine Supply Shop',
                inventory = {
                    { name = 'trowel',          price = 5 },
                    { name = 'emptybaggies',    price = 10 },
                    { name = 'plasticjerrycan', price = 100 },
                    { name = 'sodiumcarbonate', price = 50 },
                    { name = 'water_bottle',    price = 10 },
                },
            })
        end
    end
end)




--------------< VERSION CHECK >-------------

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Cocaine/version.txt', function(err, newestVersion, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
        if not newestVersion then
            print('^1[Lusty94_Cocaine]^7: Unable to fetch the latest version.')
            return
        end

        newestVersion = newestVersion:gsub('%s+', '')
        currentVersion = currentVersion and currentVersion:gsub('%s+', '') or "Unknown"

        if newestVersion == currentVersion then
            print(string.format('^2[Lusty94_Cocaine]^7: ^6You are running the latest version.^7 (^2v%s^7)', currentVersion))
        else
            print(string.format('^2[Lusty94_Cocaine]^7: ^3Your version: ^1v%s^7 | ^2Latest version: ^2v%s^7\n^1Please update to the latest version | Changelogs can be found in the support discord.^7', currentVersion, newestVersion))
        end
    end)
end

CheckVersion()