local QBCore = exports['qb-core']:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
local OverDoseName = Config.DrugSettings.Effects.OverDoseMetaDataName
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local Levels = Config.XP.Levels
local OverDoseLevels = Config.DrugSettings.OverDoseLevels

--notification function
local function SendNotify(src, msg, type, time, title)
    if not title then title = "Cocaine" end
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

----------USEABLE ITEMS-------------

QBCore.Functions.CreateUseableItem("cokeprocessingtable", function(source)
	TriggerClientEvent("lusty94_cocaine:client:openProcessingTable", source)
end)

QBCore.Functions.CreateUseableItem("coke_baggy", function(source)
	TriggerClientEvent("lusty94_cocaine:client:TakeCokeBaggy", source)
end)

QBCore.Functions.CreateUseableItem("crack_baggy", function(source)
	TriggerClientEvent("lusty94_cocaine:client:TakeCrackBaggy", source)
end)

QBCore.Functions.CreateUseableItem("overdosecure", function(source)
	TriggerClientEvent("lusty94_cocaine:client:TakeOverDoseCure", source)
end)




--------------CALL BACKS-----------

-- jerry can callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:GasCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.Gasoline.RequiredItem) -- plastic jerry can
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
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.HydrochloricAcid.RequiredItem) -- plastic jerry can
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

-- proccess cocaine callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:ProcessPureCocaine', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Cocaine.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Cocaine.RequiredItem2Name)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Cocaine.RequiredItem3Name)
    local item4 = Player.Functions.GetItemByName(Config.Processing.Cocaine.RequiredItem4Name)
    if item1 and item1.amount >= Config.Processing.Cocaine.RequiredItemAmount and item2 and item2.amount >= Config.Processing.Cocaine.RequiredItem2Amount and item3 and item3.amount >= Config.Processing.Cocaine.RequiredItem3Amount and item4 and item4.amount >= Config.Processing.Cocaine.RequiredItem4Amount then
        cb(true)
    else
        cb(false)
    end
end)

-- proccess crack callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:ProcessPureCrack', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Crack.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Crack.RequiredItem2Name)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Crack.RequiredItem3Name)
    if item1 and item1.amount >= Config.Processing.Crack.RequiredItemAmount and item2 and item2.amount >= Config.Processing.Crack.RequiredItem2Amount and item3 and item3.amount >= Config.Processing.Crack.RequiredItem3Amount then
        cb(true)
    else
        cb(false)
    end
end)

-- process overdose cure callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:OverDoseCureItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem2Name)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem3Name)
    if item1 and item1.amount >= Config.Processing.Curing.RequiredItemAmount and item2 and item2.amount >= Config.Processing.Curing.RequiredItem2Amount and item3 and item3.amount >= Config.Processing.Curing.RequiredItem3Amount then
        cb(true)
    else
        cb(false)
    end
end)

-- coke baggy callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:CokeBaggyItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Bagging.Cocaine.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Bagging.Cocaine.RequiredItem2Name)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Bagging.Cocaine.RequiredItem3Name)
    if item1 and item1.amount >= Config.Processing.Bagging.Cocaine.RequiredItemAmount and item2 and item3 and item3.amount >= Config.Processing.Bagging.Cocaine.RequiredItem3Amount then
        cb(true)
    else
        cb(false)
    end
end)

-- crack baggy callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:CrackBaggyItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Bagging.Crack.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.Bagging.Crack.RequiredItem2Name)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Bagging.Crack.RequiredItem3Name)
    if item1 and item1.amount >= Config.Processing.Bagging.Crack.RequiredItemAmount and item2 and item3 and item3.amount >= Config.Processing.Bagging.Crack.RequiredItem3Amount then
        cb(true)
    else
        cb(false)
    end
end)

-- take coke callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:TakeCokeBaggy', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Bagging.Cocaine.BaggedItemName)
    if item1 and item1.amount >= 1  then
        cb(true)
    else
        cb(false)
    end
end)

-- take crack callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:TakeCrackBaggy', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Bagging.Crack.BaggedItemName)
    local item2 = Player.Functions.GetItemByName("lighter")
    if item1 and item1.amount >= 1 and item2 then
        cb(true)
    else
        cb(false)
    end
end)

-- take overdose cure callback
QBCore.Functions.CreateCallback('lusty94_cocaine:get:TakeOverDoseCure', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.ProcessedItemName)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)






----------EVENTS-------------

