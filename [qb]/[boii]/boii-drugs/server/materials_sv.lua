----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataEvent = Config.CoreSettings.MetaDataEvent
local MetaDataName = Config.XP.MetaDataName
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- HYDROCHLORIC ACID --<!>--
RegisterServerEvent('boii-drugs:sv:CollectHydro', function(entity)
    local pData = Core.Functions.GetPlayer(source)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local itemremove = Config.DrugMaterials.Shared.Hydrochloric.Required.name
    local itemadd = Config.DrugMaterials.Shared.Hydrochloric.Return.name
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 2441 then
            itemamount = amount
        elseif DrugXP >= 2441 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 4768 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 9312 then
            itemamount = math.ceil(amount*1.5)
        elseif DrugXP >= 18188 then
            itemamount = math.ceil(amount*1.7)
        end
    else
        itemamount = amount
    end 
    if pData.Functions.GetItemByName(itemremove) ~= nil then
        if pData.Functions.GetItemByName(itemremove).amount >= itemamount then
            pData.Functions.RemoveItem(itemremove, itemamount)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[itemremove], 'remove', itemamount)
            TriggerClientEvent('boii-drugs:cl:SearchHydro', source, entity, itemremove, itemadd, itemamount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Shared.Hydrochloric['enoughjerrycan'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Shared.Hydrochloric['nojerrycan'], 'error')
    end
end)
--<!>-- HYDROCHLORIC ACID --<!>--

--<!>-- METHYLAMINE --<!>--
RegisterServerEvent('boii-drugs:sv:CollectMethy', function(entity)
    local pData = Core.Functions.GetPlayer(source)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local itemremove = Config.DrugMaterials.Meth.Methylamine.Required.name
    local itemadd = Config.DrugMaterials.Meth.Methylamine.Return.name
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 3051 then
            itemamount = amount
        elseif DrugXP >= 3051 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 7450 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 18188 then
            itemamount = math.ceil(amount*1.5)
        elseif DrugXP >= 44405 then
            itemamount = math.ceil(amount*1.7)
        end
    else
        itemamount = amount
    end 
    if pData.Functions.GetItemByName(itemremove) ~= nil then
        if pData.Functions.GetItemByName(itemremove).amount >= itemamount then
            pData.Functions.RemoveItem(itemremove, itemamount)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[itemremove], 'remove', itemamount)
            TriggerClientEvent('boii-drugs:cl:SearchMethy', source, entity, itemremove, itemadd, itemamount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Shared.Hydrochloric['enoughjerrycan'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Shared.Hydrochloric['nojerrycan'], 'error')
    end
end)
--<!>-- METHYLAMINE --<!>--

