local QBCore = exports['qb-core']:GetCoreObject()
local MetaDataName = Config.XP.MetaDataName
local OverDoseName = Config.DrugSettings.Effects.OverDoseMetaDataName
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type
local Levels = Config.XP.Levels
local OverDoseLevels = Config.DrugSettings.OverDoseLevels
local xpChance = Config.XP.XPChance

----------< USEABLE ITEMS >-------------

local useItems = {
    { name = 'heroinprocessingtable',   event = 'lusty94_heroin:client:openProcessingTable'},
    { name = 'heroin_vial',             event = 'lusty94_heroin:client:TakeHeroin'},
    { name = 'overdosecure',            event = 'lusty94_heroin:client:TakeOverDoseCure'},
}

for k,v in pairs(useItems) do
    QBCore.Functions.CreateUseableItem(v.name, function(source, item)
        TriggerClientEvent(v.event, source)
    end)
end


--notification function
local function SendNotify(src, msg, type, time, title)
    if not title then title = "Heroin" end
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


--------------< CALL BACKS >-----------

--jerry can callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:JerryCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.Ether.RequiredItem) -- plastic jerry can
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--hydrochloric acid can callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:HydroCan', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.CoreSettings.Props.HydrochloricAcid.RequiredItem) -- plastic jerry can
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--proccess heroinbase callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:ProcessHeroinBase', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItemName)
    local item1amount = Config.Processing.HeroinBase.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItem2Name)
    local item2amount = Config.Processing.HeroinBase.RequiredItem2Amount
    local item3 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItem3Name)
    local item3amount = Config.Processing.HeroinBase.RequiredItem3Amount
    local item4 = Player.Functions.GetItemByName(Config.Processing.HeroinBase.RequiredItem4Name)
    local item4amount = Config.Processing.HeroinBase.RequiredItem4Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount and item3 and item3.amount >= item3amount and item4 and item4.amount >= item4amount then
        cb(true)
    else
        cb(false)
    end
end)

--proccess pureheroin callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:ProcessPureHeroin', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.PureHeroin.RequiredItemName)
    local item1amount = Config.Processing.PureHeroin.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.PureHeroin.RequiredItem2Name)
    local item2amount = Config.Processing.PureHeroin.RequiredItem2Amount
    local item3 = Player.Functions.GetItemByName(Config.Processing.PureHeroin.RequiredItem3Name)
    local item3amount = Config.Processing.PureHeroin.RequiredItem3Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount and item3 and item3.amount >= item3amount then
        cb(true)
    else
        cb(false)
    end
end)

--process overdose cure callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:OverDoseCureItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItemName)
    local item1amount = Config.Processing.Curing.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem2Name)
    local item2amount = Config.Processing.Curing.RequiredItem2Amount
    local item3 = Player.Functions.GetItemByName(Config.Processing.Curing.RequiredItem3Name)
    local item3amount = Config.Processing.Curing.RequiredItem3Amount
    if item1 and item1.amount >= item1amount and item2 and item2.amount >= item2amount and item3 and item3.amount >= item3amount then
        cb(true)
    else
        cb(false)
    end
end)

--heroin vial callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:ProcessHeroinVial', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Bagging.HeroinVial.RequiredItemName)
    local item1amount = Config.Processing.Bagging.HeroinVial.RequiredItemAmount
    local item2 = Player.Functions.GetItemByName(Config.Processing.Bagging.HeroinVial.RequiredItem2Name)
    local item3 = Player.Functions.GetItemByName(Config.Processing.Bagging.HeroinVial.RequiredItem3Name)
    local item3amount = Config.Processing.Bagging.HeroinVial.RequiredItem3Amount
    if item1 and item1.amount >= item1amount and item2 and item3 and item3.amount >= item3amount then
        cb(true)
    else
        cb(false)
    end
end)



--take heroin callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:TakeHeroin', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.TakeDrugs.RequiredItemName)
    local item2 = Player.Functions.GetItemByName(Config.Processing.TakeDrugs.RequiredItem2Name)
    if item1 and item1.amount >= 1 and item2 and item2.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)