-- pick CocaLeaves
RegisterServerEvent('lusty94_cocaine:server:PickCocaLeaves', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            amount = math.random(2,5)
        elseif DrugXP <= 500 then
            amount = math.random(5,9)
        elseif DrugXP <= 750 then
            amount = math.random(9, 13)
        elseif DrugXP <= 1250 then
            amount = math.random(13, 18)
        elseif DrugXP <= 1500 then
            amount = math.random(18, 25)
        elseif DrugXP <= 2200 then
            amount = math.random(25, 32)
        else
            amount = math.random(32,40)
        end
    else amount = math.random(3,6) end
    if InvType == 'qb' then
        Player.Functions.AddItem("cocaleaf", amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cocaleaf"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:AddItem(src,"cocaleaf", amount)
    end
    if Config.XP.Enabled then
        Player.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(5,10))) -- Edit xp reward here
        SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
    end	
end)


-- pick Cement
RegisterServerEvent('lusty94_cocaine:server:GetCement', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            amount = math.random(2,5)
        elseif DrugXP <= 500 then
            amount = math.random(5,9)
        elseif DrugXP <= 750 then
            amount = math.random(9, 13)
        elseif DrugXP <= 1250 then
            amount = math.random(13, 18)
        elseif DrugXP <= 1500 then
            amount = math.random(18, 25)
        elseif DrugXP <= 2000 then
            amount = math.random(25, 32)
        else
            amount = math.random(32,40)
        end
    else amount = math.random(3,6) end
    if InvType == 'qb' then
        Player.Functions.AddItem("cement", amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cement"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:AddItem(src,"cement", amount)
    end
    if Config.XP.Enabled then
        Player.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(5,10))) -- Edit xp reward here
        SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
    end	
end)

--pick Gasoline
RegisterServerEvent('lusty94_cocaine:server:GetGasoline', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            amount = math.random(2,5)
        elseif DrugXP <= 500 then
            amount = math.random(5,9)
        elseif DrugXP <= 750 then
            amount = math.random(9, 13)
        elseif DrugXP <= 1250 then
            amount = math.random(13, 18)
        elseif DrugXP <= 1500 then
            amount = math.random(18, 25)
        elseif DrugXP <= 2000 then
            amount = math.random(25, 32)
        else
            amount = math.random(32,40)
        end
    else amount = math.random(3,6) end
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.CoreSettings.Props.Gasoline.RequiredItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.CoreSettings.Props.Gasoline.RequiredItem], "remove")
        Player.Functions.AddItem("gasoline", amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["gasoline"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,Config.CoreSettings.Props.Gasoline.RequiredItem, 1)
        exports.ox_inventory:AddItem(src,"gasoline", amount)
    end
    if Config.XP.Enabled then
        Player.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(5,10))) -- Edit xp reward here
        SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
    end	
end)

--pick HydrochloricAcid
RegisterServerEvent('lusty94_cocaine:server:GetHydrochloricAcid', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            amount = math.random(2,5)
        elseif DrugXP <= 500 then
            amount = math.random(5,9)
        elseif DrugXP <= 750 then
            amount = math.random(9, 13)
        elseif DrugXP <= 1250 then
            amount = math.random(13, 18)
        elseif DrugXP <= 1500 then
            amount = math.random(18, 25)
        elseif DrugXP <= 2000 then
            amount = math.random(25, 32)
        else
            amount = math.random(32,40)
        end
    else amount = math.random(3,6) end
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.CoreSettings.Props.HydrochloricAcid.RequiredItem], "remove")
        Player.Functions.AddItem("hydrochloricacid", amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hydrochloricacid"], "add")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src,Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, 1)
        exports.ox_inventory:AddItem(src,"hydrochloricacid", amount)
    end
    if Config.XP.Enabled then
        Player.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(5,10))) -- Edit xp reward here
        SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
    end	
end)




--process pure cocaine
RegisterNetEvent('lusty94_cocaine:server:ProcessPureCocaine', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local xpAmount = math.random(5,10) -- Edit xp reward here
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Cocaine.ProcessedItemAmount end -- edit amount given if not using xp here
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Cocaine.RequiredItemName, Config.Processing.Cocaine.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Cocaine.RequiredItemName], 'remove', Config.Processing.Cocaine.RequiredItemAmount)
        Player.Functions.RemoveItem(Config.Processing.Cocaine.RequiredItem2Name, Config.Processing.Cocaine.RequiredItem2Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Cocaine.RequiredItem3Name], 'remove', Config.Processing.Cocaine.RequiredItem2Amount)
        Player.Functions.RemoveItem(Config.Processing.Cocaine.RequiredItem3Name, Config.Processing.Cocaine.RequiredItem3Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Cocaine.RequiredItem3Name], 'remove', Config.Processing.Cocaine.RequiredItem3Amount)
        Player.Functions.RemoveItem(Config.Processing.Cocaine.RequiredItem4Name, Config.Processing.Cocaine.RequiredItem4Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Cocaine.RequiredItem4Name], 'remove', Config.Processing.Cocaine.RequiredItem4Amount)
        Player.Functions.AddItem(Config.Processing.Cocaine.ProcessedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Cocaine.ProcessedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Cocaine.ProcessedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Cocaine.RequiredItemName, Config.Processing.Cocaine.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Cocaine.RequiredItem2Name, Config.Processing.Cocaine.RequiredItem2Amount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Cocaine.RequiredItem3Name, Config.Processing.Cocaine.RequiredItem3Amount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Cocaine.RequiredItem4Name, Config.Processing.Cocaine.RequiredItem4Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Cocaine.ProcessedItemName, returnAmount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)


