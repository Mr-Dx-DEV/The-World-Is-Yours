----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local MetaDataEvent = Config.CoreSettings.MetaDataEvent
local MetaDataName = Config.XP.MetaDataName
local isprocessing = false
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- MORPHINE --<!>--
RegisterServerEvent('boii-drugs:sv:ProcessMorphine', function()
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1name = Config.Processing.Heroin.Morphine.Required['1'].name
    local item1amount = Config.Processing.Heroin.Morphine.Required['1'].amount
    local item2name = Config.Processing.Heroin.Morphine.Required['2'].name
    local item2amount = Config.Processing.Heroin.Morphine.Required['2'].amount
    local item3name = Config.Processing.Heroin.Morphine.Required['3'].name
    local item3amount = Config.Processing.Heroin.Morphine.Required['3'].amount
    local itemadd = Config.Processing.Heroin.Morphine.Return.name
    local amount = math.random(1,2)
    if Config.XP.Use then
        if DrugXP < 4768 then
            itemamount = amount
        elseif DrugXP <= 4768 then
            itemamount = amount
        elseif DrugXP <= 11640 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP <= 22735 then
            itemamount = math.ceil(amount*1.3)
        end
    else
        itemamount = amount
    end
    if pData.Functions.GetItemByName(item1name) ~= nil then
        if pData.Functions.GetItemByName(item1name).amount >= item1amount then
            if pData.Functions.GetItemByName(item2name) ~= nil then
                if pData.Functions.GetItemByName(item2name).amount >= item2amount then
                    if pData.Functions.GetItemByName(item3name) ~= nil then
                        if pData.Functions.GetItemByName(item3name).amount >= item3amount then
                            pData.Functions.RemoveItem(item1name, item1amount)
                            pData.Functions.RemoveItem(item2name, item2amount)
                            pData.Functions.RemoveItem(item3name, item3amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', item1amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                            TriggerClientEvent('boii-drugs:cl:ProcessDrugs', source, 'Morphine', itemadd, itemamount)
                            if Config.XP.Use then
                                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
                            end
                        else
                            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Morphine['enoughmorphine3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Morphine['nomorphine3'], 'error')
                    end
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Morphine['enoughmorphine2'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Morphine['nomorphine2'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Morphine['enoughmorphine1'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Morphine['nomorphine1'], 'error')
    end
end)
--<!>-- MORPHINE --<!>--

--<!>-- HEROIN BASE --<!>--
RegisterServerEvent('boii-drugs:sv:ProcessHeroinBase', function()
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1name = Config.Processing.Heroin.HeroinBase.Required['1'].name
    local item1amount = Config.Processing.Heroin.HeroinBase.Required['1'].amount
    local item2name = Config.Processing.Heroin.HeroinBase.Required['2'].name
    local item2amount = Config.Processing.Heroin.HeroinBase.Required['2'].amount
    local item3name = Config.Processing.Heroin.HeroinBase.Required['3'].name
    local item3amount = Config.Processing.Heroin.HeroinBase.Required['3'].amount
    local itemadd = Config.Processing.Heroin.HeroinBase.Return.name
    local amount = math.random(1,2)
    if Config.XP.Use then
        if DrugXP < 11640 then
            itemamount = amount
        elseif DrugXP <= 11640 then
            itemamount = amount
        elseif DrugXP <= 28419 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP <= 55506 then
            itemamount = math.ceil(amount*1.3)
        end
    else
        itemamount = amount
    end
    if pData.Functions.GetItemByName(item1name) ~= nil then
        if pData.Functions.GetItemByName(item1name).amount >= item1amount then
            if pData.Functions.GetItemByName(item2name) ~= nil then
                if pData.Functions.GetItemByName(item2name).amount >= item2amount then
                    if pData.Functions.GetItemByName(item3name) ~= nil then
                        if pData.Functions.GetItemByName(item3name).amount >= item3amount then
                            pData.Functions.RemoveItem(item1name, item1amount)
                            pData.Functions.RemoveItem(item2name, item2amount)
                            pData.Functions.RemoveItem(item3name, item3amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', item1amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                            TriggerClientEvent('boii-drugs:cl:ProcessDrugs', source, 'Heroin Base', itemadd, itemamount)
                            if Config.XP.Use then
                                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
                            end
                        else
                            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.HeroinBase['enoughheroinbase3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.HeroinBase['noheroinbase3'], 'error')
                    end
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.HeroinBase['enoughheroinbase2'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.HeroinBase['noheroinbase2'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.HeroinBase['enoughheroinbase1'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.HeroinBase['noheroinbase1'], 'error')
    end
end)
--<!>-- HEROIN BASE --<!>--

--<!>-- HEROIN --<!>--
RegisterServerEvent('boii-drugs:sv:ProcessHeroin', function()
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1name = Config.Processing.Heroin.Heroin.Required['1'].name
    local item1amount = Config.Processing.Heroin.Heroin.Required['1'].amount
    local item2name = Config.Processing.Heroin.Heroin.Required['2'].name
    local item2amount = Config.Processing.Heroin.Heroin.Required['2'].amount
    local item3name = Config.Processing.Heroin.Heroin.Required['3'].name
    local item3amount = Config.Processing.Heroin.Heroin.Required['3'].amount
    local itemadd = Config.Processing.Heroin.Heroin.Return.name
    local amount = math.random(1,2)
    if Config.XP.Use then
        if DrugXP < 11640 then
            itemamount = amount
        elseif DrugXP <= 11640 then
            itemamount = amount
        elseif DrugXP <= 28419 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP <= 55506 then
            itemamount = math.ceil(amount*1.3)
        end
    else
        itemamount = amount
    end
    if pData.Functions.GetItemByName(item1name) ~= nil then
        if pData.Functions.GetItemByName(item1name).amount >= item1amount then
            if pData.Functions.GetItemByName(item2name) ~= nil then
                if pData.Functions.GetItemByName(item2name).amount >= item2amount then
                    if pData.Functions.GetItemByName(item3name) ~= nil then
                        if pData.Functions.GetItemByName(item3name).amount >= item3amount then
                            pData.Functions.RemoveItem(item1name, item1amount)
                            pData.Functions.RemoveItem(item2name, item2amount)
                            pData.Functions.RemoveItem(item3name, item3amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', item1amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                            TriggerClientEvent('boii-drugs:cl:ProcessDrugs', source, 'Heroin', itemadd, itemamount)
                            if Config.XP.Use then
                                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
                            end
                        else
                            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Heroin['enoughheroin3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Heroin['noheroin3'], 'error')
                    end
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Heroin['enoughheroin2'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Heroin['noheroin2'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Heroin['enoughheroin1'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Heroin.Heroin['noheroin1'], 'error')
    end
end)
--<!>-- HEROIN --<!>--

--<!>-- CRACK --<!>--
RegisterServerEvent('boii-drugs:sv:ProcessCrack', function()
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1name = Config.Processing.Cocaine.Crack.Required['1'].name
    local item1amount = Config.Processing.Cocaine.Crack.Required['1'].amount
    local item2name = Config.Processing.Cocaine.Crack.Required['2'].name
    local item2amount = Config.Processing.Cocaine.Crack.Required['2'].amount
    local item3name = Config.Processing.Cocaine.Crack.Required['3'].name
    local item3amount = Config.Processing.Cocaine.Crack.Required['3'].amount
    local itemadd = Config.Processing.Cocaine.Crack.Return.name
    local amount = math.random(1,2)
    if Config.XP.Use then
        if DrugXP < 18188 then
            itemamount = amount
        elseif DrugXP <= 18188 then
            itemamount = amount
        elseif DrugXP <= 44405 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP <= 86729 then
            itemamount = math.ceil(amount*1.3)
        end
    else
        itemamount = amount
    end
    if pData.Functions.GetItemByName(item1name) ~= nil then
        if pData.Functions.GetItemByName(item1name).amount >= item1amount then
            if pData.Functions.GetItemByName(item2name) ~= nil then
                if pData.Functions.GetItemByName(item2name).amount >= item2amount then
                    if pData.Functions.GetItemByName(item3name) ~= nil then
                        if pData.Functions.GetItemByName(item3name).amount >= item3amount then
                            pData.Functions.RemoveItem(item1name, item1amount)
                            pData.Functions.RemoveItem(item2name, item2amount)
                            pData.Functions.RemoveItem(item3name, item3amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', item1amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                            TriggerClientEvent('boii-drugs:cl:ProcessDrugs', source, 'Crack', itemadd, itemamount)
                            if Config.XP.Use then
                                pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
                            end
                        else
                            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Crack['enoughcrack3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Crack['nocrack3'], 'error')
                    end
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Crack['enoughcrack2'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Crack['nocrack2'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Crack['enoughcrack1'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Crack['nocrack1'], 'error')
    end
end)
--<!>-- CRACK --<!>--

--<!>-- METH --<!>--
RegisterServerEvent('boii-drugs:sv:ProcessMeth', function()
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1name = Config.Processing.Meth.Meth.Required['1'].name
    local item1amount = Config.Processing.Meth.Meth.Required['1'].amount
    local item2name = Config.Processing.Meth.Meth.Required['2'].name
    local item2amount = Config.Processing.Meth.Meth.Required['2'].amount
    local item3name = Config.Processing.Meth.Meth.Required['3'].name
    local item3amount = Config.Processing.Meth.Meth.Required['3'].amount
    local item4name = Config.Processing.Meth.Meth.Required['4'].name
    local item4amount = Config.Processing.Meth.Meth.Required['4'].amount
    local itemadd = Config.Processing.Meth.Meth.Return.name
    local amount = math.random(1,2)
    if Config.XP.Use then
        if DrugXP < 28419 then
            itemamount = amount
        elseif DrugXP <= 28419 then
            itemamount = amount
        elseif DrugXP <= 55506 then
            itemamount = math.ceil(amount*1.1)
        elseif DrugXP <= 108411 then
            itemamount = math.ceil(amount*1.3)
        end
    else
        itemamount = amount
    end
    if pData.Functions.GetItemByName(item1name) ~= nil then
        if pData.Functions.GetItemByName(item1name).amount >= item1amount then
            if pData.Functions.GetItemByName(item2name) ~= nil then
                if pData.Functions.GetItemByName(item2name).amount >= item2amount then
                    if pData.Functions.GetItemByName(item3name) ~= nil then
                        if pData.Functions.GetItemByName(item3name).amount >= item3amount then
                            if pData.Functions.GetItemByName(item4name) ~= nil then
                                if pData.Functions.GetItemByName(item4name).amount >= item4amount then
                                    pData.Functions.RemoveItem(item1name, item1amount)
                                    pData.Functions.RemoveItem(item2name, item2amount)
                                    pData.Functions.RemoveItem(item3name, item3amount)
                                    pData.Functions.RemoveItem(item4name, item4amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', item1amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                    TriggerClientEvent('boii-drugs:cl:ProcessDrugs', source, 'Meth', itemadd, itemamount)
                                    if Config.XP.Use then
                                        pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
                                    end
                                else
                                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['enoughmeth4'], 'error')
                                end
                            else
                                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['nometh4'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['enoughmeth3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['nometh3'], 'error')
                    end
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['enoughmeth2'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['nometh2'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['enoughmeth1'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Meth.Meth['nometh1'], 'error')
    end
end)
--<!>-- METH --<!>--

--<!>-- COCAINE --<!>--
RegisterServerEvent('boii-drugs:sv:ProcessCocaine', function()
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local item1name = Config.Processing.Cocaine.Cocaine.Required['1'].name
    local item1amount = Config.Processing.Cocaine.Cocaine.Required['1'].amount
    local item2name = Config.Processing.Cocaine.Cocaine.Required['2'].name
    local item2amount = Config.Processing.Cocaine.Cocaine.Required['2'].amount
    local item3name = Config.Processing.Cocaine.Cocaine.Required['3'].name
    local item3amount = Config.Processing.Cocaine.Cocaine.Required['3'].amount
    local item4name = Config.Processing.Cocaine.Cocaine.Required['4'].name
    local item4amount = Config.Processing.Cocaine.Cocaine.Required['4'].amount
    local itemadd = Config.Processing.Cocaine.Cocaine.Return.name
    local amount = math.random(1,2)
    if Config.XP.Use then
        if DrugXP < 86729 then
            itemamount = amount
        elseif DrugXP <= 86729 then
            itemamount = amount
        elseif DrugXP <= 211741 then
            itemamount = math.ceil(amount*1.2)
        elseif DrugXP <= 516947 then
            itemamount = math.ceil(amount*1.3)
        end
    else
        itemamount = amount
    end
    if pData.Functions.GetItemByName(item1name) ~= nil then
        if pData.Functions.GetItemByName(item1name).amount >= item1amount then
            if pData.Functions.GetItemByName(item2name) ~= nil then
                if pData.Functions.GetItemByName(item2name).amount >= item2amount then
                    if pData.Functions.GetItemByName(item3name) ~= nil then
                        if pData.Functions.GetItemByName(item3name).amount >= item3amount then
                            if pData.Functions.GetItemByName(item4name) ~= nil then
                                if pData.Functions.GetItemByName(item4name).amount >= item4amount then
                                    pData.Functions.RemoveItem(item1name, item1amount)
                                    pData.Functions.RemoveItem(item2name, item2amount)
                                    pData.Functions.RemoveItem(item3name, item3amount)
                                    pData.Functions.RemoveItem(item4name, item4amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', item1amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                    TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                    TriggerClientEvent('boii-drugs:cl:ProcessDrugs', source, 'Cocaine', itemadd, itemamount)
                                    if Config.XP.Use then
                                        pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
                                    end
                                else
                                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['enoughcocaine4'], 'error')
                                end
                            else
                                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['nococaine4'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['enoughcocaine3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['nococaine3'], 'error')
                    end
                else
                    TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['enoughcocaine2'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['nococaine2'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['enoughcocaine1'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Processing.Cocaine.Cocaine['nococaine1'], 'error')
    end
end)
--<!>-- COCAINE --<!>--

--<!>-- KETAMINE --<!>--
-- Check
RegisterServerEvent('boii-drugs:sv:ProcessingCheck', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    if pData.Functions.GetItemByName(Config.Ketamine.Processing.Required['1'].name) ~= nil then
        if pData.Functions.GetItemByName(Config.Ketamine.Processing.Required['1'].name).amount >= Config.Ketamine.Processing.Required['1'].amount then
            if pData.Functions.GetItemByName(Config.Ketamine.Processing.Required['2'].name) ~= nil then
                if pData.Functions.GetItemByName(Config.Ketamine.Processing.Required['2'].name).amount >= Config.Ketamine.Processing.Required['2'].amount then
                    if pData.Functions.GetItemByName(Config.Ketamine.Processing.Required['3'].name) ~= nil then
                        if pData.Functions.GetItemByName(Config.Ketamine.Processing.Required['3'].name).amount >= Config.Ketamine.Processing.Required['3'].amount then
                            TriggerClientEvent('boii-drugs:cl:ProcessKet', src, Config.Ketamine.Processing.Required['1'].name, Config.Ketamine.Processing.Required['1'].amount, Config.Ketamine.Processing.Required['2'].name, Config.Ketamine.Processing.Required['2'].amount, Config.Ketamine.Processing.Required['3'].name, Config.Ketamine.Processing.Required['3'].amount)
                        else
                            TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['wrongitems'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['wrongitems'], 'error')
                    end
                else
                    TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['wrongitems'], 'error')
                end
            else
                TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['wrongitems'], 'error')
            end
        else
            TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['wrongitems'], 'error')
        end
    else
        TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['wrongitems'], 'error')
    end
end)
-- Reward
RegisterServerEvent('boii-drugs:sv:ProcessKet', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    local rewardamount = math.random(2,4)
    if Config.XP.Use then
        if DrugXP <= 1000 then
            amount = math.ceil(rewardamount*0.3)
        elseif DrugXP >= 1000 and DrugXP <= 1250 then
            amount = math.ceil(rewardamount*0.5)
        elseif DrugXP >= 1250 and DrugXP  <= 1562 then
            amount = math.ceil(rewardamount*0.7)
        elseif DrugXP >= 1562 and DrugXP  <= 1953 then
            amount = math.ceil(rewardamount*0.9)
        elseif DrugXP >= 1953 and DrugXP  <= 2441 then
            amount = math.ceil(rewardamount*1.1)
        elseif DrugXP >= 2441 and DrugXP  <= 3051 then
            amount = math.ceil(rewardamount*1.3)
        elseif DrugXP >= 3051 and DrugXP  <= 3814 then
            amount = math.ceil(rewardamount*1.5)
        end
    else
        amount = rewardamount
    end
    pData.Functions.AddItem(Config.Ketamine.Processing.Return.name, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[Config.Ketamine.Processing.Return.name], 'add', amount)
    if Config.XP.Use then
        pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
        TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['processxp'], 'success')
    else
        TriggerClientEvent('boii-drugs:notify', src, Language.Ketamine.Processing['processnoxp'], 'success')
    end
end)
--<!>-- PROCESSING REWARD --<!>--