--take overdose cure callback
QBCore.Functions.CreateCallback('lusty94_heroin:get:TakeOverDoseCure', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item1 = Player.Functions.GetItemByName(Config.Processing.Curing.ProcessedItemName)
    if item1 and item1.amount >= 1 then
        cb(true)
    else
        cb(false)
    end
end)


-- check active cops on duty
local function copsOnDuty()
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
QBCore.Functions.CreateCallback('lusty94_heroin:server:StartMission', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local copsOnDuty = copsOnDuty()
    if not Player then return end
    if copsOnDuty >= Config.CoreSettings.Police.MinCops then
        cb(true)
    else
        cb(false)
        SendNotify(src,Config.Language.Notifications.NoCopsName, 'error', 2500)
    end
end)



----------< EVENTS >-------------

--pick OpiumPlants
RegisterServerEvent('lusty94_heroin:server:PickOpiumPlants', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local DrugXP = Player.PlayerData.metadata[MetaDataName]
    local xpAmount = math.random(5,10) -- edit XP reward here
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
    else 
        amount = math.random(3,6)
    end
    if InvType == 'qb' then
        Player.Functions.AddItem("opiumsap", amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["opiumsap"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "opiumsap", amount) then
            exports.ox_inventory:AddItem(src,"opiumsap", amount)
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



--pick Lime
RegisterServerEvent('lusty94_heroin:server:GetLime', function()
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
        Player.Functions.AddItem("limepowder", amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["limepowder"], "add", amount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, "limepowder", amount) then    
            exports.ox_inventory:AddItem(src,"limepowder", amount)
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


--pick Ether
RegisterServerEvent('lusty94_heroin:server:GetEther', function(amount)
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
    else 
        amount = math.random(3,6)
    end
    if InvType == 'qb' then
        if Player.Functions.RemoveItem(Config.CoreSettings.Props.Ether.RequiredItem, 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.CoreSettings.Props.Ether.RequiredItem], "remove")
            Player.Functions.AddItem("ether", amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ether"], "add", amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,Config.CoreSettings.Props.Ether.RequiredItem, 1) then
            if exports.ox_inventory:CanCarryItem(src, "ether", amount) then
                exports.ox_inventory:AddItem(src,"ether", amount)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)

--pick HydrochloricAcid
RegisterServerEvent('lusty94_heroin:server:GetHydrochloricAcid', function()
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
        if Player.Functions.RemoveItem(Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.CoreSettings.Props.HydrochloricAcid.RequiredItem], "remove")
            Player.Functions.AddItem("hydrochloricacid", amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["hydrochloricacid"], "add", amount)
        end
    elseif InvType == 'ox' then
        if exports.ox_inventory:RemoveItem(src,Config.CoreSettings.Props.HydrochloricAcid.RequiredItem, 1) then
            if exports.ox_inventory:CanCarryItem(src, "hydrochloricacid", amount) then    
                exports.ox_inventory:AddItem(src,"hydrochloricacid", amount)
            else
                SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
            end
        end
    end
    if Config.XP.Enabled then
        if math.random(1,100) <= xpChance then
            Player.Functions.SetMetaData(MetaDataName, (DrugXP + xpAmount))
            SendNotify(src,Config.Language.Notifications.EarnedXpName, 'error', 2000)
        end
    end	
end)




--search guards for chemicals
RegisterServerEvent('lusty94_heroin:server:SearchGuards', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local cashenabled = Config.Processing.Mission.FindCash
    local cashchance = Config.Processing.Mission.CashChance
    local cashamount = Config.Processing.Mission.CashAmount
    if not Player then return end
    local chance = Config.CoreSettings.Chances.SearchBody
    if chance >= math.random(1,100)  then
        local items = { 'acetone', 'papaverine', 'noscapine',} -- add more items here if you wish but makes sure to change here if you change recipe in config
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
                    SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
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
                        SendNotify(src,"You Can\'t Carry Anymore of This Item!", 'error', 2000)
                    end
                end
            end
        end
    else
        SendNotify(src, 'You didnt find anything of use.', 'error', 2000)
    end
end)


--process heroin base
RegisterNetEvent('lusty94_heroin:server:ProcessHeroinBase', function()
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
    else returnAmount = Config.Processing.HeroinBase.ProcessedItemAmount end -- edit amount given if not using xp here
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.HeroinBase.RequiredItemName, Config.Processing.HeroinBase.RequiredItemAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.HeroinBase.RequiredItemName], 'remove', Config.Processing.HeroinBase.RequiredItemAmount)
            Player.Functions.RemoveItem(Config.Processing.HeroinBase.RequiredItem2Name, Config.Processing.HeroinBase.RequiredItem2Amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.HeroinBase.RequiredItem3Name], 'remove', Config.Processing.HeroinBase.RequiredItem2Amount)
            Player.Functions.RemoveItem(Config.Processing.HeroinBase.RequiredItem3Name, Config.Processing.HeroinBase.RequiredItem3Amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.HeroinBase.RequiredItem3Name], 'remove', Config.Processing.HeroinBase.RequiredItem3Amount)
            Player.Functions.RemoveItem(Config.Processing.HeroinBase.RequiredItem4Name, Config.Processing.HeroinBase.RequiredItem4Amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.HeroinBase.RequiredItem4Name], 'remove', Config.Processing.HeroinBase.RequiredItem4Amount)
        
            Player.Functions.AddItem(Config.Processing.HeroinBase.ProcessedItemName, returnAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.HeroinBase.ProcessedItemName], 'add', returnAmount)
        
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.HeroinBase.ProcessedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.HeroinBase.RequiredItemName, Config.Processing.HeroinBase.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.HeroinBase.RequiredItem2Name, Config.Processing.HeroinBase.RequiredItem2Amount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.HeroinBase.RequiredItem3Name, Config.Processing.HeroinBase.RequiredItem3Amount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.HeroinBase.RequiredItem4Name, Config.Processing.HeroinBase.RequiredItem4Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.HeroinBase.ProcessedItemName, returnAmount)
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