-- process pure crack
RegisterServerEvent('lusty94_cocaine:server:ProcessPureCrack', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local xpAmount = math.random(5,10) -- Edit xp reward here
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Crack.ProcessedItemAmount end -- edit amount given if not using xp here
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Crack.RequiredItemName, Config.Processing.Crack.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Crack.RequiredItemName], 'remove', Config.Processing.Crack.RequiredItemAmount)
        Player.Functions.RemoveItem(Config.Processing.Crack.RequiredItem2Name, Config.Processing.Crack.RequiredItem2Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Crack.RequiredItem3Name], 'remove', Config.Processing.Crack.RequiredItem2Amount)
        Player.Functions.RemoveItem(Config.Processing.Crack.RequiredItem3Name, Config.Processing.Crack.RequiredItem3Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Crack.RequiredItem4Name], 'remove', Config.Processing.Crack.RequiredItem3Amount)
        Player.Functions.AddItem(Config.Processing.Crack.ProcessedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Crack.ProcessedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Crack.ProcessedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Crack.RequiredItemName, Config.Processing.Crack.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Crack.RequiredItem2Name, Config.Processing.Crack.RequiredItem2Amount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Crack.RequiredItem3Name, Config.Processing.Crack.RequiredItem3Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Crack.ProcessedItemName, returnAmount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)


-- process coke baggy
RegisterServerEvent('lusty94_cocaine:server:ProcessCokeBaggy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local xpAmount = math.random(5,10) -- Edit xp reward here
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Bagging.Cocaine.BaggedItemAmount end -- edit amount given if not using xp here
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Bagging.Cocaine.RequiredItemName, Config.Processing.Bagging.Cocaine.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Cocaine.RequiredItemName], 'remove', Config.Processing.Bagging.Cocaine.RequiredItemAmount)
        Player.Functions.RemoveItem(Config.Processing.Bagging.Cocaine.RequiredItem3Name, Config.Processing.Bagging.Cocaine.RequiredItem3Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Cocaine.RequiredItem3Name], 'remove', Config.Processing.Bagging.Cocaine.RequiredItem3Amount)
        Player.Functions.AddItem(Config.Processing.Bagging.Cocaine.BaggedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Cocaine.BaggedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Bagging.Cocaine.BaggedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Bagging.Cocaine.RequiredItemName, Config.Processing.Bagging.Cocaine.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Bagging.Cocaine.RequiredItem3Name, Config.Processing.Bagging.Cocaine.RequiredItem3Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Bagging.Cocaine.BaggedItemName, returnAmount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)

-- process crack baggy
RegisterServerEvent('lusty94_cocaine:server:ProcessCrackBaggy', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local xpAmount = math.random(5,10) -- Edit xp reward here
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Bagging.Crack.BaggedItemAmount end -- edit amount given if not using xp here
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Bagging.Crack.RequiredItemName, Config.Processing.Bagging.Crack.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Crack.RequiredItemName], 'remove', Config.Processing.Bagging.Crack.RequiredItemAmount)
        Player.Functions.RemoveItem(Config.Processing.Bagging.Crack.RequiredItem3Name, Config.Processing.Bagging.Crack.RequiredItem3Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Crack.RequiredItem3Name], 'remove', Config.Processing.Bagging.Crack.RequiredItem3Amount)
        Player.Functions.AddItem(Config.Processing.Bagging.Crack.BaggedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Crack.BaggedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Bagging.Crack.BaggedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Bagging.Crack.RequiredItemName, Config.Processing.Bagging.Crack.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Bagging.Crack.RequiredItem3Name, Config.Processing.Bagging.Crack.RequiredItem3Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Bagging.Crack.BaggedItemName, returnAmount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end
end)



