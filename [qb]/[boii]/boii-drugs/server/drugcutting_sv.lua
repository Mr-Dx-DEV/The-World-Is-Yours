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

-- Event
RegisterServerEvent('boii-drugs:sv:CutDrugs',function(drugtype, returnitem, bags, bagamount)
    local src = source
    local pData = Core.Functions.GetPlayer(source)
    local DrugXP = pData.PlayerData.metadata[MetaDataName]
    if drugtype == 'Ketamine' then
        if Config.XP.Use then
            if DrugXP <= 2441 then
                amount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 2441 and DrugXP >= 3051 then
                amount = math.ceil(bagamount*0.4)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 3051 and DrugXP >= 3814 then
                amount = math.ceil(bagamount*0.6)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 3814 and DrugXP >= 4768 then
                amount = math.ceil(bagamount*0.8)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 4768 and DrugXP >= 5960 then
                amount = math.ceil(bagamount)
                lang = Language.DrugCutting.Shared['cutxp']
            elseif DrugXP <= 5960 then
                amount = math.ceil(bagamount)
                lang = Language.DrugCutting.Shared['cutxp']
            end
        else
            amount = bagamount
        end
        pData.Functions.RemoveItem(bags, amount)
        pData.Functions.AddItem(returnitem, amount)
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[bags], 'remove', amount)
        TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[returnitem], 'add', amount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', src, lang, 'success')
        else
            TriggerClientEvent('boii-drugs:notify', src, Language.DrugCutting.Shared['cutnoxp'], 'success')
        end
        return
    end
    if drugtype == 'Morphine' then
        if Config.XP.Use then
            if DrugXP < 11640 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 11640 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 22735 then
                itemamount = math.ceil(bagamount*0.4)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 44405 then
                itemamount = math.ceil(bagamount*0.6)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 86729 then
                itemamount = math.ceil(bagamount*0.8)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 169393 then
                itemamount = math.ceil(bagamount*1)
                lang = Language.DrugCutting.Shared['cutxp']
            end
        else
            itemamount = bagamount
        end
        pData.Functions.RemoveItem(bags, itemamount)
        pData.Functions.AddItem(returnitem, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[bags], 'remove', itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', itemamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutxp'], 'success')
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutnoxp'], 'success')
        end
        return
    end
    if drugtype == 'Heroin' then
        if Config.XP.Use then
            if DrugXP < 28419 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 28419 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 55506 then
                itemamount = math.ceil(bagamount*0.4)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 108411 then
                itemamount = math.ceil(bagamount*0.6)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 211741 then
                itemamount = math.ceil(bagamount*0.8)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 413558 then
                itemamount = math.ceil(bagamount*1)
                lang = Language.DrugCutting.Shared['cutxp']
            end
        else
            itemamount = bagamount
        end
        pData.Functions.RemoveItem(bags, itemamount)
        pData.Functions.AddItem(returnitem, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[bags], 'remove', itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', itemamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutxp'], 'success')
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutnoxp'], 'success')
        end
        return
    end
    if drugtype == 'Crack' then
        if Config.XP.Use then
            if DrugXP < 69383 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 69383 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 135514 then
                itemamount = math.ceil(bagamount*0.4)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 264677 then
                itemamount = math.ceil(bagamount*0.6)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 516947 then
                itemamount = math.ceil(bagamount*0.8)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 1009663 then
                itemamount = math.ceil(bagamount*1)
                lang = Language.DrugCutting.Shared['cutxp']
            end
        else
            itemamount = bagamount
        end
        pData.Functions.RemoveItem(bags, itemamount)
        pData.Functions.AddItem(returnitem, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[bags], 'remove', itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', itemamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutxp'], 'success')
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutnoxp'], 'success')
        end
        return
    end
    if drugtype == 'Meth' then
        if Config.XP.Use then
            if DrugXP < 169393 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 169393 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 330846 then
                itemamount = math.ceil(bagamount*0.4)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 646184 then
                itemamount = math.ceil(bagamount*0.6)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 1262079 then
                itemamount = math.ceil(bagamount*0.8)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 2464998 then
                itemamount = math.ceil(bagamount*1)
                lang = Language.DrugCutting.Shared['cutxp']
            end
        else
            itemamount = bagamount
        end
        pData.Functions.RemoveItem(bags, itemamount)
        pData.Functions.AddItem(returnitem, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[bags], 'remove', itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', itemamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', source, lang, 'success')
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutnoxp'], 'success')
        end
        return
    end
    if drugtype == 'Cocaine' then
        if Config.XP.Use then
            if DrugXP < 1009663 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 1009663 then
                itemamount = math.ceil(bagamount*0.2)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 1577598 then
                itemamount = math.ceil(bagamount*0.4)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 2464998 then
                itemamount = math.ceil(bagamount*0.6)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 3851559 then
                itemamount = math.ceil(bagamount*0.8)
                lang = Language.DrugCutting.Shared['cutlowxp']
            elseif DrugXP <= 6018062 then
                itemamount = math.ceil(bagamount*1)
                lang = Language.DrugCutting.Shared['cutxp']
            end
        else
            itemamount = bagamount
        end
        pData.Functions.RemoveItem(bags, itemamount)
        pData.Functions.AddItem(returnitem, itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[bags], 'remove', itemamount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[returnitem], 'add', itemamount)
        if Config.XP.Use then
            pData.Functions.SetMetaData(MetaDataName, (DrugXP + math.random(1,3))) -- Edit xp reward here
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutxp'], 'success')
        else
            TriggerClientEvent('boii-drugs:notify', source, Language.DrugCutting.Shared['cutnoxp'], 'success')
        end
        return
    end
end)