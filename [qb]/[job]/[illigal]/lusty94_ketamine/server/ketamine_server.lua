local QBCore = exports['qb-core']:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
local OverDoseName = Config.DrugSettings.Effects.OverDoseMetaDataName
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local OverDoseLevels = Config.DrugSettings.OverDoseLevels
local Levels = Config.XP.Levels
local xpChance = Config.XP.XPChance
local xpAmount = Config.XP.XPAmount



--notification function
local function SendNotify(src, msg, type, time, title)
    if not title then title = "Ketamine" end
    if not time then time = 5000 end
    if not type then type = 'success' end
    if not msg then print("Notification Sent With No Message") return end
    if NotifyType == 'qb' then
        TriggerClientEvent('QBCore:Notify', src, msg, type, time)
    elseif NotifyType == 'okok' then
        TriggerClientEvent('okokNotify:Alert', src, title, msg, time, type, Config.CoreSettings.Notify.Sound)
    elseif NotifyType == 'mythic' then
        TriggerClientEvent('mythic_notify:client:SendAlert', src, { type = type, text = msg, style = { ['background-color'] = '#00FF00', ['color'] = '#FFFFFF' } })
    elseif NotifyType == 'boii'  then
        TriggerClientEvent('boii_ui:notify', src, title, msg, type, time)
    elseif NotifyType == 'ox' then 
        TriggerClientEvent('ox_lib:notify', src, ({ title = title, description = msg, length = time, type = type, style = 'default'}))
    end
end



----------< USEABLE ITEMS >-------------



local ketItems = {
    { name = 'ketprocessingtable',   event = 'lusty94_ketamine:client:openProcessingTable'},
    { name = 'ketamine',             event = 'lusty94_ketamine:client:TakeKetamine'},
    { name = 'overdosecure',         event = 'lusty94_ketamine:client:TakeOverDoseCure'},
}

for k,v in pairs(ketItems) do
    QBCore.Functions.CreateUseableItem(v.name, function(source, item)
        TriggerClientEvent(v.event, source)
    end)
end

--------------< CALL BACKS >-----------


-- check active cops on duty
local function activeCops()
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for _, Player in pairs(players) do
        if Player.PlayerData.job.name == "police" or Player.PlayerData.job.name == "bcso" or Player.PlayerData.job.name == "leo" and Player.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    return amount
end

-- callback to check for starting mission
QBCore.Functions.CreateCallback('lusty94_ketamine:server:StartMission', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local activeCops = activeCops()
    if not Player then return end
    if activeCops >= Config.CoreSettings.Police.MinCops then
        cb(true)
    else
        cb(false)
        SendNotify(src,Config.Language.Notifications.NoCops, 'error', 2500)
    end
end)



--jerry can callback
QBCore.Functions.CreateCallback('lusty94_ketamine:get:PlasticJerryCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName('plasticjerrycan')
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)


--proccess Silica callback
QBCore.Functions.CreateCallback('lusty94_ketamine:get:ProcessSilica', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Silica.Item1)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Silica.Item2)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Silica.Item3)
    local item4 = Player.Functions.GetItemByName(Config.Processing.Silica.Item4) -- mortar pestle not removed just a check
    if item1 and item1.amount >= amount and item2 and item2.amount >= amount and item3 and item3.amount >= amount and item4 and item4.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)
 
--proccess LiquidKetamine callback
QBCore.Functions.CreateCallback('lusty94_ketamine:get:ProcessLiquidKetamine', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.LiquidKetamine.Item1)
    local item2 = Player.Functions.GetItemByName(Config.Processing.LiquidKetamine.Item2)
    local item3 = Player.Functions.GetItemByName(Config.Processing.LiquidKetamine.Item3)
    local item4 = Player.Functions.GetItemByName(Config.Processing.LiquidKetamine.Item4)
    local item5 = Player.Functions.GetItemByName(Config.Processing.LiquidKetamine.Item5)
    if item1 and item1.amount >= amount and item2 and item2.amount >= amount and item3 and item3.amount >= amount and item4 and item4.amount >= amount and item5 and item5.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)

