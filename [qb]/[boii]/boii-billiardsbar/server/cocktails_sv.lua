----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- WHISKEY SOUR START --<!>--
RegisterServerEvent('boii-billiards:sv:WhiskeySour', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.WhiskeySour.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.WhiskeySour.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.WhiskeySour.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.WhiskeySour.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.WhiskeySour.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.WhiskeySour.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 1)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughwhiskeysour3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nowhiskeysour3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughwhiskeysour2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nowhiskeysour2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughwhiskeysour1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nowhiskeysour1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- WHISKEY SOUR END --<!>--

--<!>-- WHISKEY SMASH START --<!>--
RegisterServerEvent('boii-billiards:sv:WhiskeySmash', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.WhiskeySmash.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.WhiskeySmash.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.WhiskeySmash.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.WhiskeySmash.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.WhiskeySmash.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.WhiskeySmash.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 2)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughwhiskeysmash3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nowhiskeysmash3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughwhiskeysmash2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nowhiskeysmash2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughwhiskeysmash1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nowhiskeysmash1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- WHISKEY SMASH END --<!>--

--<!>-- BLOOD AND SAND START --<!>--
RegisterServerEvent('boii-billiards:sv:BloodSand', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.BloodSand.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.BloodSand.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.BloodSand.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.BloodSand.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.BloodSand.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.BloodSand.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 3)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughbloodsand3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nobloodsand3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughbloodsand2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nobloodsand2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughbloodsand1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nobloodsand1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- BLOOD AND SAND END --<!>--

--<!>-- PINA COLADA START --<!>--
RegisterServerEvent('boii-billiards:sv:PinaColada', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.PinaColada.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.PinaColada.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.PinaColada.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.PinaColada.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.PinaColada.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.PinaColada.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 4)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughpinacolada3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nopinacolada3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughpinacolada2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nopinacolada2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughpinacolada1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nopinacolada1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- PINA COLADA END --<!>--

--<!>-- ZOMBIE START --<!>--
RegisterServerEvent('boii-billiards:sv:Zombie', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.Zombie.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.Zombie.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.Zombie.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.Zombie.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.Zombie.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.Zombie.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 4)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughzombie3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nozombie3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughzombie2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nozombie2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughzombie1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nozombie1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- ZOMBIE END --<!>--

--<!>-- ZOMBIE START --<!>--
RegisterServerEvent('boii-billiards:sv:Zombie', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.Zombie.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.Zombie.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.Zombie.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.Zombie.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.Zombie.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.Zombie.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 5)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughzombie3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nozombie3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughzombie2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nozombie2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughzombie1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nozombie1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- ZOMBIE END --<!>--

--<!>-- MAITAI START --<!>--
RegisterServerEvent('boii-billiards:sv:MaiTai', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.MaiTai.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.MaiTai.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.MaiTai.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.MaiTai.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.MaiTai.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.MaiTai.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 6)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughmaitai3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nomaitai3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughmaitai2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nomaitai2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughmaitai1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nomaitai1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- MAITAI END --<!>--

--<!>-- APPLETINI START --<!>--
RegisterServerEvent('boii-billiards:sv:Appletini', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.Appletini.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.Appletini.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.Appletini.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.Appletini.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.Appletini.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.Appletini.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 7)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughappletini3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['noappletini3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughappletini2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['noappletini2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughappletini1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['noappletini1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- APPLETINI END --<!>--

--<!>-- COSMOPOLITAN START --<!>--
RegisterServerEvent('boii-billiards:sv:Cosmopolitan', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.Cosmopolitan.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.Cosmopolitan.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.Cosmopolitan.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.Cosmopolitan.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.Cosmopolitan.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.Cosmopolitan.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 8)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughcosmopolitan3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nocosmopolitan3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughcosmopolitan2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nocosmopolitan2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughcosmopolitan1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nocosmopolitan1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- COSMOPOLITAN END --<!>--

--<!>-- BLOODY MARY START --<!>--
RegisterServerEvent('boii-billiards:sv:BloodyMary', function() 
    local source = source
    local pData = Core.Functions.GetPlayer(source)
    local item1name = Config.Drinks.Cocktails.Required.name
    local item2name = Config.Drinks.Cocktails.BloodyMary.Required['1'].name
    local item2amount = Config.Drinks.Cocktails.BloodyMary.Required['1'].amount
    local item3name = Config.Drinks.Cocktails.BloodyMary.Required['2'].name
    local item3amount = Config.Drinks.Cocktails.BloodyMary.Required['2'].amount
    local item4name = Config.Drinks.Cocktails.BloodyMary.Required['3'].name
    local item4amount = Config.Drinks.Cocktails.BloodyMary.Required['3'].amount
    if pData.Functions.GetItemByName(item1name) ~= nil then
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
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item1name], 'remove', 1)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item2name], 'remove', item2amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item3name], 'remove', item3amount)
                                TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[item4name], 'remove', item4amount)
                                TriggerClientEvent('boii-billiards:cl:MixCocktails', source, 8)
                            else
                                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughbloodymary3'], 'error')
                            end
                        else
                            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nobloodymary3'], 'error')
                        end
                    else
                        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughbloodymary2'], 'error')
                    end
                else
                    TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nobloodymary2'], 'error')
                end
            else
                TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['enoughbloodymaryn1'], 'error')
            end
        else
            TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nobloodymary1'], 'error')
            end
    else
        TriggerClientEvent('boii-billiards:notify', source, Language.Cocktails['nococktailglass'], 'error')
    end
end)
--<!>-- BLOODY MARY END --<!>--