----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT EDIT ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
--<!>-- DO NOT EDIT ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING SUPPORT WILL NOT BE PROVIDED IF YOU IGNORE THIS --<!>--

--<!>-- STREET SALES  --<!>--
RegisterServerEvent('boii-drugs:sv:StreetSellDrugs', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local CurrentCops = GetCurrentCops()
    for i=1, #Config.DrugSales.Street.Drugs, 1 do
        local streetdruglist = {}
        local moneytype = Config.DrugSales.Street.Money.Type
        local cashitem = Config.DrugSales.Street.Money.Item
        local drugitem = Config.DrugSales.Street.Drugs[i].name
		local price = math.ceil(math.random(Config.DrugSales.Street.Drugs[i].minprice, Config.DrugSales.Street.Drugs[i].maxprice))
		local saleamount = math.ceil(math.random(Config.DrugSales.Street.Drugs[i].minamount, Config.DrugSales.Street.Drugs[i].maxamount))
        if CurrentCops ~= nil then
            amount = price
        elseif CurrentCops >= 1 and CurrentCops <= 3 then
            amount = price*1.2
        elseif CurrentCops >= 3 and CurrentCops <= 5 then
            amount = price*1.5
        elseif CurrentCops >= 7 then
            amount = price*1.8
        end
        local pay = math.ceil(amount*saleamount)
        if pData.Functions.GetItemByName(drugitem) ~= nil then
            if pData.Functions.GetItemByName(drugitem).amount >= saleamount then
                pData.Functions.RemoveItem(drugitem, saleamount)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[drugitem], 'remove', saleamount)
                Wait(1000)
                if Config.DrugSales.Street.Money.UseItem then
                    pData.Functions.AddItem(cashitem, pay)
                    TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[cashitem], 'add', pay)
                else
                    pData.Functions.AddMoney(moneytype, pay, 'drugs-street')
                end
                TriggerClientEvent('boii-drugs:cl:RefreshStreetDrugs', src, streetdruglist)
                if Config.Debug then
                    boii:debug(1, 'SYSTEM', ''..GetPlayerName(src)..' '..Language.Debug['selldrugs']..' {'..saleamount..'x, '..drugitem..', $'..pay..'}')
                end
            else
                TriggerClientEvent('boii-drugs:notify', src, Language.DrugSales.Shared['enoughdrugs'], 'error')
            end
        end
    end
end)
--<!>-- STREET SALES  --<!>--

--<!>-- STREET STEAL --<!>--
RegisterServerEvent('boii-drugs:sv:StreetStealDrugs', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    for i=1, #Config.DrugSales.Street.Drugs, 1 do
        local streetdruglist = {}
        local drugitem = Config.DrugSales.Street.Drugs[i].name
		local saleamount = math.ceil(math.random(Config.DrugSales.Street.Drugs[i].minamount, Config.DrugSales.Street.Drugs[i].maxamount))
        if pData.Functions.GetItemByName(drugitem) ~= nil then
            if pData.Functions.GetItemByName(drugitem).amount >= saleamount then
                pData.Functions.RemoveItem(drugitem, saleamount)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[drugitem], 'remove', saleamount)
                TriggerClientEvent('boii-drugs:cl:RefreshStreetDrugs', src, streetdruglist)
                if Config.Debug then
                    boii:debug(1, 'SYSTEM', ''..GetPlayerName(src)..' '..Language.Debug['stealdrugs']..' {'..saleamount..'x, '..drugitem..'}')
                end
                return
            else
                TriggerClientEvent('boii-drugs:notify', src, Language.DrugSales.Street['enoughsteal'], 'error')
            end
        end
    end
end)
--<!>-- STREET STEAL --<!>--

--<!>-- DELIVERIES --<!>--
RegisterServerEvent('boii-drugs:sv:MakeDelivery', function()
    local src = source
    local pData = Core.Functions.GetPlayer(src)
    local CurrentCops = GetCurrentCops()
    for i=1, #Config.DrugSales.Deliveries.Drugs, 1 do
        local moneytype = Config.DrugSales.Deliveries.Money.Type
        local cashitem = Config.DrugSales.Deliveries.Money.Item
        local drugitem = Config.DrugSales.Deliveries.Drugs[i].name
		local price = math.ceil(math.random(Config.DrugSales.Deliveries.Drugs[i].minprice, Config.DrugSales.Deliveries.Drugs[i].maxprice))
        if CurrentCops ~= nil then
            pay = price
        elseif CurrentCops >= 1 and CurrentCops <= 3 then
            pay = math.ceil(price*1.1)
        elseif CurrentCops >= 3 and CurrentCops <= 5 then
            pay = math.ceil(price*1.3)
        elseif CurrentCops >= 7 then
            pay = math.ceil(price*1.5)
        end
        if pData.Functions.GetItemByName(drugitem) ~= nil then
            pData.Functions.RemoveItem(drugitem, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[drugitem], 'remove', 1)
            Wait(1000)
            if Config.DrugSales.Deliveries.Money.UseItem then
                pData.Functions.AddItem(cashitem, pay)
                TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[cashitem], 'add', pay)
                if Config.Debug then
                    boii:debug(1, 'SYSTEM', ''..GetPlayerName(src)..' '..Language.Debug['deliverdrugs']..' {'..saleamount..'x, '..drugitem..', $'..pay..'}')
                end
            else
                pData.Functions.AddMoney(moneytype, pay, 'drugs-deliveries')
            end
        end
    end
end)
--<!>-- DELIVERIES --<!>--