--process pure heroin
RegisterNetEvent('lusty94_heroin:server:ProcessPureHeroin', function()
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
    else returnAmount = Config.Processing.PureHeroin.ProcessedItemAmount end
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.PureHeroin.RequiredItemName, Config.Processing.PureHeroin.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.PureHeroin.RequiredItemName], 'remove', Config.Processing.PureHeroin.RequiredItemAmount)
        Player.Functions.RemoveItem(Config.Processing.PureHeroin.RequiredItem2Name, Config.Processing.PureHeroin.RequiredItem2Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.PureHeroin.RequiredItem3Name], 'remove', Config.Processing.PureHeroin.RequiredItem2Amount)
        Player.Functions.RemoveItem(Config.Processing.PureHeroin.RequiredItem3Name, Config.Processing.PureHeroin.RequiredItem3Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.PureHeroin.RequiredItem3Name], 'remove', Config.Processing.PureHeroin.RequiredItem3Amount)

        Player.Functions.AddItem(Config.Processing.PureHeroin.ProcessedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.PureHeroin.ProcessedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.PureHeroin.ProcessedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.PureHeroin.RequiredItemName, Config.Processing.PureHeroin.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.PureHeroin.RequiredItem2Name, Config.Processing.PureHeroin.RequiredItem2Amount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.PureHeroin.RequiredItem3Name, Config.Processing.PureHeroin.RequiredItem3Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.PureHeroin.ProcessedItemName, returnAmount)
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