--proccess Ketamine callback
QBCore.Functions.CreateCallback('lusty94_ketamine:get:ProcessKetamine', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Ketamine.Item1)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Ketamine.Item2) -- pressure cooker not removed just an item check
    local item3 = Player.Functions.GetItemByName(Config.Processing.Ketamine.Item3)
    if item1 and item1.amount >= amount and item2 and item2.amount >= 1 and item3 and item3.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)

--process overdose cure callback
QBCore.Functions.CreateCallback('lusty94_ketamine:get:CreateOverDoseCure', function(source, cb, amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.Item1)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Curing.Item2)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Curing.Item3)
    if item1 and item1.amount >= amount and item2 and item2.amount >= amount and item3 and item3.amount >= amount then
        cb(true)
    else
        cb(false)
    end
end)



--take Ketamine callback
QBCore.Functions.CreateCallback('lusty94_ketamine:get:TakeKetamine', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.TakeDrugs.Item)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--take overdose cure callback
QBCore.Functions.CreateCallback('lusty94_ketamine:get:TakeOverDoseCure', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.Given)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)






----------< EVENTS >-------------

--Mine Quartz Rock
RegisterServerEvent('lusty94_ketamine:server:MineQuartzRock', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local amountGiven = 2
    local item = 'quartz'
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP >= 150 then
            amountGiven = math.random(1, 3)
        elseif DrugXP >= 500 then
            amountGiven = math.random(2, 4)
        elseif DrugXP >= 750 then
            amountGiven = math.random(3, 5)
        elseif DrugXP >= 1250 then
            amountGiven = math.random(4, 6)
        elseif DrugXP >= 1500 then
            amountGiven = math.random(5, 7)
        elseif DrugXP >= 2200 then
            amountGiven = math.random(6, 8)
        end
    end
    if InvType == 'qb' then
        Player.Functions.AddItem(item, amountGiven)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", amountGiven)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, item, amountGiven) then
            exports.ox_inventory:AddItem(src,item, amountGiven)
        else
            SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
            return
        end
    end
    if Config.XP.Enabled then
        if xpChance >= math.random(1, 100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXp, 'success', 2000)
        end
    end	
end)

--Collect ether
RegisterServerEvent('lusty94_ketamine:server:GetEther', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local taken = 'plasticjerrycan'
    local given = 'ether'
    local amountGiven = 2
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP >= 150 then
            amountGiven = math.random(1, 3)
        elseif DrugXP >= 500 then
            amountGiven = math.random(2, 4)
        elseif DrugXP >= 750 then
            amountGiven = math.random(3, 5)
        elseif DrugXP >= 1250 then
            amountGiven = math.random(4, 6)
        elseif DrugXP >= 1500 then
            amountGiven = math.random(5, 7)
        elseif DrugXP >= 2200 then
            amountGiven = math.random(6, 8)
        end
    end
    
    if InvType == 'qb' then
        if Player.Functions.RemoveItem(taken, 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[taken], "add", 1)
            Player.Functions.AddItem(given, amountGiven)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[given], "add", amountGiven)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src, taken, 1) then
            if exports.ox_inventory:CanCarryItem(src, given, amountGiven) then
                exports.ox_inventory:AddItem(src, given, amountGiven)
            else
                SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
                return
            end
        end
    end
    if Config.XP.Enabled then
        if xpChance >= math.random(1, 100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXp, 'success', 2000)
        end
    end
end)


--Collect hydrochloric acid
RegisterServerEvent('lusty94_ketamine:server:GetHydrochloricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local taken = 'plasticjerrycan'
    local given = 'hydrochloricacid'
    local amountGiven = 2
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP >= 150 then
            amountGiven = math.random(1, 3)
        elseif DrugXP >= 500 then
            amountGiven = math.random(2, 4)
        elseif DrugXP >= 750 then
            amountGiven = math.random(3, 5)
        elseif DrugXP >= 1250 then
            amountGiven = math.random(4, 6)
        elseif DrugXP >= 1500 then
            amountGiven = math.random(5, 7)
        elseif DrugXP >= 2200 then
            amountGiven = math.random(6, 8)
        end
    end
    if InvType == 'qb' then
        if Player.Functions.RemoveItem(taken, 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[taken], "add", 1)
            Player.Functions.AddItem(given, amountGiven)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[given], "add", amountGiven)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,taken, 1) then
            if exports.ox_inventory:CanCarryItem(src, given, amountGiven) then
                exports.ox_inventory:AddItem(src, given, amountGiven)
            else
                SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
                return
            end
        end
    end
    if Config.XP.Enabled then
        if xpChance >= math.random(1, 100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXp, 'success', 2000)
        end
    end	
