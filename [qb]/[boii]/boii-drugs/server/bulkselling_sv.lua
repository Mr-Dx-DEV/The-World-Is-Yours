----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

-- Bulk bags
RegisterServerEvent('boii-drugs:sv:BulkSellBags', function(args) 
    local pData = Core.Functions.GetPlayer(source)
    local MoneyType = Config.Stores.BulkSelling.Money.Type
    local CashItem = Config.Stores.BulkSelling.Money.Item
	local args = tonumber(args)
    if args == 1 then
        drugitem = 'ketamine'
    elseif args == 2 then
        drugitem = 'morphinebaggy'
	elseif args == 3 then
        drugitem = 'heroinbaggy'
    elseif args == 4 then
        drugitem = 'morphine'
    elseif args == 5 then
        drugitem = 'liquidheroin'
    elseif args == 6 then
        drugitem = 'crack_baggy'
    elseif args == 7 then
        drugitem = 'meth'
    elseif args == 8 then
        drugitem = 'cokebaggy'
    end
	if pData.Functions.GetItemByName(drugitem) ~= nil then
        amount = pData.Functions.GetItemByName(drugitem).amount
        pay = (amount*Config.Stores.BulkSelling.Drugs.Bags[drugitem])
        pData.Functions.RemoveItem(drugitem, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[drugitem], 'remove', amount)
        if Config.Stores.BulkSelling.Money.UseItem then
            pData.Functions.AddItem(CashItem, pay)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[CashItem], 'add', Amount)
        else
            pData.Functions.AddMoney(MoneyType, math.ceil(pay))
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Stores.BulkSelling['nodrugs'], 'error')
        TriggerClientEvent('boii-drugs:cl:BulkSellingMenu', source)
    end
end)

-- Ounces
RegisterServerEvent('boii-drugs:sv:BulkSellOunces', function(args) 
    local pData = Core.Functions.GetPlayer(source)
    local MoneyType = Config.Stores.BulkSelling.Money.Type
    local CashItem = Config.Stores.BulkSelling.Money.Item
	local args = tonumber(args)
    if args == 1 then
        drugitem = 'ketamine_1oz'
    elseif args == 2 then
        drugitem = 'heroin_1oz'
	elseif args == 3 then
        drugitem = 'crack_1oz'
    elseif args == 4 then
        drugitem = 'meth_1oz'
    elseif args == 5 then
        drugitem = 'coke_1oz'
    end
	if pData.Functions.GetItemByName(drugitem) ~= nil then
        amount = pData.Functions.GetItemByName(drugitem).amount
        pay = (amount*Config.Stores.BulkSelling.Drugs.Ounces[drugitem])
        pData.Functions.RemoveItem(drugitem, amount)
        TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[drugitem], 'remove', amount)
        if Config.Stores.BulkSelling.Money.UseItem then
            pData.Functions.AddItem(CashItem, pay)
            TriggerClientEvent('inventory:client:ItemBox', source, Core.Shared.Items[CashItem], 'add', Amount)
        else
            pData.Functions.AddMoney(MoneyType, math.ceil(pay))
        end
    else
        TriggerClientEvent('boii-drugs:notify', source, Language.Stores.BulkSelling['nodrugs'], 'error')
        TriggerClientEvent('boii-drugs:cl:BulkSellingMenu', source)
    end
end)