-- process heroin vial
RegisterServerEvent('lusty94_heroin:server:ProcessHeroinVial', function()
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
    else returnAmount = Config.Processing.Bagging.HeroinVial.BaggedItemAmount end
    if InvType == 'qb' then
        Player.Functions.RemoveItem(Config.Processing.Bagging.HeroinVial.RequiredItemName, Config.Processing.Bagging.HeroinVial.RequiredItemAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.HeroinVial.RequiredItemName], 'remove', Config.Processing.Bagging.HeroinVial.RequiredItemAmount)
        Player.Functions.RemoveItem(Config.Processing.Bagging.HeroinVial.RequiredItem3Name, Config.Processing.Bagging.HeroinVial.RequiredItem3Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.HeroinVial.RequiredItem3Name], 'remove', Config.Processing.Bagging.HeroinVial.RequiredItem3Amount)

        Player.Functions.AddItem(Config.Processing.Bagging.HeroinVial.BaggedItemName, returnAmount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Bagging.HeroinVial.BaggedItemName], 'add', returnAmount)
    elseif InvType == 'ox' then
        if exports.ox_inventory:CanCarryItem(src, Config.Processing.Bagging.HeroinVial.BaggedItemName, returnAmount) then
            exports.ox_inventory:RemoveItem(src,Config.Processing.Bagging.HeroinVial.RequiredItemName, Config.Processing.Bagging.HeroinVial.RequiredItemAmount)
            exports.ox_inventory:RemoveItem(src,Config.Processing.Bagging.HeroinVial.RequiredItem3Name, Config.Processing.Bagging.HeroinVial.RequiredItem3Amount)
            exports.ox_inventory:AddItem(src,Config.Processing.Bagging.HeroinVial.BaggedItemName, returnAmount)
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
RegisterServerEvent('lusty94_heroin:server:CreateOverDoseCure', function()
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
    else returnAmount = Config.Processing.Curing.ProcessedItemAmount end
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





--take heroin vial
RegisterServerEvent('lusty94_heroin:server:TakeHeroin', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if InvType == 'qb' then
	    Player.Functions.RemoveItem(Config.Processing.TakeDrugs.RequiredItemName, 1) -- heroin_vial
	    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.TakeDrugs.RequiredItemName], "remove")
    elseif InvType == 'ox' then
        exports.ox_inventory:RemoveItem(src, Config.Processing.TakeDrugs.RequiredItemName, 1)
    end
end)



--update overdose
RegisterServerEvent('lusty94_heroin:server:OverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]

    Player.Functions.SetMetaData(OverDoseName, (OverDose + Config.DrugSettings.Effects.OverDoseAmount))
    if OverDose >= Config.DrugSettings.Effects.OverDoseLevel then
        Wait(3000)       
        TriggerClientEvent('lusty94_heroin:client:OverDose', src)
    end    
end)

--remove overdose
RegisterServerEvent('lusty94_heroin:server:CureOverDose', function()
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local OverDose = Player.PlayerData.metadata[OverDoseName]

    if OverDose >= 1 then
        if Player.Functions.RemoveItem(Config.Processing.Curing.ProcessedItemName, 1) then
            Player.Functions.SetMetaData(OverDoseName, (OverDose - Config.DrugSettings.Effects.OverDoseCureAmount))
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Processing.Curing.ProcessedItemName], "remove")
            SendNotify(src, Config.Language.Notifications.OverDoseCuredName, 'success', 2000)
        end
    else
        SendNotify(src, Config.Language.Notifications.AlreadyCuredName, 'error', 2000)
    return
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

--tints shop
function HeroinSupplyShop()
    exports.ox_inventory:RegisterShop('HeroinSupplyShop', {
        name = 'Heroin Supply Shop',
        inventory = {
            { name = 'trowel', price = 5 },
            { name = 'emptyvial', price = 5 },
            { name = 'scales', price = 500 },
            { name = 'plasticjerrycan', price = 100 },
            { name = 'heroinprocessingtable', price = 100 },
        },
    })
end

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        if InvType == 'ox' then
            print('^5--<^3!^5>-- ^7| Lusty94_Heroin|^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Inventory Type is set to ox |^5 ^5--<^3!^5>--^7')
            print('^5--<^3!^5>-- ^7| Registering shops automatically |^5 ^5--<^3!^5>--^7')
            HeroinSupplyShop()
            print('^5--<^3!^5>-- ^7| Shops registered successfully |^5 ^5--<^3!^5>--^7')
        end
    end
end)



local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/Heroin/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
		--print(advice)
	end)
end
CheckVersion()