end)



--search bodies
RegisterServerEvent('lusty94_ketamine:server:SearchBody', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local cashenabled = Config.Processing.Mission.FindCash
    local cashchance = Config.Processing.Mission.CashChance
    local cashamount = Config.Processing.Mission.CashAmount
    if not Player then return end
    local chance = Config.CoreSettings.Chances.SearchBody
    if chance >= math.random(1,100)  then
        local items = { 'papaverine', 'noscapine', 'polyethyleneglycol', } -- add more items here if you wish but makes sure to change here if you change recipe in config
        local itemsAmount
        for _, item in pairs(items) do
            itemsAmount = math.random(2,4)
            if InvType == 'qb' then
                Player.Functions.AddItem(item, itemsAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[items], "add", itemsAmount)
            elseif InvType == 'ox' then
                if exports.ox_inventory:CanCarryItem(src, item, itemsAmount) then 
                    exports.ox_inventory:AddItem(src, item, itemsAmount)
                else
                    SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
                end
            end
        end
        if cashenabled then 
            if cashchance >= math.random(1,100) then
                if InvType == 'qb' then
                    Player.Functions.AddMoney('cash', cashamount, "supplies-mission")
                elseif InvType == 'ox' then
                    if exports.ox_inventory:CanCarryItem(src, "money", cashamount) then 
                        exports.ox_inventory:AddItem(src,"money", cashamount)
                    else
                        SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
                    end
                end
            end
        end
    else
        SendNotify(src, 'These shit gangsters had fuck all on them!', 'error', 2000)
    end
end)


--process Silica
RegisterNetEvent('lusty94_ketamine:server:ProcessSilica', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MethXP = Player.PlayerData.metadata[MetaDataName]
    local item1 = Config.Processing.Silica.Item1
    local item2 = Config.Processing.Silica.Item2
    local item3 = Config.Processing.Silica.Item3
    local given = Config.Processing.Silica.Given
    local requiredAmount = 1
    local returnAmount = 2
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP >= 150 then
            returnAmount = math.random(1, 3)
        elseif DrugXP >= 500 then
            returnAmount = math.random(2, 4)
        elseif DrugXP >= 750 then
            returnAmount = math.random(3, 5)
        elseif DrugXP >= 1250 then
            returnAmount = math.random(4, 6)
        elseif DrugXP >= 1500 then
            returnAmount = math.random(5, 7)
        elseif DrugXP >= 2200 then
            returnAmount = math.random(6, 8)
        end
    end
    if InvType == 'qb' then
        if Player.Functions.RemoveItem(item1, requiredAmount * amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item1], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item2, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item3, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item3], 'remove', requiredAmount * amount)
            Player.Functions.AddItem(given, amount * returnAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[given], 'add', amount * returnAmount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src, item1, requiredAmount * amount) then
            exports.ox_inventory:RemoveItem(src, item2, requiredAmount * amount)
            exports.ox_inventory:RemoveItem(src, item3, requiredAmount * amount)
            if exports.ox_inventory:CanCarryItem(src, given, amount * returnAmount) then
                exports.ox_inventory:AddItem(src,given, amount * returnAmount)
            else
                SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
    if Config.XP.Enabled then
        if xpChance >= math.random(1, 100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXp, 'success', 2000)
        end
    end	
end)