-- create overdose cure
RegisterServerEvent('lusty94_cocaine:server:CreateOverDoseCure', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local xpAmount = math.random(5,10) -- Edit xp reward here
    if not Player then return end
    if Config.XP.Enabled then
        if DrugXP <= 150 then
            returnAmount = math.random(1,4)
        elseif DrugXP <= 500 then
            returnAmount = math.random(3,7)
        elseif DrugXP <= 750 then
            returnAmount = math.random(6,9)
        elseif DrugXP <= 1250 then
            returnAmount = math.random(10,14)
        elseif DrugXP <= 1500 then
            returnAmount = math.random(13,17)
        elseif DrugXP <= 2200 then
            returnAmount = math.random(17,20)
        end
    else returnAmount = Config.Processing.Curing.ProcessedItemAmount end -- edit amount given if not using xp here
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Curing.RequiredItemName, Config.Processing.Curing.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.RequiredItemName], 'remove', Config.Processing.Curing.RequiredItemAmount)
        Player.Functions.RemoveItem(Config.Processing.Curing.RequiredItem2Name, Config.Processing.Curing.RequiredItem2Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.RequiredItem3Name], 'remove', Config.Processing.Curing.RequiredItem2Amount)
        Player.Functions.RemoveItem(Config.Processing.Curing.RequiredItem3Name, Config.Processing.Curing.RequiredItem3Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.RequiredItem3Name], 'remove', Config.Processing.Curing.RequiredItem3Amount)
        Player.Functions.AddItem(Config.Processing.Curing.ProcessedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.ProcessedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Curing.ProcessedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Curing.RequiredItemName, Config.Processing.Curing.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Curing.RequiredItem2Name, Config.Processing.Curing.RequiredItem2Amount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Curing.RequiredItem3Name, Config.Processing.Curing.RequiredItem3Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Curing.ProcessedItemName, returnAmount)
        else
            SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)






-- take coke baggy
RegisterServerEvent('lusty94_cocaine:server:TakeCokeBaggy', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if InvType == 'qb' then
	    Player.Functions.RemoveItem(Config.Processing.Bagging.Cocaine.BaggedItemName, 1) -- coke_baggy
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Cocaine.BaggedItemName], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, Config.Processing.Bagging.Cocaine.BaggedItemName, 1)
    end
end)

-- take crack baggy
RegisterServerEvent('lusty94_cocaine:server:TakeCrackBaggy', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if InvType == 'qb' then
	    Player.Functions.RemoveItem(Config.Processing.Bagging.Crack.BaggedItemName, 1) -- crack_baggy
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.Crack.BaggedItemName], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, Config.Processing.Bagging.Crack.BaggedItemName, 1)
    end
end)











-- update overdose
RegisterServerEvent('lusty94_cocaine:server:OverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]
    if not Player then return end
    Player.Functions.SetMetaData(OverDoseName, (OverDose + Config.DrugSettings.Effects.OverDoseAmount)) -- Edit overdose counter here dont go too high or players wont be able to consume that many magic mushrooms without overdosing each time
    if OverDose >= Config.DrugSettings.Effects.OverDoseLevel then -- ONCE A PLAYER REACHES THIS NUMBER OR GOES PAST IT THEY WILL ALWAYS OVERDOSE WHEN CONSUMING MAGIC MUSHROOMS SO BE CAREFUL WHEN SETTING THIS VALUE
        Wait(3000)       
        TriggerClientEvent('lusty94_cocaine:client:OverDose', src)
    end    
end)

-- remove overdose
RegisterServerEvent('lusty94_cocaine:server:CureOverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]
    if not Player then return end
    if OverDose >= 1 then
        Player.Functions.SetMetaData(OverDoseName, (OverDose - Config.DrugSettings.Effects.OverDoseCureAmount)) -- Edit value here to set the amount that of metadata for overdose
        Player.Functions.RemoveItem(Config.Processing.Curing.ProcessedItemName, 1)
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.ProcessedItemName], "remove")
        SendNotify(src, Config.Language.Notifications.OverDoseCuredName, 'error', 2000)
    else
        SendNotify(src, Config.Language.Notifications.AlreadyCuredName, 'error', 2000)
        return
    end
end)



-- /commands
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
            SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'success', 2000)
        end
    end)
end

-- /commands
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
                SendNotify(src, 'You Are Currently Level: ' ..level.. ' | You have: ' ..data.. ' xp |', 'success', 2000)
            end
        end)
    end
end

--change items and prices here for ox_iventory
function CocaineSupplyShop()
    exports.ox_inventory:RegisterShop('CocaineSupplyShop', {
        name = 'Cocaine Supply Shop',
        inventory = {
            { name = 'trowel', price = 5 },
            { name = 'emptybaggies', price = 10 },
            { name = 'scales', price = 500 },
            { name = 'plasticjerrycan', price = 100 },
            { name = 'sodiumcarbonate', price = 50 },
            { name = 'water_bottle', price = 10 },
            { name = 'cokeprocessingtable', price = 1000 },
            { name = 'acetone', price = 250 },
            { name = 'dimethylformamide', price = 500 },
        },
    })
end

-- dont touch
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
		if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_Cocaine |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering supply shop |^5 ^5--<^3!^5>--^7')
            CocaineSupplyShop()
            print('^5--<^3!^5>-- ^7| Supplies shop and registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)



local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Cocaine/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
	end)
end
CheckVersion()