--<!>-- ACETONE --<!>--
RegisterServerEvent('boii-drugs:sv:CollectAcetone', function(entity)
    local pData = Core.Functions.GetPlayer(source)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1add = Config.DrugMaterials.Meth.Acetone.RewardItems[math.random(1, #Config.DrugMaterials.Meth.Acetone.RewardItems)]
    local item2add = Config.DrugMaterials.Meth.Acetone.RewardItems[math.random(1, #Config.DrugMaterials.Meth.Acetone.RewardItems)]
    local item3add = Config.DrugMaterials.Meth.Acetone.RewardItems[math.random(1, #Config.DrugMaterials.Meth.Acetone.RewardItems)]
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 3051 then
            itemamount = amount
        elseif DrugXP >= 3051 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 7450 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 18188 then
            itemamount = math.ceil(amount*1.5)
        elseif DrugXP >= 44405 then
            itemamount = math.ceil(amount*1.7)
        end
    else
        itemamount = amount
    end
    --<!>-- NOTES --<!>--
    -- How to use event
    -- "EVENT", "SOURCE", "ENTITY", "ITEM 1 ADD", "ITEM 2 ADD", "ITEM 3 ADD", "ITEM AMOUNT", "CHANCE TO RECEIVE 2 ITEMS WHEN SEARCHING", "CHANCE TO RECEIVE 3 ITEMS WHEN SEARCHING"
    --<!>-- NOTES --<!>-- 
    TriggerClientEvent('boii-drugs:cl:SearchAcetone', source, entity, item1add, item2add, item3add, itemamount, math.random(40,50), math.random(10,20)) 
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
    end
end)
--<!>-- ACETONE --<!>--

--<!>-- PROSPECTING --<!>--
RegisterServerEvent('boii-drugs:sv:ProspectRock', function()
    local pData = Core.Functions.GetPlayer(source)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1add = Config.DrugMaterials.Meth.Lithium.RewardItems[math.random(1, #Config.DrugMaterials.Meth.Lithium.RewardItems)]
    local item2add = Config.DrugMaterials.Meth.Lithium.RewardItems[math.random(1, #Config.DrugMaterials.Meth.Lithium.RewardItems)]
    local item3add = Config.DrugMaterials.Meth.Lithium.RewardItems[math.random(1, #Config.DrugMaterials.Meth.Lithium.RewardItems)]
    local chance = Config.DrugMaterials.Meth.Lithium.Chance
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 2441 then
            itemamount = amount
        elseif DrugXP >= 2441 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 7450 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 22735 then
            itemamount = math.ceil(amount*1.5)
        elseif DrugXP >= 69383 then
            itemamount = math.ceil(amount*1.7)
        end
    else
        itemamount = amount
    end
    if chance >= math.random(1,100) then 
        if 10 >= math.random(1,100) then -- Edit chance for three item rewards here
            pData.Functions.AddItem(item2add, itemamount)
            pData.Functions.AddItem(item3add, itemamount)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2add], 'add', itemamount)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3add], 'add', itemamount)
        elseif 45 >= math.random(1,100) then -- Edit chance for two item rewards here
            pData.Functions.AddItem(item2add, itemamount)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2add], 'add', itemamount)
        end
        pData.Functions.AddItem(item1add, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1add], 'add', itemamount)
        if Config.XP.Use then
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Meth.Lithium['successxp'], 'success')
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Meth.Lithium['successnoxp'], 'success')
        end
    else
        if Config.XP.Use then
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Meth.Lithium['failxp'], 'error')
            pData.Functions.SetMetaData(MetaDataName, (DrugXP - math.random(1,3))) -- Edit xp remove here
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Meth.Lithium['failnoxp'], 'error')
        end
    end 
end)
--<!>-- PROSPECTING --<!>--

--<!>-- COCA PLANTS --<!>--
RegisterServerEvent('boii-drugs:sv:CollectCoca', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local itemadd = Config.DrugMaterials.Cocaine.CocaPlants.Return.name
    local chance = Config.DrugMaterials.Cocaine.CocaPlants.Chance
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 3814 then
            itemamount = amount
        elseif DrugXP >= 3814 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 11640 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 35524 then
            itemamount = math.ceil(amount*1.5)
        elseif DrugXP >= 108411 then
            itemamount = math.ceil(amount*1.7)
        end
    else
        itemamount = amount
    end
    if chance >= math.random(1,100) then 
        pData.Functions.AddItem(itemadd, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[itemadd], 'add', itemamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', src, Language.DrugMaterials.Cocaine.CocaPlants['successxp'], 'success')
        else
            TriggerClientEvent('boii-drugs:notify', src, Language.DrugMaterials.Cocaine.CocaPlants['successnoxp'], 'success')
        end
    else
        if Config.XP.Use then
            TriggerClientEvent('boii-drugs:notify', src, Language.DrugMaterials.Cocaine.CocaPlants['failxp'], 'error')
            pData.Functions.SetMetaData(MetaDataName, (DrugXP - math.random(1,3))) -- Edit xp remove here
        else
            TriggerClientEvent('boii-drugs:notify', src, Language.DrugMaterials.Cocaine.CocaPlants['failnoxp'], 'error')
        end
    end 
end)
--<!>-- COCA PLANTS --<!>--

--<!>-- ILLEGAL GASOLINE --<!>--
RegisterServerEvent('boii-drugs:sv:CollectGasoline', function(entity)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local itemremove = Config.DrugMaterials.Cocaine.IllegalGasoline.Required.name
    local itemadd = Config.DrugMaterials.Cocaine.IllegalGasoline.Return.name
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 2441 then
            itemamount = amount
        elseif DrugXP >= 2441 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 4768 then
            itemamount = math.ceil(amount*1.2)
        elseif DrugXP >= 9312 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 18188 then
            itemamount = math.ceil(amount*1.4)
        end
    else
        itemamount = amount
    end 
    if pData.Functions.GetItemByName(itemremove) ~= nil then
        if pData.Functions.GetItemByName(itemremove).amount >= itemamount then
            pData.Functions.RemoveItem(itemremove, itemamount)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[itemremove], 'remove', itemamount)
            TriggerClientEvent('boii-drugs:cl:SearchGasoline', src, entity, itemremove, itemadd, itemamount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            end
        else
            TriggerClientEvent('boii-drugs:notify', src, Language.DrugMaterials.Cocaine.IllegalGasoline['enoughjerrycan'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', src, Language.DrugMaterials.Cocaine.IllegalGasoline['nojerrycan'], 'error')
    end
end)
--<!>-- ILLEGAL GASOLINE --<!>--

--<!>-- BENZOCAINE --<!>--
RegisterServerEvent('boii-drugs:sv:CollectBenzo', function(entity)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1add = Config.DrugMaterials.Cocaine.Benzocaine.RewardItems[math.random(1, #Config.DrugMaterials.Cocaine.Benzocaine.RewardItems)]
    local item2add = Config.DrugMaterials.Cocaine.Benzocaine.RewardItems[math.random(1, #Config.DrugMaterials.Cocaine.Benzocaine.RewardItems)]
    local item3add = Config.DrugMaterials.Cocaine.Benzocaine.RewardItems[math.random(1, #Config.DrugMaterials.Cocaine.Benzocaine.RewardItems)]
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 7450 then
            itemamount = amount
        elseif DrugXP >= 7450 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 18188 then
            itemamount = math.ceil(amount*1.2)
        elseif DrugXP >= 44405 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 135514 then
            itemamount = math.ceil(amount*1.4)
        end
    else
        itemamount = amount
    end
    --<!>-- NOTES --<!>--
    -- How to use event
    -- "EVENT", "SOURCE", "ENTITY", "ITEM 1 ADD", "ITEM 2 ADD", "ITEM 3 ADD", "ITEM AMOUNT", "CHANCE TO RECEIVE 2 ITEMS WHEN SEARCHING", "CHANCE TO RECEIVE 3 ITEMS WHEN SEARCHING"
    --<!>-- NOTES --<!>--  
    TriggerClientEvent('boii-drugs:cl:SearchBenzo', src, entity, item1add, item2add, item3add, itemamount, math.random(30,50), math.random(5,15))
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
    end
end)
--<!>-- BENZOCAINE --<!>--

--<!>-- CONSTRUCTION SITE --<!>--
RegisterServerEvent('boii-drugs:sv:CollectConstruction', function(entity)
    local src = source
    local pData = Core.Functions.GetPlayer(src)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1add = Config.DrugMaterials.Shared.ConstructionSite.RewardItems[math.random(1, #Config.DrugMaterials.Shared.ConstructionSite.RewardItems)]
    local item2add = Config.DrugMaterials.Shared.ConstructionSite.RewardItems[math.random(1, #Config.DrugMaterials.Shared.ConstructionSite.RewardItems)]
    local item3add = Config.DrugMaterials.Shared.ConstructionSite.RewardItems[math.random(1, #Config.DrugMaterials.Shared.ConstructionSite.RewardItems)]
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 3051 then
            itemamount = amount
        elseif DrugXP >= 3051 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 9312 then
            itemamount = math.ceil(amount*1.2)
        elseif DrugXP >= 44405 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 211741 then
            itemamount = math.ceil(amount*1.4)
        end
    else
        itemamount = amount
    end
    --<!>-- NOTES --<!>--
    -- How to use event
    -- "EVENT", "SOURCE", "ENTITY", "ITEM 1 ADD", "ITEM 2 ADD", "ITEM 3 ADD", "ITEM AMOUNT", "CHANCE TO RECEIVE 2 ITEMS WHEN SEARCHING", "CHANCE TO RECEIVE 3 ITEMS WHEN SEARCHING"
    --<!>-- NOTES --<!>--  
    TriggerClientEvent('boii-drugs:cl:SearchConstruction', src, entity, item1add, item2add, item3add, itemamount, math.random(40,55), math.random(10,18))
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
    end
end)
--<!>-- CONSTRUCTION SITE --<!>--

--<!>-- OPIUM PLANTS --<!>--
RegisterServerEvent('boii-drugs:sv:CollectOpium', function()
    local pData = Core.Functions.GetPlayer(source)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local itemadd = Config.DrugMaterials.Heroin.Opium.Return.name
    local chance = Config.DrugMaterials.Heroin.Opium.Chance
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 1000 then
            itemamount = amount
        elseif DrugXP >= 1000 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 2441 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 5960 then
            itemamount = math.ceil(amount*1.5)
        elseif DrugXP >= 14550 then
            itemamount = math.ceil(amount*1.7)
        end
    else
        itemamount = amount
    end
    if chance >= math.random(1,100) then 
        pData.Functions.AddItem(itemadd, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[itemadd], 'add', itemamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Heroin.Opium['successxp'], 'success')
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Heroin.Opium['successnoxp'], 'success')
        end
    else
        if Config.XP.Use then
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Heroin.Opium['failxp'], 'error')
            pData.Functions.SetMetaData(MetaDataName, (DrugXP - math.random(1,3))) -- Edit xp remove here
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Heroin.Opium['failnoxp'], 'error')
        end
    end 
end)
--<!>-- OPIUM PLANTS --<!>--

--<!>-- ETHER --<!>--
RegisterServerEvent('boii-drugs:sv:CollectEther', function(entity)
    local pData = Core.Functions.GetPlayer(source)
	local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local itemremove = Config.DrugMaterials.Heroin.Ether.Required.name
    local itemadd = Config.DrugMaterials.Heroin.Ether.Return.name
    local amount = math.random(1,3)
    if Config.XP.Use then
        if DrugXP < 1953 then
            itemamount = amount
        elseif DrugXP >= 1953 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP >= 4768 then
            itemamount = math.ceil(amount*1.3)
        elseif DrugXP >= 11640 then
            itemamount = math.ceil(amount*1.5)
        elseif DrugXP >= 28419 then
            itemamount = math.ceil(amount*1.7)
        end
    else
        itemamount = amount
    end 
    if pData.Functions.GetItemByName(itemremove) ~= nil then
        if pData.Functions.GetItemByName(itemremove).amount >= itemamount then
            pData.Functions.RemoveItem(itemremove, itemamount)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[itemremove], 'remove', itemamount)
            TriggerClientEvent('boii-drugs:cl:SearchEther', source, entity, itemremove, itemadd, itemamount)
            if Config.XP.Use then
                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Heroin.Ether['enoughjerrycan'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.DrugMaterials.Heroin.Ether['nojerrycan'], 'error')
    end
end)
--<!>-- ETHER --<!>--