--process LiquidKetamine
RegisterNetEvent('lusty94_ketamine:server:ProcessLiquidKetamine', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MethXP = Player.PlayerData.metadata[MetaDataName]
    local item1 = Config.Processing.LiquidKetamine.Item1
    local item2 = Config.Processing.LiquidKetamine.Item2
    local item3 = Config.Processing.LiquidKetamine.Item3
    local item4 = Config.Processing.LiquidKetamine.Item4
    local item5 = Config.Processing.LiquidKetamine.Item5
    local given = Config.Processing.LiquidKetamine.Given
    local requiredAmount = 1
    local returnAmount = 2
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP >= 150 then
            returnAmount = math.random(1, 3)
        elseif DrugXP >= 500 then
            returnAmount = math.random(2, 4)
        elseif DrugXP >= 750 then
            returnAmount = math.random(3, 5)
        elseif DrugXP >= 1250 then
            returnAmount = math.random(4, 6)
        elseif DrugXP >= 1500 then
            returnAmount = math.random(5, 7)
        elseif DrugXP >= 2200 then
            returnAmount = math.random(6, 8)
        end
    end
    if InvType == 'qb' then
        if Player.Functions.RemoveItem(item1, requiredAmount * amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item1], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item2, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item3, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item3], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item4, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item4], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item5, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item5], 'remove', requiredAmount * amount)
            Player.Functions.AddItem(given, amount * returnAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[given], 'add', amount * returnAmount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src, item1, requiredAmount * amount) then
            exports.ox_inventory:RemoveItem(src, item2, requiredAmount * amount)
            exports.ox_inventory:RemoveItem(src, item3, requiredAmount * amount)
            exports.ox_inventory:RemoveItem(src, item4, requiredAmount * amount)
            exports.ox_inventory:RemoveItem(src, item5, requiredAmount * amount)
            if exports.ox_inventory:CanCarryItem(src, given, amount * returnAmount) then
                exports.ox_inventory:AddItem(src,given, amount * returnAmount)
            else
                SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
    if Config.XP.Enabled then
        if xpChance >= math.random(1, 100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXp, 'success', 2000)
        end
    end	
end)

--process Ketamine
RegisterNetEvent('lusty94_ketamine:server:ProcessKetamine', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MethXP = Player.PlayerData.metadata[MetaDataName]
    local item1 = Config.Processing.Ketamine.Item1
    local item3 = Config.Processing.Ketamine.Item3
    local given = Config.Processing.Ketamine.Given
    local requiredAmount = 1
    local returnAmount = 2
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP >= 150 then
            returnAmount = math.random(1, 3)
        elseif DrugXP >= 500 then
            returnAmount = math.random(2, 4)
        elseif DrugXP >= 750 then
            returnAmount = math.random(3, 5)
        elseif DrugXP >= 1250 then
            returnAmount = math.random(4, 6)
        elseif DrugXP >= 1500 then
            returnAmount = math.random(5, 7)
        elseif DrugXP >= 2200 then
            returnAmount = math.random(6, 8)
        end
    end
    if InvType == 'qb' then
        if Player.Functions.RemoveItem(item1, requiredAmount * amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item1], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item3, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item3], 'remove', requiredAmount * amount)
            Player.Functions.AddItem(given, amount * returnAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[given], 'add', amount * returnAmount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src, item1, requiredAmount * amount) then
            exports.ox_inventory:RemoveItem(src, item3, requiredAmount * amount)
            if exports.ox_inventory:CanCarryItem(src, given, amount * returnAmount) then
                exports.ox_inventory:AddItem(src,given, amount * returnAmount)
            else
                SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
    if Config.XP.Enabled then
        if xpChance >= math.random(1, 100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXp, 'success', 2000)
        end
    end	
end)

--process overdose cure
RegisterNetEvent('lusty94_ketamine:server:CreateOverDoseCure', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local MethXP = Player.PlayerData.metadata[MetaDataName]
    local item1 = Config.Processing.Curing.Item1
    local item2 = Config.Processing.Curing.Item2
    local item3 = Config.Processing.Curing.Item3
    local given = Config.Processing.Curing.Given
    local requiredAmount = 1
    local returnAmount = 2
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP >= 150 then
            returnAmount = math.random(1, 3)
        elseif DrugXP >= 500 then
            returnAmount = math.random(2, 4)
        elseif DrugXP >= 750 then
            returnAmount = math.random(3, 5)
        elseif DrugXP >= 1250 then
            returnAmount = math.random(4, 6)
        elseif DrugXP >= 1500 then
            returnAmount = math.random(5, 7)
        elseif DrugXP >= 2200 then
            returnAmount = math.random(6, 8)
        end
    end
    if InvType == 'qb' then
        if Player.Functions.RemoveItem(item1, requiredAmount * amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item1], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item2, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], 'remove', requiredAmount * amount)
            Player.Functions.RemoveItem(item3, requiredAmount * amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item3], 'remove', requiredAmount * amount)
            Player.Functions.AddItem(given, amount * returnAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[given], 'add', amount * returnAmount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src, item1, requiredAmount * amount) then
            exports.ox_inventory:RemoveItem(src, item2, requiredAmount * amount)
            exports.ox_inventory:RemoveItem(src, item3, requiredAmount * amount)
            if exports.ox_inventory:CanCarryItem(src, given, amount * returnAmount) then
                exports.ox_inventory:AddItem(src,given, amount * returnAmount)
            else
                SendNotify(src, Config.Language.Notifications.CantCarry, 'error', 2000)
            end
        end
    end
    if Config.XP.Enabled then
        if xpChance >= math.random(1, 100) then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src, Config.Language.Notifications.EarnedXp, 'success', 2000)
        end
    end	
end)




--take Ketamine
RegisterServerEvent('lusty94_ketamine:server:TakeKetamine', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
	    Player.Functions.RemoveItem(Config.Processing.TakeDrugs.ItemName, 1) -- heroin_vial
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.TakeDrugs.ItemName], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, Config.Processing.TakeDrugs.ItemName, 1)
    end
end)



--update overdose
RegisterServerEvent('lusty94_ketamine:server:OverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]

    Player.Functions.SetMetaData(OverDoseName, (OverDose + Config.DrugSettings.Effects.OverDoseAmount))
    if OverDose >= Config.DrugSettings.Effects.OverDoseLevel then -- ONCE A PLAYER REACHES THIS NUMBER OR GOES PAST IT THEY WILL ALWAYS OVERDOSE WHEN CONSUMING MAGIC MUSHROOMS SO BE CAREFUL WHEN SETTING THIS VALUE
        Wait(3000)       
        TriggerClientEvent('lusty94_ketamine:client:OverDose', src)
    end    
end)

--remove overdose
RegisterServerEvent('lusty94_ketamine:server:CureOverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]

    if OverDose >= 1 then
        if InvType == 'qb' then
            Player.Functions.RemoveItem(Config.Processing.Curing.Given, 1)
	        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.Given], "remove")
        elseif InvType == 'ox' then
            exports.ox_inventory:RemoveItem(src, Config.Processing.Curing.Given, 1)
        end
        Player.Functions.SetMetaData(OverDoseName, (OverDose - Config.DrugSettings.Effects.OverDoseCureAmount))
        SendNotify(src, Config.Language.Notifications.OverDoseCured, 'success', 2000)
    else
        SendNotify(src, Config.Language.Notifications.AlreadyCured, 'error', 2000)
        return
    end
end)



--ketamine supply shop
function ketItems()
    exports.ox_inventory:RegisterShop('ketItems', {
        name = 'Ketamine Supply Shop',
        inventory = {
            { name = 'pickaxe', price = 200 },
			{ name = 'painkillers', price = 200 },
			{ name = 'citricacid', price = 250 },
			{ name = 'steviapowder', price = 250 },
			{ name = 'butane_gas', price = 250 },
			{ name = 'plasticjerrycan', price = 100 },
			{ name = 'pressurecooker', price = 100 },
			{ name = 'mortarpestle', price = 250 },
			{ name = 'ketprocessingtable', price = 1000 },
        },
    })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_Ketamine |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering shops automatically |^5 ^5--<^3!^5>--^7')
            ketItems()
            print('^5--<^3!^5>-- ^7| Shops registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)







--------------< COMMANDS >---------------

--/commands
if Config.DrugSettings.Effects.OverDose then
    QBCore.Commands.Add(OverDoseName, "Check Your OverDose Level", {}, true, function(source, args)
        local source = source
        local src = source
        local level = 1
        local Player = QBCore.Functions.GetPlayer(source)
        local data = Player.PlayerData.metadata[OverDoseName]
        if data ~= nil then
            for i=1, #OverDoseLevels, 1 do
                if data >= OverDoseLevels[i] then
                    level = i + 1
                end
            end
            SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'error', 2000)
        end
    end)
end

--/commands
if Config.XP.Enabled then
    if Config.XP.Command then
        QBCore.Commands.Add(MetaDataName, "Check Your Drug XP Level", {}, true, function(source, args)
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
                SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'error', 2000)
            end
        end)
    end
end





local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Ketamine/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
	end)
end
CheckVersion()